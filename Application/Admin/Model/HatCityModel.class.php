<?php
namespace Admin\Model;

/**
 * 地址市
 * Class HatCityModel
 * @package Home\Model
 */
class HatCityModel extends CommModel {

	// 获取列表
	public function getList() {
		return $this->select ();
	}
	
	// 根据父id获取列表
    public function GetTableList($father){
        $condition ['father'] = $father;
        $result = $this->where ( $condition )->select ();
        return $result;
    }
    
}