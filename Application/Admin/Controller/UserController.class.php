<?php
namespace Admin\Controller;

/**
 * 管理员控制器
 * 
 * @author BoBo
 *        
 */
class UserController extends CommController {
	
	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize();
		// 模型
		$this->model = D( 'User' );
		// 参数
		$this->paramter['auth'] = I( 'post.auth', 0 );
		// 权限群组
		$this->getRoleList();
	}
	
	/**
	 * 管理员列表
	 */
	public function index() {
		// 获取参数
		$this->paramter['username'] = I( 'post.username', '' );
		$this->paramter['nickname'] = I( 'post.nickname', '' );
		$this->paramter['start_time'] = I( 'post.start_time', '' );
		$this->paramter['end_time'] = I( 'post.end_time', '' );
		// 设置查询条件
		$field = "a.id,a.username,a.nickname,a.intro,a.status,a.create_time,a.last_login_time,a.last_login_ip,a.sort";
		$field .= ",b.title as auth_title";
		
		$sql = "select $field from db_user as a";
		$sql .= " left join db_user_role as b on a.auth = b.id";
		$sql .= " where 1=1 and a.id <> 1 and a.is_delete = 0";
		// 群组
		if ( !empty( $this->paramter['auth'] ) ) {
			$sql .= " and a.auth = {$this->paramter['auth']}";
		}
		// 用户名
		if ( !empty( $this->paramter['username'] ) ) {
			$sql .= " and a.username like '%{$this->paramter['username']}%'";
		}
		// 真实姓名
		if ( !empty( $this->paramter['nickname'] ) ) {
			$sql .= " and a.nickname like '%{$this->paramter['nickname']}%'";
		}
		// 日期范围
		if ( !empty( $this->paramter['start_time'] ) || !empty( $this->paramter['end_time'] ) ) {
			$sql .= " and a.create_time between ".strtotime($this->paramter['start_time'])." and ".strtotime($this->paramter['end_time'])."";
		} else if ( !empty( $this->paramter['start_time'] ) ) {
			$start_time = strtotime( $this->paramter['start_time'] );
			$end_time = strtotime( date( $this->paramter['start_time'], strtotime('+1 day') ) ) - 1;
			$sql .= " and a.create_time between $start_time and $end_time";
		} else if ( !empty( $this->paramter['end_time'] ) ) {
			$start_time = strtotime( $this->paramter['end_time'] );
			$end_time = strtotime( date( $this->paramter['end_time'], strtotime('+1 day') ) ) - 1;
			$sql .= " and a.create_time between $start_time and $end_time";
		}
		
		// 读取数据
		$this->dataList = $this->model->getSQLList( $sql, array( 'begin' => 0, 'num' => 0 ) );
		
		// 注入数据
		$this->assign( "paramter", $this->paramter );
		$this->assign( "dataList", $this->dataList );
		
		// 渲染视图
		$this->display ();
	}
	
	/**
	 * 获取权限群组列表
	 */
	private function getRoleList() {
		$roleList = D( 'UserRole' )->getList( array( 'is_delete' => 0 ), "id,title" );
		$this->assign( "roleList", $roleList );
	}
	
	/**
	 * 密码修改
	 */
	public function pass_edit() {
		$tag = I( 'get.tag', '' );
		if ( $tag == "update" ) {
			$returnMsg = $this->model->pass_edit ( $_POST );
			$this->HuiMsg( $returnMsg );
		} else {
			$theId = I( 'request.id', 0 );
			$return = $this->model->getCommOne ( $theId );
			if ($return ['status']) {
				$this->assign ( 'dataInfo', $return ['info'] );
			} else {
				die( $return['info'] );
			}
			$this->display (); 
		}
	}
	
	/**
	 * 修改个人密码
	 */
	public function uppwd() {
		if (IS_POST) {
			$returnMsg = returnMsg();
			if (sha1 ( $_POST ['oldpwd'] ) != $this->user ['password'] ){
				$returnMsg['info'] = "旧密码填写有误!";
			} else if ( $_POST ['newpwd'] != $_POST ['confimpwd'] || empty ( $_POST ['newpwd'] ) || empty ( $_POST ['confimpwd'] ) ) {
				$returnMsg['info'] = "新密码填写不一致!";
			} else {
				$newArray['id'] = $this->user['id'];
				$newArray['password'] = $_POST['newpwd'];
				$returnMsg = $this->model->uppwd( $newArray );
			}
			$this->HuiMsg( $returnMsg );
		} else {
			$this->display ();
		}
	}
	
	/**
	 * 查看个人详情
	 */
	public function show() {
		$theId = I( 'get.id', 0 );
		if ( !empty( $theId ) ) {
			$this->user = $this->model->getOne( $theId, 'id' );
		}
		$this->user['authName'] = D( 'UserRole' )->getOne( $this->user['auth'], 'id', false, 'title' );
		$this->assign( 'userAuth', $this->user );
		// 渲染模板
		$this->display();
	}
}