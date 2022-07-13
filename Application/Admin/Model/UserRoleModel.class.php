<?php
namespace Admin\Model;

/**
 * 后台管理-管理员群组模型
 *
 * @author Administrator
 *        
 */
class UserRoleModel extends CommModel {
	
	/**
	 * 设置授权
	 */
	public function auth_save( $data ) {
		if ($this->create ( $data )) {
			$return = $this->getCommOne ( $data ['id'] );
			if ($return ['status']) {
				$this->save ( $data );
				$return ['info'] = '授权成功!';
			}
		}
		return $return;
	}	
}