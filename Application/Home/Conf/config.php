<?php
//'配置项'=>'配置值'
return array(
	// 设置模版替换变量
	'TMPL_PARSE_STRING' => array(
		'__STYLE__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Style',
		'__JS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Js',
		'__IMAGES__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Images',
		'__PLUGIN__' => __ROOT__ . '/Public/Plugin',
		'__PHONE-TIP__' => __ROOT__ . '/Public/Plugin/phone-tip',
	),

	//启用路由功能
	'URL_ROUTER_ON'=>true,

	//配置路由规则
	'URL_ROUTE_RULES'=>array(
		//每条键值对，对应一个路由规则
		'i/:domain'=>'Space/index',
	),
);