<?php
namespace Home\Model;

/**
 * 会员提成模型
 * 
 * @author BoBo
 *
 */
class MemberCommissionModel extends CommModel {

	/**
	 * 新增会员获得积分的记录 并更新会员的总积分
	 *
	 * @param $data
	 * @return array
	 */
	public function insert($data) {
		if ($this->create ( $data )) {
			if ($this->add ()) {
				// 更新会员表的总积分
				$AllIntegral = $data ['manage_price'] + $data ['build_price'];
				// 先获取会员当前的积分
				$theIntegral = D ( 'Member' )->where ( array ('id' => $data ['uid'] ) )->getField ( 'integral' );
				// 更新会员的积分
				if (D ( 'Member' )->where ( array ('id' => $data ['uid'] ) )->save ( array ('integral' => $AllIntegral + $theIntegral ) )) {return true;}
			}
		}
		return false;
	}
}