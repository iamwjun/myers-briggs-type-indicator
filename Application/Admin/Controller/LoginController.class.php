<?php
namespace Admin\Controller;
use Think\Controller;

class LoginController extends Controller {
	
	/**
	 * 登录首页
	 */
	public function index() {
		$userAuth = session('userAuth');
		if ( !$userAuth ) {
			$this->redirect( '/Admin/login' );
		} else {
			$this->redirect( '/Admin/index' );
		}
	}
	
	/**
	 * 登录
	 */
	public function login() {
		if ( IS_POST ) {
			$this->ajaxReturn( D( "User" )->login( $_POST ) );
		} else {
			// 基本配置
			$this->assign ( 'config', D ( 'Config' )->getOne ( 1 ) );
			$this->display( "login" );
		}
	}
	
	/**
	 * 退出登录
	 */
	public function logout() {
		session( 'userAuth', null );
		$this->redirect( '/Admin/login' );
	}
	
	/**
	 * 验证码
	 */
	public function verify() {
		$verify = new \Think\Verify( array( "length"=>5 ) );
		$verify->entry( 1 );
	}
}