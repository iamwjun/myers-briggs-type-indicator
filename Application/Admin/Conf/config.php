<?php
//'配置项'=>'配置值'
return array(
	// 设置模版替换变量
	'TMPL_PARSE_STRING' => array(
		'__ROOTURL__'	=> __ROOT__ . '/' . MODULE_NAME,
		'__STYLE__' 	=> __ROOT__ . '/Public/' . MODULE_NAME . '/Style',
		'__JS__' 		=> __ROOT__ . '/Public/' . MODULE_NAME . '/Js',
		'__IMAGES__' 	=> __ROOT__ . '/Public/' . MODULE_NAME . '/Images',
		'__PLUGIN__' 	=> __ROOT__ . '/Public/Plugin',
		'__PLUGIN_H-ui__' 	=> __ROOT__ . '/Public/Plugin/h-ui',
		'__TEMPLATE__' 	=> __ROOT__ . '/Public/' . MODULE_NAME . '/Template',
	),
	
	// excel表格导入[上传文件路径]
	'EXCEL_UPLOAD_PATH' => "./Uploads/Excel/",

	// 开启TOKEN
	'TOKEN_ON' => true,	// 是否开启令牌验证 默认关闭
	'TOKEN_NAME' => '__hash__', // 令牌验证的表单隐藏字段名称，默认为__hash__
	'TOKEN_TYPE' => 'md5', // 令牌哈希验证规则 默认为MD5
	'TOKEN_RESET' => true, // 令牌验证出错后是否重置令牌 默认为true
		
	//启用路由功能
	'URL_ROUTER_ON' => true,
	//配置路由规则
	'URL_ROUTE_RULES' => array(
		//每条键值对，对应一个路由规则
		'backpwd' 	=> 'Forget/send', 	// 找回密码
		'login' 	=> 'Login/login', 	// 登录
		'logout' 	=> 'Login/logout', 	// 退出登录
		'verify'	=> 'Login/verify',	// 验证码
		'index'	=> 'Index/index',	// 后台首页
		'welcome'	=> 'Index/welcome',	// 欢迎界面
		'demo'	=> 'Index/demo'	// 后台首页body
	),
);