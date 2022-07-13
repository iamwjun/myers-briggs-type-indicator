<extend name="Base/common" />

<block name="link">
	<link href="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript">
		$(function(){
			// 单图上传
			plugins.singleImageUpload();
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>会员账号：
				</label>
				<div class="formControls col-5">
					<input type="text" name="username"  value="{$dataInfo['username']}"  datatype="*2-16" class="input-text" />
				</div>
				<div class="col-4"> </div>
			</div>

			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>登录密码：
				</label>
				<div class="formControls col-5">
					<input type="text" name="password"  value="{$dataInfo['password']}" datatype="*2-16" class="input-text" />
				</div>
				<div class="col-4"> </div>
			</div>

			<div class="row cl">
				<label class="form-label col-3">会员头像：</label>
				<div class="formControls col-9">
					<if condition="$dataInfo['face'] neq ''">
						<div class="singleImageShow">
							<img src="__ROOT__/{$dataInfo['face']}" width="100" height="100" style="border-radius:100px" />
						</div>
					</if>
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div id="filePicker">选择图片</div>
						<input type="hidden" name="face" value="{$dataInfo['face']}" id="singleImageUpload" />
						<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
					</div>
				</div>
				<div class="col-2"> </div>
			</div>
            
            <div class="row cl">
				<label class="form-label col-3">
					性别：
				</label>
				<div class="formControls col-5">
					<select name="sex" style="width:70px; height:30px; text-align:center">
					  <option value="{$dataInfo.sex}"><if condition="$dataInfo.sex eq 1">男<elseif condition="$dataInfo.sex eq 2" />女<else />保密</if></option>
					  <if condition="$dataInfo.sex neq 1">
                       <option value="1">男</option>
                      </if>
                      <if condition="$dataInfo.sex neq 2">
                       <option value="2">女</option>
                      </if>
                      <if condition="$dataInfo.sex neq 0">
                       <option value="0">保密</option>
                      </if>
					</select>
				</div>
				<div class="col-4"> </div>
			</div>

			<div class="row cl">
				<label class="form-label col-3">
					会员昵称：
				</label>
				<div class="formControls col-5">
					<input type="text" name="nickname" value="{$dataInfo['nickname']}"  class="input-text" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					QQ号码：
				</label>
				<div class="formControls col-5">
					<input type="text" name="qq" value="{$dataInfo['qq']}" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					邮箱地址：
				</label>
				<div class="formControls col-5">
					<input type="text" name="email" value="{$dataInfo['email']}" class="input-text radius" />
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