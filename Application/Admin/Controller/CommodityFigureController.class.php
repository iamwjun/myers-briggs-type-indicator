<?php
namespace Admin\Controller;

/**
 * 商品附图管理控制器
 *
 * @author BoBo
 *        
 */
class CommodityFigureController extends CommController {

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		// 模型
		$this->model = D ( 'CommodityFigure' );
	}

	/**
	 * 商品附图列表
	 */
	public function index() {
		// 获取参数
		$this->paramter ['pid'] = I ( 'request.pid', 0 );
		if (is_number ( $this->paramter ['pid'] )) {
			die( '参数错误：pid' );
		}
		$this->paramter['title'] = I( 'post.title', '' );
		$this->paramter['start_time'] = I( 'post.start_time', '' );
		$this->paramter['end_time'] = I( 'post.end_time', '' );
		// 设置[默认]查询条件
		$condition ['pid'] = $this->paramter ['pid'];
		$condition ['is_delete'] = 0;
		// 标题
		if ( !empty( $this->paramter['title'] ) ) {
			$condition['title'] = array( "like", "%{$this->paramter['title']}%" );
		}
		// 日期范围
		if ( !empty( $this->paramter['start_time'] ) || !empty( $this->paramter['end_time'] ) ) {
			$condition['create_time'] = array( 'between', array( strtotime($this->paramter['start_time']), strtotime($this->paramter['end_time']) ) );
		} else if ( !empty( $this->paramter['start_time'] ) ) {
			$start_time = strtotime( $this->paramter['start_time'] );
			$end_time = strtotime( date( $this->paramter['start_time'], strtotime('+1 day') ) ) - 1;
			$condition['create_time'] = array( 'between', array( $start_time, $end_time ) );
		} else if ( !empty( $this->paramter['end_time'] ) ) {
			$start_time = strtotime( $this->paramter['end_time'] );
			$end_time = strtotime( date( $this->paramter['end_time'], strtotime('+1 day') ) ) - 1;
			$condition['create_time'] = array( 'between', array( $start_time, $end_time ) );
		}
		// 获取附图列表
		$dataList = $this->model->getList( $condition );
		// 获取商品信息
		$commodityInfo = D( 'Commodity' )->getOne( $this->paramter['pid'] );
		// 注入变量
		$this->assign ( 'dataList', $dataList );
		$this->assign ( 'paramter', $this->paramter );
		$this->assign ( 'commodityInfo', $commodityInfo );
		// 渲染模板
		$this->display ();
	}
	
	/**
	 * 添加附图
	 */
	public function add() {
		// 获取参数
		$this->paramter ['pid'] = I ( 'get.pid', 0 );
		// 注入变量
		$this->assign ( 'paramter', $this->paramter );
		// 渲染模板
		$this->display ();
	}
	
}