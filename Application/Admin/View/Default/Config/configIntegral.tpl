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
    	<div class="panel-header">积分奖励配置</div>
    	<div class="panel-body">
	    	<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>消费：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="integral_rule[consume]" value="{$dataInfo['integral_rule']['consume']}" class="input-text config_upgrade_input" />
					<span style="color:red;">元获得1积分</span>
					</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>签到：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="integral_rule[past]" value="{$dataInfo['integral_rule']['past']}" class="input-text config_upgrade_input" />
					<span style="color:red;">次获得1积分</span>
					</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>直接粉丝：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="integral_rule[build]" value="{$dataInfo['integral_rule']['build']}" class="input-text config_upgrade_input" />
					<span style="color:red;">人获得1积分</span>
					</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>团队粉丝：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="integral_rule[manage]" value="{$dataInfo['integral_rule']['manage']}" class="input-text config_upgrade_input" />
					<span style="color:red;">人获得1积分</span>
					</div>
			</div>	
		</div>
	</div>
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>