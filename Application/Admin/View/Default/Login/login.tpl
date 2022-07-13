<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$config['web_title']}</title>
    <meta name="keywords" content="{$config['web_keywords']}">
    <meta name="description" content="{$config['web_description']}">
    <link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="__PLUGIN__/hplus/css/bootstrap.min.css?v=3.3.5">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/font-awesome.min.css?v=4.4.0">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/animate.min.css">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/style.min.css?v=4.0.0">
    <link href="__PLUGIN__/hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">
	<link rel="stylesheet" href="__STYLE__/custom.css">
	<style type="text/css">
	.form-group {
		text-align:left;
		width:100%;
		float:left;
	}
	.form-group span {
		clear:both;
		position:relative;
		left:7px;
	}
	.verify span {
		top:4px;
	}
	.codeyzm {
		width:150px;
		float:left;
	}
	.imgyzm {
		width:130px;
		cursor:pointer;
		float:right;
		position:relative;
		top:1px;
	}
	</style>
	    <script type="text/javascript">
    	/*
IE浏览器版本检测
*/
var user_agent = navigator.userAgent.toLowerCase();
var b = false;
var c = '';

if (user_agent.indexOf("msie 9.0")>-1&&user_agent.indexOf("trident/6.0")>-1){
    //IE10（兼容模式）
    b = false;
    c = 'IE10（兼容模式）';
}else if (user_agent.indexOf("msie 8.0")>-1&&user_agent.indexOf("trident/6.0")>-1){
    //IE10（兼容模式）
    b = false;
    c = 'IE10（兼容模式）';
}else if (user_agent.indexOf("msie 7.0")>-1&&user_agent.indexOf("trident/6.0")>-1){
    //IE10（兼容模式）
    b = false;
    c = 'IE10（兼容模式）';
}else if(user_agent.indexOf("msie 9.0")>-1) {
    //IE9
    b = false;
    c = 'IE9';
}else if (user_agent.indexOf("msie 7.0")>-1&&user_agent.indexOf("trident/5.0")>-1){
    //IE9（兼容模式）
    b = false;
    c = 'IE9（兼容模式）';
}else if (user_agent.indexOf("msie 8.0")>-1&&user_agent.indexOf("trident/5.0")>-1){
    //IE9（兼容模式）
    b = false;
    c = 'IE9（兼容模式）';
}else if(user_agent.indexOf("msie 8.0")>-1) {
    //IE8
    b = true;
    c = 'IE8';
}else if(user_agent.indexOf("msie 7.0")>-1&&user_agent.indexOf("trident/4.0")>-1){
    //IE8（兼容模式）
    b = true;
    c = 'IE8（兼容模式）';
}else if(user_agent.indexOf("msie 7.0")>-1){
    //IE7
    b = true;
    c = 'IE7';
}else if(user_agent.indexOf("msie 6.0")>-1){
    //IE6
    b = true;
    c = 'IE6';
}          

if(b){
    if(confirm('提示：您当前IE浏览器版本为'+c+'，为获取更好展示效果，建议升级至IE9')){
        window.open('http://rj.baidu.com/soft/detail/23356.html?ald');
    }
}
    </script>
</head>

<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
				<h1 class="logo-name">H+</h1>
            </div>
            <h3>欢迎使用 H+</h3>
            <form class="form-horizontal m-t form-login" id="signupForm" action="{:U('/Admin/login')}">
            	{__TOKEN__}
            	<!-- 用户名 -->
                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder="用户名" autofocus="true">
				</div>
            	<!-- 密码 -->
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="密码">
                </div>
            	<!-- 验证码 -->
                <div class="form-group verify">
                    <input name="verify" type="text" class="form-control codeyzm" placeholder="验证码" maxlength="5">
					<img src="{:U('/Admin/verify')}" class="imgyzm">
                </div>
            	<!-- 提交按钮 -->
				<div class="form-group form-loading-button-box">
                	<button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
				</div>
            	<!-- 忘记密码 -->
                <div class="form-group">
                	<p class="text-muted text-center">
						<a href="{:U('/Admin/backpwd')}">
							<small>忘记密码了？</small>
						</a>
	                </p>
                </div>
            </form>
        </div>
    </div>
	
	<script>
		var imgyzm_url = "{:U('/Admin/verify')}";
		var loginsuccess_url = "{:U('/Admin/index')}";
	</script>
	
	<!-- 通用js -->
	<script src="__PLUGIN__/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="__PLUGIN__/hplus/js/bootstrap.min.js?v=3.3.5"></script>
	
	<!-- 表单验证 -->
	<script src="__PLUGIN__/hplus/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="__PLUGIN__/hplus/js/plugins/validate/messages_zh.min.js"></script>
    <script src="__JS__/jquery-validate-set_default.js"></script>
	
	<!-- 提示框插件 -->
    <script src="__PLUGIN__/hplus/js/plugins/toastr/toastr.min.js"></script>
	
	<!-- 自定义插件 -->
	<script src="__JS__/plugins.js"></script>
	
	<!-- 登录验证 -->
    <script src="__JS__/login.js"></script>
</body>
</html>