<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configSMS">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />

    <div class="panel panel-default mt-10">
    	<div class="panel-header">短信接口</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>接口账号：
				</label>
				<div class="formControls col-9">
					<input type="text" name="sms_account" value="{$dataInfo['sms_account']}" datatype="*" nullmsg="短信接口账号不能为空" placeholder="短信接口账号" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>接口密码：
				</label>
				<div class="formControls col-9">
					<input type="text" name="sms_password" value="{$dataInfo['sms_password']}" datatype="*" nullmsg="短信接口密码不能为空" placeholder="短信接口密码" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
		</div>
    </div>
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>