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
    	<div class="panel-header">分销奖励配置</div>
    	<div class="panel-body">
	    	<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>推荐加分享配比(X)：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="profit" value="{$dataInfo['profit']}" class="input-text config_upgrade_input" />
					</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>推荐配比(X)：
				</label>
                	<div class="formControls col-5">
					<input type="text" name="team_build" value="{$dataInfo['team_build']}" class="input-text config_upgrade_input" />
					</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>分享配比(X)：
				</label>
	        	<div class="formControls col-5">
				<input type="text" name="team_manage" value="{$dataInfo['team_manage']}" class="input-text config_upgrade_input" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>消费奖励(X)：
				</label>
	        	<div class="formControls col-5">
				<input type="text" name="consume" value="{$dataInfo['consume']}" class="input-text config_upgrade_input" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>商品推荐(X)：
				</label>
	        	<div class="formControls col-5">
				<input type="text" name="recommend" value="{$dataInfo['recommend']}" class="input-text config_upgrade_input" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>推荐奖励(X)：
				</label>
	        	<div class="formControls col-5">
				<input type="text" name="begin" value="{$dataInfo['begin']}" class="input-text config_upgrade_input" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>分享奖励(X)：
				</label>
	        	<div class="formControls col-5">
				<input type="text" name="high" value="{$dataInfo['high']}" class="input-text config_upgrade_input" />
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