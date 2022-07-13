<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    
    <meta name="description" content="{$config['web_description']}" />
    <meta name="keywords" content="{$config['web_keywords']}" />
    <title>{$config['web_title']}</title>   
    <link rel="stylesheet" type="text/css" href="__STYLE__/common.css" />
	<link rel="stylesheet" type="text/css" href="__STYLE__/main.css" />
	<link rel="stylesheet" type="text/css" href="__STYLE__/swiper-3.2.5.min.css" />
	<link rel="stylesheet" type="text/css" href="__STYLE__/zyUpload.css" />
	<link rel="styleSheet" type="text/css" href="__STYLE__/layer.css" id="layermcss">
    <block name="link">
    </block>  
    
	<script type="text/javascript" src="__JS__/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="__JS__/layer.js"></script>
    <script type="text/javascript" src="__JS__/ectouch.js"></script>
    <script type="text/javascript" src="__JS__/jquery-ui-1.10.1.custom.min.js "></script>
    <script type="text/javascript" src="__JS__/jquery.ui.touch-punch.min.js "></script>
    <script type="text/javascript" src="__JS__/jquery.infinite.js"></script>
    <script type="text/javascript" src="__JS__/template.js"></script>
    <script type="text/javascript" src="__PUBLIC__/Plugin/dwz/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="__JS__/swiper-3.2.5.min.js"></script>
	<script type="text/javascript">
		var jsObj = {
			'root' : '__ROOT__',
			'images' : '__IMAGES__',
			'login_url' : '{:U('Login/login')}',
			'is_login' : '<if condition="session('member_auth')">1<else />0</if>',
		};
	</script>
	<block name="jscript">
	</block>