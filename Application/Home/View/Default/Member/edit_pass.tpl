﻿<extend name="Base/common1" />

{// css样式区 }
<block name="link">
<link rel="stylesheet" type="text/css" href="__STYLE__/usercenter.css" />
</block>

<block name="jscript">

</block>
<block name="main">

<body class="">

	<!-- 头部 -->
	<header class="header-menu dis-box">
    	<a href="javascript:history.go(-1);"><i class="iconfont">&#xe636;</i></a>
        <h3>修改密码</h3>
        <a href="__ROOT__/"><i class="iconfont">&#xe621;</i></a>
    </header>

    <!-- 主题内容 -->
	<div class="main" style="background:#fff;" id="pjax-container">
	
		<form action="{:U('Member/edit_pass')}" method="post" onsubmit="return check()">
			<section class="user-center user-forget-tel user-login">
				
				<!-- 新密码 -->
				<div class="text-all dis-box j-text-all" name="userpassworddiv">
					<div class="input-text input-check  box-flex">
						<input class="j-input-text" name="password" type="password" placeholder="请输入新密码">
						<i class="iconfont is-null j-is-null">&#xe669;</i>
					</div>
					<i class="iconfont is-yanjing j-yanjing disabled">&#xe668;</i>
				</div>
				
				<!-- 确认新密码 -->
				<div class="text-all dis-box j-text-all" name="userpassworddiv">
					<div class="input-text input-check  box-flex">
						<input class="j-input-text" type="password" name="notpassword" placeholder="确认输入新密码">
						<i class="iconfont is-null j-is-null">&#xe669;</i>
					</div>
					<i class="iconfont is-yanjing j-yanjing disabled">&#xe668;</i>
				</div>
				
				<!-- 确认按钮 -->
				<button type="submit" class="btn-submit">确认修改</button>
			</section>
		</form>
	</div>
	
<script>
	function check(){
		var word      =$("input[name=password]");
		var word2     =$("input[name=notpassword]");
		if(word.val() == ''){
			 d_messages('新密码不能为空',2);
			 $("div[name=userpassworddiv]").addClass("active");
			 return false;
		 }
		if(word.val() != word2.val()){
			 d_messages('两次密码不一致',2);
			 $("div[name=userpassword]").addClass("active");
			 return false;
		 }
	   
   }
</script>
</block>
