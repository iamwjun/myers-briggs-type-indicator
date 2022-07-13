<?php
namespace Admin\Model;

/**
 * 积分明细模型
 *
 * @author BoBo
 *        
 */
class MemberIntegralModel extends CommModel {

	/**
	 * 添加积分明细
	 * @param array $data
	 * @return array
	 */
	public function addIntegral($data) {
		$return = returnArray ();
		if ($this->create ( $data )) {
			if ( $this->add () ) {
				// 添加成功，更新会员本身的积分
				$memberModel = D( 'Member' );
				$memberObj = $memberModel->getOne( $data['uid'] );
				if ( !empty( $memberObj ) ) {
					$newIntegral = $memberObj['integral'] + $data['integral'];
					$memberModel->save( array( 'id' => $data['uid'], 'integral' => $newIntegral ) );
				} else {
					$return ['status'] = 0;
					$return ['info'] = "会员不存在!";
				}
			} else {
				$return ['status'] = 0;
				$return ['info'] = "添加失败!";
			}
		} else {
			$return ['status'] = 0;
			$return ['info'] = $this->getError ();
		}
		return $return;
	}
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
			$data[$i]['nickname'] = $memberModel->where( array( 'id' => $data[$i]['mid'] ) )->getField( 'referral_code' );
			// 来源用户
			$data[$i]['source_nickname'] = $memberModel->where( array( 'id' => $data[$i]['from_id'] ) )->getField( 'referral_code' );
			// 订单
			$data[$i]['order'] = $orderModel->where( array( 'id' => $data[$i]['order_id'] ) )->field( 'id,order_id' )->find();
		}
		return $data;
	}
}
?>