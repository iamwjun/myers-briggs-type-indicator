<?php
namespace Admin\Controller;

/**
 * 商品管理控制器
 *
 * @author BoBo
 *        
 */
class CommodityController extends CommController {

	/**
	 * 商品分类模型
	 *
	 * @var model
	 */
	private $classmodel;

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		// 模型
		$this->model = D ( 'Commodity' );
		$this->classmodel = D ( 'CommodityClass' );
		// 获取商品一级分类
		$this->assign ( 'classList', $this->classmodel->getList ( array ('pid' => 0, 'status' => 0, 'is_delete' => 0 ), "id,title" ) );
	}

	/**
	 * 上架商品列表
	 */
	public function shelves() {
		$this->setDataList();
		// 渲染模板
		$this->display ();
	}

	/**
	 * 下架商品列表
	 */
	public function shelf() {
		$this->setDataList( 0 );
		// 渲染模板
		$this->display ();
	}
	
	/**
	 * 设置数据列表
	 * 
	 * @param number $shelves 1为上架 0为下架 默认为0
	 */
	private function setDataList( $shelves = 0 ) {
		// 获取参数
		$this->paramter['pid'] = I( 'post.pid', '' );
		$this->paramter['title'] = I( 'post.xxss', '' );
		// 设置查询条件
		$condition['is_delete'] = 0;
		$condition['shelves'] = $shelves;
		// 分类
		if ( !is_number( $this->paramter['pid'] ) ) {

			$condition['pid'] = $this->paramter['pid'];
		}
		// 标题
		if ( !empty( $this->paramter['title'] ) ) {
			$condition['title'] = array( "like", "%{$this->paramter['title']}%" );
		}
		
		$dataList = $this->model->getProList ( $condition );
		foreach ($dataList as $key => $val) {
			$dataList[$key]['nav']=M('CommodityClass')->where('id='.$val['pid'])->getField('title');
		}
		$this->assign ( 'dataList', $dataList );
		$this->assign ( 'paramter', $this->paramter );
	}

	/**
	 * 获取下级分类列表
	 */
	public function getNextClassList() {
		$returnMsg = returnMsg ();
		if (IS_AJAX && IS_POST) {
			$returnMsg ['status'] = 1;
			$condition = array ('pid' => I ( 'post.pid' ),'status' => 0,'is_delete' => 0 );
			$returnMsg ['info'] = $this->classmodel->getList ( $condition, "id,title" );
		}
		$this->HuiMsg ( $returnMsg );
	}

	/**
	 * 编辑
	 */
	public function edit() {
		$id = I ( 'get.id', 0 );
		// 获取信息
		$dataInfo = $this->model->getOne ( $id );
		// 判断商品所属
		if ( $dataInfo['uid'] > 0 ) {
			$dataInfo['member_info'] = D( 'Member' )->getOne( $dataInfo['uid'], 'id', true, 'username,nickname,referral_code' );
		}
		$this->assign ( 'dataInfo', $dataInfo );
		// 分类下拉列表
		if ( !empty( $dataInfo['pid'] ) ) {
			$classList = $this->getSelectClassList ( $dataInfo ['pid'] );
			$this->assign( 'classList', $classList );
		}
		// 渲染视图
		$this->display();
	}

	/**
	 * 逆向递归获取商品分类
	 *
	 * @param int $pid 商品类别ID
	 */
	private function getSelectClassList( $pid ) {
		global $dataList;
		$tempInfo = $this->classmodel->getOne( $pid );
		if ( count( $tempInfo ) == 0 ) {
			return array();
		}
		$tempList = $this->classmodel->getList ( array ('pid' => $tempInfo['pid'],'status' => 0,'is_delete' => 0 ), 'id,title' );
		for ( $i = 0, $size = count( $tempList ); $i < $size; $i ++ ) {
			$tempList[$i]['selected'] = $tempList[$i]['id'] == $pid ? ' selected="selected"' : '';
		}
		$dataList[] = $tempList;
		if ( $tempInfo['pid'] > 0 ) {
			self::getSelectClassList( $tempInfo['pid'] );
		}
		krsort( $dataList );
		return array_merge( $dataList );
	}
	
	/**
	 * 检索商品推荐人是否存在
	 */
	public function searchMember() {
		if ( !IS_AJAX && !IS_POST ) {
			$this->error( '请勿非法操作' );
		}
		$code = I( 'post.code', 0 );
		$returnMsg = returnMsg();
		if ( is_number( $code ) ) {
			$returnMsg['info'] = '幸运码有误!';
			$this->HuiMsg( $returnMsg );
		}
		$memberInfo = D( 'Member' )->getOne( $code, 'referral_code' );
		if ( count( $memberInfo ) == 0 ){
			$returnMsg['info'] = '此幸运码不存在!';
		} else {
			$returnMsg['status'] = 1;
			$returnMsg['id'] = $memberInfo['id'];
			$returnMsg['info'] = "用户名：{$memberInfo['username']}&nbsp;&nbsp;&nbsp;&nbsp;真实名称：{$memberInfo['nickname']}&nbsp;&nbsp;&nbsp;&nbsp;幸运码：{$memberInfo['referral_code']}";
		}
		$this->HuiMsg( $returnMsg );
	}
	
	/**
	 * 设置商品下架状态
	 */
	public function commodityShelf() {
		$this->onTheShelf();
	}
	
	/**
	 * 设置商品上架状态
	 */
	public function commodityShelves() {
		$this->onTheShelf( 1 );
	}
	
	/**
	 * 设置商品上下架
	 * 
	 * @param number $shelves 0为下架 1为上架 默认为0
	 */
	private function onTheShelf( $shelves = 0 ) {
		if ( !IS_AJAX && !IS_POST ) {
			$this->error( '请勿非法操作' );
		}
		$returnMsg = returnMsg();
		$idList = I( 'post.id', 0 );
		if ( empty( $idList ) ) {
			$returnMsg['info'] = "参数传递有误!";
			$this->HuiMsg( $returnMsg );
		}
		$condition['id'] = array( 'in', $idList );
		$condition['shelves'] = $shelves;
		if ( $this->model->save( $condition ) ) {
			$returnMsg['info'] = empty( $shelves ) ? "下架成功!" : '上架成功!';
			$returnMsg['status'] = 1;
		} else {
			$returnMsg['info'] = empty( $shelves ) ? "下架失败!" : '上架失败!';
		}
		$this->HuiMsg( $returnMsg );
	}

	public function _before_create() {
		$_POST['birth_time'] = strtotime($_POST['birth_time']);
	}

	public function _before_update() {
		$_POST['birth_time'] = strtotime($_POST['birth_time']);
	}

}