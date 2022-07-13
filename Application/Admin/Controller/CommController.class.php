<?php
namespace Admin\Controller;

use Think\Controller;

/**
 * 公用类
 * @author Administrator
 *
 */
class CommController extends Controller {

	/**
	 * 单条信息
	 *
	 * @var array
	 */
	protected $dataInfo;

	/**
	 * 数据列表
	 *
	 * @var array
	 */
	protected $dataList;

	/**
	 * 模型
	 *
	 * @var model
	 */
	protected $model;
	
	/**
	 * 参数数组
	 * 
	 * @var array
	 */
	protected $paramter;
	

	/**
	 * 会员信息
	 * 
	 * @var array
	 */
	protected $user;

	/**
	 * 构造方法
	 */
	public function _initialize() {
		// 如果是uploadify上传文件，则不检测是否登录（此地方为一个暂未解决的bug，uploadify上传session的问题）
		if (CONTROLLER_NAME != "File") {
			$this->checkLogin ();
		}
		$this->crumb();
	}

	/**
	 * 检测用户是否登录
	 */
	private function checkLogin() {
		$userAuth = session ( 'userAuth' );
		if ( empty( $userAuth ) ) {
			$this->redirect( '/Admin/login' );
		} else {
			$map ['username'] = array ( 'eq', $userAuth ['username'] );
			$this->user = D ( 'User' )->where ( $map )->find ();
			if (empty ( $this->user )) {
				session ( 'userAuth', null );
				$this->redirect( '/Admin/login' );
			} else {
				// 获取当前管理员的权限
				$this->user['authString'] = D( 'UserRole' )->getOne( $this->user['auth'], 'id', false, 'auth' );
				// 判断是否有权限
				$action = ',' . CONTROLLER_NAME . '/' . ACTION_NAME . ',';
				if ( strpos( $this->user['authString'], $action ) === false && $this->user['id'] != 1 ) {
					if ( IS_AJAX ) {
						$returnMsg = returnMsg();
						$returnMsg['info'] = "很抱歉，您没有权限!";
						$this->HuiMsg( $returnMsg );
					} else {
						//session ( 'userAuth', null );
						//$this->error( '很抱歉，您没有权限!', U( '/Admin/login' ) );
						die( '很抱歉，您没有权限!' );
					}
				}
				$this->assign ( 'userAuth', $this->user );
			}
		}
	}
	public function crumb(){
		//面包屑
		$controller = D('UserGroup')->where(array('name'=>CONTROLLER_NAME,'is_delete'=>0))->find();
		$retrun[]  =  $controller['title'];
		if($controller['pid'] ==0){
			$fataterName =  $controller['name'];
		}else{
			$controller = D('UserGroup')->where(array('id'=>$controller['pid'],'is_delete'=>0))->find();
			$retrun[]  =  $controller['title'];
		}
		rsort($retrun);
		$this->assign('crumb',$retrun);
	}
	/**
	 * 获取数据列表[分页-数组条件array]
	 *
	 * @param $model Model
	 * @param $condition 查询条件
	 * @param int $pageSize 每页显示条数
	 * @param string $order 排序
	 * @return array
	 */
	public function getPageList($model, $condition, $pageSize = 20, $order = "sort desc") {
		if (is_array ( $condition )) {
			$condition ['is_delete'] = 0;
		}
		$page ['all'] = $model->where ( $condition )->count ( 'id' );
		$page ['numPerPage'] = I ( 'post.numPerPage', $pageSize );
		$page ['totalPage'] = intval ( $page ['all'] ) / intval ( $page ['pageSize'] );
		$page ['totalPage'] = is_float ( $page ['totalPage'] ) ? intval ( $page ['totalPage'] ) + 1 : $page ['totalPage'];
		$page ['pageNum'] = I ( 'post.pageNum', 1 );
		$page ['numPerPageArray'] = array ( 5, 10, 20, 30, 40, 50 );
		$limitStart = ($page ['pageNum'] - 1) * $page ['numPerPage'];
		$limit = array( 'begin' => $limitStart, 'num' => $page ['numPerPage'] );
		// 注入分页数据
		$this->assign ( "page", $page );

		// 返回数据
		return $model->getList($condition, "*", $limit, $order);
	}
	
	/**
	 * 获取数据列表[分页-sql条件]
	 *
	 * @param $model Model
	 * @param $sql 查询语句
	 * @param int $pageSize 每页显示条数
	 * @param string $order 排序
	 * @return array
	 */
	public function getPageSQLList($model, $sql, $pageSize = 20, $order = "a.sort desc") {
		$page ['all'] = count ( $model->query( $sql ) );
		$page ['numPerPage'] = I ( 'post.numPerPage', $pageSize );
		$page ['totalPage'] = intval ( $page ['all'] ) / intval ( $page ['pageSize'] );
		$page ['totalPage'] = is_float ( $page ['totalPage'] ) ? intval ( $page ['totalPage'] ) + 1 : $page ['totalPage'];
		$page ['pageNum'] = I ( 'post.pageNum', 1 );
		$page ['numPerPageArray'] = array ( 5, 10, 20, 30, 40, 50 );
		
		$limitStart = ($page ['pageNum'] - 1) * $page ['numPerPage'];
		$limit = array( 'begin' => $limitStart, 'num' => $page ['numPerPage'] );

		// 注入分页数据
		$this->assign ( "page", $page );

		// 返回数据
		return $model->getSQLList( $sql, $limit, $order);
	}

	/**
	 * 获取数据列表
	 * @param object $model 模型名
	 * @param array $condition 查询条件
	 * @param string $field 查询字段
	 * @param string $order 排序条件
	 */
	public function getList( $model, $condition, $field = "*", $order = "sort desc" ) {
		return $model->where( $condition )->field( $field )->order( $order )->select();
	}
	

	/**
	 * 显示添加页面
	 */
	public function add() {
		// 渲染视图
		$this->display ();
	}

	/**
	 * 插件一条数据
	 */
	public function create() {
		$returnMsg = D ( CONTROLLER_NAME )->commInsert ( $_POST );
		$this->HuiMsg( $returnMsg );
	}

	/**
	 * 显示编辑页面
	 */
	public function edit() {
		$id = I ( 'get.id' );
		$returnMsg = D ( CONTROLLER_NAME )->getCommOne ( $id );
		if ($returnMsg ['status']) {
			$this->assign ( 'dataInfo', $returnMsg ['info'] );
		} else {
			die ( $returnMsg ['info'] );
		}
		$this->display ();
	}

	/**
	 * 修改一条数据
	 */
	public function update() {
		$returnMsg = D ( CONTROLLER_NAME )->commUpdate ( $_POST );
		$this->HuiMsg( $returnMsg );
	}

	/**
	 * 删除一条或一组数据(伪删除)
	 */
	public function remove() {
		$idList = I ( 'post.id' );
		$returnMsg = D ( CONTROLLER_NAME )->commRemove ( $idList );
		$this->HuiMsg( $returnMsg );
	}

	/**
	 * 获取数据id字符串
	 * @param array $data 数据数组
	 * @return string
	 */
	public function getIdList($data) {
		$idList = "";
		for($i = 0, $size = count ( $data ); $i < $size; $i ++) {
			$idList .= empty ( $idList ) ? $data [$i] ['id'] : "," . $data [$i] ['id'];
		}
		return $idList;
	}

	/**
	 * 设置一条或一组数据的状态
	 */
	public function commSetStatus() {
		$idList = $_REQUEST ['id'];
		$param = I ( 'get.param' );
		$returnMsg = D ( CONTROLLER_NAME )->commSetStatus ( $idList, explode ( "-", $param ) );
		$this->HuiMsg( $returnMsg );
	}
	
	/**
	 * 批量更新排序
	 */
	public function BatchSequence() {
		$param = I ( 'post.param', '' );
		$returnMsg = D ( CONTROLLER_NAME )->BatchSequence ( $param );
		$this->HuiMsg( $returnMsg );
	}
}