<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>客服中心-{$config.web_title}</title>
	<meta name="keywords" content="{$config.web_keywords}" />
	<meta name="description" content="{$config.web_description}" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">客服中心</h1>
		<!-- <a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="javascript:;"></a> -->
	</header>
	<div id="header_bg"></div>
	<!--右上角弹出菜单-->
	<div id="topPopover" class="mui-popover mui-active">
		<div class="mui-backdrop"></div>
		<div class="topPopover_head">
			<a id="close_topPopover" href="" class="mui-action-menu mui-icon iconfont icon-chacha mui-pull-right"></a>
		</div>
		<div class="mui-popover-arrow"></div>
		<div class="mui-scroll-wrapper">
			
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	<!--客服中心-->
	<div class="service">
		<div class="service_banner"><img src="__PUBLIC__/Home/Images/service.jpg"/></div>
		<div class="service_body">
			<div class="servive_title">常见问题</div>
			<ul>
			<volist name="list" id="vo">
				<li>
					<h5><span>●</span>{$vo.title}</h5>
					<div>{$vo.content}</div>
				</li>
			</volist>
			</ul>
		</div>
		<div class="service_interval"></div>
		<div class="servive_title">还需要其他帮助？</div>
		<div class="servive_href">
			<a href="tel:{$config.copyright}"><span class="mui-icon iconfont icon-icon052"><i>联系客服</i></span></a>
		</div>
	</div>
	<!--客服中心-->
	
	<!--底部导航-->
	<include file="Public:footer" />
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
</html>