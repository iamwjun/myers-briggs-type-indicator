<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/pass_edit/tag/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>初始密码：
				</label>
				<div class="formControls col-5">
					<input type="password" name="password" value="" datatype="*6-20" nullmsg="密码不能为空" placeholder="初始密码" autocomplete="off" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
				<div class="formControls col-5">
					<input type="password" name="repassword" value="" recheck="password" datatype="*" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！" placeholder="确认密码" autocomplete="off" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>