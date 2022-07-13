<?php
namespace Admin\Model;

/**
 * 后台管理-操作节点模型
 *
 * @author Administrator
 *        
 */
class UserNodeModel extends CommModel {
	
	/**
	 * 获取授权所用的节点
	 * 
	 * @param string $auth 权限
	 * @return array
	 */
	public function authNodeList( $auth ) {
		$limit = array( 'begin' => 0, 'num' => 0 );
		$temp_condition = array( 'pid' => 0, 'is_delete' => 0, 'status' => 0 );
		$nodeList = $this->getList( $temp_condition, "id,title,name", $limit );
		$newsList = array();
		for ( $i = 0, $size = count( $nodeList ); $i < $size; $i ++ ) {
			$rows = $nodeList[$i];
			$temp_condition = array( 'pid' => $rows['id'], 'is_delete' => 0, 'status' => 0 );
			$child = $this->getList( $temp_condition, "id,pid,title,name" );
			// 判断是否拥有操作当前节点的权限
			$newRows = $rows;
			$newRows['checked'] = strpos( $auth, ",{$rows['name']}," ) !== false ? true : false;
			$newRows['node'] = $rows['name'];
			$newRows['pId'] = 0;
			$newRows['name'] = $rows['title'];
			$newsList[] = $newRows;
			for ( $j = 0, $length = count( $child ); $j < $length; $j ++ ) {
				$temp = $child[$j];
				$newTemp = $temp;
				$newTemp['checked'] = strpos( $auth, ",{$rows['name']}/{$temp['name']}," ) !== false ? true : false;
				$newTemp['node'] = "{$rows['name']}/{$temp['name']}";
				$newTemp['pId'] = $rows['id'];
				$newTemp['name'] = $temp['title'];
				$newsList[] = $newTemp;
			}
		}
		return $newsList;
	}
	
}