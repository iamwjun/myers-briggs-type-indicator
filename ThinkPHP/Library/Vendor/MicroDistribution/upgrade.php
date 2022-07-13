<?php
/**
 * 类名：MemberUpgrade
 * 功能：会员升级
 */

class MemberUpgrade {
	
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
	 * 模型
	 * @var array
	 */
	private $model;
	
	/**
	 * 会员等级列表
	 * @var array
	 */
	private $levelList = array();
	
	/**
	 * 构造方法
	 * @param array $config
	 */
	public function __construct(  ) {
		
		// 模型
		$this->model['config'] = D( 'Config' ); // 配置
		$this->model['member'] = D( 'Member' );	// 会员
		$this->model['integral'] = D( 'MemberIntegral' ); // 积分记录
		$this->model['upgrade'] = D('MemberUpgrade'); // 成长值记录
		
		// 配置参数
		$this->config = $this->model['config']->getOne( 1 );
		
		// 升级规则[build 直推][manage 团推]
		$this->config['upgrade_rule'] = json_decode( $this->config['upgrade_rule'], true );
		
		// 积分规则[build 直推][manage 团推]
		$this->config['integral_rule'] = json_decode( $this->config['integral_rule'], true );
		
		// 成长值规则
		$this->config['grown'] = array_merge( array_filter( explode( '|', $this->config['grown'] ) ) );
	}

	/**
	 * 升级
	 */
	public function upgrade( $recommended, $fromId, $layer = 0 ) {
		$return = returnMsg();
		
		// 判断推荐码是否为空
		if ( empty( $recommended ) ) {
			$return['info'] = $layer == 0 ? "推荐码为空!" : "已到顶级!";
			return $return;
		}
		
		// 判断推荐码是否存在
		$map = array();
		$map['referral_code'] = $recommended;
		$map['is_delete'] = 0;
		$map['status'] = 0;
		$member = $this->model['member']->where( $map )->find();
		if ( empty( $member ) ) {
			$return['info'] = "推荐人不存在!";
			return $return;
		}
		
		// 计算直推/团推积分
		$integral_rule = $this->config['integral_rule'];
		$integral = array();
		$integral['mid'] = $member['id'];
		$integral['from_id'] = $fromId;
		$integral['create_time'] = time();
		if( $layer == 0 ){
			$integral['integral'] = ( 1 / $integral_rule['build'] );
			$integral['type'] = 31;
		}else{
			$integral['integral'] = ( 1 / $integral_rule['manage'] );
			$integral['type'] = 32;
		}
		if ( !$this->model['integral']->add( $integral ) ) {
			$return['info'] = $layer == 0 ? "计算直推/团推积分：当前第{$layer}层，添加直推积分失败!" : "计算直推/团推积分：当前第{$layer}层，添加团推积分失败!";
			return $return;
		}
		
		// 计算直推/团推成长值
		$upgrade_rule = $this->config['upgrade_rule'];
		$build = ( 1 / $upgrade_rule['build'] );
		$manage = ( 1 / $upgrade_rule['manage'] );
		$upgrade = array();
		$upgrade['mid'] = $member['id'];
		$upgrade['from_id'] = $fromId;
		$upgrade['upgrade'] = $layer == 0 ? $build + $manage : $manage;
		$upgrade['type'] = $layer == 0 ? 38 : 39;
		$upgrade['create_time'] = time();
		if ( !$this->model['upgrade']->add( $upgrade ) ) {
			$return['info'] = $layer == 0 ? "计算直推/团推成长值：当前第{$layer}层，添加直推成长值失败!" : "计算直推/团推成长值：当前第{$layer}层，添加团推成长值失败!";
			return $return;
		}
		
		// 更新会员积分、成长值
		$saves = array();
		$saves['id'] = $member['id'];
		$saves['integral'] = $integral['integral'] + $member['integral'];
		$saves['grown'] = $upgrade['upgrade'] + $member['grown'];
		if ( !$this->model['member']->save( $saves ) ) {
			$return['info'] = $layer == 0 ? "更新会员积分、成长值：当前第{$layer}层，更新会员积分、成长值失败!" : "计更新会员积分、成长值：当前第{$layer}层，更新会员积分、成长值失败!";
			return $return;
		}
		
		// 会员升级
		$member['integral'] = $integral['integral'];
		$member['grown'] = $integral['grown'];
		$return = $this->setLevel( $member );
		if ( !$return['status'] ) {
			return $return;
		}
		
		// 递归执行
		if ( $member['recommended_code'] ) {
			$layer ++;
			return $this->upgrade( $member['recommended_code'], $fromId, $layer );
		}
		
		// 返回成功
		$return['status'] = 1;
		$return['info'] = '操作成功!';
		return $return;
	}
	
	/**
	 * 设置会员等级
	 * @return array
	 */
	private function setLevel( $member ) {
		$return = returnMsg();
		
		// 获取会员等级
		$model = D( 'Category' );
		$condition[ 'status' ] = 0;
		$condition[ 'is_delete' ] = 0;
		$condition[ 'pid' ] = 1;
		$levelList = $model->getList( $condition, "id,title", array( 'begin' => 0, 'num' => 0 ), 'sort asc' );
		
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
		if ( $member['level'] != $nowLevel ) {
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

}
?>