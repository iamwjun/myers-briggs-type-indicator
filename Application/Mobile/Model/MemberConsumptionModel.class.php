<?php
namespace Home\Model;

/**
 * 会员消费记录模型
 *
 * @author BoBo
 *        
 */
class MemberConsumptionModel extends CommModel {

	/**
	 * 插入一条数据
	 * 
	 * @param $data
	 * @return array
	 */
	public function insert($data) {
		if ($this->create ( $data )) {return $this->add ();}
		return false;
	}
}