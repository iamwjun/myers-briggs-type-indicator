<?php
/**
 * 类名：MicroDistribution
 * 功能：微分销操作
 */

class MicroDistribution {

	var $alipay_config;
	var $outPut = array();
	var $member;
	function __construct($config){
		$this->config = $config;
		$model = D('Config');
		$configInfo = $model->where(array('id'=>1))->find();
		//团推-直推所占比例
		$this->config['team_build'] = $configInfo['team_build']/100;
		$this->config['team_manage'] = $configInfo['team_manage']/100;
		$this->config['grown'] = json_decode($configInfo['upgrade_rule'],true);
		$this->config['integral_rule'] = json_decode($configInfo['integral_rule'],true);
		$grown_rule = array_filter(explode('|',$configInfo['grown']));
		foreach ($grown_rule as $v){
			$this->config['grown_rule'][] = $v;
		}
		$this->member = D('Member')->where(array('id'=>$this->config['mid']))->find();
	}
	function microDistribution(){
		$model = D('Config');
		$configInfo = $model->where(array('id'=>1))->find();
		//成长值规则，数组
		$upgrade_rule = json_decode($configInfo['upgrade_rule'],true);
 		//消费商，消费获取成长值,并记录
 		if($upgrade_rule['consume'] > 0){
 			$upgrade_val = $this->config['price']*(1/$upgrade_rule['consume']);
 			$this->addUpgrade($upgrade_val,1);
 		}

 		
 		//消费商积分规则数组
 		$integral_rule = json_decode($configInfo['integral_rule'],true);

 		if($integral_rule['consume'] >0){
	 		$integral_val = $this->config['price']*(1/$integral_rule['consume']);
	 		$this->addIntegral($integral_val,1); 		
 		}
 		//消费商消费获取分销奖励
 		if($configInfo['consume'] > 0){
 			$this->MemberConsume($configInfo['consume']);
 		}
 		
 		//添加消费记录和减少库存，增加销量
 		$this->consumption();

 		//会员提成计算
 		//begin和high属于同种奖励，只是按不同的比例对商机进行提成。一个是按上级数进行提成。一个是按上级会员级别进行提成
		$begin = array_filter(explode( "|", $configInfo['begin'] ));
		$high = array_filter(explode( "|", $configInfo['high'] ));
		foreach ($begin as $v){
			$this->begin[] = $v;
		}
		foreach ($high as $v){
			$this->high[] = $v;
		}
		//有上家则分销
		if($this->member['recommended_code']){
			$this->commission($this->member['recommended_code'],$this->member['level'],1);
		}
		//查看用户是否已到升级阶段
		$this->upLevel($this->config['mid']);

	}
	/**
	 * 成长值添加,记录
	 * 完成
	 * @param number $mid 会员id
	 */
	function addUpgrade($upgrade,$up_type = 1){
		$data['mid'] = $this->config['mid'];
		$data['from_id'] = $this->config['mid'];
		$data['create_time'] = time();
		$data['order_id'] = $this->config['order_id'];
		$data['upgrade'] = $upgrade;
		$data['record'] = tmpl_upgrade($up_type);
		$MemberUpgrade = D( 'MemberUpgrade' );
		if ($MemberUpgrade->create ( $data )) {
			if ( $MemberUpgrade->add () ) {
				
				// 更新会员表的总成长值
				$AllGrown = $upgrade;

				// 先获取会员当前的积分
				$theGrown = D( 'Member' )->where( array( 'id' => $data['mid'] ) )->getField( 'grown' );
				// 更新会员的积分
				if ( D( 'Member' )->where( array( 'id' => $data['mid'] ) )->save( array( 'grown' => $AllGrown + $theGrown ) ) ) {
					return true;
				}
			}
		}
		//查看用户是否已到升级阶段
		$this->upLevel($this->config['mid']);
		return;
	}
	/**
	 * 积分添加,记录
	 * 完成
	 * @param number $mid 会员id
	 */
	function addIntegral($integral,$up_type = 1){
		$data['mid'] = $this->config['mid'];
		$data['from_id'] = $this->config['mid'];
		$data['create_time'] = time();
		$data['order_id'] = $this->config['order_id'];
		$data['integral'] = $integral;
		$data['record'] = '30';
		$MemberUpgrade = D( 'MemberIntegral' );
		if ($MemberUpgrade->create ( $data )) {
			if ( $MemberUpgrade->add () ) {
				// 更新会员表的总积分
				$AllIntegral = $integral;
				//记录积分
				//D('MemberIntegralRecode')->addIntegralInfo($integral,'30',true,false,$data['order_id']);
				// 先获取会员当前的积分
				$theIntegral = D( 'Member' )->where( array( 'id' => $data['mid'] ) )->getField( 'integral' );
				// 更新会员的积分
				if ( D( 'Member' )->where( array( 'id' => $data['mid'] ) )->save( array( 'integral' => $AllIntegral + $theIntegral ) ) ) {
					return true;
				}
			}
		}
	
		return;
	}
	
	/**
	 * 奖励添加
	 * 完成
	 * @param number $mid 会员id
	 */
	function addreward($reward,$up_type = 1,$from = 0){
		$data['mid'] = $this->config['mid'];
		$data['from_id'] = $from ? $from : $this->config['mid'];
		$data['create_time'] = time();
		$data['order_id'] = $this->config['order_id'];
		$data['reward'] = $reward;
		$data['record'] = tmpl_upgrade($up_type);
		$MemberUpgrade = D( 'MemberReward' );
		if ($MemberUpgrade->create ( $data )) {
			if ( $MemberUpgrade->add () ) {
				// 更新会员表的总奖励
				$AllReward = $reward;
	
				// 先获取会员当前的奖励
				$theReward = D( 'Member' )->where( array( 'id' => $data['mid'] ) )->getField( 'reward' );
				// 更新会员的奖励
				if ( D( 'Member' )->where( array( 'id' => $data['mid'] ) )->save( array( 'reward' => $AllReward + $theReward ) ) ) {
					return true;
				}
			}
		}
	
		return;
	}
	/**
	 * 直推,团推会员增加成长值,在用户注册时调用 $layer=0时为直推会员 否则为团推会员
	 * 特别提醒：这里上级会员获得成长值，不是自己获得。。。。消费升级是用户自己消费得来。团直推是下层会员带来的升级
	 * @param array $recommended 幸运码
	 */
	 function buildUpgrade($recommended,$layer=0) {
		if($recommended){
			$map['referral_code'] = $recommended;
			$map['is_delete'] = 0;
			$map['status'] = 0;
			$father = D('Member')->where( $map )->find();
			$build = (1/$this->config['grown']['build']);
			$manage = (1/$this->config['grown']['manage']);
			$grown = $layer == 0 ? $build + $manage : $manage;
			D('Member')->where(array('id'=>$father['id']))->setInc('grown',$grown);
			//查看用户是否已到升级阶段
			$this->upLevel($father['id']);
			//直推 团推 增加积分
			$integral_rule = $this->config['integral_rule'];
			$map['mid'] = $father['id'];
			$map['create_time'] = time();
			if($layer == 0){
				$map['integral'] = 1/$_POST['build'];
				$map['record'] = '31';
			}else{
				$map['integral'] = 1/$_POST['manage'];
				$map['record'] = '32';
			}
			
			D( 'MemberIntegral' )->add($map);
			//递归
			if($father['recommended_code']){
				$this->buildUpgrade($father['recommended_code'],1);
			}
		}	
	}
	/**
	 * 直推和团推人数获取
	 * @param number $recommend 推销号
	 */
	 protected $countList = 0;
	 function getSubList( $recommend) {
			$map['recommended'] = $recommend;
			$map['level'] = array('egt',$this->config['upgrade']['team']);
			$map['is_delete'] = 0;
			$map['status'] = 0;
			$newArray = D('Member')->where( $map )->select();
			for ( $i = 0, $size = count( $newArray ); $i < $size; $i ++ ) {
				$this->countList ++;
				$this->getSubList( $newArray[$i]['recommend']);
			}
	}
	/**
	 * 会员推荐提成提成
	 * 直推或者团推时，对会员进行提成
	 */
	private $remain = array('level'=>-1,'avg'=>0);//会员已经提取的比例
	private function commission($recommend,$level,$layer) {
		$memberModel = D( 'Member' );
		$memberCommission = D( 'MemberCommission' );
		$thisArray = $memberModel->where( array( 'referral_code' => $recommend ) )->find();
		$count = count($this->begin);//得到分销层数
		if ( empty( $thisArray ) ) {
			return $layer;
		} else {
			if ( $layer >= $count ) {
				return $layer;
			}
			$tempArray['from_id'] = $this->member['id'];
			$tempArray['order_id'] = $this->config['order_id'];
			$tempArray['uid'] = $thisArray['id'];
			$tempArray['create_time'] = time();
			
			// （团队建设奖）
			$tempArray['build_price'] = 0;
			if($this->begin[$layer-1] > 0){
				$tempArray['build_price'] = $this->config['profit'] *$this->config['team_build']* ($this->begin[$layer-1]/100);
			}
			//团队管理奖领取规则
			if($thisArray['level'] > $this->remain['level']){
				$newHigh = $this->high[$thisArray['level']]/100 - $this->remain['avg'];
				$this->remain = array('level'=>$thisArray['level'],'avg'=>$this->high[$thisArray['level']]/100 );
			}else{
				$newHigh = 0;
			}
			// 团队管理奖
			$tempArray['manage_price'] = $this->config['profit'] *$this->config['team_manage'] * $newHigh;
			
			 // 团队管理奖结束
			if ( $layer > $count && $tempArray['manage_price'] == 0 ) {
				// 此条件下没有任何提成产生，不执行添加
				$this->commission($thisArray['recommended_code'],$layer, $thisArray['level'] );
			} else {
				if ( $this->insert( $tempArray ) ) {
					$layer ++;
					$this->commission( $thisArray['recommended_code'], $thisArray['level'], $layer);
				}
			}
		}
	}
	/**
	 * 新增会员获得积分的记录 并更新会员的总积分
	 * 
	 * @param $data
	 * @return array
	 */
	public function insert($data) {
		$memberCommission = D( 'MemberCommission' );
		if ($memberCommission->create ( $data )) {
			if ( $memberCommission->add () ) {
				// 更新会员表的总积分
				$AllIntegral = $data['manage_price'] + $data['build_price'];

				// 先获取会员当前的积分
				$theIntegral = D( 'Member' )->where( array( 'id' => $data['uid'] ) )->getField( 'integral' );
				// 更新会员的积分
				if ( D( 'Member' )->where( array( 'id' => $data['uid'] ) )->save( array( 'integral' => $AllIntegral + $theIntegral ) ) ) {
					return true;
				}
			}
		}
		return false;
	}
	/**
	 * 添加消费记录
	 */
	public function consumption(){
		// 添加会员消费记录
		$memberConsumptionModel = D( 'MemberConsumption' );
		$consumption['uid'] = $this->member['id'];
		$consumption['order_id'] = $this->config['order_id'];
		$consumption['create_time'] = time();
		if ( $memberConsumptionModel->add( $consumption ) ) {
			$orderInfo = $this->getProId( $this->config['order_id'] );
			$productModel = D( 'Commodity' );
			for ( $i = 0, $size = count( $orderInfo ); $i < $size; $i ++ ) {
				// 增加产品销量
				$update['id'] = $orderInfo[$i]['id'];
				$update['sale_volume'] = $orderInfo[$i]['sale_volume'] + $orderInfo[$i]['num'];
				//减少库存
				$update['stock'] = $orderInfo[$i]['stock'] - $orderInfo[$i]['num'];
				$productModel->save( $update );
			}
		}
	}
	/**
	 * 根据订单编号 获得所属订单商品的属性
	 * @param string $order_id
	 * @return array
	 */
	public function getProId( $order_id ) {
		$listArray = D('OrderInfo')->where( array( 'order_id' => $order_id ) )->field( 'pro_id,num' )->select();
		$newArray = array();
		$productModel = D( 'Commodity' );
		for ( $i = 0, $size = count( $listArray ); $i < $size; $i ++ ) {
			$theArray = $productModel->where( array( 'id' => $listArray[$i]['pro_id'] ) )->field( 'id,uid,member_price,cost_price,sale_volume,stock,hit' )->find();
			$newArray[] = array(
					'id' => $theArray['id'],
					'uid' => $theArray['uid'],
					'sale_volume' => $theArray['sale_volume'],
					'stock' => $theArray['stock'],
					'num' => $listArray[$i]['num'],
					'member_price' => $theArray['member_price'],
					'cost_price' => $theArray['cost_price'],
			);
		}
		return $newArray;
	}
	/**
	 * 消费提成
	 */
	function MemberConsume($consume){
		$data['mission_price'] = ($this->config['price']*$consume)/100;
		$data['consume_price'] = $this->config['price'];
		$data['create_time'] = time();
		$data['order_id'] = $this->config['order_id'];
		$data['uid'] = $this->config['mid'];
		$MemberConsume = D( 'MemberConsume' );
		if ($MemberConsume->create ( $data )) {
			if ( $MemberConsume->add () ) {
				// 获取会员信息
				$memberModel = D( 'Member' );
				$tempMember = $memberModel->where( array( 'id' => $data['uid'] ) )->find();
				$AllReward = $tempMember['reward'] + $data['mission_price'];

				// 更新会员的奖金
				$isMember = $memberModel->where( array( 'id' => $data['uid'] ) )->setField( 'reward', $AllReward );

				// 添加奖金明细记录
				$reward = array();
				$reward['uid'] = $this->config['mid'];
				$reward['price'] = $data['mission_price'];
				$reward['balance'] = $AllReward;
				$reward['type'] = $this->config['reward_type'];
				$reward['create_time'] = time();
				$reward['status'] = 1;
				$isRewardMoney = D('RewardMoney')->add($reward);

				return $isMember && $isRewardMoney ? true : false;
			}
		}
	}
	/**
	 * 判断用户成长值是否能够升级
	 * @param $mid
	 */
	function upLevel($id){
		$member = D('Member')->where(array('id'=>$id))->find();
		//$category = D('Category')->where(array('pid'=>1,'is_delete'=>0,'status'=>0))->order('sort desc,create_time desc')->select();
		$this->config['grown'];
		$nowLevel = 0;
		foreach ($this->config['grown_rule'] as $key=>$vl){
			if($member['grown'] >= $vl){
				$nowLevel ++;
			}
		}
		$data['id'] = $member['id'];
		$data['level'] = $nowLevel;
		D('Member')->save($data);
	}
}
?>