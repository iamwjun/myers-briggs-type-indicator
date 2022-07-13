<?php
namespace Home\Controller;
use Think\Controller;

/**
 * 微信注册登录 测试账号：17761202996@163.com lzc20030811
 * Class WeiXinController
 * @package Home\Controller
 */
class WeiXinController extends Controller {
	
	private $appid;
	
	private $secret;
	
	private $code;
	
	private $access_token;
	
	private $url;
	
	private $openid;
	
	private $recommend;
	
	// 构造函数
	public function _initialize() {
		header( 'Content-type:text/html; charset=utf-8' );
		$config = D( 'Config' )->getOne( 1 );
		$this->appid = $config['wx_app_id'];
		$this->secret = $config['wx_app_secret'];
		$this->wx_follow = $config['wx_follow'];
		$this->url = 'http://' . $_SERVER['HTTP_HOST'];
		$this->recommend = I( 'get.recommend_code', '' );
	}
	
	// 跳转oauth2
	public function index() {
		if ( strpos( $_SERVER['HTTP_USER_AGENT'], 'MicroMessenger' ) !== false ) {
			$uri = urlencode( $this->url . "/WeiXin/checkUser" );
			$tempUrl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $this->appid . '&redirect_uri=' . $uri . '&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
			$tempUrl = str_replace( 'STATE', $this->recommend, $tempUrl );
			header("Location:". $tempUrl );
		} else {
			die( '请用微信客户端打开' );
		}
	}

	public function checkUser() {
		// 数据数组
		$data = array();		
		$this->code = $_GET['code'];
		$this->recommend = $_GET['state'];
		$get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='. $this->appid .'&secret='. $this->secret .'&code='. $this->code .'&grant_type=authorization_code';
		$ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false ); // 信任任何证书  
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false ); // 检查证书中是否设置域名  
		curl_setopt( $ch, CURLOPT_URL,$get_token_url );
		curl_setopt( $ch,  CURLOPT_HEADER, 0 );
		curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT, 10 );
		$res = curl_exec( $ch );
		curl_close( $ch );
		$jsonObj = json_decode( $res, true );

		//根据openid和access_token查询用户信息
		$this->access_token = $jsonObj['access_token'];
		$this->openid = $jsonObj['openid'];
		$get_user_info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token=' . $this->access_token . '&openid=' . $this->openid . '&lang=zh_CN';

		$ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false ); // 信任任何证书  
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false ); // 检查证书中是否设置域名  
		curl_setopt($ch,CURLOPT_URL,$get_user_info_url);
		curl_setopt($ch,CURLOPT_HEADER,0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
		$res = curl_exec($ch);
		curl_close($ch);
		//解析json
		$userObj = json_decode( $res, true );

		// 数据组合
		$data['wx_open_id'] = $userObj['openid'];
		$data['wx_name'] = json_encode( $userObj['nickname'] );
		$data['sex'] = $userObj['sex'];
		$data['face'] = $userObj['headimgurl'];
		$data['recommended_code'] = $this->recommend;
				
		// 如果未获取到open_id，则重新获取
		if ( empty( $data['wx_open_id'] ) ) {
			die( header( "Location:".$_SERVER['HTTP_REFERER'] ) );			
		}
		
		// 判断数据库是否存在此会员
		$memberModel = D( 'Member' );
		$memberObj = $memberModel->where( array( 'wx_open_id' => $this->openid ) )->find();
		// 判断微信openid是否注册
		// 	1、如果未注册，就注册
		if ( empty( $memberObj ) ) {
			$theArray ['wx_open_id'] = $data ['wx_open_id'];
			$theArray ['password'] = sha1( '123456' );
			$theArray ['wx_name'] = json_encode( $data ['nickname'] );
			$theArray ['referral_code'] = $memberModel->getRecommend( $memberModel->getAllRecommend() );
			$theArray ['recommended_code'] = $data['recommended_code'];
			$theArray ['create_time'] = time();
			$memberModel->add( $theArray );
			$theObj = $memberModel->where( array( 'wx_open_id' => $data ['wx_open_id'] ) )->find();
			$this->setUserInfo( $data, $theObj, $memberModel );
		} else {
			$this->setUserInfo( $data, $memberObj, $memberModel );
		}
	}
	
	// 更新账号信息
	public function setUserInfo( $data, $user, $memberModel ) {
		// 重组数据
		$theArray = $data;
		$theArray['id'] = $user['id'];
		if ( empty( $user['wx_name'] ) || $user['wx_name'] == 'null' ) {
			$theArray['wx_name'] = $data['wx_name'];
		} else {
			unset( $theArray['wx_name'] );
		}
		// 判断是否设置了头像
		if ( empty( $user['face'] ) ) {
			$theArray['face'] = $this->getWeiXinFace( $data['face'], 'Uploads/head/' . $theArray ['wx_open_id'] . '.jpg' );
		} else {
			$theArray['face'] = $user['face'];
		}
		// 如果密码为空，则默认为123456
		if ( empty( $user['password'] ) ) {
			$theArray['password'] = sha1( '123456' );
		}

		// 去掉推荐人
		unset( $theArray['recommended_code'] );
		
		// 更新信息
		$memberModel->save( $theArray );
		
		// 登录会员
		$this->login( $user, $memberModel );
	}
	
	// 登录
	public function login( $user, $memberModel ) {
		// 写入登录信息
		$update = array(
			'id' => $user['id'],
			'last_login_time' => time(),
			'last_login_ip' => get_client_ip( 1 )
		);
		// 是否是第一次访问
		if ( empty( $user['first_view'] ) ) {
			if ( strpos( $_SERVER['HTTP_USER_AGENT'], 'MicroMessenger' ) !== false ) {
				$tempUrl = $this->wx_follow;
			} else {
				$tempUrl = $this->url;
			}
			$update['first_view'] = 1;
		} else {
			$tempUrl = $this->url;
		}
		$memberModel->save( $update );
		// 更新登录日志
		$tempUsername = !empty( $user['username'] ) ? $user['username'] : $user['referral_code'];
		$memberModel->addLog( $tempUsername, '', $update['last_login_time'], '微信登录' );
		// 更新登录在线记录
		$memberModel->addMemberLine( $user['id'] );
		// 写入到session
		$auth = array(
			'id' => $user['id'],
			'username' => $user['username'],
			'referral_code' => $user['referral_code'],
			'last_login_time' => $update['last_login_time'],
			'last_login_ip' => $update['last_login_ip'],
		);
		session( 'member_auth', $auth );		
		// 登陆时存cookie商品进数据库
		setCartCookie();
		if($_SESSION['recommend_url']){
			$this->url = U('Member/recommend/code/'.$user['referral_code']);
		}
		header( 'Location:' . $tempUrl );
	}
	
	// 获取并下载微信头像
	public function getWeiXinFace( $url, $filename ) {
		// 初始化一个curl对象
		$my_curl = curl_init();
		// 设置你需要抓取的URL
		curl_setopt($my_curl, CURLOPT_URL, "$url");
		// 设置是将结果保存到字符串中还是输出到屏幕上，1表示将结果保存到字符串
		curl_setopt($my_curl,CURLOPT_RETURNTRANSFER,1);
		// 执行请求
		$headurl = curl_exec($my_curl);
		// 关闭url请求
		curl_close($my_curl);
		file_put_contents( $filename, $headurl );
		/* if ( strpbrk( $filename, "/.jpg" ) !== false ) {
			return $this->getWeiXinFace( $url, $filename );
		} else {
			return $filename;
		} */
		return $filename;
	}

}