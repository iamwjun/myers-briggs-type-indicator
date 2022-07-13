<?php
return array (
	// 页面Trace
	// 'SHOW_PAGE_TRACE'=>true,
		
	// 设置可访问目录
	'MODULE_ALLOW_LIST' => array (
			'Home',
			'Admin',
			'Mobile'
	),
	
	// 设置默认目录
	'DEFAULT_MODULE' => 'Home',
	
	// 设置模版后缀
	'TMPL_TEMPLATE_SUFFIX' => '.tpl',
	
	// 设置默认主题目录
	'DEFAULT_THEME' => 'Default',
	
	// URL模式
	'URL_MODEL' => 2,
	
	// 图片上传路径
	'UPLOAD_PATH' => './Uploads/public/',
	
	// 头像上传路径
	'MEMBER_UPLOAD_PATH' => './Uploads/head/',
	
	// 数据库设置
	'DB_TYPE' => 'mysql', // 数据库类型
	
	'DB_HOST' => 'mysql', // 服务器地址
	'DB_NAME' => 'mbti', // 数据库名
	'DB_USER' => 'root', // 用户名
	'DB_PWD' => 'XyZ321!', // 密码
	
	'DB_PORT' => '3306', // 端口
	'DB_PREFIX' => 'db_', // 数据库表前缀
	'DB_FIELDTYPE_CHECK' => false, // 是否进行字段类型检查
	'DB_FIELDS_CACHE' => false, // 启用字段缓存
	'DB_CHARSET' => 'utf8', // 数据库编码默认采用utf8
	'DB_DEPLOY_TYPE' => 0, // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
	'DB_RW_SEPARATE' => false, // 数据库读写是否分离 主从式有效
	'DB_SQL_BUILD_CACHE' => false  // 数据库查询的SQL创建缓存
);