<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
		});
		function check_baojia()
		{
		   
           var oid=$('#oid').val();
           var path="__URL__";
           $.ajax({
           	 type:"POST",
           	 url :path+"/check_baojia",
           	 data:"id="+oid,
           	 success:function(date){alert(date);window.parent.location.reload();var index = parent.layer.getFrameIndex(window.name);parent.layer.close(index);},
           });
		}
		//后台修改订单报价
		function update_baojia(obj,selfs)
		{
		  var path="__URL__";
		  var info=$(selfs).val();
          $.ajax({
          	 type:"POST",
          	 url :path+"/update_baojia",
          	 data:"id="+obj+"&&info="+info,
          });
		}
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/price_edit/tag/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" id="oid" name="id" value="{$dataInfo['id']}" />
			<label>费用报价列表:</label><br>
			<volist name="infomation" id="vo">
              <input style="width:260px;height:26px;border:0;border-bottom:1px dashed gray; padding:5px 0px 5px 3px; type="text" value="{$vo.info}" onfocus="$(this).css('background','#f1f1f1')" onblur="$(this).css('background','#FFF');update_baojia({$vo['id']},this)"><br>
			</volist>
			<input type="button" value="确认修改" style="padding: 5px 12px; background: #09F; color: #FFF;border:0;border-radius:5px;margin:10px 0px 0px 2px;cursor: pointer;" onclick="alert('报价信息修改成功!')">
			<hr style="margin-top: 20px">
			<label>设备实际故障描述:</label><br>
			<label><if condition="$true_desc neq ''">{$true_desc}<else />工程师未填写...</if></label>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="button" onclick="check_baojia()" value="&nbsp;&nbsp;通过审核&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>