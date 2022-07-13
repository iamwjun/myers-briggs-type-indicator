<?php
namespace Home\Model;

/**
 * 收货地址模型
 *
 * @author BoBo
 *        
 */
class AddressModel extends CommModel {

	/**
	 * 获取列表
	 */
	public function getList() {
		$condition ['uid'] = $_SESSION ['member_auth'] ['id'];
		$condition ['is_delete'] = 0;
		return $this->format ( $this->where ( $condition )->order ( 'id desc' )->select () );
	}

	/**
	 * 格式化数据
	 * 
	 * @param array $data
	 * @return array
	 */
	private function format( $data ) {
		$hatProvince = D ( 'HatProvince' );
		$hatCity = D ( 'HatCity' );
		$hatArea = D ( 'HatArea' );
		for ( $i = 0 , $size = count ( $data ); $i < $size; $i ++ ) {
			$data [$i] ['provinceString'] = $hatProvince->getOne( $data [$i] ['province'], 'province_id', false, 'province' );
			$data [$i] ['cityString'] = $hatCity->getOne( $data [$i] ['city'], 'city_id', false, 'city' );
			$data [$i] ['areaString'] = $hatArea->getOne( $data [$i] ['area'], 'area_id', false, 'area' );
		}
		return $data;
	}

	/**
	 * 获取订单详情地址
	 *
	 * @param int $id
	 * @return array
	 */
	public function getInfo( $id ) {
		$dataInfo = $this->format ( $this->where ( array ( 'id' => $id ) )->select () );
		return $dataInfo [0];
	}

	/**
	 * 获取一条默认信息[如果没有默认的，就取第一条]
	 */
	public function getDefault() {
		$dataInfo = $this->where ( array ( "uid" => $_SESSION ['member_auth'] ['id'], "is_default" => 1, "is_delete" => 0 ) )->find ();
		$dataList = array ();
		if ( count ( $dataInfo ) > 0 ) {
			$dataList [0] = $dataInfo;
		} else {
			$dataList = $this->where ( array ( "uid" => $_SESSION ['member_auth'] ['id'], "is_delete" => 0 ) )->limit ( 1 )->select ();
		}
		// 格式化
		if ( count ( $dataList ) > 0 ) {
			$dataList = $this->format ( $dataList );
			return $dataList [0];
		} else {
			return $dataList;
		}
	}
}