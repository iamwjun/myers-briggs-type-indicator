<?php
namespace Admin\Model;

/**
 * 后台管理-前台操作节点模型
 *
 * @author Administrator
 *        
 */
class MemberNodeModel extends CommModel {
	
	/**
	 * 获取授权所用的节点
	 * 
	 * @param string $auth 权限
	 * @return array
	 */
	public function authNodeList( $auth ) {
		$nodeList = $this->getList( array( 'pid' => 0, 'is_delete' => 0, 'status' => 0 ), "id,title,name" );
		for ( $i = 0, $size = count( $nodeList ); $i < $size; $i ++ ) {
			$rows = $nodeList[$i];
			$child = $this->getList( array( 'pid' => $rows['id'], 'is_delete' => 0, 'status' => 0 ), "id,title,name" );
			// 判断是否拥有操作当前节点的权限
			$nodeList[$i]['checked'] = strpos( $auth, ",{$rows['name']}," ) !== false ? ' checked="true"' : '';
			for ( $j = 0, $length = count( $child ); $j < $length; $j ++ ) {
				$temp = $child[$j];
				$child[$j]['checked'] = strpos( $auth, ",{$rows['name']}/{$temp['name']}," ) !== false ? ' checked="true"' : '';
			}
			$nodeList[$i]['child'] = empty( $child ) ? array() : $child;
		}
		return $nodeList;
	}
	
}