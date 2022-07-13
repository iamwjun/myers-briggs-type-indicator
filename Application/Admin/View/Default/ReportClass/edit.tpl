<extend name="Base/common" />

<block name="link">
<link href="__PLUGIN_H-ui__/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</block>

<block name="jscript">
	<link rel="stylesheet" href="__PLUGIN__/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="__PLUGIN__/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="__PLUGIN__/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="__PLUGIN__/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="__PLUGIN__/kindeditor/plugins/code/prettify.js"></script>
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
			// 表单验证
			plugins.Validform();
		});
		// 单图上传
			plugins.singleImageUpload();
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					上级分类：
				</label>
				<div class="formControls col-5" style="position:relative;top:3px;">
					{$paramter['level']}
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>分类名称：
				</label>
				<div class="formControls col-5">
					<input type="text" name="title" value="{$dataInfo['title']}" datatype="*2-16" nullmsg="分类名称不能为空" placeholder="分类名称" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			
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
				<label class="form-label col-3">
					备注：
				</label>
				<div class="formControls col-5">
					<textarea name="intro" dragonfly="true" onKeyUp="textarealength(this,100)" placeholder="说点什么...100个字符以内" class="textarea radius">{$dataInfo['intro']}</textarea>
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