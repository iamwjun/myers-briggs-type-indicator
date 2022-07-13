<?php
namespace Admin\Model;

/**
 * 订单产品模型
 *
 * @author BoBo
 *        
 */
class OrderInfoModel extends CommModel {

	/**
	 * 根据订单ID获取订单产品列表
	 */
	public function getList( $order_id ) {
		$field = "a.id,a.pro_id,a.total_money,a.num,a.is_send,a.send_id,a.send_company,a.send_time,a.create_time";
		$field .= ",b.title as pro_title,b.picture as pro_picture,b.market_price as pro_market_price,b.member_price as pro_member_price,b.cost_price as pro_cost_price";
		$sql = "select $field from db_order_info as a";
		$sql .= " left join db_commodity as b on a.pro_id = b.id";
		$sql .= " where 1=1 and a.order_id = '$order_id'";
		return $this->getSQLList ( $sql, array ( 'begin' => 0, 'num' => 0 ), 'a.id desc' );
	}

	/**
	 * 统计订单商品个数
	 *
	 * @param array $array
	 * @return int
	 */
	public function countPro( $array = array() ) {
		$num = 0;
		foreach ( $array as $rows ) {
			$num += $rows ['num'];
		}
		return $num;
	}

	/**
	 * 根据订单商品信息ID获取订单商品品列表
	 */
	public function getProList( $idList ) {
		$field = "a.id,b.title";
		$sql = "select $field from db_order_info as a";
		$sql .= " left join db_commodity as b on a.pro_id = b.id";
		$sql .= " where 1=1 and a.id in($idList) and is_send = 0";
		return $this->getSQLList ( $sql, array ( 'begin' => 0, 'num' => 0 ), 'a.id desc' );
	}

	/**
	 * 订单商品发货
	 *
	 * @param array $data 表单数据
	 */
	public function deliver_goods( $data ) {
		$returnMsg = returnMsg ();
		// 组合数据
		$theId = $data ['id'];
		unset ( $data ['id'] );
		$data ['id'] = array ( 'in', $theId );
		$data ['is_send'] = 1;
		$data ['send_time'] = empty ( $data ['send_time'] ) ? time () : strtotime ( $data ['send_time'] );
		if ( $this->save ( $data ) ) {
			$returnMsg ['status'] = 1;
			$returnMsg ['info'] = "发货成功!";
		} else {
			$returnMsg ['info'] = "发货失败!";
		}
		return $returnMsg;
	}

	/**
	 * 获取订单信息表的所有id
	 *
	 * @param array $data 表单数据
	 */
	public function getOrderInfoIdList( $order_id ) {
		$returnMsg = returnMsg ();
		if ( empty( $order_id ) ) {
			$returnMsg['info'] = "订单号为空！";
			return $returnMsg;
		}
		$dataList = $this->where("order_id = '{$order_id}' and is_send = 0")->field('id')->select();
		if ( count( $dataList ) == 0 ) {
			$returnMsg['info'] = "此订单没有需要发货的商品！";
		} else {
			$returnMsg['status'] = 1;
			$returnMsg['info'] = "";
			for ( $i = 0, $size = count( $dataList ); $i < $size; $i ++ ) {
				$returnMsg['info'] .= empty( $returnMsg['info'] ) ? $dataList[$i]['id'] : ",{$dataList[$i]['id']}";
			}
		}
		return $returnMsg;
	}



}