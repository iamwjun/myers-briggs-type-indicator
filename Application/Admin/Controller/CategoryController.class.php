<?php
namespace Admin\Controller;

class CategoryController extends CommController {

	public function _before_add() {
		$this->assign( 'pid', I( 'get.pid' ) );
	}
	// 显示数据列表
	public function index() {
		// 获取参数
		$pid['pid'] = I('get.pid', 0);

		// 设置查询条件
		$condition['pid'] = $pid['pid'];
		$condition['is_delete'] = 0;

		// 设置数据列表
		$model = D( 'Category' );
		$dataList = $model->format( $this->getList( $model, $condition, 20 ) );
		$pid['sort'] = empty( $pid['pid'] ) ? 0 : $model->where( array( 'id' => $pid['pid'] ) )->getField( 'pid' );
		if($pid['pid'] > 0){
			$parentsInfo = D('Category')->where(array('id'=>$pid['pid']))->find();
		}
			//  注入数据
		$this->assign( "pid", $pid );
		$this->assign( "parentsInfo", $parentsInfo );
		$this->assign("dataList", $dataList);

		// 渲染模板
		$this->display();
	}

	// 改变一条数据的导航栏状态
	public function checknav() {
		$condition['id'] = I( 'get.id' );
		$modelName = getActiveName();
		$model = D( $modelName );
		$result = $model->where( $condition )->find();
		$list=$model->where('pid=1 and is_nav=1 and is_delete=0')->select();
		$tempOne = $model->where( $condition )->find();
		if ( count( $list ) < 8 || $tempOne['is_nav'] == 1 ) {
			if ( $result ) {
				$data['is_nav'] = empty( $result['is_nav'] ) ? 1 : 0;
				if ( $model->where( $condition )->save( $data ) ) {
					$this->dwzSuccess( "操作成功!", "1", $modelName, "refreshThis" );
				} else {
					$this->dwzSuccess( "操作失败，请重试!", "0", $modelName, "refreshThis" );
				}
			} else {
				$this->dwzSuccess( "非法操作，此数据不存在!", "0", $modelName, "refreshThis" );
			}
		}else {
			$this->dwzSuccess( "操作失败，导航栏超过限制!", "0", $modelName, "refreshThis" );
		}
	}

}