<?php
namespace Admin\Model;

/**
 * 收货地址管理模型
 *
 * @author BoBo
 */
class AddressModel extends CommModel {

	/**
	 * 获取订单详情地址
	 *
	 * @param int $id
	 * @return array
	 */
	public function getInfo( $id ) {
		$theInfo = $this->getOne ( $id );
		$theInfo ['provinceString'] = D ( 'HatProvince' )->getOne ( $theInfo['province'], 'province_id', false, 'province' );
		$theInfo ['cityString'] = D ( 'HatCity' )->getOne ( $theInfo['city'], 'city_id', false, 'city' );
		$theInfo ['areaString'] = D ( 'HatArea' )->getOne ( $theInfo['area'], 'area_id', false, 'area' );
		return $theInfo;
	}
}