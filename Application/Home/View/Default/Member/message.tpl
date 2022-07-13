<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>消息中心</title>
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
		<h1 class="mui-title">消息中心</h1>
		<a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="javascript:;"></a>
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
			<div class="mui-scroll">
				<ul class="mui-table-view">
				<?php $gywm=explode(',',$gywm);$fwxy=explode(',',$fwxy);$fwlc=explode(',',$fwlc);$hyxz=explode(',',$hyxz);$yssm=explode(',',$yssm);$sybz=explode(',',$sybz);$lxwm=explode(',',$lxwm);?>
				<?php if($gywm[0]==$unit || $gywm[1]==$unit || $gywm[2]==$unit || $gywm[3]==$unit || $gywm[4]==$unit){ ?>
					<li class="mui-table-view-cell">
						<a href="{:U('Article/about_us')}">关于我们</a>
					</li>
				<?php }?>
				<?php if($fwxy[0]==$unit || $fwxy[1]==$unit || $fwxy[2]==$unit || $fwxy[3]==$unit || $fwxy[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/agreement')}">服务协议</a></li>
				<?php }?>
				<?php if($fwlc[0]==$unit || $fwlc[1]==$unit || $fwlc[2]==$unit || $fwlc[3]==$unit || $fwlc[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/service_flow')}">服务流程</a></li>
				<?php }?>
			    <?php if($hyxz[0]==$unit || $hyxz[1]==$unit || $hyxz[2]==$unit || $hyxz[3]==$unit || $hyxz[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/member_notes')}">会员须知</a></li>
				<?php }?>
				<?php if($yssm[0]==$unit || $yssm[1]==$unit || $yssm[2]==$unit || $yssm[3]==$unit || $yssm[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/privacy')}">隐私说明</a></li>
				<?php }?>
				<?php if($sybz[0]==$unit || $sybz[1]==$unit || $sybz[2]==$unit || $sybz[3]==$unit || $sybz[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/help')}">使用帮助</a></li>
				<?php }?>
				<?php if($lxwm[0]==$unit || $lxwm[1]==$unit || $lxwm[2]==$unit || $lxwm[3]==$unit || $lxwm[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/contact_us')}">联系我们</a></li>
				<?php }?>
				</ul>
			</div>
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	<!--消息中心-->
	<div class="user_center">
		<div class="user_message_center">
			<ul>
			<volist name="list" id="vo">
				<li>
					<div class="user_message_center_time"><?php echo date('Y-m-d H:i',$vo['create_time']);?></div>
					<div class="user_message_center_text">
						<h5>{$vo.title}</h5>
						<p>{$vo.content}</p>
					</div>
				</li>
			</volist>
			</ul>
		</div>
	</div>
	<!--消息中心-->
	
	
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
</html>