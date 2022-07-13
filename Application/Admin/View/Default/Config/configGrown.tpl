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
    	<div class="panel-header">会员升级配置</div>
    	<div class="panel-body">
	    	<div class="row cl">
					<label class="form-label col-1">
						<span class="c-red"></span>{$leveltitle[0]['title']}：
					</label>
	            	<div class="formControls col-5">
						<input type="text" readonly="readonly" name="" value="注册" class="input-text config_grown_input" />
					</div>
			</div>		
    		<volist name="leveltitle" id="vo">
    		<if condition="$key gt 0">
				<div class="row cl">
					<label class="form-label col-1">
						<span class="c-red"></span>{$vo['title']}：
					</label>
	            	<div class="formControls col-5">
						<input type="text" name="grown[]" value="{$vo['grown']}" class="input-text config_grown_input" />
						<span style="color:red;">成长值</span>
					</div>
				</div>
			</if>
			</volist>
		</div>
	</div>
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>