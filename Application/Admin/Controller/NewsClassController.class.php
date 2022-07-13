<?php
namespace Admin\Controller;

/**
 * 新闻分类
 *
 * @author BoBo
 *        
 */
class NewsClassController extends CommController {

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		// 模型
		$this->model = D ( 'NewsClass' );
	}

	/**
	 * 添加[前置操作]
	 */
	public function _before_add() {
		$this->setLevel ();
	}
	
	/**
	 * 编辑
	 */
	public function edit() {
		$id = I ( 'get.id' );
		$returnMsg = $this->model->getCommOne ( $id );
		if ($returnMsg ['status']) {
			$dataInfo = $returnMsg ['info'];
			$this->setLevel ( $dataInfo['pid'] );
			$this->assign ( 'dataInfo', $returnMsg ['info'] );
		} else {
			die ( $returnMsg ['info'] );
		}
		$this->display ();
	}

	/**
	 * 数据列表
	 */
	public function index() {
		// 获取参数
		$this->paramter ['title'] = I ( 'post.title', '' );
		
		// 默认查询条件
		$condition = array (
				'is_delete' => 0,
				'pid' => 0 
		);
		
		// 标题
		if (! empty ( $this->paramter ['title'] )) {
			$condition ['title'] = array ( 'like', "%{$this->paramter['title']}%" );
		}
		
		$this->assign ( 'dataList', $this->formatDataList ( $condition ) );
		// 渲染模板
		$this->display ();
	}

	/**
	 * 格式化数据列表
	 *
	 * @param array $condition 查询条件
	 * @param number $level 层数
	 * @return array
	 */
	private function formatDataList($condition, $level = 1) {
		$dataList = $this->model->getList ( $condition, "id,pid,title,sort,status,picture,recommend", array ( 'begin' => 0, 'num' => 0 ), "sort desc" );
		for($i = 0, $size = count ( $dataList ); $i < $size; $i ++) {
			$dataList [$i] ['operation'] = $level;
			$condition ['pid'] = $dataList [$i] ['id'];
			$dataList [$i] ['children'] = $this->formatDataList ( $condition );
		}
		return count ( $dataList ) > 0 ? $dataList : array ();
	}

	/**
	 * 设置分类层级
	 *
	 * @param number $pid 父id
	 */
	private function setLevel($pid = 0) {
		$this->paramter ['pid'] = empty ( $pid ) ? I ( 'get.pid' ) : $pid;
		$this->paramter ['level'] = "模块分类";
		if (! empty ( $this->paramter ['pid'] )) {
			$tempInfo = $this->model->getOne ( $this->paramter ['pid'] );
			if ($tempInfo ['pid'] > 0) {
				$lastInfo = $this->model->getOne ( $tempInfo ['pid'] );
				$this->paramter ['level'] .= "/{$lastInfo['title']}/{$tempInfo['title']}";
			} else {
				$this->paramter ['level'] .= "/{$tempInfo['title']}";
			}
		}
		$this->assign ( 'paramter', $this->paramter );
	}
}