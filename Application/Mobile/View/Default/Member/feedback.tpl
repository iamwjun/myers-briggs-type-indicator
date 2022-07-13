<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>意见反馈</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">意见反馈</h1>
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
		

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	<!--意见反馈-->
	<form method="post" action="">
	<div class="user_center">
		<div class="feedback_box">
			<ul>
				<li>
					<input type="text" name="username" id="user_name" value="" placeholder="请输入您的姓名" />
				</li>
				<li>
					<input type="text" name="tel" id="tel" value="" placeholder="请输入您的联系方式" />
				</li>
				<li>
					<textarea name="content" rows="" cols="" id="message" placeholder="您的意见是我们前进的动力！"></textarea>
				</li>
			</ul>
			<div class="apply_repair_submit mui-clearfix">
				<input type="submit" id="message_submit" name="tj" value="确定" />
			</div>
		</div>
	</div>
	</form>
	<!--意见反馈-->
	
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--意见反馈js-->
<script src="__JS__/advice_feedback.js" type="text/javascript" charset="utf-8"></script>
</html>