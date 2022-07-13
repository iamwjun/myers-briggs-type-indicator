<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>登录</title>
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
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">登录</h1>
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
	<!--登录-->
	<script type="text/javascript">
       function check_user(obj)
       {
       	 var user=$(obj).val();
       	 if(user!='')
       	 {
	       	 $.ajax({
	       	 	type:"POST",
	       	 	url :"{:U('Login/check_user')}",
	       	 	data:"user="+user,
	       	 	success:function(date){if(date==0){alert('用户不存在!');$(obj).val('');}},
	       	 });
       	}
       	stop_user(obj);
       }
       function stop_user(obj)
       {
       	 var user=$(obj).val();
       	 if(user!='')
       	 {
	       	 $.ajax({
	       	 	type:"POST",
	       	 	url :"{:U('Login/stop_user')}",
	       	 	data:"user="+user,
	       	 	success:function(date){if(date==1){alert('该用户已被禁用!');$(obj).val('');}},
	       	 });
       	}
       }
       function loginform()
       {
       	    $len=$('#password_set').val().length;
       	    if(len<6)
       	    {
       	    	alert(34);
       	    	return false;
       	    }
	       	
       }
       function get_pass()
       {
         var name=$('#tel').val();
       	 $.ajax({
       	 	type:"POST",
       	 	url :"{:U('Login/get_pass')}",
       	 	data:"name="+name,
       	 	success:function(date){$('#psd').val(date)},
       	 });
       }
       //下次自动登录
       function remember()
          {
            var ck=$('#ck_rem').val();
            if(ck==0)
            {
                //记住
                $('#ck_rem').val(1);
                var number=$('#tel').val();
                var pass  =$('#password_set').val();
                 $.ajax({
                    type:"GET",
                    url :"{:U('Login/remember_logininfo')}",
                    data:"status=1&username="+number+"&pass="+pass,
                 });
            }
            else{
                //取消记住
                $('#ck_rem').val(0);
                var number=$('#tel').val();
                var pass  =$('#password_set').val();
                 $.ajax({
                    type:"GET",
                    url :"{:U('Login/remember_logininfo')}",
                    data:"status=0&username="+number+"&pass="+pass,
                 });
            }
            
          }
	</script>
	<input type="hidden" id="psd" value="<?php if($password!=''){echo $password;}?>">
	<form class="login-form" action="" method="post" onsubmit="return loginform()">
		<div class="register_login">
			<ul>
				<li>
					<span class="mui-icon iconfont icon-gerenzhongxin"></span>
					<input type="tel" maxlength="11" name="username" id="tel" onblur="check_user(this)" value="<?php if($username!=''){echo $username;}?>" placeholder="请输入账号" />
				</li>
				<li>
					<span class="mui-icon iconfont icon-xiugaimima"></span>
					<input type="password" name="password" id="password_set" value="<?php if($password!=''){echo $password;}?>" onfocus="get_pass()" placeholder="请输入密码" />
					<i class="mui-icon iconfont icon-yanjing"></i>
				</li>
			</ul>
			<div class="register_state login_state">
			<!-- <?php if($username==''){ ?>
               <span class="checkbox_state">
				<i class="mui-icon mui-icon-checkmarkempty"></i>
				<i class="checkbox_case"></i>
                  <input type="checkbox" name="" id="checkbox" value="" onclick="remember()" />
                  <input type="hidden" value="0" id="ck_rem">
				</span>
			<?php }else{ ?>
               <span class="checkbox_state active">
				<i class="mui-icon mui-icon-checkmarkempty"></i>
				<i class="checkbox_case"></i>
                  <input type="checkbox" name="" id="checkbox" checked="checked" value="" onclick="remember()" />
                  <input type="hidden" value="1" id="ck_rem">
				</span>
			<?php }?>
				<span>下次自动登录</span>
				<a href="{:U('Forget/index')}">忘记密码？</a> -->
			</div>
			<div class="register_login_submit">
				<input type="submit" id="login_submit" name="" value="登录" />
			</div>
			<div class="register_login_condition">
				还没有账号？<a href="{:U('Login/register')}">去注册</a>
			</div>
		</div>
	</form>
	<!--登录-->
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--登录，注册，忘记密码的js验证-->
<script src="__JS__/Login_register_password.js" type="text/javascript" charset="utf-8"></script>
</html>