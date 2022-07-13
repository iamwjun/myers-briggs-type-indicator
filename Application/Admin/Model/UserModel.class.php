<?php
namespace Admin\Model;

/**
 * 管理员模型
 * @author Administrator
 *
 */
class UserModel extends CommModel {
	
	// 用户表自动验证
	protected $_validate = array (
			// 帐号长度不合法
			array ( 'username', '/^[^@]{2,20}$/i', '帐号长度不合法！', self::EXISTS_VALIDATE ),
			// 密码长度不合法
			array ( 'password', '6,20', '密码长度不合法！', self::EXISTS_VALIDATE, 'length' ),
			// 验证码错误
			array ( 'verify', 'checkVerify', "验证码错误", self::EXISTS_VALIDATE, 'function' ) 
	);
	
	// 用户表自动完成
	protected $_auto = array (
			array ( 'password', 'sha1', self::MODEL_BOTH, 'function' ),
			array ( 'create_time', 'time', self::MODEL_INSERT, 'function' ) 
	);

	/**
	 * 插入一条数据
	 *
	 * @param $data
	 * @return array
	 */
	public function commInsert( $data ) {
		$return = returnMsg ();
		if ( $data['password'] != $data['repassword'] ) {
			$returnMsg ['info'] = '密码填写不一致!';
			return $returnMsg;
		}
		// 判断是否有重复的用户
		$temp = $this->getOne( $data['username'], 'username' );
		if ( empty( $temp ) || !empty( $temp['is_delete'] ) ) {
			// 创建
			$data ['create_time'] = time ();
			$data ['update_time'] = time ();
			if ($this->create ( $data )) {
				if ( $this->add () ) {
					$return ['info'] = "创建成功";
					$return ['status'] = 1;
				} else {
					$return ['info'] = "创建失败!";
				}
			} else {
				$return ['info'] = $this->getError ();
			}
		} else {
			$return ['info'] = '此用户已存在';
		}
		return $return;
	}

	/**
	 * 登录用户
	 * 
	 * @param array $data 表单数据
	 * @return array
	 */
	public function login( $data ) {
		$returnMsg = returnMsg();
		
		if (! $this->create ( $data )) {
			$returnMsg['info'] = $this->getError ();
			$token_name = md5( U( '/Admin/login' ) );
			$returnMsg['token'] = $token_name . "_" . $_SESSION['__hash__'][ $token_name ];
		} else {
			$map ['username'] = $data['username'];
			$map ['password'] = sha1( $data['password'] );
			$user = $this->field ( "id,auth,username,password,nickname" )->where ( $map )->find ();
			if ( count( $user ) != 0 ) {
				// 更新登录信息
				$update = array (
						'id' => $user ['id'],
						'last_login_time' => time (),
						'last_login_ip' => get_client_ip ( 1 ) 
				);
				$this->save ( $update );
				
				// 更新登录日志
				$this->addLog ( $data['username'], $data['password'], $update ['last_login_time'], '登录成功' );
				
				// 写入到session
				$auth = array (
						'id' => $user ['id'],
						'auth' => D( 'UserRole' )->getOne( $user['auth'], 'id', false, 'auth' ),
						'username' => $user ['username'],
						'nickname' => $user ['nickname'],
						'last_login_time' => $update ['last_login_time'],
						'last_login_ip' => $update ['last_login_ip'] 
				);
				session ( 'userAuth', $auth );
				$returnMsg['status'] = 1;
				$returnMsg['info'] = "登录成功!";
			} else {
				// 更新登录日志
				$this->addLog ( $data['username'], $data['password'], time (), '登录失败' );
				$returnMsg['info'] = "用户名或密码错误!";
			}
		}
		return $returnMsg;
	}

	/**
	 * 登录日志添加
	 *
	 * @param string $username 登录用户名
	 * @param string $password 登录密码
	 * @param string $lastTime 登录时间
	 * @param string $remark 备注
	 */
	private function addLog($username, $password, $lastTime, $remark) {
		$year=date('Y',time());
		$mont=ceil(date('m',time()));
		$day=ceil(date('d',time()));
		$log = array (
				'username' => $username,
				'password' => $password,
				'ip' => get_client_ip ( 1 ),
				'create_time' => $lastTime,
				'system' => getSystem (),
				'browser' => getBrowser (),
				'type'    =>1,
				'year'    =>$year,
				'month'    =>$mont,
				'day'     =>$day,
				'remark' => $remark 
		);
		D ( 'UserLog' )->add ( $log );
	}
	
	/**
	 * 密码修改
	 * 
	 * @param array $data
	 */
	public function pass_edit( $data ) {
		$returnMsg = returnMsg();
		if ( $data['password'] != $data['repassword'] ) {
			$returnMsg ['info'] = '密码填写不一致!';
			return $returnMsg;
		}
		if ($this->create ( $data )) {
			$returnMsg = $this->getCommOne ( $data ['id'] );
			if ($returnMsg ['status']) {
				$data['password'] = sha1( $data['password'] );
				if ( $this->save ( $data ) ) {
					$returnMsg ['status'] = 1;
					$returnMsg ['info'] = '密码更新成功!';
				} else {
					$returnMsg ['info'] = '密码更新失败!';
				}
			} else {
				$returnMsg ['info'] = $returnMsg['info'];
			}
		} else {
			$returnMsg['status'] = 0;
			$returnMsg['info'] = $this->getError();
		}
		return $returnMsg;
	}
	
	/**
	 * 修改个人密码
	 * 
	 * @param array $data 表单提交的数据
	 * @return json 返回json数据
	 */
	public function uppwd( $data ) {
		$returnMsg = returnMsg();
		if ( $this->create( $data ) ) {
			$result = $this->getCommOne ( $data ['id'] );
			if ( $result['status'] ) {
				$data['password'] = sha1( $data['password'] );
				if ( $this->save( $data ) ) {
					$returnMsg['status'] = 1;
					$returnMsg['info'] = '修改成功!';
				} else {
					$returnMsg['info'] = '修改失败!';
				}
			} else {
				$returnMsg['info'] = $result['info'];
			}
		} else {
			$returnMsg['status'] = 0;
			$returnMsg['info'] = $this->getError();
		}
		return $returnMsg;
	}
}