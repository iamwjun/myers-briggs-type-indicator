<?php
namespace Admin\Model;

/**
 * 后台管理-前台菜单分组模型
 *
 * @author Administrator
 *        
 */
class MemberGroupModel extends CommModel {
	
	/**
	 * 获取后台菜单列表
	 * 
	 * @param string $auth 权限
	 * @return array
	 */
	public function menuList( $auth ) {
		$tempList = $this->getList( array( 'pid' => 0, 'status' => 0, 'is_delete' => 0 ), "id,title,name" );
		for ( $i = 0, $size = count( $tempList ); $i < $size; $i ++ ) {
			$rows = $tempList[$i];
			$child = $this->getList( array( 'pid' => $rows['id'], 'status' => 0, 'is_delete' => 0 ), "title,name,inherit" );
			for ( $j = 0, $length = count( $child ); $j < $length; $j ++ ) {
				$temp = $child[$j];
				$child[$j]['url'] = empty( $temp['inherit'] ) ? "{$temp['name']}/index" : "{$rows['name']}/{$temp['name']}";
				$child[$j]['rel'] = empty( $temp['inherit'] ) ? strtolower( $temp['name'] ) : strtolower( $rows['name'] );
				if ( strpbrk( $auth, ",{$child[$j]['url']}," ) === false ) {
					unset( $child[$j] );
				}
			}
			$tempList[$i]['child'] = $child;
		}
		return $tempList;
	}
}