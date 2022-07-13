<?php

namespace Admin\Controller;

/**
 * 网站基础设置
 *
 * @author Administrator
 *        
 */
class ConfigController extends CommController {
	
	/**
	 * 网站基础设置
	 */
	public function index() {
		// 获取数据
		$data = D( 'Config' )->getOne( 1 );
		
		// 获取会员等级
		$map[ 'status' ] = 0;
		$map[ 'is_delete' ] = 0;
		$map[ 'pid' ] = 1;
		$levelTitle = D( 'Category' )->field('title')->where( $map )->select();
		
		// 会员等级成长值
		$grown = array_filter(explode( '|', $data[ 'grown' ] ));
		foreach ( $levelTitle as $key => $val ) {
			if ( $key > 0 ) {
				$levelTitle[ $key ][ 'grown' ] = $grown[ $key ];
			} else {
				$levelTitle[ $key ][ 'grown' ] = '注册';
			}
		}
		
		// 积分奖励规则
		$data[ 'integral_rule' ] = json_decode( $data[ 'integral_rule' ], true );
		
		// 会员升级规则
		$data[ 'upgrade_rule' ] = json_decode( $data[ 'upgrade_rule' ], true );
		
		// 推荐奖励规则
		//$data[ 'reward_recommend' ] = explode( "|", $data[ 'reward_recommend' ] );
		
		// 团队奖励规则
		//$data[ 'reward_team' ] = explode( "|", $data[ 'reward_team' ] );
		
		$this->assign( 'leveltitle', $levelTitle );
		$this->assign( 'dataInfo', $data );
		$this->display();
	}
	
	/**
	 * 保存配置信息
	 */
	public function _before_update() {
		
		// 会员成长值规则
		if ( $_POST[ 'grown' ] ) {
			$_POST[ 'grown' ] = '|' . implode( '|', $_POST[ 'grown' ] ) . '|';
		}
		
		// 会员升级规则
		if ( $_POST[ 'upgrade_rule' ] ) {
			$_POST[ 'upgrade_rule' ] = json_encode( $_POST[ 'upgrade_rule' ] );
		}
		
		// 积分规则
		if ( $_POST[ 'integral_rule' ] ) {
			$_POST[ 'integral_rule' ] = json_encode( $_POST[ 'integral_rule' ] );
		}
		
		// 推荐奖励规则
		if ( $_POST[ 'reward_recommend' ] ) {
			$_POST[ 'reward_recommend' ] = implode( '|', $_POST[ 'reward_recommend' ] );
		}
		
		// 团队奖励规则
		if ( $_POST[ 'reward_team' ] ) {
			$_POST[ 'reward_team' ] = implode( '|', $_POST[ 'reward_team' ] );
		}
	}
}