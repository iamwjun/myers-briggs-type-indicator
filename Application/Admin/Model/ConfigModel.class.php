<?php

namespace Admin\Model;

class ConfigModel extends CommModel {
	
	// 自动验证
	protected $_validate = array (
			array ( 'title', '1,20', '请填写类别标题!', self::EXISTS_VALIDATE, 'length' ) 
	);
	
	// 自动完成
	protected $_auto = array (
			array ( 'title', 'filter_label', self::MODEL_BOTH, 'function' ) 
	);
}