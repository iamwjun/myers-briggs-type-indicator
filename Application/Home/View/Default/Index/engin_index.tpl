<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>{$config.web_title}</title>
	<meta name="keywords" content="{$config.web_keywords}" />
	<meta name="description" content="{$config.web_description}" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/swiper.min.css"/>
    <style type="text/css">
        .swiper-container {
        width: 100%;
        height: auto;
	    }
	    .swiper-slide {
	        text-align: center;
	        font-size: 18px;
	        background: #fff;

	        /* Center slide text vertically */
	        display: -webkit-box;
	        display: -ms-flexbox;
	        display: -webkit-flex;
	        display: flex;
	        -webkit-box-pack: center;
	        -ms-flex-pack: center;
	        -webkit-justify-content: center;
	        justify-content: center;
	        -webkit-box-align: center;
	        -ms-flex-align: center;
	        -webkit-align-items: center;
	        align-items: center;
	    }
	    .swiper-slide img{width: 100%; height: auto;}
    </style>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hAjiYxx2WoLGG7owEEwfSuv9d94dxKbD"></script>
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<!--地图定位-->
		<div id="allmap" style="display: none;"></div>
		<a class="mui-icon iconfont icon-dizhi mui-pull-left"><span id="location">正在定位</span></a>
		<!--地图定位-->
		<h1 class="mui-title">仪修网</h1>
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
	
	<!--轮播图-->
  
    <div class="swiper-container">
        <div class="swiper-wrapper">
        <volist name="focus" id="vo">
          <div class="swiper-slide">
            <a href="#">
	          <img src="__ROOT__/{$vo.picture}"/>
	        </a>
	     </div>
        </volist>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
	
	<!--轮播图-->
	<!--首页-->
	<div class="index_box">
		<ul>
			<a href="{:U('Member/engin_all_order')}" title=""><li class="index_box1">
				<span class="mui-icon iconfont icon-shenqing"></span>
				<i>全部工单</i>
			</li></a>
			<a href="{:U('Member/engin_waite_order')}" title=""><li class="mui-pull-right index_box2">
				<span class="mui-icon iconfont icon-iconfontzhizuobiaozhun12"></span>
				<i>待处理工单</i>
			</li></a>
			<a href="{:U('Member/engin_waite_baojia')}" title=""><li class="mui-pull-right index_box3">
				<span class="mui-icon iconfont icon-anzhuang"></span>
				<i>待报价工单</i>
			</li></a>
			<a href="{:U('Member/engin_weixiu')}" title=""><li class="mui-pull-right index_box4">
				<span class="mui-icon iconfont icon-weibao"></span>
				<i>维修中工单</i>
			</li></a>
			<a href="{:U('News/index')}" title=""><li class="mui-pull-right index_box7">
				<span class="mui-icon iconfont icon-icon02"></span>
				<i>新闻中心</i>
			</li></a>
			<a href="{:U('Service/index')}" title=""><li class="index_box5">
				<span class="mui-icon iconfont icon-fapiao"></span>
				<i>服务项目</i>
			</li></a>
			<a href="{:U('Service/customer')}" title=""><li class="index_box6">
				<span class="mui-icon iconfont icon-a138"></span>
				<i>客服中心</i>
			</li></a>
		</ul>
	</div>
	<!--首页-->
	
	<!--底部导航-->
	<div id="foot_bg"></div>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-href mui-active" href="{:U('Index/index')}">
        <span class="mui-icon iconfont icon-shouyeshouye"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <if condition="$unit eq 1">
    <a class="mui-tab-href" href="{:U('Member/grab_order')}">
        <span class="mui-icon iconfont icon-icon"></span>
        <span class="mui-tab-label">抢单</span>
    </a>
    <elseif condition="$unit eq 4" />
    <a class="mui-tab-href" href="{:U('Member/engin_all_order')}">
        <span class="mui-icon iconfont icon-icon"></span>
        <span class="mui-tab-label">我的工单</span>
    </a>
    <else />
    <a class="mui-tab-href" href="{:U('Member/myorder')}">
        <span class="mui-icon iconfont icon-icon"></span>
        <span class="mui-tab-label">我的订单</span>
    </a>
    </if>
    <a class="mui-tab-href" href="{:U('Member/index')}">
        <span class="mui-icon iconfont icon-gerenzhongxin"></span>
        <span class="mui-tab-label">个人中心</span>
    </a>
</nav>
	

</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--未登录时弹出提示框-->
<script src="__JS__/index_map_not_login.js" type="text/javascript" charset="utf-8"></script>
 <!-- Swiper JS -->
<script src="__JS__/swiper.min.js"></script>

<!-- Initialize Swiper -->
<script>
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true
});
</script>
</html>