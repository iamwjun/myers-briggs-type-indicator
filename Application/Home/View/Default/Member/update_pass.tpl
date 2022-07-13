<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>修改密码</title>
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
	<script type="text/javascript">
      function check_pass(obj)
      {
      	$.ajax({
      		type:"POST",
      		url :"{:U('Member/check_pass')}",
      		data:"old_pass="+obj,
      		success:function(date){if(date!='正确'){alert(date);document.getElementById('password_old').value='';}},
      	});
      }
      function check(obj)
      {
      	if($('#password_old').val()=='')
      	{
      		alert('原始密码不能为空!');
      		return false;
      	}
      	if($('#password_new').val()=='')
      	{
      		alert('新密码不能为空!');
      		$('#password_new').focus();
      		return false;
      	}
      	if($('#password_new').val()!=$('#password_new_algin').val())
      	{
      		alert('两次输入密码不一致!');
      		return false;
      	}
      }
	</script>>
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">修改密码</h1>
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
	
	<!--修改密码-->
	<div class="user_center">
	 <form action="" method="post" onsubmit="return check(this);">
		<div class="change_password">
			<ul>
				<li>
					<div class="mui-input-row">
						<label>账号</label>
						<input type="text" disabled="disabled" value="{$userinfo.username}">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>密码</label>
						<input type="password" id="password_old" onblur="check_pass($(this).val())" value="" placeholder="填写当前密码">
					</div>
				</li>
			</ul>
		</div>
		<div class="change_password_title">请重新设置密码</div>
		<div class="change_password">
			<ul>
				<li>
					<div class="mui-input-row">
						<label>设置新密码</label>
						<input type="password" id="password_new" name="password_new" placeholder="请输入您的新密码">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>确认新密码</label>
						<input type="password" id="password_new_algin" placeholder="再次填写新密码">
					</div>
				</li>
			</ul>
		</div>
		<div class="apply_repair_submit mui-clearfix">
			<input type="submit" id="password_submit" name="ok" value="确定" />
		</div>
	 </form>
	</div>
	<!--修改密码-->

	
	
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--编辑资料js-->
<script src="__JS__/personal_data.js" type="text/javascript" charset="utf-8"></script>

</html>