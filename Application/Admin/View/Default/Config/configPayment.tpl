<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configPyament">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />
	
	<!-- 微信支付接口开始 -->
    <div class="panel panel-default mt-10">
    	<div class="panel-header">微信支付</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>商户账号：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_pay_mchid" value="{$dataInfo['wx_pay_mchid']}" datatype="*" nullmsg="商户登录账号不能为空" placeholder="商户登录账号" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>商户密码：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_pay_mchid_pass" value="{$dataInfo['wx_pay_mchid_pass']}" datatype="*" nullmsg="商户登录密码不能为空" placeholder="商户登录密码" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>商户密钥：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_pay_pass" value="{$dataInfo['wx_pay_pass']}" datatype="*" nullmsg="商户支付密钥不能为空" placeholder="商户支付密钥" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
		</div>
    </div>
	<!-- 微信支付接口结束 -->
	
	<!-- 支付宝接口开始 -->
    <!--div class="panel panel-default mt-10">
    	<div class="panel-header">支付宝</div>
    	<div class="panel-body">
    		
    	</div>
	</div-->
	<!-- 支付宝接口结束 -->
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>