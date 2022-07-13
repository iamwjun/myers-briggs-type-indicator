<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			//根据提成比例自动算出提成金额
			var total_price=parseInt($('#total_price').val());
			var ticheng_bl=parseInt($('#ticheng_bl').val());
			var result=(total_price*ticheng_bl)/100;
			$('#price').val(result);
			// 表单验证
			plugins.Validform();
		});
		//管理员收到更改提成比例时操作数据库
		function change_price(obj){
		   //根据更改的提成比例更改提成金额
		   var gcs_type=$('#gcs_type').html();
           var total_price=parseInt($('#total_price').val());
		   var ticheng_bl=$(obj).val();
		   var result=(total_price*ticheng_bl)/100;
		   $('#price').val(result);
		   //更改提成比例后，数据库保存更改后的提成比例数据
		   var path="__URL__";
		   $.ajax({
		   	 type:"POST",
		   	 url :path+"/update_tcheng_bl",
		   	 data:"gcs_type="+gcs_type+"&&tcbl="+ticheng_bl,
		   });
		}

		function ok_ticheng()
		{
           var order_id=$('#order_id').val();
           var num=$('#number').val();
           var path="__URL__";
           $.ajax({
           	 type:"POST",
           	 url :path+"/ok_ticheng",
           	 data:"order_id="+order_id+"&&num="+num,
           	 success:function(date){alert(date);window.parent.location.reload();var index = parent.layer.getFrameIndex(window.name);parent.layer.close(index);},
           });
		}

		//js处理去除提成费用项
		function out_tc(obj,id)
		{
		  var hh="#ckd_"+id;
		  var cc=$(hh).val();
		  if(cc==0)
		  {
		  	  var pv=$(obj).prev().html();
	          var del=pv.split('￥');
	          var total=parseInt($('#total_price').val());
	          $('#total_price').val(total-del[1]);
	          var total_price=parseInt($('#total_price').val());
			  var ticheng_bl=parseInt($('#ticheng_bl').val());
			  var result=(total_price*ticheng_bl)/100;
			  $('#price').val(result);
			  $(hh).val(1);
		  }
		  else{
		  	  var pv=$(obj).prev().html();
	          var del=pv.split('￥');
	          var total=parseInt($('#total_price').val());
	          $('#total_price').val(parseInt(total+parseInt(del[1])));
	          var total_price=parseInt($('#total_price').val());
			  var ticheng_bl=parseInt($('#ticheng_bl').val());
			  var result=(total_price*ticheng_bl)/100;
			  $('#price').val(result);
			  $(hh).val(0);
		  }
          
		}
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/price_edit/tag/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" id="order_id" name="order_id" value="{$info['id']}" />
			<input type="hidden" id="uid" name="uid" value="{$info['uid']}" />
			<input type="hidden" id="do_id" name="do_id" value="{$info['do_id']}" />
			<label style="font-size: 14px" id="gcs_type">商品名称：{$info.name}</label><br>
			<hr><br>
			<volist name="infomation" id="vo">
			  <div style="border-bottom:1px dashed lightgray; width:100%;height:100%;margin-bottom:5px;padding-bottom: 3px">
				  <input type="hidden" value="0" id="ckd_{$vo.id}">
	              <label>{$vo.info}</label>&nbsp;<input type="checkbox" checked style="float: right;margin-top:5px" onclick="out_tc(this,<?=$vo['id']?>)"><br>
              </div>
			</volist>
			<br>
			<?php
               for($i=0;$i<count($infomation);$i++)
               {
                 $mat=explode('￥',$infomation[$i]['info']);
                 $str+=$mat[1];
               }
            ?>
            <input type="hidden" id="total_price" value="<?=$str?>">
			
			<label class="form-label col-3" style="width:130px"><span class="c-red">*</span>购物车数量：</label>
			<div class="formControls col-6">
				<input type="text" id="number" value="{$info.number}" style="width: 150px" placeholder="购物车数量" class="input-text radius" />&nbsp;件
			</div>
			<div class="col-3"> </div>
			<br><br><br>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="button" onclick="ok_ticheng()" value="&nbsp;&nbsp;确认修改&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>