<?php
/**
 * 类名：MicroDistribution
 * 功能：微分销操作
 */

class MicroDistribution {
	
	/**
	 * 配置参数
	 * @var array
	 */
	private $config;
	
	/**
	 * 会员信息
	 * @var array
	 */
	private $member;
	
	/**
	 * 订单详情
	 * @var array
	 */
	private $order;
	
	/**
	 * 模型
	 * @var array
	 */
	private $model;

	/**
	 * 利润
	 * @var int
	 */
	private $profit = 0;

	/**
	 * 合伙人商品
	 * @var int
	 */
	private $partner = array();
	
	/**
	 * 会员等级列表
	 * @var array
	 */
	private $levelList = array();
	
	/**
	 * 构造方法
	 * @param array $config
	 */
	public function __construct( $config ) {
		
		// 模型
		$this->model['config'] = D( 'Config' );
		$this->model['member'] = D( 'Member' );	// 会员
		$this->model['order'] = D( 'Order' );	// 订单
		$this->model['orderInfo'] = D( 'OrderInfo' );	// 订单产品
		$this->model['reward'] = D( 'RewardMoney' );	// 奖金明细
		$this->model['commission'] = D( 'MemberCommission' );	// 提成明细
		
		// 整合配置参数
		$tempConfig = $this->model['config']->getOne( 1 );
		$this->config = array_merge( $tempConfig, $config );
		
		// 设置参数
		$this->setParameter();
	}

	/**
	 * 微分销
	 */
	public function microDistribution() {
		// 第一步：1、添加会员消费记录 2、计算消费得消费奖 3、计算消费得成长值 4、计算消费得积分
		$return = $this->setConsumption();
		if ( !$return['status'] ) {
			return $return;
		}
		
		// 第二步：计算合伙人奖金
		$return = $this->setPartner();
		if ( !$return['status'] ) {
			return $return;
		}
		
		// 第三步：计算会员等级
		$return = $this->setLevel();
		if ( !$return['status'] ) {
			return $return;
		}
		
		// 第四步：计算推荐奖励、团队奖励
		if ( !empty( $this->member['recommended_code'] ) ) {
			// 提成最大层数
			$maxLayer = count( $this->config['reward_recommend'] ) - 1;
			// 最高等级
			$maxLevel = count( $this->levelList ) - 1;
			// 等级提成标记
			$levelMark = array();
			$j = 0;
			for ( $i = $maxLevel; $i >= 0; $i -- ) {
				$rows = $this->levelList[$i];
				$rows['level'] = $j;
				$rows['status'] = 'no';
				$j ++;
				$levelMark[] = $rows;
			}
			
			$return = $this->setCascadeReward( $this->member['recommended_code'], $maxLayer, 0, $maxLevel, 0, $levelMark );
			/* print_r($return);
			die(); */
			if ( !$return['status'] ) {
				return $return;
			}
		}
		
		// 更改订单状态为已付款
		$order = array();
		$order['is_pay'] = 1;
		$order['id'] = $this->order['id'];
		if ( !$this->model['order']->save( $order ) ) {
			$return['info'] = '更改订单状态失败!';
			return $return;
		}
		
		// 返回成功
		$return['status'] = 1;
		$return['info'] = '操作成功!';
		return $return;
	}

	/**
	 * 设置参数
	 */
	private function setParameter() {
		// 获取订单、订单产品详情、减少库存、增加销量、获取利润
		$this->setOrder();
		
		// 获取会员信息
		$this->member = $this->model['member']->getOne( $this->order['uid'] );
		
		// 成长值规则
		$this->config['grown'] = array_merge( array_filter( explode( '|', $this->config['grown'] ) ) );

		// 积分规则
		$this->config['integral_rule'] = json_decode( $this->config['integral_rule'], true );

		// 升级规则
		$this->config['upgrade_rule'] = json_decode( $this->config['upgrade_rule'], true );

		// 推荐奖励规则
		$reward_recommend = explode( '|', $this->config['reward_recommend'] );
		for ( $i = 0, $size = count( $reward_recommend ); $i < $size; $i ++ ) {
			$reward_recommend[$i] = $reward_recommend[$i] / 100;
		}
		$this->config['reward_recommend'] = $reward_recommend;

		// 团队奖励规则
		$reward_team = explode( '|', $this->config['reward_team'] );
		for ( $i = 0, $size = count( $reward_team ); $i < $size; $i ++ ) {
			$reward_team[$i] = $reward_team[$i] / 100;
		}
		$this->config['reward_team'] = $reward_team;

		// 消费奖励规则
		$this->config['reward_consume'] = $this->config['reward_consume'] / 100;

		// 合伙人奖励规则
		$this->config['reward_partner'] = $this->config['reward_partner'] / 100;
	}

	/**
	 * 设置订单
	 * 	1、获取订单 2、获取订单产品详情 3、减少库存 4、增加销量 5、获取利润
	 */
	private function setOrder() {
		// 获取订单
		$this->order = $this->model['order']->getOne( $this->config['order_id'] );

		// 获取订单产品信息
		$field = "a.num,a.pro_id,b.uid,b.member_price,b.cost_price,b.sale_volume,b.stock";
		$sql = "select $field from db_order_info as a";
		$sql .= " left join db_commodity as b on b.id = a.pro_id";
		$sql .= " where a.order_id = '{$this->order['order_id']}'";
		$orderInfoList = $this->model['orderInfo']->query( $sql );
		
		$model = D( 'Commodity' );
		for ( $i = 0, $size = count( $orderInfoList ); $i < $size; $i ++ ) {
			$rows = $orderInfoList[$i];
			// 增加产品销量
			$update['id'] = $rows['pro_id'];
			$update['sale_volume'] = $rows['sale_volume'] + $rows['num'];
			//减少库存
			$update['stock'] = $rows['stock'] - $rows['num'];
			$model->save( $update );
			// 统计利润
			$this->profit += ( $rows['member_price'] - $rows['cost_price'] ) * $rows['num'];
			// 统计合伙人商品
			if ( $rows['uid'] > 0 ) {
				$this->partner[] = $rows;
			} 
		}
	}

	/**
	 * 设置会员消费记录
	 * 	1、添加会员消费记录(db_member_consumption)
	 * 	2、计算消费得消费奖(db_member,db_reward_money)
	 * 	3、计算消费得成长值(db_member,db_member_upgrade)
	 * 	4、计算消费得积分(db_member,db_member_integral)
	 */
	private function setConsumption() {
		$return = returnMsg();
		
		// 添加会员消费记录
		$consumption = array();
		$consumption['uid'] = $this->member['id'];
		$consumption['order_id'] = $this->config['order_id'];
		$consumption['create_time'] = time();
		$model = D( 'MemberConsumption' );
		if ( !$model->add( $consumption ) ) {
			$return['info'] = '消费记录添加失败!';
			return $return;
		}

		// 计算消费得消费奖; 记入奖金明细表
		$getReward = $this->profit * $this->config['reward_consume'];
		$reward = array();
		$reward['uid'] = $this->member['id'];
		$reward['price'] = $getReward;
		$reward['balance'] = $getReward + $this->member['reward'];
		$reward['type'] = 25;
		$reward['order_id'] = $this->order['id'];
		$reward['create_time'] = time();
		$reward['status'] = 1;
		if ( !$this->model['reward']->add( $reward ) ) {
			$return['info'] = '计算会员消费得消费奖出错：记入奖金明细失败！';
			return $return;
		}
		
		// 计算消费得成长值; 记入成长值明细表
		$getGrown = $this->order['price'] / $this->config['upgrade_rule']['consume'];
		$grown['mid'] = $this->member['id'];
		$grown['from_id'] = $this->member['id'];
		$grown['order_id'] = $this->order['id'];
		$grown['upgrade'] = $getGrown;
		$grown['type'] = 36;
		$grown['create_time'] = time();
		$model = D('MemberUpgrade');
		if ( !$model->add( $grown ) ) {
			$return['info'] = '计算会员消费得成长值出错：记入成长值明细失败！';
			return $return;
		}
		
		// 计算消费得积分; 记入积分明细表
		$getIntegral = $this->order['price'] / $this->config['integral_rule']['consume'];
		$integral['mid'] = $this->member['id'];
		$integral['from_id'] = $this->member['id'];
		$integral['order_id'] = $this->order['id'];
		$integral['integral'] = $getIntegral;
		$integral['type'] = 30;
		$integral['create_time'] = time();
		$model = D('MemberIntegral');
		if ( !$model->add( $integral ) ) {
			$return['info'] = '计算会员消费得积分出错：记入积分明细失败！';
			return $return;
		}
		
		
		// 更新会员的消费奖总额、成长值总额、积分总额
		$member['id'] = $this->member['id'];
		$member['reward'] = $getReward + $this->member['reward'];
		$member['grown'] = $getGrown + $this->member['grown'];
		$member['integral'] = $getIntegral + $this->member['integral'];
		if ( !$this->model['member']->save( $member ) ) {
			$return['info'] = '更新会员：消费奖总额、成长值总额、积分总额 失败！';
			return $return;
		}
		
		// 返回成功
		$return['status'] = 1;
		$return['info'] = 'setConsumption成功!';
		return $return;
	}

	/**
	 * 设置合伙人奖金
	 * @return array
	 */
	private function setPartner() {
		$return = returnMsg();
		
		// 判断是否有合伙商品
		if ( count( $this->partner ) <= 0 ) {
			$return['status'] = 1;
			$return['info'] = '没有合伙人商品！';
			return $return;
		}
		
		// 伙伴人产品提成模型
		$model = D( 'MemberProduct' );		
		
		// 计算合伙人商品奖金
		foreach ( $this->partner as $rows ) {
			// 计算商品的奖金
			$price = ( $rows['member_price'] - $rows['cost_price'] ) * $rows['num'] * $this->config['reward_partner'];

			// 记录合伙人产品提成
			$memPro = array();
			$memPro['uid'] = $rows['uid'];
			$memPro['pro_id'] = $rows['pro_id'];
			$memPro['order_id'] = $this->order['id'];
			$memPro['num'] = $rows['num'];
			$memPro['price'] = $price;
			$memPro['create_time'] = time();
			if ( !$model->add( $memPro ) ) {
				$return['info'] = '计算合伙人产品提成出错：记入合伙人产品提成明细失败！';
				return $return;
			}
			
			// 更新合伙人奖金总额
			$member_reward = $this->model['member']->getOne( $rows['uid'], 'id', false, 'reward' );
			$member = array();
			$member['id'] = $rows['uid'];
			$member['reward'] = $member_reward + $price;
			if ( !$this->model['member']->save( $member ) ) {
				$return['info'] = '更新合伙人奖金总额失败！';
				return $return;
			}
			
			// 记录合伙人奖金明细
			$reward = array();
			$reward['uid'] = $rows['uid'];
			$reward['price'] = $price;
			$reward['balance'] = $member['reward'];
			$reward['type'] = 24;
			$reward['order_id'] = $this->order['id'];
			$reward['create_time'] = time();
			$reward['status'] = 1;
			if ( !$this->model['reward']->add( $reward ) ) {
				$return['info'] = '计算合伙人奖金出错：记入奖金明细失败！';
				return $return;
			}
		}
		
		// 返回成功
		$return['status'] = 1;
		$return['info'] = 'setPartner成功!';
		return $return;
	}
	
	/**
	 * 设置会员等级
	 * @return array
	 */
	private function setLevel() {
		$return = returnMsg();
		
		// 获取会员信息
		$member = $this->model['member']->getOne( $this->member['id'] );
		
		// 获取会员等级
		$model = D( 'Category' );
		$condition[ 'status' ] = 0;
		$condition[ 'is_delete' ] = 0;
		$condition[ 'pid' ] = 1;
		$this->levelList = $model->getList( $condition, "id,title", array( 'begin' => 0, 'num' => 0 ), 'sort asc' );
		$levelList = $this->levelList;
		
		// 设置等级
		$nowLevel = 0;
		krsort($this->config['grown']);
		$this->config['grown'] = array_merge( $this->config['grown'] );
		for ( $i = 0, $size = count( $levelList ); $i < $size; $i ++ ) {
			if ( $member['grown'] >= $this->config['grown'][$i] ) {
				$nowLevel = $levelList[$i]['id'];
				break;
			}
		}
		if ( $this->member['level'] != $nowLevel ) {
			$data['id'] = $member['id'];
			$data['level'] = $nowLevel;
			if ( !$this->model['member']->save($data) ) {
				$return['info'] = '设置会员等级失败!';
				return $return;
			}
		}
	
		// 返回成功
		$return['status'] = 1;
		$return['info'] = 'setLevel成功!';
		return $return;
	}
	
	/**
	 * 计算推荐奖励、团队奖励
	 * @return array
	 */
	private function setCascadeReward( $recommended, $maxLayer, $layer, $maxLevel, $level, $levelMark ) {
		$return = returnMsg();
		// 判断会员是否有上级
		if ( empty( $recommended ) ) {
			$return['status'] = 1;
			$return['info'] = $layer == 0 ? '没有推荐人!' : '已到最顶级!';
			return $return;
		}
		
		// 获取推荐人信息
		$theMember = $this->model['member']->getOne( $recommended, 'referral_code' );
		if ( empty( $theMember ) ) {
			$return['status'] = 0;
			$return['info'] = '当前第'.$layer.'层，推荐人'.$recommended.'不存在！';
			return $return;
		}
		
		// 取得当前会员等级
		$theLevel = 0;
		for ( $i = 0, $size = count( $levelMark ); $i < $size; $i ++ ) {
			$rows = $levelMark[$i];
			if ( $rows['id'] == $theMember['level'] ) {
				$theLevel = $rows['level'];
				break;
			}
		}
		
		// 判断提成是否已完成
		if ( $layer > $maxLayer && $level >= $maxLevel ) {
			$return['status'] = 1;
			$return['info'] = '提成已完成!';
			return $return;
		}
		
		// 计算提成
		$commission['from_id'] = $this->member['id'];
		$commission['order_id'] = $this->order['id'];
		$commission['uid'] = $theMember['id'];
		$commission['create_time'] = time();
		// 推荐奖励
		$commission['build_price'] = $layer > $maxLayer ? 0 : $this->profit * $this->config['reward_recommend'][$layer];
		// 团队奖励
		$commission['manage_price'] = 0;
		if ( $theLevel >= $level && $levelMark[ $theLevel ]['status'] == 'no' ) {
			$theL = -1;
			$theF = false;
			foreach ( $levelMark as $rows ) {
				if ( $rows['status'] == 'yes' ) {
					$theL = $rows['level'];
				}
			}
			$reward_team = $this->config['reward_team'];
			if ( $theL == -1 ) {
				$thePercent = $reward_team[ 0 ];
			} else {
				$thePercent = $reward_team[ $theLevel ] - $reward_team[ $theL ];
			}
			$commission['manage_price'] = $this->profit * $thePercent;
			$levelMark[ $theLevel ]['status'] = 'yes';
		}
		
		// 添加会员提成记录
		if ( $commission['manage_price'] == 0 && $commission['build_price'] == 0 ) {
			// 此条件下没有任何提成产生，不执行添加
			return $this->setCascadeReward( $theMember['recommended_code'], $maxLayer, $layer, $maxLevel, $theLevel, $levelMark);
		} else {
			if ( $this->model['commission']->add( $commission ) ) {
				// 总奖金
				$allReward = $commission['manage_price'] + $commission['build_price'];
				// 更新会员的推荐奖、团队奖
				$member['id'] = $theMember['id'];
				$member['reward'] = $allReward + $theMember['reward'];
				if ( !$this->model['member']->save( $member ) ) {
					$return['info'] = '更新会员：更新会员的推荐奖、团队奖失败！';
					return $return;
				}
				// 推荐奖励; 记入奖金明细表
				$balance = $commission['build_price'] + $theMember['reward'];
				if ( $commission['build_price'] > 0 ) {
					$reward = array();
					$reward['uid'] = $theMember['id'];
					$reward['price'] = $commission['build_price'];
					$reward['balance'] = $balance;
					$reward['type'] = 22;
					$reward['order_id'] = $this->order['id'];
					$reward['create_time'] = time();
					$reward['status'] = 1;
					if ( !$this->model['reward']->add( $reward ) ) {
						$return['info'] = '计算会员推荐奖励出错：记入奖金明细失败！';
						return $return;
					}
				}
				// 团队奖励; 记入奖金明细表
				if ( $commission['manage_price'] > 0 ) {
					$reward = array();
					$reward['uid'] = $theMember['id'];
					$reward['price'] = $commission['manage_price'];
					$reward['balance'] = $balance + $commission['manage_price'];
					$reward['type'] = 23;
					$reward['order_id'] = $this->order['id'];
					$reward['create_time'] = time();
					$reward['status'] = 1;
					if ( !$this->model['reward']->add( $reward ) ) {
						$return['info'] = '计算会员团队奖励出错：记入奖金明细失败！';
						return $return;
					}
				}
				$layer ++;
				return $this->setCascadeReward( $theMember['recommended_code'], $maxLayer, $layer, $maxLevel, $theLevel, $levelMark);
			} else {
				$return['info'] = '添加会员提成记录失败!';
				return $return;
			}
		}		
		
		// 返回成功
		$return['status'] = 1;
		$return['info'] = 'setCascadeReward成功!';
		return $return;
	}

}
?>