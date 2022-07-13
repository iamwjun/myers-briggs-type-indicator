<extend name="Base/common" />

<block name="link">
	<link type="text/css" rel="stylesheet" href="__PLUGIN_H-ui__/lib/icheck/icheck.css" />
</block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/icheck/jquery.icheck.min.js"></script> 
	<script type="text/javascript">
		$(function(){
			// radio插件
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/addWalletRecharge" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$id}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>充值金额：
				</label>
				<div class="formControls col-5">
					<input type="text" name="price" value="" datatype="price" nullmsg="充值金额不能为空" placeholder="充值金额" class="input-text radius" />
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