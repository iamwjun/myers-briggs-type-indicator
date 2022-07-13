<?php
namespace Admin\Model;

/**
 * 后台管理-会员群组模型
 *
 * @author Administrator
 *        
 */
class MemberRoleModel extends CommModel {
	
	/**
	 * 设置授权
	 */
	public function auth_save( $data ) {
		if ($this->create ( $data )) {
			$return = $this->getCommOne ( $data ['id'] );
			if ($return ['status']) {
				$data['pid'] = $data['id'];
				$this->where( array( 'id' => $data['id'], 'pid' => $data['pid'], '_logic' => 'or' ) )->save ( array( 'auth' => $data['auth'] ) );
				$return ['info'] = '授权成功!';
			}
		}
		return $return;
	}

	/**
	 * 递归获取前台会员群组
	 * @param number $pid 会员的父id
	 * @param number $level 层数
	 * @return string html代码
	 */
	public $html;
	public function getMultiSelect( $pid = 0, $level = 0 ,$auth='') {
		$condition = array( 'pid' => $pid, "is_delete" => 0, "status" => 0 );
		$dataArray = $this->getList( $condition, "id,pid,title" );
	
		// 组合Tree
		$this->html = empty( $this->html ) ? "" :$this->html;
		if ( count( $dataArray ) > 0 ) {
			if ( $level == 0 ) {
				$this->html .= "<ul class=\"tree treeFolder collapse treeCheck expand\" oncheck=\"checkCallback\">";
			} else {
				$this->html .= "<ul class=\"tree treeFolder collapse treeCheck expand\" oncheck=\"checkCallback\" style=\"padding-left:20px;\">";
			}
			for ( $i = 0, $size = count( $dataArray ); $i < $size; $i ++ ) {
				$rows = $dataArray[$i];
				$this->html .= "	<li>";
                                $isCheck = '';
                                if($auth){
                                    $isCheck = strpos( $auth, ",{$rows['id']}," ) !== false ? ' checked="true"' : '';
                                }
				$this->html .= "	<a tname=\"role[]\" tvalue=\"{$rows['id']}\" {$isCheck}>{$rows['title']}</a>";
				$level++;
				$this->getMultiSelect( $rows['id'], $level,$auth );
				$this->html .= "	</li>";
			}
			$this->html .= "</ul>";
		}
		return $this->html;
	}
}