<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
		});
		function fenpei()
		{
			var order_id=$('#oid').val();//订单id
			var work_id =$('#worker').val();//工程师id
			var path="__URL__";
            $.ajax({
           	 type:"POST",
           	 url :path+"/fenpei_order",
           	 data:"oid="+order_id+"&&do_id="+work_id,
           	 success:function(date){alert(date);window.parent.location.reload();var index = parent.layer.getFrameIndex(window.name);parent.layer.close(index);},
            });
		}
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/price_edit/tag/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" id="oid" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>分配给：</label>
				<div class="formControls col-6">
					<select name="worker" id="worker" style="height: 24px;">
                     <volist name="engineer" id="vo">
                     <option value="{$vo.uid}">【<if condition="$vo.category neq ''">{$vo.category}<else />计量检测师</if>】{$vo.truename}</option>
                     </volist>
					</select>
				</div>
				<div class="col-3"> </div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="button" onclick="fenpei()" style="margin: 30px 0px 0px 140px;" value="&nbsp;&nbsp;确认分配&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>