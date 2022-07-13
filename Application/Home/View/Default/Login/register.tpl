<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>注册</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <script type="text/javascript" src="__JS__/register.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<script type="text/javascript">
	//判断用户名是否重复
	function check_user(obj)
	{
		var us=$(obj).val();
		$.ajax({
			type:"POST",
			url :"{:U('Login/check_users')}",
			data:"username="+us,
			success:function(date){if(date==1){alert('用户名已存在!');$(obj).val('')}},
		});
	}
      /**********手机动态验证码开始*************/
	 function get_tel_code(obj)
	 {
	   if($('#code_tel').val()=='')
	   {
	    alert('请输入手机号!')
		$('#code_tel').focus();
		return false;
	   }
	   else{
	   	  var us=$('#code_tel').val();
		  $.ajax({
			type:"POST",
			url :"{:U('Login/check_users')}",
			data:"username="+us,
			success:function(date){if(date==1){location.reload();$(obj).val('')}else{
				 time(obj);
			      var Num=""; 
				  //随机生成6位动态效验码
				  for(var i=0;i<6;i++) 
				  { 
				  Num+=Math.floor(Math.random()*10); 
				  } 
			      $('#msg_code').val(Num);
			      var phone=$('#code_tel').val();
				  //ajax调用短信接口 
				  /* 这是原短信接口
				  $.ajax({
					  type:"GET",
					  url :"http://sh2.ipyy.com/sms.aspx",
					  data:"action=send&userid=&account=meishu&password=meishu123&mobile="+phone+"&content=【吐思智慧】您好,您此次注册验证码为:"+Num+"&sendTime=&extno=",
				   });
				   */

				   //这是阿里云短信接口
				   $.ajax({
					  type:"POST",
					  url :"{:U('Login/sendsms')}",
					  data:'phone='+phone+'&code='+Num,
				   });
			}},
		  });
	   }
	 }
	//获取验证码倒计时60秒
	var wait=60;
    function time(o) {
		if (wait == 0) {			
			$(o).val("获取验证码");
			wait = 60;
		} else {
			$(o).val("重新发送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			},
			1000)
		}
	}
 /************手机动态验证码结束**************/
	</script>
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">注册</h1>
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
					<li class="mui-table-view-cell">
						<a href="关于我们.html">关于我们</a>
					</li>
					<li class="mui-table-view-cell"><a href="服务协议.html">服务协议</a>
					</li>
					<li class="mui-table-view-cell"><a href="服务流程.html">服务流程</a>
					</li>
					<li class="mui-table-view-cell"><a href="会员须知.html">会员须知</a>
					</li>
					<li class="mui-table-view-cell"><a href="隐私说明.html">隐私说明</a>
					</li>
					<li class="mui-table-view-cell"><a href="使用帮助.html">使用帮助</a>
					</li>
					<li class="mui-table-view-cell"><a href="联系我们.html">联系我们</a>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	<!--注册-->
	<form class="user-register" action="" method="post">
		<div class="register_login">
			<ul>
				<li>
					<span class="mui-icon iconfont icon-gerenzhongxin"></span>
					<input type="tel" name="username" id="code_tel" maxlength="11" onblur="check_user(this)" onkeyup="check_user(this)" value="" placeholder="请输入注册手机号" />
					<input type="button" name="" id="get_code" value="获取验证码" onclick="get_tel_code(this)"/>
				</li>
				<li>
					<span class="mui-icon iconfont icon-jubao"></span>
					<input type="number" name="smscode" id="code" value="" placeholder="请输入手机验证码" />
					<input type="hidden" value="" id="msg_code">
				</li>
				<li>
					<span class="mui-icon iconfont icon-xiugaimima"></span>
					<input type="password" name="password" id="password_set" value="" placeholder="请设置密码(至少6位)" />
					<i class="mui-icon iconfont icon-yanjing"></i>
				</li>
				<li>
					<span class="mui-icon iconfont icon-xiugaimima"></span>
					<input type="password" name="agin_pass" id="password_repetition" value="" placeholder="请确认密码" />
					<i class="mui-icon iconfont icon-yanjing"></i>
				</li>
			</ul>
			<div class="register_state">
				<span class="checkbox_state">
				<i class="mui-icon mui-icon-checkmarkempty"></i>
				<i class="checkbox_case"></i>
				<input type="checkbox" name="" id="checkbox" value="" />
				</span>
				<span>我已阅读并同意<a href="{:U('Article/agreement')}">《吐思智慧会员注册协议》</a></span>
			</div>
			<div class="register_login_submit">
				<input type="submit" id="register_submit" name="" value="注册" />
			</div>
			<div class="register_login_condition">
				已有账号，<a href="{:U('Login/login')}">去登录</a>
			</div>
		</div>
	</form>
	<!--注册-->

</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--登录，注册，忘记密码的js验证-->
<script src="__JS__/Login_register_password.js" type="text/javascript" charset="utf-8"></script>
</html>