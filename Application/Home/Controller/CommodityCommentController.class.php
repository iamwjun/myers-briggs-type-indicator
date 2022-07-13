<?php

namespace Home\Controller;

use Think\Upload;

/**
 * 商品评价控制器
 * 
 * @author BoBo
 *        
 */
class CommodityCommentController extends CommController {
	
	// 初始化
	public function _initialize() {
		parent::_initialize ();
		$this->checkLogin ();
		$this->model = D( 'CommodityComment' );
	}
	
	/**
	 * 商品评论列表
	 */
	public function index() {
		$theId = I( 'get.id', 0 );
		if (is_number ( $theId )) {
			$this->error ( '非法操作' );
		}
		// 判断此订单是否存在
		$proInfo = D( 'Commodity' )->getOne( $theId, 'id', true, 'id' );
		if (empty ( $proInfo )) {
			$this->error ( '没有此数据' );
		}
		// 获取查询类型
		$type = I( 'get.type', 'all' );
		
		// 设置查询字段
		$field = "a.content,a.picture,a.create_time";
		$field .= ",b.username,b.nickname,b.wx_name,b.face";
		// 设置查询条件
		$sql = "select $field from db_commodity_comment as a";
		$sql .= " left join db_member as b on b.id = a.uid";
		$sql .= " where a.is_delete = 0 and a.status = 0 and a.pro_id = {$theId}";
		switch ( $type ) {
			case 'haopin':
				$sql .= ' and a.type = 3';
				break;
			case 'zhongpin':
				$sql .= ' and a.type = 2';
				break;
			case 'chapin':
				$sql .= ' and a.type = 1';
				break;
			case 'youtu':
				$sql .= " and a.picture <> ''";
				break;
		}
		// 设置排序条件
		$order .= "a.create_time desc";
		
		// 读取数据
		$this->dataList = D( 'Order' )->getSQLList( $sql, array( 'begin' => 0, 'num' => 0 ), $order );
		$this->assign( 'dataList', $this->dataList ); // 数据列表
		$this->assign( 'theId', $theId ); // 商品ID
		$this->assign( 'type', $type ); // 查询类型
		$this->assign ( 'columnTitle', '评价' ); // 栏目名称
		// 模板渲染
		$this->display();
	}
	
	/**
	 * 添加评价记录
	 */
	public function add() {		
		if ( IS_AJAX && IS_POST ) {
			// 评价记录添加
			$data = I( 'post.' );
			$data['uid'] = $this->member['id'];
			$data['create_time'] = time();
			$isComments = D( 'CommodityComment' )->add( $data );
			// 更新当前订单商品已经评价
			$order = array();
			$order['id'] = $data['order_id'];
			$order['is_comment'] = 1;
			$isOrder = D( 'OrderInfo' )->save( $order );
			$return = returnMsg();
			if ( $isComments && $isOrder ) {
				$return['status'] = 1;
				$return['info'] = '评价成功!';
			}
			$this->ajaxReturn( $return );
		} else {
			$this->error( '请勿非法访问！' );
		}
	}
	
	/**
	 * 图片上传
	 */
	public function picUpload() {
		//die();
		//sleep(10);
		$upload = new Upload ();
		$upload->rootPath = C ( 'COMMENTS_UPLOAD_PATH' );
		$upload->maxSize = 1048576;
		$resultInfo = $upload->upload ();
		$return = returnMsg ();
		if ( $resultInfo ) {
			$return ['savepath'] = str_replace( './', '', $upload->rootPath );
			$return ['savepath'] .= $resultInfo ['file'] ['savepath'];
			$return ['savepath'] .= $resultInfo ['file'] ['savename'];
			$return ['showpath'] = __ROOT__ . '/' . $return ['savepath'];
			$return ['tempname'] = $_FILES ["file"] ["name"];
			$return ['info'] = '上传成功!';
			$return ['status'] = 1;
		} else {
			$return ['info'] = $upload->getError ();
		}
		$this->ajaxReturn ( $return );
	}
	
	
	
	// 删除图片
	public function removeImage() {
		$returnMsg = returnMsg ();
		if (empty ( $_POST ['img'] )) {
		} else {
			$root = __ROOT__ . '/';
			$img = str_replace ( $root, '', $_POST ['img'] );
			if (file_exists ( $img )) {
				if (unlink ( $img )) {
					$returnMsg['status'] = 1;
					$returnMsg['info'] = "删除成功";
				} else {
					$returnMsg['info'] =  "删除失败";
				}
			} else {
				$returnMsg['info'] =  "此图片不存在";
			}
		}
		$this->HuiMsg ( $returnMsg );
	}
}
