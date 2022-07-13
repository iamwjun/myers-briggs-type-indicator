<?php
namespace Home\Model;

/**
 * 订单模型
 *
 * @author BoBo
 *        
 */
class OrderModel extends CommModel {

	/**
	 * 设置订单编号
	 *
	 * @return string
	 */
	public  function setOrderId() {
		$orderId = createRandomCode () . time ();
		if ( $this->where ( array ( 'order_id' => $orderId ) )->getField ( 'id' ) ) {
			$this->setOrderId ();
		} else {
			return $orderId;
		}
	}

	/**
	 * 获取订单列表
	 *
	 * @param array $condition 查询条件
	 */
	public function getList( $condition, $type ) {
		$condition ['is_delete'] = 0;
		$tempArray = $this->where ( $condition )->order ( 'create_time desc' )->select ();
		$productModel = D ( 'Commodity' );
		$orderInfoModel = D ( 'OrderInfo' );
		if ( empty ( $tempArray ) ) {
			return null;
		} else {
			for ( $i = 0 , $size = count ( $tempArray ); $i < $size; $i ++ ) {
				$newArray = array ();
				$map ['order_id'] = $tempArray [$i] ['order_id'];
				if ( $type == 1 ) {
					$map ['is_send'] = 0;
				} else if ( $type == 2 ) {
					$map ['is_send'] = 1;
				} else if ( $type == 3 ) {
					$map ['is_send'] = 2;
				}
				$orderArray = $orderInfoModel->where ( $map )->select ();
				for ( $j = 0 , $len = count ( $orderArray ); $j < $len; $j ++ ) {
					$orderArray [$j] ['create_time'] = date ( 'Y-m-d H:i:s', $orderArray [$j] ['create_time'] );
					$newArray [$j] = $orderArray [$j];
					$newArray [$j] ['info'] = $productModel->where ( array ( 'id' => $orderArray [$j] ['pro_id'] ) )->field ( 'id,title,picture,intro,market_price,member_price' )->find ();
				}
				$tempArray [$i] ['list'] = $newArray;
			}
		}
		return $tempArray;
	}

	/**
	 * 取消订单
	 *
	 * @param int $id 订单id
	 * @return array
	 */
	public function remove( $id ) {
		$return = returnMsg ();
		$condition ['id'] = $id;
		if ( $this->where ( $condition )->getField ( 'id' ) ) {
			if ( $this->delete ( $id ) ) {
				$return ['status'] = 1;
				$return ['info'] = "取消成功!";
			} else {
				$return ['info'] = "取消失败!";
			}
		} else {
			$return ['info'] = "数据不存在!";
		}
		return $return;
	}
	/**
	 * 新增立即购买的订单
	 * $id 为商品ID 立即购买 只能购买1件商品
	 */
	public function goBuyNowInsert($data){
		$return = returnMsg ();
		//钱包抵扣
		$money = $data['money'] ? $data['money'] : 0;
		$session = $_SESSION ['member_auth'];
		$product = D('Commodity')->getOne($data['pro_id']);
		$orderArray = $data;
		$orderArray ['uid'] = $session ['id'];
		$orderArray ['order_id'] = $this->setOrderId ();
		$orderArray ['create_time'] = time ();
		$orderArray ['price'] = ($product['member_price'] * $data['num']) + ($product['freight'] * $data['num']) - $money;
		$orderArray ['freight'] = $product['freight'] * $data['num'];	// 运费
		// 订单产品列表
		$tempArray['order_id'] = $orderArray ['order_id']; // 订单编号
		$tempArray['pro_id'] = $data ['pro_id']; // 产品id
		$tempArray['num'] = $data ['num']; // 商品个数
		$tempArray['total_money'] = $data ['num'] * $product ['member_price']; // 订单总金额
		$tempArray['create_time'] = time (); // 创建时间
		$tempArray['freight'] = $orderArray ['freight'];	// 运费
		if ( $this->create ( $orderArray ) ) {
			$result = $this->add ();
			if ( $result ) {
				D ( 'OrderInfo' )->add ( $tempArray );
				cookie( 'TempCart', null );
				$return ['status'] = 1;
				$return ['info'] = $result;
			} else {
				$return ['info'] = "下单失败!";
			}
		}
		return $return;
	}
	/**
	 * 新增订单
	 *
	 * @param array $data 订单数据
	 */
	public function insert( $data ) {
		$return = returnMsg ();
		$session = $_SESSION ['member_auth'];
		
		//钱包抵扣
		$money = $data['money'] ? $data['money'] : 0;
		
		// 把json转为数组
		$cart = json_decode ( $_COOKIE ['ShopCart'], true );
		$tempList = $cart ['cartList'];
		// 记录购买商品个数
		$num = 0;
		// 付款数组
		$orderArray = $data;
		$orderArray ['price'] = 0;
		$orderArray ['freight'] = 0;
		$orderArray ['uid'] = $session ['id'];
		$orderArray ['order_id'] = $this->setOrderId ();
		// 循环生成订单数组
		$productArray = array ();
		$proModel = D('Commodity');
		for ( $i = 0 , $size = count ( $tempList ); $i < $size; $i ++ ) {
			$rows = $tempList [$i];
			if ( $rows ['check'] == 1 ) {
				// 订单产品列表
				$freight = $proModel->where( array( 'id' => $rows ['id'] ) )->getField('freight');
				$tempArray['order_id'] = $orderArray ['order_id']; // 订单编号
				$tempArray['pro_id'] = $rows ['id']; // 产品id
				$tempArray['num'] = $rows ['num']; // 商品个数
				$tempArray['total_money'] = $rows ['num'] * $rows ['price']; // 订单总金额
				$tempArray['freight'] = $rows ['num'] * $freight; // 运费
				$tempArray['create_time'] = time (); // 创建时间
				$productArray [] = $tempArray;
				$num += $rows ['num'];
				$orderArray ['price'] += $tempArray['total_money'] + $tempArray['freight'];
				$orderArray ['freight'] += $tempArray['freight'];
				unset ( $cart ['cartList'] [$i] );
			}
		}
		// 是否清空购物车
		if ( count ( $productArray ) == count ( $tempList ) ) {
			$isNullCart = true;
		} else {
			$isNullCart = false;
		}
		// 添加订单
		$orderArray ['create_time'] = time ();
		$orderArray ['price'] = $orderArray ['price'] - $money;
		if ( $this->create ( $orderArray ) ) {
			$result = $this->add ();
			if ( empty ( $result ) ) {
				$return ['info'] = "下单失败!";
			} else {
				if ( D ( 'OrderInfo' )->addAll ( $productArray ) ) {
					// 设置购物车
					if ( $isNullCart ) {
						cookie ( 'ShopCart', null );
						// 更新购物车表
						$whereArray = array ( 'user_id' => $session ['id'] );
						$saveArray ['cart_json'] = '';
						$saveArray ['create_time'] = time ();
						D ( 'Cart' )->where ( $whereArray )->save ( $saveArray );
					} else {
						$cart ['cartList'] = array_merge ( $cart ['cartList'] );
						$cart ['totalMoney'] -= $orderArray ['price'];
						$cart ['shopNum'] -= $num;
						$tempCart = json_encode ( $cart );
						cookie ( 'ShopCart', $tempCart );
						// 更新购物车表
						$whereArray = array ( 'user_id' => $session ['id'] );
						$saveArray ['cart_json'] = $tempCart;
						$saveArray ['create_time'] = time ();
						D ( 'Cart' )->where ( $whereArray )->save ( $saveArray );
					}
					$return ['status'] = 1;
					$return ['info'] = $result;
				} else {
					$return ['info'] = "下单失败!";
				}
			}
		}
		return $return;
	}
	
	/**
	 * 新增订单[当面支付订单]
	 * 
	 * @param array $data 订单数据
	 */
	public function facePayInsert( $data ) {
		$return = returnMsg();
		
		// 付款数组
		$orderArray = $data;
		$orderArray['order_id'] = $this->setOrderId();
		$orderArray['create_time'] = time();
		$orderArray['type'] = 1;
		
		// 添加订单
		if ( $this->create( $orderArray ) ) {
			$result = $this->add();
			if ( empty( $result ) ) {
				$return['info'] = "下单失败!";
			} else {
				$productArray = array(
						'order_id' => $orderArray['order_id'],		// 订单编号
						'pro_id' => 0,		// 产品id
						'num' => 1,			// 商品个数
						'total_money' => $orderArray['price'],	// 订单总金额
						'create_time' => time(),				// 创建时间
				);
				if ( D( 'OrderInfo' )->add( $productArray ) ) {
					$return['status'] = 1;
					$return['info'] = $result;
				} else {
					$return['info'] = "下单失败!";
				}
			}
		}
		return $return;
	}

	/**
	 * 会员升级
	 *
	 * @param number $uid 会员id
	 * @param number $price 订单价格
	 * @param array $upgradeConsumer 升级规则
	 */
	public function upgrade( $uid, $price, $upgrade ) {
		$orderModel = D ( 'Order' );
		$memberModel = D ( 'Member' );
		$user = $memberModel->where ( array ( 'id' => $uid ) )->find ();
		if ( empty ( $user ) ) {return;}
		$orderArray = $orderModel->where ( array ( 'uid' => $user ['id'], 'is_pay' => 1 ) )->field ( 'price' )->select ();
		for ( $i = 0 , $size = count ( $orderArray ); $i < $size; $i ++ ) {
			$price += $orderArray [$i] ['price'];
		}
		// 直推总数
		$push = $memberModel->getSubList ( $user ['referral_code'], 'push' );
		// 团队总数
		$team = $memberModel->getSubList ( $user ['referral_code'], 'team' );
		switch ( $user ['level'] ) {
			case 0 :
				$return = explode ( "-", $upgrade [2] );
				$reutrn2 = explode ( "-", $upgrade [3] );
				$reutrn3 = explode ( "-", $upgrade [4] );
				if ( $push >= $reutrn3 [0] || $team >= $reutrn3 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 5 );
				} else if ( $push >= $reutrn2 [0] || $team >= $reutrn2 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 4 );
				} else if ( $push >= $return [0] || $team >= $return [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 3 );
				} else if ( $price >= $upgrade [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 2 );
				} else if ( $price >= $upgrade [0] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level' );
				}
				break;
			case 1 :
				$return = explode ( "-", $upgrade [2] );
				$reutrn2 = explode ( "-", $upgrade [3] );
				$reutrn3 = explode ( "-", $upgrade [4] );
				if ( $push >= $reutrn3 [0] || $team >= $reutrn3 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 4 );
				} else if ( $push >= $reutrn2 [0] || $team >= $reutrn2 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 3 );
				} else if ( $push >= $return [0] || $team >= $return [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 2 );
				} else if ( $price >= $upgrade [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level' );
				}
				break;
			case 2 :
				$return = explode ( "-", $upgrade [2] );
				$reutrn2 = explode ( "-", $upgrade [3] );
				$reutrn3 = explode ( "-", $upgrade [4] );
				if ( $push >= $reutrn3 [0] || $team >= $reutrn3 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 3 );
				} else if ( $push >= $reutrn2 [0] || $team >= $reutrn2 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 2 );
				} else if ( $push >= $return [0] || $team >= $return [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level' );
				}
				break;
			case 3 :
				$return = explode ( "-", $upgrade [3] );
				$reutrn2 = explode ( "-", $upgrade [4] );
				if ( $push >= $reutrn2 [0] || $team >= $reutrn2 [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level', 2 );
				} else if ( $push >= $return [0] || $team >= $return [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level' );
				}
				break;
			case 4 :
				$return = explode ( "-", $upgrade [4] );
				if ( $push >= $return [0] || $team >= $return [1] ) {
					$memberModel->where ( array ( 'id' => $uid ) )->setInc ( 'level' );
				}
				break;
			case 5 :
				break;
		}
	}
}