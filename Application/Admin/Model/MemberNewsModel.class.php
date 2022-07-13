<?php
namespace Admin\Model;

/**
 * 会员消息模型
 *
 * @author BoBo
 *        
 */
class MemberNewsModel extends CommModel {
	
	/**
	 * 群发消息
	 * 
	 * @param array $data
	 */
	public function send( $data ) {
		$return = array( 'status' => 0, 'info' => '非法操作' );
		if ( empty( $data['role'] ) ) {
			$return['info'] = '请选择消息接收组';
		} else {
			$data['role'] = implode( ",", $data['role'] );
			// 组合数据并添加
			$condition = array( 'auth' => array( 'in', $data['role'] ) );
			$userArray = D( 'Member' )->getList( $condition, 'id' );
			$tempList = array();
			for ( $i = 0, $size = count( $userArray ); $i < $size; $i ++ ) {
				$tempList[$i]['uid'] = $userArray[$i]['id'];
				$tempList[$i]['sender'] = $data['sender'];
				$tempList[$i]['source'] = "短消息";
				$tempList[$i]['title'] = $data['title'];
				$tempList[$i]['intro'] = $data['intro'];
				$tempList[$i]['create_time'] = time();
			}
			if ( count( $tempList ) == 0 ) {
				$return['info'] = "消息发送失败：您所选择的消息接收组没有会员";
			} else {
				if ( $this->addAll( $tempList ) ) {
					$return['status'] = 1;
					$return['info'] = "消息发送成功";
				} else {
					$return['info'] = "消息发送失败";
				}
			}
		}
		return $return;
	}
	
}
?>