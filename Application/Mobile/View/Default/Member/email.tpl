<extend name="Base/common" />

{// css样式区 }
<block name="link">
	<link rel="stylesheet" type="text/css" href="__STYLE__/usercenter.css" />
</block>

<block name="jscript">
</block>

<block name="main">
	<!-- 头部 -->
	<header class="header-menu dis-box">
		<a href="javascript:history.go(-1);"><i class="iconfont">&#xe636;</i></a>
		<h3>{$columnTitle}</h3>
		<a href="__ROOT__/"><i class="iconfont">&#xe621;</i></a>
	</header>

	<!-- 主题内容 -->
	<div class="main" style="background:#fff;" id="pjax-container">

		<form action="{:U('Member/email')}" method="post">
			<section class="user-center user-forget-tel user-login">
				<!-- 输入邮箱 -->
				<div class="text-all dis-box j-text-all">
					<div class="input-text input-check box-flex" name="emaildiv">
						<input class="j-input-text" id="focus" type="text" name="email" placeholder="请输入您的Email">
						<i class="iconfont is-null j-is-null">&#xe669;</i>
					</div>
				</div>

				<!-- 确认按钮 -->
				<button type="submit" class="btn-submit">确认修改</button>
			</section>
		</form>
	</div>

	<script>
		$("#focus").focus();
		$(".btn-submit").click(function(){
			var email = $("#focus");
			var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(email.val() == ""){
				d_messages('请输入用户邮箱',2);
				$("div[name=emaildiv]").addClass("active");
				return false;
			}
			if(!reg.test(email.val())){
				d_messages('请输入有效的邮箱',2);
				$("div[name=emaildiv]").addClass("active");
				return false;
			}


		})
	</script>

</block>