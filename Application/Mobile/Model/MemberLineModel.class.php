<?php

namespace Home\Model;

class MemberLineModel extends CommModel {
	
	// 获取会员在线总数
	public function getTotal() {
		return $this->where( '1 = 1' )->count();
	}
	
	// 获取列表
	public function getList() {
		return $this->where( '1 = 1' )->select();
	}
	
	// 添加会员在线记录
	public function insert( $data ) {
		// 先判断是否有登录在线记录
		$tempArray = $this->where( array( 'uid' => $data['uid'] ) )->find();
		if ( $this->create( $data ) ) {
			if ( empty( $tempArray ) ) {
				$this->add();
			} else {
				$data['id'] = $tempArray['id'];
				$this->save( $data );
			}
		}
	}
	
	/**
	 * 删除一条或一组数据
	 * 
	 * @param $idList id列表
	 */
	public function remove($idList) {
		return $this->delete ( array ( 'in', $idList  ) );
	}
}