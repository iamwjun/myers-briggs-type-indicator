<?php
namespace Admin\Controller;

/**
 * 后台管理-操作节点控制器
 * 
 * @author Administrator
 *        
 */
class UserNodeController extends CommController {
	
	public function _initialize() {
		parent::_initialize();
		// 模型
		$this->model = D( 'UserNode' );
		// 参数
		$this->paramter['pid'] = I( 'get.pid', 0 );
	}
	
	/**
	 * 操作节点列表
	 */
	public function index() {		
		// 获取参数
		$this->paramter['parent_id'] = $this->model->getOne ( $this->paramter['pid'], 'id', false, 'pid' );
		
		// 设置查询条件
		$field = "a.id,a.pid,a.name,a.title,a.is_nav,a.create_time,a.status,a.sort";
		$field .= ",b.title as parent_title";
		//$field .= ",c.title as group_title";
		
		$sql = "select $field from db_user_node as a";
		$sql .= " left join db_user_node as b on a.pid = b.id";
		//$sql .= " left join db_user_group as c on a.group_id = c.id";
		$sql .= " where 1=1";
		$sql .= " and a.pid = {$this->paramter['pid']} and a.is_delete = 0";
		
		// 读取数据
		$this->dataList = $this->model->getSQLList( $sql, array( 'begin' => 0, 'num' => 0 ) );
		
		// 注入数据
		$this->assign( "paramter", $this->paramter );
		$this->assign( "dataList", $this->dataList );
		
		// 渲染视图
		$this->display ();
	}
	
	/**
	 * 添加操作节点-前置
	 */
	public function _before_add() {
		// $this->getGroupList();
		// 参数
		$this->assign( "paramter", $this->paramter );
	}
	
	/**
	 * 编辑操作节点-前置
	 */
	/* public function _before_edit() {
		$this->getGroupList();
	} */
	
	/**
	 * 获取分组列表
	 */
	private function getGroupList() {
		$groupList = D( 'UserGroup' )->getList( array( 'pid' => 0, 'is_delete' => 0 ), "id,title" );
		$this->assign( "groupList", $groupList );
	}
}