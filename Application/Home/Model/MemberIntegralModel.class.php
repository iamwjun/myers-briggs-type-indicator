<?php
namespace Home\Model;

/**
 * 积分明细
 *
 * @author BoBo
 *        
 */
class MemberIntegralModel extends CommModel {


	/**
	 * 添加签到积分记录
	 * $data 数组
	 */
	public function addSign( $data ) {
		return $this->add($data);
	}

	/**
	 * 添加积分信息
	 * $integral 积分数
	 * $recde_info 积分来源信息
	 * $recode 收入|支出  true|false
	 * $pro 商品id
	 */
	public function addIntegralInfo($integral,$recode_info,$recode=true,$pro=false,$order_id=false) {
		$data['mid'] = $_SESSION['member_auth']['id'];
		$data['integral'] = $integral;
		$data['recode_info'] = $recode_info;
		$data['recode'] = $recode ? 1 : 2;
		$data['create_time'] = time();
		
		if($pro){
			$data['pro_id'] = $pro;
		}
		if($order_id){
			$data['order_id'] = $order_id;
		}
		$this->add($data);
	}
}