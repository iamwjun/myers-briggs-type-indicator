<?php
namespace Mobile\Controller;

/**
 * 会员中心
 *
 * @author BoBo
 *        
 */
class MemberController extends CommController {

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		if (strpos ( '|app|', '|' . ACTION_NAME . '|' ) === false) {
			$this->checkLogin ();
		}
		if(ACTION_NAME=='recommend'){
			session('recommend_url','recommend');
			$this->checkLogin ();
		}
	}

	/**
	 * 最新消息公用方法
	 */
	private function comm_newsInfo() {
		$user = $this->member;
		$user_create_time = $user ['create_time'];
		// 查询出从会员开始注册到现在管理员所发的消息
		$data ['create_time'] = $user_create_time;
		$data ['status'] = 1;
		$dataList = D ( 'MemberNews' )->where ( $data )->select ();
		// 查询出会员阅读了哪些消息
		$isShow = D ( 'MemberIsshow' )->where ( 'member_id=' . $user ['id'] )->find ();
		if ($isShow == null) { // 如果会员未阅读过咋、则全标示为新消息
			$newShow = count ( $dataList );
		} else {
			$arrayId = array ();
			$array = explode ( ',', $isShow ['is_new'] );
			$newShow = 0;
			foreach ( $dataList as $key => $val ) {
				if (! in_array ( $val ['id'], $array )) { // 假如该消息未阅读过，则长度+1
					$newShow ++;
				}
			}
		}
		// 计算出消费额，根据所有的订单来计算
		$dataInfo = D ( 'Order' )->where ( 'uid=' . $user ['id'] . ' and is_pay=1' )->select ();
		$totlalPrice = 0;
		if ($dataInfo) {
			foreach ( $dataInfo as $val ) {
				$totlalPrice += $val ['price'];
			}
		}
		$this->assign ( 'totlalPrice', $totlalPrice );
		$this->assign ( 'newShow', $newShow );
	}

	/**
	 * 会员中心
	 */
	public function index() 
	{
		
		$unit=$this->member['unit'];
		
		//获取后台填写的联系电话
	    $this->assign('config',M('config')->where('id>0')->find());
	    $this->assign('unit',$this->member['unit']);
	    //获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display ();	//普通用户个人中心
	
	}


	/**
	 * 会员信息展示页
	 */
	public function news_show() {
		$this->comm_newsInfo ();
		$model = D ( 'MemberNews' );
		$id = I ( 'get.id', '0' );
		if ($id > 0) {
			$dataInfo = $model->where ( 'id=' . $id )->find ();
			$session = session ( 'member_auth' );
			$isShow = D ( 'MemberIsshow' )->where ( 'member_id=' . $session ['id'] )->find ();
			$array = explode ( ',', $isShow ['is_new'] );
			if (! in_array ( $dataInfo ['id'], $array )) { // 假如该消息未阅读过
			                                               // 将这条消息标记为该用户一已读
				$str = $isShow ['is_new'] . $id . ',';
				$a = D ( 'MemberIsshow' )->where ( 'id=' . $isShow ['id'] )->save ( array ('is_new' => $str ) );
			}
			$this->assign ( 'dataInfo', $dataInfo );
		}
		$this->display ();
	}


	/**
	 * 更新个人信息
	 */
	public function update() {
		header ( 'Content-type: text/html; charset=utf-8' );
		if (IS_POST) {
			$return = D ( 'Member' )->update ( $_POST );
			if (empty ( $return ['status'] )) {
				$this->error ( $return ['info'] );
			} else {
				$this->success ( $return ['info'], U ( 'Member/update' ) );
			}
		} else {
			// 获取会员收货地址
			$this->assign ( 'address', D ( 'Address' )->getList () );
			// 栏目名称
			$this->assign ( 'columnTitle', '更新个人信息' );
			// 渲染模板
			$this->display ();
		}
	}

	/**
	 * 推荐页
	 */
	public function recommend() {
		$code = I ( 'get.code', '' );
		if(!$code){
			$code = $_SESSION['member_auth']['referral_code'];
		}
		if (empty ( $code ) || strlen ( $code ) != 6) {
			$this->error ( '请勿非法操作' );
		} else {
			$member = D ( 'Member' )->where ( array ('recommend' => $code ) )->find ();
			if (empty ( $member )) {
				$this->error ( '未找到会员' );
			}
		}
		// 会员专用二维码
		$filename = "Uploads/erweima/$code.png";
		$url = "http://" . $_SERVER ['HTTP_HOST'] . U ( 'Login/register/code/' . $code );
		$this->create_erweima ( $filename, $url );
		// 幻灯片
		$slideCondition = array ('status' => 0,'is_delete' => 0 );
		$slideList = D ( 'Link' )->getList ( $slideCondition, 'title,picture,link' );
		$this->assign ( 'slide', $slideList );
		$this->assign ( 'recommend', I ( 'get.code', '' ) );
		$this->assign ( 'erweima', $filename );
		$this->assign ( 'userObj', $member );
		// 渲染模板
		$this->display ();
	}

	/**
	 * 取得两个日期之间月份
	 * 
	 * @param unknown $date1
	 * @param unknown $date2
	 * @return multitype:string
	 */
	private function diffdate($date1, $date2) {
		if (strtotime ( $date1 ) > strtotime ( $date2 )) {
			$ymd = $date2;
			$date2 = $date1;
			$date1 = $ymd;
		}
		list ( $y1, $m1, $d1 ) = explode ( '-', $date1 );
		list ( $y2, $m2, $d2 ) = explode ( '-', $date2 );
		$math = ($y2 - $y1) * 12 + $m2 - $m1;
		$my_arr = array ();
		if ($y1 == $y2 && $m1 == $m2) {
			if ($m1 < 10) {
				$m1 = intval ( $m1 );
				$m1 = '0' . $m1;
			}
			if ($m2 < 10) {
				$m2 = intval ( $m2 );
				$m2 = '0' . $m2;
			}
			$my_arr [] = $y1 . '-' . $m1 . '-01';
			$my_arr [] = $y2 . '-' . $m2 . '-01';
			return $my_arr;
		}
		$p = $m1;
		$x = $y1;
		for($i = 0; $i <= $math; $i ++) {
			if ($p > 12) {
				$x = $x + 1;
				$p = $p - 12;
				if ($p < 10) {
					$p = intval ( $p );
					$p = '0' . $p;
				}
				$my_arr [] = $x . '-' . $p;
			} else {
				if ($p < 10) {
					$p = intval ( $p );
					$p = '0' . $p;
				}
				$my_arr [] = $x . '-' . $p;
			}
			$p = $p + 1;
		}
		return $my_arr;
	}

	/**
	 * 电话号码
	 */
	public function phone() {
		// 渲染模板
		$this->display ();
	}
	// 设置qq码
	public function qq() {
		if ( IS_POST ) {
			$data['qq'] = I( 'post.qq', '' );
			$data['id'] = $this->member['id'];
			if ( D( 'Member' )->save( $data ) ) {
				$this->success( '修改成功', U( 'Member/update' ) );
			} else {
				$this->error( '设置失败!' );
			}
		} else {
			// 渲染模板
			$this->display();
		}
	}
	// 设置qq码
	public function recommended_code() {
		if ( IS_POST ) {
			$data['recommended_code'] = I( 'post.qq', '' );
			$data['id'] = $this->member['id'];
			if ( D( 'Member' )->save( $data ) ) {
				$this->success( '修改成功', U( 'Member/update' ) );
			} else {
				$this->error( '设置失败!' );
			}
		} else {
			// 渲染模板
			$this->display();
		}
	}
	// 设置性别
	public function sex() {
		if ( IS_POST ) {
			$data['sex'] = I( 'post.sex', '' );
			$data['id'] = $this->member['id'];
			if ( D( 'Member' )->save( $data ) ) {
				echo 1;exit;
			} else {
				echo 2;exit;
			}
		}
	}
	/**
	 * 电话号码绑定
	 */
	public function phone_bind() {
		if (IS_POST) {
			// 手机号码验证
			$username = I ( 'post.phone', '' );
			if (! preg_match ( '/^1[3|4|5|7|8][0-9]\d{8}$/', $username )) {
				$this->error ( '手机号码填写有误' );
			} else {
				if (D ( 'Member' )->checkField ( array ('username' => $username ), "id" )) {
					$this->error ( '手机号码已经被占用，请仔细检查是否填写错误' );
				}
			}
			// 图形验证码
			$verify = I ( 'post.verify', '' );
			if (! checkVerify ( $verify )) {
				$this->error ( '验证码填写错误' );
			}
			// 短信验证码
			$smscode = I ( 'post.smscode', '' );
			if (! checkSMSCode ( $smscode ,$username)) {
				$this->error ( '短信验证码填写错误' );
			}
			// 所有数据正确,则更改电话号码
			$theArray ['username'] = $username;
			$theArray ['tel'] = $username;
			$theArray ['id'] = $this->member ['id'];
			if (D ( 'Member' )->save ( $theArray )) {
				// 写入到session
				$auth = array ('id' => $this->member ['id'],'username' => $username,'recommend' => $this->member ['recommend'],'last_login_time' => $this->member ['last_login_time'],'last_login_ip' => $this->member ['last_login_ip'] );
				session ( 'member_auth', $auth );
				// 写入cookie，实现自动登录，有效期30天
				$member_auto_login = array ('username' => encrypt ( $username, 'E', 'nowamagic' ),'password' => encrypt ( $this->member ['password'], 'E', 'nowamagic' ) );
				$option = array ('expire' => 30 * 24 * 3600,'path' => '/' );
				cookie ( 'member_auto_login', json_encode ( $member_auto_login ), $option );
				$this->success ( '手机号码修改成功', U ( 'Member/index' ) );
			} else {
				$this->error ( '手机号码修改失败' );
			}
		} else {
			// 渲染模板
			$this->display ();
		}
	}
	/**
	 * 设置密码
	 */
	public function edit_pass() {
		if (IS_POST) {
			$data ['password'] = I ( 'post.password', '' );
			$data ['notpassword'] = I ( 'post.notpassword', '' );
			if (strlen ( $data ['password'] ) < 6 || strlen ( $data ['notpassword'] ) < 6) {
				$this->error ( '密码格式填有误!!!' );
			} else if ($data ['password'] != $data ['notpassword']) {
				$this->error ( '密码格式填写不一致!!!' );
			} else if ($data ['password'] == $data ['notpassword']) {
				$theArray ['id'] = $this->member ['id'];
				$theArray ['password'] = sha1 ( $data ['password'] );
				if (D ( 'Member' )->save ( $theArray )) {
					$this->success ( '修改成功', U ( 'Member/index' ) );
				} else {
					$this->error ( '新密码设置失败!' );
				}
			}
		} else {
			// 渲染模板
			$this->display ();
		}
	}
	/**
	 * 修改钱包密码
	 */
	public function updatechange(){
		$returnMsg = returnMsg ( array ( 'info' => '短信验证码错误' ) );
// 		if (IS_AJAX && IS_POST) {
// 			$phone = I ( 'post.phone', '' );
// 			$code = I ( 'post.code', '' );
// 			if (checkSMSCode ( $code, $phone )) {exit;
// 				$returnMsg ['status'] = 1;
// 				$returnMsg ['info'] = '&nbsp;&nbsp;';
// 			}
// 		}
		if(IS_POST){
			$phone = I ( 'post.mobile', '' );
			$code = I ( 'post.mobile_code', '' );
			if (checkSMSCode ( $code, $phone )) {
				$returnMsg ['status'] = 1;
				$returnMsg ['info'] = '&nbsp;&nbsp;';
				//修改
				$data['id'] = $this->member['id'];
				$data['money_pass'] = I('post.smspassword');
				D('Member')->save($data);
				$this->success('设置成功',U('Member/index'));
			}else{
				$this->error($returnMsg['info']);
			}
		}
	}

	/**
	 * app下载
	 */
	public function app() {
		// 渲染模板
		$this->display ();
	}

	/**
	 * 退出登录
	 */
	public function logout() {
		session ( 'member_auth', null );
		cookie ( 'member_auto_login', null );
		$this->redirect("Login/login");
		//$this->success ( '退出成功!', U ( 'Login/login' ) );
	}


	/**
	 * 投诉建议
	 */
	public function suggest(){
		if(IS_AJAX){
			$data = $_POST;
			$data['create_time'] = time();
			$data['member_id'] = $this->member['id'];
			$outPut = array('status'=>0,'msg'=>'');
			if(D('MemberSuggest')->add($data)){
				$outPut['status'] = 1;
			}else{
				$outPut['msg'] = '添加建议失败';
			}
			$this->ajaxReturn ( $outPut );
		}else{
			$this->display();
		}
	}

	/**
	 * 待评价商品个数统计
	 */
	private function getCommentCount() {
		// 设置查询字段
		$field = "b.pro_id,b.id";
		$field .= ",c.picture,c.title";
		// 设置查询条件
		$sql = "select $field from db_order as a";
		$sql .= " left join db_order_info as b on b.order_id = a.order_id";
		$sql .= " left join db_commodity as c on c.id = b.pro_id";
		$sql .= " where a.is_delete = 0 and a.uid = {$this->member['id']} and a.is_pay = 1 and a.is_complete = 1 and b.is_send = 2 and b.is_comment = 0";
		// 设置排序条件
		$order .= "a.create_time desc";
		
		return count( D( 'Order' )->query( $sql ) );
	}

	/**
	 * 会员攻略
	 */
	public function grow_show(){
		$dataInfo = D('WebIntroduce')->where(array('id'=>4))->find();
		$this->assign ( 'dataInfo', $dataInfo );
		// 渲染视图
		$this->display ();
	}


   /**
    * 修改密码
    */
   public function update_pass()
   {
   	if(isset($_POST['ok']))
   	{
   		$data['password']=I('post.password_new');
   		M('member')->where('id='.$this->member['id'])->save($data);

        //修改密码记录到消息表
   		$mes['uid']=$this->member['id'];
   		$mes['title']='密码修改通知';
        $mes['picture']='';
        $mes['content']='你的密码已成功修改，请牢记你的新密码，切勿向其他人透露你的密码信息。';
        $mes['status']=1;
        $mes['create_time']=time();
        $mes['stick']=1;
        $mes['is_delete']=0;
        M('member_news')->add($mes);

   		echo "<script>alert('密码修改成功!请重新登录!')</script>";
   		echo "<script>window.location='logout'</script>";
   	}
   	  $this->assign('unit',$this->member['unit']);
     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
	 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
	 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
	 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
	 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
	 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
	 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));
   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
   	 $this->display();
   }

   /**
    * 意见反馈
    */
   public function feedback()
   {
   	 if(isset($_POST['tj']))
   	 {
   	 	$data['type']=1;
   	 	$data['uid']=$this->member['id'];
   	 	$data['name']=I('post.username');
   	 	$data['tel']=I('post.tel');
   	 	$data['content']=I('post.content');
   	 	$data['status']=0;
   	 	$data['is_delete']=0;
   	 	$data['create_time']=time();

   	 	M('feedback')->add($data);

   	 	//意见反馈记录到消息表
   		$mes['uid']=$this->member['id'];
   		$mes['title']='意见反馈';
        $mes['picture']='';
        $mes['content']='感谢您提供的宝贵意见,我们会尽快完善给您带来更便捷的体验和服务!';
        $mes['status']=1;
        $mes['create_time']=time();
        $mes['stick']=1;
        $mes['is_delete']=0;
        M('member_news')->add($mes);

   	 	$this->redirect('Member/index');
   	 }
   	 else if(isset($_POST['ts']))
   	 {
   	 	$data['type']=2;
   	 	$data['uid']=$this->member['id'];
   	 	$data['name']=I('post.key');
   	 	$data['tel']=I('post.tel');
   	 	$data['content']=I('post.content');
   	 	$data['status']=0;
   	 	$data['is_delete']=0;
   	 	$data['create_time']=time();

   	 	M('feedback')->add($data);
        //举报投诉记录到消息表
   		$mes['uid']=$this->member['id'];
   		$mes['title']='举报投诉';
        $mes['picture']='';
        $mes['content']='我们会尽快为您处理投诉问题,给您带来的不便请多谅解!';
        $mes['status']=1;
        $mes['create_time']=time();
        $mes['stick']=1;
        $mes['is_delete']=0;
        M('member_news')->add($mes);

   	 	$this->redirect('Member/index');
   	 }
   	 $this->assign('unit',$this->member['unit']);
     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
	 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
	 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
	 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
	 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
	 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
	 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));
   	 $this->display();
   }
   /**
    * 编辑资料
    */
   public function edit_info()
   {
   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
   	 $this->assign('unit',$this->member['unit']);
     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
	 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
	 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
	 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
	 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
	 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
	 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));

	 //获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
   	 $this->display();
   }
   /**
    * 修改昵称
    */
   public function update_nickname()
   {
   	 if(isset($_POST['ok']))
   	 {
   	 	$data['nickname']=I('post.nickname');
   	 	M('member')->where('id='.$this->member['id'])->save($data);
   	 	$this->redirect('Member/edit_info');
   	 }
   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
   	 $this->display();
   }
   /**
    * 修改QQ
    */
   public function update_qq()
   {
   	if(isset($_POST['ok']))
   	 {
   	 	$data['qq']=I('post.qq');
   	 	M('member')->where('id='.$this->member['id'])->save($data);
   	 	$this->redirect('Member/edit_info');
   	 }
   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
   	 $this->display();
   }
   /**
    * 修改邮箱
    */
   public function update_email()
   {
   	if(isset($_POST['ok']))
   	 {
   	 	$data['email']=I('post.email');
   	 	M('member')->where('id='.$this->member['id'])->save($data);
   	 	$this->redirect('Member/edit_info');
   	 }
   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
   	 $this->display();
   }
   /**
    * 修改姓名
    */
   public function update_name()
   {
	   	if(isset($_POST['ok']))
	   	 {
	   	 	$data['truename']=I('post.truename');
	   	 	M('member')->where('id='.$this->member['id'])->save($data);
	   	 	$this->redirect('Member/edit_info');
	   	 }
	   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
	   	 $this->display();
   }
   /**
    * 修改单位
    */
   public function update_company()
   {
   	   if(isset($_POST['ok']))
	   	 {
	   	 	$data['company']=I('post.company');
	   	 	M('member')->where('id='.$this->member['id'])->save($data);
	   	 	$this->redirect('Member/edit_info');
	   	 }
	   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
	   	 $this->display();
   }
   /**
    * 修改单位地址
    */
   public function update_addr()
   {
   	   if(isset($_POST['ok']))
	   	 {
	   	 	$data['company_addr']=I('post.company_addr');
	   	 	M('member')->where('id='.$this->member['id'])->save($data);
	   	 	$this->redirect('Member/edit_info');
	   	 }
	   	 $this->assign('userinfo',M('member')->where('id='.$this->member['id'])->find());
	   	 $this->display();
   }
   /**
    * 修改性别
    */
   public function update_sex()
   {
   	 $data['sex']=I('post.type');
   	 M('member')->where('id='.$this->member['id'])->save($data);
   }
   /**
    * 修改生日
    */
   public function update_birthday()
   {
   	 $data['birthday']=I('post.obj');
   	 M('member')->where('id='.$this->member['id'])->save($data);
   }
   /**
    * 修改密码时检查原始密码是否正确
    */
   public function check_pass()
   {
   	 $pass=sha1(I('post.old_pass'));
   	 $cont1=M('member')->where("id=".$this->member['id']." and password='".$pass."'")->count();
   	 $cont2=M('member')->where("id=".$this->member['id']." and password='".I('post.old_pass')."'")->count();
   	 if($cont1!=0)
   	 {
   	 	$cont=$cont1;
   	 }
   	 if($cont2!=0)
   	 {
   	 	$cont=$cont2;
   	 }
   	 if($cont==0 )
   	 {	 	
   	 	 echo "原始密码输入错误!";
   	 }
   	 else{
   	         echo "正确";
   	 }
   }
   
   /**
    * 工程师上门检测后，填写设备实际故障描述信息
    */
   public function add_true_desc()
   {
   	  $data['true_desc']=I('post.tex');
   	  M('repair')->where('id='.I('post.oid'))->save($data);
   }
   
   /**
    * 申请成为经销商
    */
   public function distributor()
   {
   	  $this->display();
   }
   /**
    * 申请成为供应商
    */
   public function supplier()
   {
   	  $this->display();
   }
   /**
    * 申请成为计量检测单位
    */
   public function testing()
   {
   	  $this->display();
   }

   //图片文件上传
	public function upload_imginfo()
	{
		$m=M('member')->where('id='.$this->member['id'])->find();
		/**身份证正面上传**/
		if(isset($_POST['tj_img']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file1']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file1']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file1']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件1]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
		/**身份证反面上传**/
		if(isset($_POST['tj_img_1']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file3']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file3']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file3']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件2]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
		if(isset($_POST['tj_img_2']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file2']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file2']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file2']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件2]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
		//附件上传
		if(isset($_POST['tj_img_3']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['fujian']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['fujian']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['fujian']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件2]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}

	}

   //获取上传的小图片
	public function show_repair()
	{
		$m=M('member')->where('id='.$this->member['id'])->find();
		$cover=M('task_picture_save')->where('type_id='.$_GET['type'].' and uid='.$m['id'])->select();
		if($cover)
		{
			echo json_encode($cover);
		}
	}



	//判断是否有下级配件分类
	public function get_next()
	{
		$child=M('commodity_class')->where('pid='.I('post.id').' and is_delete=0 and status=0')->count();
		if($child>0)
		{
			echo I('post.id');
		}
		else{
			echo 0;
		}
	}
	//获取二级分类
	public function child()
	{
		$info=M('commodity_class')->where('pid='.I('get.id').' and is_delete=0 and status=0')->order('sort desc')->select();
		if($info)
		{
			echo json_encode($info);
		}
	}
	//获取san级分类
	public function kid()
	{
		$info=M('commodity_class')->where('pid='.I('get.id').' and is_delete=0 and status=0')->order('sort desc')->select();
		if($info)
		{
			echo json_encode($info);
		}
	}
	//选分类筛查出配件列表
	public function sel_list()
	{
		$list=M('commodity')->where('pid='.I('get.id').' and is_delete=0')->order('sort desc')->select();
		if($list)
		{
			echo json_encode($list);
		}
	}

	//用户头像上传
	public function upload_head_face()
	{
		$m=M('member')->where('id='.$this->member['id'])->find();
		if(isset($_POST['head_pic']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file1']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file1']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file1']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件1]上传失败!')</script>";
				}
			$data['face']='/Uploads/'.$path.'/'.$first_file;

			M('member')->where('id='.$this->member['id'])->save($data);
		}
	}
	//物流跟踪
	public function logistics()
	{
		$this->display();
	}
	//用户确认订单完成然后评价订单
	public function complet_order()
	{
       if(IS_POST)
       {
       	 $uid=I('post.uid');
       	 $point=I('post.point');
       	 $user=M('member')->where('id='.$uid)->getField('position');

       	 $data['position']=($point+$user);
       	 M('member')->where('id='.$uid)->save($data);
       }
	}
	//提交评价信息
	public function add_comment()
	{
       if(IS_POST)
       {
       	 $uid=I('post.uid');
       	 $point=I('post.point');
       	 $user=M('member')->where('id='.$uid)->getField('position');

       	 $data['position']=$point+$user;
       	 M('member')->where('id='.$uid)->save($data);

       	 $ups['status']=8;
       	 M('repair')->where('id='.I('post.oid'))->save($ups);
       	 echo "评价成功!";
       }
	}
	//删除选择的图片
	public function del_img()
	{
		M('task_picture_save')->where('id='.I('post.id'))->delete();
	}
	//工程师报价时修改服务费用
	public function update_price()
	{
		$data['intro']=I('post.price');
		M('object')->where('id='.I('post.id'))->save($data);
	}
	
}
