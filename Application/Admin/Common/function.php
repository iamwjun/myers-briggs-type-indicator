<?php

/**
 * +-------------------------------------------------
 * + 获取商品的层级分类[商品列表处使用]
 * +-------------------------------------------------
 * + @param number $pid 商品所属分类ID
 * + @return string
 * +-------------------------------------------------
 */
function tmpl_commodityClassLevel($pid, $level = "") {
	$model = D ( 'CommodityClass' );
	if (! empty ( $pid )) {
		$tempInfo = $model->getOne ( $pid );
		$level = empty( $level ) ? "" : "/$level";
		$level = $tempInfo['title'] . $level;
		if ($tempInfo ['pid'] > 0) {
			return tmpl_commodityClassLevel( $tempInfo['pid'], $level );
		} else {
			return "商品分类：" . $level;
		}
	}
}

/**
 * +-------------------------------------------------
 * + 获取会员名称
 * +-------------------------------------------------
 * + @param number $id 会员ID
 * + @return string
 * +-------------------------------------------------
 */
function tmpl_getMemberName( $id ) {
	if ( is_number( $id ) ) {
		return '无';
	}
	$username = D( 'Member' )->getOne( $id, 'id', false, 'username' );
	return empty( $username ) ? '无' : $username;
}