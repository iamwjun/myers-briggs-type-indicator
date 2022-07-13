<!-- kindeditor编辑器开始 -->
<link rel="stylesheet" href="__PLUGIN__/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="__PLUGIN__/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="__PLUGIN__/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="__PLUGIN__/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="__PLUGIN__/kindeditor/plugins/code/prettify.js"></script>
<script>
    KindEditor.ready(function(K) {
		K.create('#kindeditor', {
            pasteType : 2,
			allowFileManager : true
		});
	});
</script>
<!-- kindeditor编辑器结束 -->

<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configInfo">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />

    <div class="panel panel-default mt-10">
    	<div class="panel-header">基本配置信息</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>公司名称：
				</label>
				<div class="formControls col-9">
					<input type="text" name="company" value="{$dataInfo['company']}" datatype="*" nullmsg="公司名称不能为空" placeholder="公司名称" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>网站标题：
				</label>
				<div class="formControls col-9">
					<input type="text" name="web_title" value="{$dataInfo['web_title']}" datatype="*" nullmsg="网站标题不能为空" placeholder="网站标题" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>网站关键字：
				</label>
				<div class="formControls col-9">
					<input type="text" name="web_keywords" value="{$dataInfo['web_keywords']}" datatype="*" nullmsg="网站关键字不能为空" placeholder="网站关键字" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red">*</span>网站描述：
				</label>
				<div class="formControls col-9">
					<input type="text" name="web_description" value="{$dataInfo['web_description']}" datatype="*" nullmsg="网站描述不能为空" placeholder="网站描述" class="input-text radius" />
				</div>
				<div class="col-2"> </div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-1">
					联系方式：
				</label>
				<div class="formControls col-9">
					<textarea name="copyright" id="kindeditor" style="height:200px;width:100%;">{$dataInfo['copyright']}</textarea>
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