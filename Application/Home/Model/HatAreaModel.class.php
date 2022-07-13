<?php

namespace Home\Model;

/**
 * 地址区/县
 * Class HatAreaModel
 * 
 * @package Home\Model
 */
class HatAreaModel extends CommModel {

	// 获取列表
	public function getList() {
		return $this->select ();
	}
	
	// 根据父id获取列表
	public function GetTableList($father) {
		$condition ['father'] = $father;
		$result = $this->where ( $condition )->select ();
		return $result;
	}
}