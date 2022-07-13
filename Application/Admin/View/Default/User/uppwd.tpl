<extend name="Base/common" />

{// css区域}
<block name="link"></block>

{// js区域}
<block name="jscript">
	<script type="text/javascript">$(function(){plugins.Validform();});</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/uppwd" method="post" class="form form-horizontal" id="formValidform">
		    <div class="row cl">
		        <label class="form-label col-3">
		            <span class="c-red">*</span>旧密码：
		        </label>
		        <div class="formControls col-5">
		            <input type="password" value="" placeholder="请填写旧密码" name="oldpwd" datatype="*6-20" nullmsg="请填写旧密码" class="input-text">
		        </div>
		        <div class="col-4"></div>
		    </div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>新密码：
				</label>
				<div class="formControls col-5">
					<input type="password" value="" placeholder="请填写新密码" name="newpwd" datatype="*6-20" nullmsg="请填写新密码" autocomplete="off" class="input-text">
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>确认新密码：
				</label>
				<div class="formControls col-5">
					<input type="password" placeholder="确认新密码" id="confimpwd" name="confimpwd" datatype="*6-20" recheck="newpwd" errormsg="您两次输入的新密码不一致！" nullmsg="请再输入一次新密码！" autocomplete="off" class="input-text">
				</div>
				<div class="col-4"></div>
			</div>
		    <div class="row cl">
		        <div class="col-9 col-offset-3">
		            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		        </div>
		    </div>
		</form>
	</div>
</block>
