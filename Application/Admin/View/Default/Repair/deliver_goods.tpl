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
		<form action="__URL__/deliver_goods/tag/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$theId}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>商品名称：
				</label>
				<div class="formControls col-5">
					<volist name="infoList" id="volist">
						{$volist['title']}<br />
					</volist>
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>快递名称：
				</label>
				<div class="formControls col-5">
					<input type="text" name="send_company" value="" datatype="*2-16" nullmsg="快递名称不能为空" placeholder="快递名称" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>快递单号：
				</label>
				<div class="formControls col-5">
					<input type="text" name="send_id" value="" datatype="*" nullmsg="快递单号不能为空" placeholder="快递单号" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>发货时间：
				</label>
				<div class="formControls col-5">
					<input type="text" name="send_time" value="" id="datemin" datatype="*" nullmsg="发货时间不能为空" placeholder="发货时间" class="input-text radius" />
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