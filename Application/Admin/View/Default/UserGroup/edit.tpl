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
		<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>分组标题：
				</label>
				<div class="formControls col-5">
					<input type="text" name="title" value="{$dataInfo['title']}" datatype="*2-16" nullmsg="分组标题不能为空" placeholder="分组标题" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>分组名称：
				</label>
				<div class="formControls col-5">
					<input type="text" name="name" value="{$dataInfo['name']}" datatype="*2-30" nullmsg="分组名称不能为空" placeholder="分组名称" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					Icon图标代码：
				</label>
				<div class="formControls col-5">
					<input type="text" name="icon" value="{$dataInfo['icon']}" placeholder="Icon图标代码" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<if condition="$dataInfo['pid'] gt 0">
				<div class="row cl">
					<label class="form-label col-3">
						是否继承父级：
					</label>
					<div class="formControls col-5 skin-minimal">
						<div class="radio-box">
							<if condition="$dataInfo['inherit'] eq 1">
								<input type="radio" name="inherit" value="1" checked="checked" id="inherit-1" datatype="*" nullmsg="是否继承父级" />
							<else />
								<input type="radio" name="inherit" value="1" id="inherit-1" datatype="*" nullmsg="是否继承父级" />
							</if>
							<label for="inherit-1">是</label>
						</div>
						<div class="radio-box">
							<if condition="$dataInfo['inherit'] eq 0">
								<input type="radio" name="inherit" value="0" checked="checked" id="inherit-2" />
							<else />
								<input type="radio" name="inherit" value="0" id="inherit-2" />
							</if>
							<label for="inherit-2">否</label>
						</div>
					</div>
					<div class="col-4"> </div>
				</div>
			</if>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>排序：
				</label>
				<div class="formControls col-5">
					<input type="text" name="sort" value="{$dataInfo['sort']}" datatype="n" nullmsg="排序值不能为空" placeholder="排序值" class="input-text radius" />
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