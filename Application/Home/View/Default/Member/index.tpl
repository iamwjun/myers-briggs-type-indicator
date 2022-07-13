<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>个人中心</title>
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
		<h1 class="mui-title">个人中心</h1>
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
	
	<!--个人中心-->
	<div class="user_center">
		<div class="user_center_list">
		<img src="__IMAGES__/ucenter_banner.png" style="width:400px; height:240px">
			<div class="user_center_img" style="background:#f2f2f2">
			    <if condition="$member['face'] eq ''">
				   <img src="__PUBLIC__/Home/Images/head.jpg" alt="头像" />
			    <else />
				   <img src="__ROOT__/{$member['face']}" alt="头像"/>
			    </if>
				<p>
					<span style="color:#000">用户：<?php echo substr($member['username'],0,3);?>****<?php echo substr($member['username'],-4);?></span>
					
				</p>
				<a href="{:U('Member/edit_info')}" style="background:none; color:gray">编辑资料&nbsp;></a>
			</div>
			<div class="user_center_list_box">
				<ul>
					<!-- <a href="{:U('Member/message')}"><li>
						<i class="mui-icon iconfont icon-xiaoxizhongxin"><em>消息中心</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a>
					<a href="{:U('Member/certification')}"><li>
						<i class="mui-icon iconfont">&#xe692;<em>申请认证</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a> -->
					<a href="{:U('Member/update_pass')}"><li>
						<i class="mui-icon iconfont icon-xiugaimima"><em>修改密码</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a>
					<!-- <a href="{:U('Member/invoice')}"><li>
						<i class="mui-icon iconfont icon-fapiao"><em>发票信息管理</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a> -->
				</ul>
			</div>
			
			<div class="user_center_list_box">
				<ul>
					<a href="{:U('Member/feedback')}"><li>
						<i class="mui-icon iconfont icon-yijianfankui"><em>意见反馈</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a>
					<!-- <a href="{:U('Member/report')}"><li>
						<i class="mui-icon iconfont icon-jubao"><em>举报投诉</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a> -->
					<a href="{:U('Service/customer')}"><li>
						<i class="mui-icon iconfont icon-icon052"><em>客服中心</em></i>
						<span class="mui-icon mui-icon-arrowright"></span>
					</li></a>
				</ul>
			</div>
			
			<a href="{:U('Member/logout')}" class="quit">退出</a>
		</div>
	</div>
	<!--个人中心-->
	
	<!--底部导航-->
	<include file="Public:footer" />
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
</html>