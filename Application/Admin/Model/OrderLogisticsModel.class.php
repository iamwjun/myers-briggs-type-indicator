<?php
namespace Admin\Model;

/**
 * 订单商品物流模型
 *
 * @author BoBo
 *        
 */
class OrderLogisticsModel extends CommModel {

	/**
	 * 插入一条数据
	 * 
	 * @param $data
	 * @return array
	 */
	public function insert( $data ) {
		$data ['create_time'] = strtotime ( $data ['create_time'] );
		$data ['intro'] .= " \n";
		$returnMsg = returnMsg();
		if ( $this->create ( $data ) ) {
			if ( $this->add () ) {
				$returnMsg['status'] = 1;
				$returnMsg['info'] = "添加成功!";	
			}
		} else {
			$returnMsg['info'] = "数据有误!";
		}
		return $returnMsg;
	}
}