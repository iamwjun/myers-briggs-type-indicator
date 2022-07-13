<?php
namespace Admin\Model;

/**
 * 后台管理-菜单分组模型
 *
 * @author Administrator
 *        
 */
class UserGroupModel extends CommModel {
	
	/**
	 * 获取后台菜单列表
	 * 
	 * @param string $auth 权限
	 * @return array
	 */
	public function menuList( $auth ) {
		$limit = array( 'begin' => 0, 'num' => 0 );
		$temp_map = array( 'pid' => 0, 'status' => 0, 'is_delete' => 0 );
		$tempList = $this->getList( $temp_map, "id,title,name,icon", $limit );
		for ( $i = 0, $size = count( $tempList ); $i < $size; $i ++ ) {
			$rows = $tempList[$i];
			$temp_map = array( 'pid' => $rows['id'], 'status' => 0, 'is_delete' => 0 );
			$child = $this->getList( $temp_map, "title,name,inherit", $limit );
			for ( $j = 0, $length = count( $child ); $j < $length; $j ++ ) {
				$temp = $child[$j];
				$child[$j]['url'] = empty( $temp['inherit'] ) ? "Admin/{$temp['name']}/index" : "Admin/{$rows['name']}/{$temp['name']}";
				$child[$j]['rel'] = empty( $temp['inherit'] ) ? strtolower( $temp['name'] ) : strtolower( $rows['name'] );
				$temp_url = empty( $temp['inherit'] ) ? "{$temp['name']}/index" : "{$rows['name']}/{$temp['name']}";
				if ( strpos( $auth, ",{$temp_url}," ) === false ) {
					unset( $child[$j] );
				}
			}
			if ( count( $child ) == 0 ) {
				unset( $tempList[$i] );
			} else {
				$tempList[$i]['child'] = $child;
			}
		}
		return array_merge( $tempList );
	}
}