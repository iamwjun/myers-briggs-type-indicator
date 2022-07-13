<?php
namespace Admin\Model;

/**
 * 订单模型
 *
 * @author BoBo
 *        
 */
class OrderModel extends CommModel {

	/**
	 * 修改订单价格
	 *
	 * @param array $data 表单数据
	 * @return array
	 */
	public function price_edit( $data ) {
		$returnMsg = returnMsg ();
		if ( $this->save ( $data ) ) {
			$returnMsg ['status'] = 1;
			$returnMsg ['info'] = "订单价格更改成功!";
		}
		return $returnMsg;
	}

	/**
	 * 确认付款
	 *
	 * @param array $data 参数数组
	 * @return array
	 */
	public function confirmPay( $data ) {
		$returnMsg = returnMsg ();
		$data['is_pay'] = 1;
		$data['pay_time'] = time();
		if ( $this->save ( $data ) ) {
			$returnMsg ['status'] = 1;
			$returnMsg ['info'] = "线下付款成功!";
		}
		return $returnMsg;
	}
}