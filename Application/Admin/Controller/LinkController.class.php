<?php
namespace Admin\Controller;

/**
 * 首页幻灯
 *
 * @author BoBo
 *        
 */
class LinkController extends CommController {
	
	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize();
		// 模型
		$this->model = D( 'Link' );
	}

	/**
	 * 幻灯列表
	 */
	public function index() {
		// 获取参数
		$this->paramter ['title'] = I ( 'post.title', '' );
		$this->paramter ['start_time'] = I ( 'post.start_time', '' );
		$this->paramter ['end_time'] = I ( 'post.end_time', '' );
		// 设置[默认]查询条件
		$condition ['is_delete'] = 0;
		// 标题
		if (! empty ( $this->paramter ['title'] )) {
			$condition ['title'] = array ("like","%{$this->paramter['title']}%" );
		}
		// 日期范围
		if (! empty ( $this->paramter ['start_time'] ) || ! empty ( $this->paramter ['end_time'] )) {
			$condition ['create_time'] = array ('between',array (strtotime ( $this->paramter ['start_time'] ),strtotime ( $this->paramter ['end_time'] ) ) );
		} else if (! empty ( $this->paramter ['start_time'] )) {
			$start_time = strtotime ( $this->paramter ['start_time'] );
			$end_time = strtotime ( date ( $this->paramter ['start_time'], strtotime ( '+1 day' ) ) ) - 1;
			$condition ['create_time'] = array ('between',array ($start_time,$end_time ) );
		} else if (! empty ( $this->paramter ['end_time'] )) {
			$start_time = strtotime ( $this->paramter ['end_time'] );
			$end_time = strtotime ( date ( $this->paramter ['end_time'], strtotime ( '+1 day' ) ) ) - 1;
			$condition ['create_time'] = array ('between',array ($start_time,$end_time ) );
		}
		// 获取幻灯列表
		$dataList = $this->model->getList ( $condition );
		$this->assign ( 'dataList', $dataList );
		// 渲染模板
		$this->display ();
	}
}