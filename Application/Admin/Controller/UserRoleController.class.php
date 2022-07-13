<?php
namespace Admin\Controller;

/**
 * 后台管理-管理员群组控制器
 * 
 * @author Administrator
 *        
 */
class UserRoleController extends CommController {
	
	public function _initialize() {
		parent::_initialize();
		// 模型
		$this->model = D( 'UserRole' );
		// 参数
		$this->paramter['pid'] = I( 'request.pid', 0 );
	}
	
	/**
	 * 管理员群组列表
	 */
	public function index() {		
		// 获取参数
		$this->paramter['parent_id'] = $this->model->getOne ( $this->paramter['pid'], 'id', false, 'pid' );
		$this->paramter['title'] = I( 'post.title', '' );
		
		// 设置查询条件
		$field = "a.id,a.pid,a.title,a.intro,a.create_time,a.status,a.sort";
		$field .= ",b.title as parent_title";
		
		$sql = "select $field from db_user_role as a";
		$sql .= " left join db_user_role as b on a.pid = b.id";
		$sql .= " where 1=1";
		$sql .= " and a.pid = {$this->paramter['pid']} and a.is_delete = 0";
		// 群组名称
		if ( !empty( $this->paramter['title'] ) ) {
			$sql .= " and a.title like '%{$this->paramter['title']}%'";
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
	 * 添加管理员群组-前置
	 */
	public function _before_add() {
		$this->assign( "paramter", $this->paramter );
	}
	
	/**
	 * 权限列表
	 */
	public function auth() {
		$theId = I( 'get.id', 0 );
		$authInfo = $this->model->getOne( $theId, 'id' );
		// 群组id
		$this->assign( "authInfo", $authInfo );
		// 获取节点
		$nodeList = D( 'UserNode' )->authNodeList( $authInfo['auth'] );
		/* print_r( $nodeList );
		die(); */
		$this->assign( 'nodeList', json_encode( $nodeList ) );
		// 渲染视图
		$this->display ();
	}
	
	/**
	 * 设置授权
	 */
	public function auth_save() {
		$returnMsg = $this->model->auth_save ( $_POST );
		$this->HuiMsg( $returnMsg );
	}
}