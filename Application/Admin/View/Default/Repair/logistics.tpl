<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
			
			// 日期插件
			$('#datemin').focus(function(){
		        WdatePicker({});
		    });
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/logistics/tag/create" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="order_info_id" value="{$orderInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					快递单号：
				</label>
				<div class="formControls col-5">{$orderInfo['send_id']}</div>
				<div class="col-4"> </div>
			</div>
			<if condition="$orderInfo['is_send'] eq 1">
				<div class="row cl">
					<label class="form-label col-3">
						<span class="c-red">*</span>时间：
					</label>
					<div class="formControls col-5">
						<input type="text" name="create_time" value="" id="datemin" datatype="*" nullmsg="时间不能为空" placeholder="时间" class="input-text radius" />
					</div>
					<div class="col-4"> </div>
				</div>
				<div class="row cl">
					<label class="form-label col-3">
						<span class="c-red">*</span>内容：
					</label>
					<div class="formControls col-5">
						<input type="text" name="intro" value="" datatype="*" nullmsg="内容不能为空" placeholder="内容" class="input-text radius" />
					</div>
					<div class="col-4"> </div>
				</div>
			</if>
			<div class="row cl">
				<label class="form-label col-3">
					物流记录：
				</label>
				<div class="formControls col-9">
					<textarea readonly="readonly" class="textarea radius"><volist name="logisticsList" id="volist">{$volist['create_time']|date='Y-m-d H:i:s',###}　　{$volist['intro']}</volist></textarea>
				</div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>