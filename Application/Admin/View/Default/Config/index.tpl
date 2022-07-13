<extend name="Base/common" />

<block name="link">
	<link type="text/css" rel="stylesheet" href="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.css" />
</block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.Huitab("#tab_demo .tabBar span","#tab_demo .tabCon","current","click","0");
			// 基本配置-表单验证
			plugins.Validform({
				formName : '#formValidform_configInfo'
			});
			// 公众号绑定-表单验证
			plugins.Validform({
				formName : '#formValidform_configWXBind'
			});
			// 支付接口-表单验证
			plugins.Validform({
				formName : '#formValidform_configPayment'
			});
			// 短信接口-表单验证
			plugins.Validform({
				formName : '#formValidform_configSMS'
			});
			// APP管理-表单验证
			plugins.Validform({
				formName : '#formValidform_configAppManage'
			});
			// 操作手册-表单验证
			plugins.Validform({
				formName : '#formValidform_configManual'
			});
			// 公众号绑定-单图上传
			plugins.singleImageUpload();
			// APP管理-二维码上传
			/*
			 plugins.singleImageUpload({
				list : '#fileList1',
				btn : '#btn-star1',
				pickId : '#filePicker1',
				inputBox : '#singleImageUpload1'
			});
			 */
		});
	</script>
</block>

<block name="main">	
	<div class="pd-20">
		<div id="tab_demo" class="HuiTab">
			<div class="tabBar cl">
				<span>管理中心</span>
				<span>基本配置</span>
				<!-- <span>会员升级配置</span>
				<span>成长值配置</span>
				<span>分销奖励配置</span>
				<span>积分奖励配置</span>
				<span>公众号绑定</span>
				<span>支付接口</span>
				<span>短信接口</span>
				<span>APP管理</span>
				<span>操作手册</span> -->
			</div>
			<a class="btn btn-success radius r mr-20" style="position:absolute;top:15px;right:0px;" id="RefreshButton" href="javascript:void(0);" title="刷新">
				<i class="Hui-iconfont">&#xe68f;</i>
			</a>
			
			<!-- 管理中心 -->
			<div class="tabCon">
				<include file="Config/configInfoManage" />
			</div>
			
			<!-- 基本配置 -->
			<div class="tabCon">
				<include file="Config/configInfo" />
			</div>
			
			<!-- 成长值 -->
			<div class="tabCon">
				<include file="Config/configGrown" />
			</div>
			
			<!-- 会员升级 -->
			<div class="tabCon"> 
				<include file="Config/configUpgrade" />
			</div>
			
			<!-- 分销奖励配置 -->
			<div class="tabCon"> 
				<include file="Config/configFenxiao" />
			</div>
			
			<!-- 积分奖励配置 -->
			<div class="tabCon"> 
				<include file="Config/configIntegral" />
			</div>
			
			<!-- 公众号绑定 -->
			<div class="tabCon">
				<include file="Config/configWXBind" />
			</div>
			
			<!-- 支付接口 -->
			<div class="tabCon">
				<include file="Config/configPayment" />
			</div>
			
			<!-- 短信接口 -->
			<div class="tabCon">
				<include file="Config/configSMS" />
			</div>
			
			<!-- APP管理 -->
			<div class="tabCon">
				<include file="Config/configAppManage" />
			</div>
			
			<!-- 操作手册 -->
			<div class="tabCon">
				<include file="Config/configManual" />
			</div>
			
		</div>
	</div>
</block>