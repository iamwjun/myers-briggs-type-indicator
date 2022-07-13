<?php

namespace Admin\Model;

/**
 * 会员提成模型
 * Class MemberCommissionModel
 *
 * @package Admin\Model
 */
class MemberCommissionModel extends CommModel {
	
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
    		$data[$i]['nickname'] = $memberModel->where( array( 'id' => $data[$i]['uid'] ) )->getField( 'referral_code' );
    		// 来源用户
    		$data[$i]['source_nickname'] = $memberModel->where( array( 'id' => $data[$i]['from_id'] ) )->getField( 'referral_code' );
    		// 订单
    		$data[$i]['order'] = $orderModel->where( array( 'id' => $data[$i]['order_id'] ) )->field( 'id,order_id' )->find();
    	}
		return $data;
	}
	
	/**
	 * 新增会员获得积分的记录 并更新会员的总积分
	 * 
	 * @param $data
	 * @return array
	 */
	public function insert($data) {
		if ($this->create ( $data )) {
			if ( $this->add () ) {
				// 更新会员表的总积分
				$AllIntegral = $data['manage_price'] + $data['build_price'];
				// 先获取会员当前的积分
				$theIntegral = D( 'Member' )->where( array( 'id' => $data['uid'] ) )->getField( 'integral' );
				// 更新会员的积分
				if ( D( 'Member' )->where( array( 'id' => $data['uid'] ) )->save( array( 'integral' => $AllIntegral + $theIntegral ) ) ) {
					return true;
				}
			}
		}
		return false;
	}
}