<?php
namespace Home\Controller;

/**
 * 会员登录注册控制器
 *
 * @author BoBo
 *        
 */
class LoginController extends CommController {

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		$session = session ( 'member_auth' );
		if (count ( $session ) > 0) {
			$this->redirect ( 'Member/index' );
		}
	}
   //判断用户名是否重复
	public function check_users()
	{
		$cont=M('member')->where("username='".I('post.username')."'")->count();
		echo $cont;
	}
	/**
	 * 登录
	 */
	public function login() {
		if (IS_POST) {
			$user=I('post.username');
			$pass=I('post.password');
		    $check=M('member')->where("username='".$user."'")->getField('is_delete');
		    if($check==1)
		    {
                    $this->error ( '用户不存在!', $history );
		    }
		    else{
				$return = D ( "Member" )->login ( $_POST );
				if (empty ( $return ['status'] )) {
					$this->error ( $return ['info'] );
					
				   // 更新登录日志
				   $this->addLog ( $user, $pass, time(), '登录失败' );
				} else {
					$history = $this->setHistory ( $_POST ['history'] );
					// 登陆时存cookie进数据库
					//setCartCookie ();

					// 更新登录日志
				    $this->addLog ( $user, $pass, time(), '登录成功' );

					$this->redirect('Member/index');
					//$this->success ( '登录成功!', $history );
				}
			}
		} else {
			//  if ( isWeChat() ) {
			// 	if (strpos ( $_SERVER ['HTTP_REFERER'], 'logout' ) !== false) {
			// 		$this->redirect ( 'Index/index' );
			// 	} else {
			// 		$recommend = I ( 'get.recommend_code', 0 );
			// 		$recommend_code = empty ( $recommend ) ? "" : "/recommend_code/$recommend";
			// 		$theUrl = "http://" . $_SERVER ['HTTP_HOST'] . "/WeiXin/index$recommend_code";
			// 		$this->assign ( "url", $theUrl );
			// 		$this->display ( "Login/loading" );
			// 	}
			// } else { 
				$this->assign('username',$_COOKIE['username']);
				$this->assign('password',$_COOKIE['password']);
				$this->display ();
			 // } 
		}
	}

//用户登录写入登录日志信息
	public  function addLog($username, $password, $lastTime, $remark) {
		$year=date('Y',time());
		$mont=ceil(date('m',time()));
		$day=ceil(date('d',time()));
		$log = array (
				'username' => $username,
				'password' => $password,
				'ip' => $this->getIp(),
				'create_time' => $lastTime,
				'system' => getSystem (),
				'browser' => getBrowser (),
				'type'    =>2,
				'year'    =>$year,
				'month'    =>$mont,
				'day'     =>$day,
				'remark' => $remark 
		);
		$map['username']=$username;
		$map['day']=$day;
		$check=M('user_log')->where($map)->count();
		//每个用户每天无论登录多少次,当天只写入一次登录日志信息

		if($check==0)
		{
			M('user_log')->add ( $log );
		}
	}


function getIp()
{
    if ($_SERVER["HTTP_CLIENT_IP"] && strcasecmp($_SERVER["HTTP_CLIENT_IP"], "unknown")) {
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    } else {
        if ($_SERVER["HTTP_X_FORWARDED_FOR"] && strcasecmp($_SERVER["HTTP_X_FORWARDED_FOR"], "unknown")) {
            $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else {
            if ($_SERVER["REMOTE_ADDR"] && strcasecmp($_SERVER["REMOTE_ADDR"], "unknown")) {
                $ip = $_SERVER["REMOTE_ADDR"];
            } else {
                if (isset ($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'],
                        "unknown")
                ) {
                    $ip = $_SERVER['REMOTE_ADDR'];
                } else {
                    $ip = "unknown";
                }
            }
        }
    }
    return ($ip);
}
	/**
	 * 注册
	 */
	public function register() {
		if (IS_POST) {
			$return = D ( 'Member' )->register ( $_POST );
			if (empty ( $return ['status'] )) {
				$this->error ( $return ['info'] );
			} else {
				$this->success ( '注册成功!', U ( 'Member/edit_pass' ) );
			}
		} else {
			$recommend = I ( 'get.code', '' );
			 if (strpos ( $_SERVER ['HTTP_USER_AGENT'], 'MicroMessenger' ) !== false) {
				$recommend_code = empty ( $recommend ) ? "" : "/recommend_code/$recommend";
				$theUrl = "http://" . $_SERVER ['HTTP_HOST'] . "/WeiXin/index$recommend_code";
				$this->assign ( "url", $theUrl );
				$this->display ( "Login/loading" );
			} else { 
				$this->assign ( 'recommend', $recommend );
				$this->display ();
			 } 
		}
	}

	/**
	 * 设置登录后跳转历史页面
	 * 
	 * @param unknown $url
	 * @return Ambigous <string, mixed>|unknown
	 */
	private function setHistory($url) {
		$defaultUrl = U ( 'Member/index' );
		if (strpos ( $url, "register" ) !== false) {
			return $defaultUrl;
		} else if (strpos ( $url, "login" ) !== false) {
			return $defaultUrl;
		} else if (strpos ( $url, "logout" ) !== false) {
			return $defaultUrl;
		} else {
			return $url;
		}
	}
	/**
	 * 判断用户是否存在
	 */
	public function check_user()
	{
		$user=I('post.user');
		$check=M('member')->where("username='".$user."' and is_delete=0")->count();
		echo $check;
	}
	/**
	 * 判断用户是否被禁用
	 */
	public function stop_user()
	{
		$user=I('post.user');
		$check=M('member')->where("username='".$user."' and is_delete=0 and status=1")->count();
		echo $check;
	}
    public function get_pass()
    {
    	$pass=M('member')->where("username='".I('post.name')."'")->getField('password');
    	echo $pass;
    }
    //记住登录账号和密码
	public function remember_logininfo()
	{
		if($_GET['status']==1)
		{
			setcookie("username",$_GET['username'],time()+180*24*3600);
			setcookie("password",$_GET['pass'],time()+180*24*3600);
		}
		else{
			setcookie('username', '', 0);
		    setcookie('password', '', 0);
		}
	}



	/**
   * 阿里云-短息接口调用
   */

   /********短信接口处理开始*********/
   
	public function sendsms(){
            $target = "http://dysmsapi.aliyuncs.com/?";  
            $phoneNum = I('post.phone');//手机号码串，以逗号隔开
            $mobile_code = I('post.code');//验证码
            // 注意使用GMT时间  
            date_default_timezone_set("GMT");  
            $dateTimeFormat = 'Y-m-d\TH:i:s\Z'; // ISO8601规范  
            $accessKeyId = 'LTAI5tEHZosQw1gGwJcDYjwy';
            $accessKeySecret = 'TDPq4l0HyeglHdRXbGNLbdqq84NRSa';
            $ParamString="{\"code\":\"".strval($mobile_code)."\"}";  
            $data = array(  
                // 公共参数   
                'SignatureMethod' => 'HMAC-SHA1',
                'SignatureNonce'=> uniqid(),  
                'Format' => 'XML',   
                'AccessKeyId' => $accessKeyId,  
                'SignatureVersion' => '1.0',    
                'Timestamp' => date($dateTimeFormat),  
                // 业务参数  
                'Action'         => 'SendSms',  
                'Version'         => '2017-05-25',
                'RegionId'         => 'cn-hangzhou',
                'TemplateCode'     => 'SMS_162450947',  
                'PhoneNumbers'     => $phoneNum,  
                'SignName'        =>'吐思智慧',
                'TemplateParam' => $ParamString,
                'OutId'            => '123'
            );
            $data['Signature'] = $this -> getSign($data, $accessKeySecret);  
            // dump($data);die;
            // 发送请求
            $result = $this -> xml_to_array($this -> https_request($target.http_build_query($data)));
               if($result["SendSmsResponse"]['Message'] == 'OK' && $result['SendSmsResponse']["Code"] == 'OK'){
                   return true;
               }else{
                   return $result["SendSmsResponse"]["Message"]."和".$result["SendSmsResponse"]["Code"];
               }
        }
          // 接口请求
        public function https_request($url){  
            $curl = curl_init();  
            curl_setopt($curl, CURLOPT_URL, $url);  
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);  
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);  
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);  
            $data = curl_exec($curl);  
            if (curl_errno($curl)) {return 'ERROR '.curl_error($curl);}  
            curl_close($curl);  
            return $data;  
        }  
        // xml格式转成数组格式
        public function xml_to_array($xml){  
            $reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";  
            if(preg_match_all($reg, $xml, $matches)){  
                $count = count($matches[0]);  
                for($i = 0; $i < $count; $i++){  
                $subxml= $matches[2][$i];  
                $key = $matches[1][$i];  
                    if(preg_match( $reg, $subxml )){  
                        $arr[$key] = $this -> xml_to_array( $subxml );  
                    }else{  
                        $arr[$key] = $subxml;  
                    }  
                }  
            }  
            return @$arr;  
        }    
          
        public function percentEncode($str) {  
            // 使用urlencode编码后，将"+","*","%7E"做替换即满足ECS API规定的编码规范  
            $res = urlencode($str);  
            $res = preg_replace('/\+/', '%20', $res);  
            $res = preg_replace('/\*/', '%2A', $res);  
            $res = preg_replace('/%7E/', '~', $res);  
            return $res;  
        }    
        //获取签名算法--按照阿里云文档指示一步一步算
        public function getSign($parameters, $accessKeySecret) {  
            // 第一步 将参数Key按字典顺序排序  
            ksort($parameters);  
            // 第二步 生成规范化请求字符串  
            $canonicalizedQueryString = '';  
            foreach($parameters as $key => $value)  
            {  
            $canonicalizedQueryString .= '&' . $this -> percentEncode($key)  
                . '=' . $this -> percentEncode($value);  
            }  
            // 第三步 生成用于计算签名的字符串 stringToSign  
            $stringToSign = 'GET&%2F&' . $this -> percentEncode(substr($canonicalizedQueryString, 1));  
            //echo "<br>".$stringToSign."<br>";  
            // 第四步 计算签名，注意accessKeySecret后面要加上字符'&'  
            $signature = base64_encode(hash_hmac('sha1', $stringToSign, $accessKeySecret . '&', true));  
            return $signature;  
        }

    /********短信接口处理结束*********/
}