<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configWXBind">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />

    <div class="panel panel-default mt-10">
    	<div class="panel-header">公众号绑定</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>登录账号：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_login_username" value="{$dataInfo['wx_login_username']}" datatype="*" nullmsg="登录账号不能为空" placeholder="登录账号" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>登录密码：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_login_pass" value="{$dataInfo['wx_login_pass']}" datatype="*" nullmsg="登录密码不能为空" placeholder="登录密码" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>AppID：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_app_id" value="{$dataInfo['wx_app_id']}" datatype="*" nullmsg="AppID不能为空" placeholder="AppID" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>AppSecret：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_app_secret" value="{$dataInfo['wx_app_secret']}" datatype="*" nullmsg="AppSecret不能为空" placeholder="AppSecret" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>关注链接：
				</label>
				<div class="formControls col-9">
					<input type="text" name="wx_follow" value="{$dataInfo['wx_follow']}" datatype="*" nullmsg="公众号关注链接不能为空" placeholder="公众号关注链接" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>二维码：
				</label>
				<div class="formControls col-9">
					<if condition="$dataInfo['wx_erweima'] neq ''">
						<div class="singleImageShow">
							<img src="__ROOT__/{$dataInfo['wx_erweima']}" width="100" />
						</div>
					</if>
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div id="filePicker">选择图片</div>
						<input type="hidden" name="wx_erweima" value="" id="singleImageUpload" />
						<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
					</div>
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