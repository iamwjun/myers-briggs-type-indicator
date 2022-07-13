<?php

namespace Admin\Model;

/**
 * 会员消费记录模型类
 *
 * @author Administrator
 *        
 */
class MemberConsumptionModel extends CommModel {
	
	/**
	 * 格式化数据
	 * @param array $data
	 * @return array
	 */
	public function format( $data ) {
		$memberModel = D( 'Member' );
		$orderModel = D( 'Order' );
		for ( $i = 0, $size = count( $data ); $i < $size; $i ++ ) {
    		$data[$i]['create_time'] = date( 'Y-m-d H:i:s', $data[$i]['create_time'] );
    		// 用户名
    		$member = $memberModel->where( array( 'id' => $data[$i]['uid'] ) )->find();
    		$data[$i]['nickname'] = $member['nickname'];
    		$data[$i]['wx_name'] = $member['wx_name'];
    		$data[$i]['username'] = $member['username'];
    		$data[$i]['referral_code'] = $member['referral_code'];
    		// 订单
    		$data[$i]['order'] = $orderModel->where( array( 'id' => $data[$i]['order_id'] ) )->field( 'id,order_id,price' )->find();
    	}
		return $data;
	}
	
	/**
	 * 插入一条数据
	 * @param $data
	 * @return array
	 */
	public function insert( $data ) {
		if ( $this->create( $data ) ) {
			return $this->add();
		}
		return false;
	}
	
}