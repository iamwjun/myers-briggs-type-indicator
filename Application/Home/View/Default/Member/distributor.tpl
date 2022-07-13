<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>申请认证经销商</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <!--App自定义的css-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/app.css" />
	<link href="__STYLE__/mui.picker.css" rel="stylesheet" />
	<link href="__STYLE__/mui.poppicker.css" rel="stylesheet" />
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
		<h1 class="mui-title">申请认证经销商</h1>
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
	
	<!--认证经销商-->
	<div class="user_center">
		<div class="invoice_management Certification_Engineer">
			<input type="hidden" name="" id="authentication_type" value="1" />
			<ul>
				<li>
					<div class="mui-input-row">
						<label>营业执照号</label>
						<input type="text" id="license" placeholder="请输入营业执照号">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>经营范围</label>
						<input type="text" id="manage" placeholder="请输入经营范围">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>公司名称</label>
						<input type="text" id="company_name" placeholder="请输入与营业执照一致的公司名称">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>联系人</label>
						<input type="text" id="user_name" placeholder="请输入联系人姓名">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>座机</label>
						<input type="text" id="tel" placeholder="请输入座机号码">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>法定代表人</label>
						<input type="text" id="user_name2" placeholder="请输入法定代表人姓名">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>法人联系电话</label>
						<input type="text" id="tel2" placeholder="请输入法定联系电话">
					</div>
				</li>
				
			</ul>
		</div>		
		<div class="Certification_Engineer_message">
			<input type="submit" id="apply_submit" name="" value="提交申请" />
			<a href="{:U('Member/certification')}">上一步</a>
		</div>
		
	</div>
	<!--认证经销商-->

</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--认证js-->
<script src="__JS__/authentication.js" type="text/javascript" charset="utf-8"></script>

</html>