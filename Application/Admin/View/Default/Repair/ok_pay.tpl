<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
		});
		function ok_pay()
		{
			var order_id=$('#oid').val();//订单id
			var path="__URL__";
            $.ajax({
           	 type:"POST",
           	 url :path+"/payment",
           	 data:"oid="+order_id,
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
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="button" onclick="ok_pay()"  value="&nbsp;&nbsp;已确认收到款项&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>