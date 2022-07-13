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
					<span class="c-red"></span>消费奖励：
				</label>
	        	<div class="formControls col-5">
					<input type="text" name="reward_consume" value="{$dataInfo['reward_consume']}" class="input-text config_upgrade_input" />
					<span style="color:red;">%</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>合伙奖励：
				</label>
	        	<div class="formControls col-5">
					<input type="text" name="reward_partner" value="{$dataInfo['reward_partner']}" class="input-text config_upgrade_input" />
					<span style="color:red;">%</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>推荐奖励：
				</label>
	        	<div class="formControls col-11" id="formConfigFenxiaoRecommend">
	        		
	        		<!-- 第一层 -->
	        		<div class="thisLayer">
						<em>第一层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][0]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第二层 -->
	        		<div class="thisLayer">
						<em>第二层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][1]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第三层 -->
	        		<div class="thisLayer">
						<em>第三层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][2]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第四层 -->
	        		<div class="thisLayer">
						<em>第四层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][3]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第五层 -->
	        		<div class="thisLayer">
	        			<em>第五层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][4]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第六层 -->
	        		<div class="thisLayer">
		        		<em>第六层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][5]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第七层 -->
	        		<div class="thisLayer">
		        		<em>第七层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][6]}" class="input-text" />
						<font>%</font>
					</div>
					
	        		<!-- 第八层 -->
	        		<div class="thisLayer">
		        		<em>第八层：</em>
						<input type="text" name="reward_recommend[]" value="{$dataInfo['reward_recommend'][7]}" class="input-text" />
						<font>%</font>
					</div>
					
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-1">
					<span class="c-red"></span>团队奖励：
				</label>
	        	<div class="formControls col-11" id="formConfigFenxiaoTeam">
	        		
	        		<volist name="leveltitle" id="volist">
		        		<div class="thisLayer">
							<em>{$volist['title']}：</em>
							<input type="text" name="reward_team[]" value="{$dataInfo['reward_team'][$key]}" class="input-text" />
							<font>%</font>
						</div>
					</volist>
					
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