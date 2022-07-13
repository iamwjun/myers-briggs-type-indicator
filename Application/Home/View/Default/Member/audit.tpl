<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>认证审核中</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<style type="text/css">
		.certification_status_bg{background: #fff;}
		.certification_status_tab{margin: 20px 10px; height: 50px; position: relative;}
		.certification_status_tab:after{content:'';position: absolute; top: 9px; left: 15%; width: 35%; height: 0; border-bottom: 1px dashed #479bfe;}
		.certification_status_tab:before{content:'';position: absolute; top: 9px; right: 15%; width: 35%; height: 0; border-bottom: 1px dashed #999;}
		.certification_status_tab.active:before{border-bottom: 1px dashed #479bfe;}
		.certification_status_tab ul li{width: 20%; float: left; text-align: center; position: relative; z-index: 50;}
		.certification_status_tab ul li i{height: 30px; background: #fff; font-size: 24px; color: #999;}
		.certification_status_tab ul li h5{font-size: 15px;}
		.certification_status_tab ul li.active h5{color: #479bfe;}
		.certification_status_tab ul li.active i{color: #479bfe;}
		.certification_status_tab ul li.line{background: none;}
		.certification_status_tab ul li.line i{font-size:18px ; background: none;}
		.certification_status_box{text-align: center; font-size: 14px; color: #999; padding: 20px 0;}
		.certification_status_box img{width: 110px; height: 110px; margin: 20px 0;}
		.certification_status_box a{display: block; margin: 30px 30px; border: 1px solid #479bfe; height: 40px; line-height: 40px; border-radius:20px ; font-size: 16px;}
	</style>
	<script type="text/javascript">
		$(function () {
			var type_val = $('#type').val();
			if(type_val==2){
				$('.certification_status_tab ul li:eq(0)').addClass('active');
				$('.certification_status_tab ul li:eq(1)').addClass('active');
				$('.certification_status_tab ul li:eq(2)').addClass('active');
			}else if(type_val==3){
				$('.certification_status_tab ul li:eq(0)').addClass('active');
				$('.certification_status_tab ul li:eq(1)').addClass('active');
				$('.certification_status_tab ul li:eq(2)').addClass('active');
				$('.certification_status_tab ul li:eq(3)').addClass('active');
				$('.certification_status_tab ul li:eq(4)').addClass('active');
				$('.certification_status_tab').addClass('active');
			}
		})
	</script>
</head>
<body class="certification_status_bg">
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">认证审核中</h1>
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
					<li class="mui-table-view-cell">
						<a href="{:U('Article/about_us')}">关于我们</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/agreement')}">服务协议</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/service_flow')}">服务流程</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/member_notes')}">会员须知</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/privacy')}">隐私说明</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/help')}">使用帮助</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/contact_us')}">联系我们</a>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	<!--认证状态-->
	<div class="user_center">
		<div class="certification_status">
		<if condition="$audit.status eq 0">
			<input type="hidden" name="type" id="type" value="2" />
		<else />
            <input type="hidden" name="type" id="type" value="3" />
		</if>
			<div class="certification_status_tab">
				<ul>
					<li>
						<div>
							<i class="iconfont">&#xe692;</i>
							<h5>申请认证</h5>
						</div>
					</li>
					<li class="line">
						<div>
							<i class="iconfont">&#xe60e;</i>
						</div>
					</li>
					<li>
						<div>
							<i class="iconfont">&#xe625;</i>
							<h5>审核中</h5>
						</div>
					</li>
					<li class="line">
						<div>
							<i class="iconfont">&#xe60e;</i>
						</div>
					</li>
					
					<li>
						<div>
							<i class="iconfont">&#xe601;</i>
							<h5>通过</h5>
						</div>
					</li>
					<if condition="$audit.status eq 2">
						<li>
							<div>
								<i class="iconfont">&#xe64d;</i>
								<h5>失败</h5>
							</div>
						</li>
					</if>
				</ul>
			</div>
			<if condition="$audit.status eq 0">
				<div class="certification_status_box">
					<img src="__PUBLIC__/Home/Images/icon2.png"/>
					<p>后台人员正在审核您提交的相关<br />
	资料，请耐心等待！</p>
	                <if condition="$audit.type eq 1">
					<a href="{:U('Member/show_engin_info')}">查看资料</a>
					<else />
                    <a href="{:U('Member/show_other_info')}">查看资料</a>
					</if>
				</div>
			</if>
			<if condition="$audit.status eq 2">
				<div class="certification_status_box">
					<img src="__PUBLIC__/Home/Images/icon1.png"/>
					<p>您提交的认证资料审核<br />
	失败，请重新填写！</p>
					<a href="">再次填写</a>
				</div>
			</if>
			
		    <if condition="$audit.status eq 1">
				<div class="certification_status_box">
					<img src="__PUBLIC__/Home/Images/icon3.png"/>
					<p>恭喜！您提交的认证资料<br />
	审核已通过！</p>
					<a href="{:U('Index/index')}">返回首页</a>
				</div>
			</if>
			
		</div>
		
		
	</div>
	<!--认证状态-->
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--登录，注册，忘记密码的js验证-->

</html>