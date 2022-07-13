<extend name="Base/common" />

<block name="link">
	<link href="__PLUGIN_H-ui__/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/icheck/jquery.icheck.min.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript">
		$(function(){
			// radio插件
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			
			// 单图上传
			plugins.singleImageUpload();
			
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/create" method="post" class="form form-horizontal" id="formValidform">
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>用户名：
				</label>
				<div class="formControls col-5">
					<input type="text" name="username" value="" datatype="*2-16" nullmsg="用户名不能为空" placeholder="用户名" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>真实姓名：
				</label>
				<div class="formControls col-5">
					<input type="text" name="nickname" value="" datatype="*2-10" nullmsg="真实姓名不能为空" placeholder="真实姓名" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
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
				<label class="form-label col-3">头像：</label>
				<div class="formControls col-5">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div id="filePicker">选择图片</div>
						<input type="hidden" name="face" value="" id="singleImageUpload" />
						<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
					</div>
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>性别：</label>
				<div class="formControls col-5 skin-minimal">
					<div class="radio-box">
						<input type="radio" name="sex" value="0" id="sex-1" datatype="*" nullmsg="请选择性别" />
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" name="sex" value="1" id="sex-2" />
						<label for="sex-2">女</label>
					</div>
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>手机：</label>
				<div class="formControls col-5">
					<input type="text" name="phone" value="" datatype="m" nullmsg="手机不能为空" placeholder="手机号码" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>邮箱：</label>
				<div class="formControls col-5">
					<input type="text" name="email" value="" datatype="e" nullmsg="请输入邮箱" placeholder="邮箱地址" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					地址：
				</label>
				<div class="formControls col-5">
					<input type="text" name="address" value="" placeholder="真实姓名" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>群组：
				</label>
				<div class="formControls col-5">
					<span class="select-box radius width-130">
						<select name="auth" class="select" datatype="*" nullmsg="请选择群组">
			                <option value="">请选择</option>
			                <volist name="roleList" id="volist">
								<option value="{$volist['id']}">{$volist['title']}</option>
			                </volist>
			            </select>
					</span>
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">备注：</label>
				<div class="formControls col-5">
					<textarea name="intro" dragonfly="true" onKeyUp="textarealength(this,100)" placeholder="说点什么...100个字符以内" class="textarea radius"></textarea>
					<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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