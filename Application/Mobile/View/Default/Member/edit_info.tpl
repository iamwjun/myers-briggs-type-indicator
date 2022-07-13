<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>个人资料</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<!--App自定义的css-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/app.css" />
	<!--<link href="../../css/mui.picker.css" rel="stylesheet" />
	<link href="../../css/mui.dtpicker.css" rel="stylesheet" />-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/mui.picker.min.css" />
	<link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
	<script type="text/javascript">
      function update_sex(obj)
       {
          $.ajax({
          	type:"POST",
          	url :"{:U('Member/update_sex')}",
          	data:"type="+obj,
          });
       }
       function update_birthday(obj)
       {
       	  $.ajax({
          	type:"POST",
          	url :"{:U('Member/update_birthday')}",
          	data:"val="+obj,
          });
       }
       function upload_bill()
       {
       	$('#up_tu').click();
       	window.location="{:U('Member/edit_info')}";
       }
	</script>
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="{:U('Member/index')}"></a>
		<h1 class="mui-title">个人资料</h1>
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
	
	<!--个人资料-->
	<div class="user_center">
		<div class="personal_data">
			<ul>
				<a href="javascript:"  ><li class="first">
					<h5>头像</h5>
					<span>
					<if condition="$userinfo['face'] eq ''">
					   <img src="__PUBLIC__/Home/Images/head.jpg" alt="头像" onclick="$('#upImg').click();"/>
				    <else />
					   <img id="user_pic" src="__ROOT__/{$userinfo['face']}" onclick="$('#upImg').click();"/>
				    </if>
				    
					<form method="post" action="{:U('Member/upload_head_face')}" enctype="multipart/form-data"  target="id_iframe" style="display:none;">
						<input type="file" accept="image/*" name="file1" multiple="multiple" onchange="upload_bill()" id="upImg" style="display:block;" />
						<input type="submit" name="head_pic" id="up_tu">
					</form>
					
					<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>
					
					<em class="mui-icon mui-icon-arrowright"></em>
					
					</span>
				</li></a>
				<a href="{:U('Member/update_nickname')}"><li>
					<h5>昵称</h5>
					<span>{$userinfo.nickname}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="javascript:"><li>
					<h5>账号</h5>
					<span>{$userinfo.username}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="{:U('Member/update_qq')}"><li>
					<h5>QQ</h5>
					<span>{$userinfo.qq}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="{:U('Member/update_email')}"><li>
					<h5>邮箱</h5>
					<span>{$userinfo.email}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="{:U('Member/update_name')}"><li>
					<h5>姓名</h5>
					<span>{$userinfo.truename}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="javascript:;" id="sex_box_open"><li>
					<h5>性别</h5>
					<span><i id="sex"><if condition="$userinfo.sex eq 1">男<else />女</if></i><em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a id='demo2' data-options='{"type":"date","beginYear":1000,"endYear":5000}' class="btn"><li>
					<h5>出生日期</h5>
					<input type="hidden" name="result_val" id="result_val" value="" />
					<span><i id="result">{$userinfo.birthday}</i><em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<!-- <a href="{:U('Member/update_company')}"><li>
					<h5>单位名称</h5>
					<span>{$userinfo.company}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a>
				<a href="{:U('Member/update_addr')}"><li>
					<h5>单位地址</h5>
					<span>{$userinfo.company_addr}<em class="mui-icon mui-icon-arrowright"></em></span>
				</li></a> -->
			</ul>
			
			<div id="sex_box">
				<div class="sex_body">
					<ul>
						<li onclick="update_sex(1)">男</li>
						<li onclick="update_sex(2)">女</li>
					</ul>
					<div id="sex_box_close">取消</div>
				</div>
			</div>
		</div>
	</div>
	<!--个人资料-->
	
	<!--底部导航-->
	<include file="Public:footer" />
	
</body>
<script src="__JS__/mui.picker.min.js"></script>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--编辑资料js-->
<script src="__JS__/personal_data.js" type="text/javascript" charset="utf-8"></script>
<script>
	(function($) {
		$.init();
		var result = $('#result')[0];
		var result_val =$('#result_val')[0];
		var btns = $('.btn');
		btns.each(function(i, btn) {
			btn.addEventListener('tap', function() {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				/*
				 * 首次显示时实例化组件
				 * 示例为了简洁，将 options 放在了按钮的 dom 上
				 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
				 */
				var picker = new $.DtPicker(options);
				picker.show(function(rs) {
					/*
					 * rs.value 拼合后的 value
					 * rs.text 拼合后的 text
					 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
					 * rs.m 月，用法同年
					 * rs.d 日，用法同年
					 * rs.h 时，用法同年
					 * rs.i 分（minutes 的第二个字母），用法同年
					 */
					//result.innerText = '选择结果: ' + rs.text;
					result.innerText = rs.y.text+'年'+rs.m.text+'月'+rs.d.text+'日';
					result_val.value = rs.text;
					var string=rs.y.text+'年'+rs.m.text+'月'+rs.d.text+'日';
					$.ajax({
						type:"POST",
						url :"{:U('Member/update_birthday')}",
						data:"obj="+string,
					});
					/* 
					 * 返回 false 可以阻止选择框的关闭
					 * return false;
					 */
					/*
					 * 释放组件资源，释放后将将不能再操作组件
					 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
					 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
					 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
					 */
					picker.dispose();
				});
			}, false);
		});
	})(mui);
</script>
</html>