<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<title>{$keywordInfo.web_title}</title>
<meta name="keywords" content="{$keywordInfo.web_keywords}" />
<meta name="description" content="{$keywordInfo.web_description}" />

<link rel="stylesheet" href="__STYLE__/initital.css"/>
<link rel="stylesheet" href="__STYLE__/home.css"/>
<link rel="stylesheet" type="text/css" href="__STYLE__/bind_phone.css">
<script type="text/javascript" src="__JS__/jquery.min.js"></script>
<script type="text/javascript" src="__JS__/communal.js"></script>
<script type="text/javascript" src="__JS__/bind_phone.js"></script>
<script type="text/javascript">
var jsObj = {
	'root' : '__ROOT__',
	'images' : '__IMAGES__',
	'login_url' : '{:U('Login/login')}',
	'is_login' : '<if condition="session('member_auth')">1<else />0</if>',
};
</script>

</head>

<body>
	
	<!-- 顶部 -->
	<div id="dingdan">
	    <div class="dingdan_tol">
	        <ul>
	            <li style="width:20%;">
					<a class="iconfont dingdan_a" href="__ROOT__">&#xe643;</a>
				</li>
	            <li class="dingdan_size" style="width:60%;">手机验证</li>
	        </ul>
	    </div>
	</div>
	
	<!-- 内容 -->
	<div class="account_main">
		<form action="{:U('WeiXin/bind_phone')}" method="post" id="#mainForm1" class="mainForm mainForm1">
			<input type="hidden" name="action" value="{$data['action']}" />
			<input type="hidden" name="weixin_name" value="{$data['nickname']}" />
			<input type="hidden" name="sex" value="{$data['sex']}" />
			<input type="hidden" name="head" value="{$data['head']}" />
			<input type="hidden" name="open_id" value="{$data['open_id']}" />
			<input type="hidden" name="recommended" value="{$data['recommended']}" />
	        <div class="promptCon">温馨提示：您可用该手机号在APP端口或网页端口登录和找回密码！</div>
	        <div class="normalInput">
	        	<span>+86</span>
	            <input type="text" class="phone" maxlength="11" placeholder="手机号码" name="username" />
	        </div>
	        <span class="error error1"></span>
	        <div class="nextBtn">
				<input type="submit" value="下一步" class="submit" />
	        </div>
	    </form>
	</div>

</body>
</html>