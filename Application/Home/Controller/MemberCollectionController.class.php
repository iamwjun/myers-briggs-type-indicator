<?php

namespace Home\Controller;

/**
 * 文章业务逻辑层
 *
 * @author Administrator
 *        
 */
class MemberCollectionController extends CommController {
	// 初始化
	public function _initialize() {
		parent::_initialize ();
		$this->checkLogin ();
	}
	protected  $pageSize = 10;
	// 列表
    public function index(){
    	$articleModel = D( 'MemberCollection' );
    	
    	// 设置查询条件
    	$condition = array();
    	$condition['is_delete'] = 0;
    	$condition['member_id'] = $this->member['id'];
    	$dataList = $this->getPdList( $articleModel, $condition, $this->pageSize,'*',$order);
    	foreach ($dataList as $key=>$val){
    		$dataList[$key]['pro'] = D('Commodity')->getOne($val['pro_id']);
    	}
    	$this->assign( 'dataList', $dataList );
    	
    	// 渲染模板
    	$this->display();
    }
    // 删除
    public function delete() {
    	$id = $_GET ['id'];
    	$outPut = array('status'=>0,'msg'=>'');
    	if (empty ( $id ) || ! is_numeric ( $id )) {
    		$outPut['msg']='请勿非法操作!';
    	}else{
    		if (! empty ( $id )) {
    			$Address = D ( 'MemberCollection' );
    			$up = $Address->remove ( $id );
    			if($up){
    				$outPut['status'] = 1;
    				$outPut['msg'] = '操作成功';
    			}else{
    				$outPut['status'] = 0;
    				$outPut['msg'] = '操作失败';
    			}
    		}
    	}
    	$this->ajaxReturn ( $outPut );
    	// $this->display("index");
    }
    //添加收藏
    public function add(){
    	$id = $_POST ['id'];
    	$outPut = array('status'=>0,'msg'=>'');
    	if (empty ( $id ) || ! is_numeric ( $id )) {
    		$outPut['msg']='请勿非法操作!';
    	}else{
    		if (! empty ( $id )) {
    			$collection = D ( 'MemberCollection' );
    			$data['pro_id'] = $id;
    			$data['member_id'] = $this->member['id'];
    			$dataInfo = $collection->where($data)->find();
    			$data['create_time'] = time();
    			if($dataInfo){
    				$data['id'] = $dataInfo['id'];
    				$data['is_delete'] = $dataInfo['is_delete'] ? '0' : '1';
    				$succ = $collection->save($data);
    			}else{
    				$succ = $collection->add($data);
    			}
    			if($succ){
    				$outPut['status'] = 1;
    				$outPut['msg'] = '操作成功';
    			}else{
    				$outPut['status'] = 0;
    				$outPut['msg'] = '操作失败';
    			}
    		}
    	}
    	$this->ajaxReturn ( $outPut );
    }
}