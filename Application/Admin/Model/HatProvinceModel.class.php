<?php

namespace Admin\Model;

/**
 * 地址省
 * Class HatProvinceModel
 *
 * @package Home\Model
 */
class HatProvinceModel extends CommModel {
	
	// 获取列表
	public function getList() {
		return $this->select ();
	}
}