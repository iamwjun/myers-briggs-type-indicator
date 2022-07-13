<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__JS__/order.js"></script>
	<script type="text/javascript">
      //后台管理员将用户订单发布到前端大厅
      function publish(obj)
      {
      	var path="__URL__";
      	$.ajax({
      		type:"POST",
      		url :path+"/publish",
      		data:"oid="+obj,
      		success:function(date){alert('订单已成功发布!');window.location=path+"/index";},
      	});
      }
      //后台管理员将用户订单发布到前端大厅
      function reject(obj)
      {
      	var path="__URL__";
      	var reject_tex=$('#reject_tex').val();
      	$.ajax({
      		type:"POST",
      		url :path+"/reject",
      		data:"oid="+obj+"&&reject_tex="+reject_tex,
      		success:function(date){alert('订单已驳回!');window.location=path+"/index";},
      	});
      }
      //不显示客户单位地址
      function hidd_company(obj)
      {
        var path="__URL__";
        $.ajax({
        	type:"POST",
        	url :path+"/hidd_company",
        	data:"oid="+obj,
        });
      }
      //不显示客户单位名称
      function hidd_address(obj)
      {
        var path="__URL__";
        $.ajax({
        	type:"POST",
        	url :path+"/hidd_address",
        	data:"oid="+obj,
        });
      }
      //不显示客户联系人名
      function hidd_contact(obj)
      {
        var path="__URL__";
        $.ajax({
        	type:"POST",
        	url :path+"/hidd_contact",
        	data:"oid="+obj,
        });
      }
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<a id="RefreshButton" href="javascript:void(0);"></a>
		<if condition="$dataInfo['status'] neq 9">
		<div id="speed">				
			<div class="line"></div>
			<if condition="$dataInfo['status'] eq 7">
				<ul class="step2">
			<elseif condition="$dataInfo['status'] eq 8" />
				<ul class="step3">
			<elseif condition="$dataInfo['status'] lt 7" />
				<ul class="step1">
			</if>
				<li>
					<span></span>
					<div class="step_line"></div>
					<div class="text">
						<p>客户下单</p>
						<p>{$dataInfo['create_time']?$dataInfo['create_time']|date='Y-m-d H:i:s',###:''}</p>
					</div>
				</li>
				<li>
					<span></span>
					<div class="step_line"></div>
					<div class="text">
						<p>付款成功</p>
						<p>{$dataInfo['pay_time']?$dataInfo['pay_time']|date='Y-m-d H:i:s',###:''}</p>
					</div>
				</li>
				<li>
					<span></span>
					<div class="step_line"></div>
					<div class="text">
						<p>已完成</p>
						<p>{$dataInfo['complete_time']?$dataInfo['complete_time']|date='Y-m-d H:i:s',###:''}</p>
					</div>
				</li>
			</ul>
		</div>
		</if>
		<!-- 订单详情 -->
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
		        <tr>
		            <th colspan="4">订单详情</th>
		        </tr>
			</thead>
			<tbody>
				<tr>
					<td width="10%">订单编号</td>
					<td width="40%">{$dataInfo['order_number']}</td>
					<td width="11%">下单人<span style="color: green">【<if condition="$dataInfo.role eq 0">普通用户<elseif condition="$dataInfo.role eq 1" />工程师<elseif condition="$dataInfo.role eq 2" />经销商<elseif condition="$dataInfo.role eq 3" />供应商<else />检测单位</if>】</span></td>
					<td width="40%">{$username}</td>
				</tr>
				<tr>
					<td>服务类型</td>
					<td><if condition="$dataInfo.category eq 'bx'">报修服务<elseif condition="$dataInfo.category eq 'wb'" />维修保养<elseif condition="$dataInfo.category eq 'az'" />安装升级<else />检测校准</if></td>
					<td>设备名称</td>
					<td>{$dataInfo['name']}</td>
				</tr>
				<tr>
					<td>设备型号</td>
					<td>{$dataInfo['model']}</td>
					<td>设备编号</td>
					<td>{$dataInfo['number']}</td>
				</tr>
				<tr>
					<td>下单时间</td>
					<td>{$dataInfo['create_time']|date='Y-m-d H:i:s',###}</td>
					<td>完成时间</td>
					<td><if condition="$dataInfo.end_time eq 0 or $dataInfo.end_time eq ''">订单正在进行中...<else />{$dataInfo['end_time']|date='Y-m-d H:i:s',###}</if></td>
				</tr>
				<tr>
					<td>故障描述</td>
					<td>{$dataInfo['describle']}</td>
					<td>实际故障描述</td>
					<td><if condition="$dataInfo.status gt 2"><if condition="$dataInfo.true_desc neq ''">{$dataInfo['true_desc']}<else />工程师未填写【实际故障与用户描述相符】</if><else />待工程师上门检测...</if></td>
				</tr>
				<tr>
					<td>单位名称</td>
					<td>{$dataInfo['company_name']}</td>
					<td>联系电话</td>
					<td>{$dataInfo['tel']}</td>
				</tr>
				<tr>
					<td>联系人</td>
					<td>{$dataInfo['contact_name']}</td>
					<td>订单状态</td>
					<td>
						<if condition="$dataInfo['status'] gt 6 and $dataInfo['status'] neq 9">
							<span class="color_green">已付款<?php if($dataInfo['status']==7){ ?>/<span style="color:red">未评价</span><?php }?></span>
						<else />
							<span class="color_red">未付款</span>
						</if>
					</td>
				</tr>
				<tr>
                <td>维修地址</td>
				<td colspan="3">{$dataInfo['area']} {$dataInfo['address']}</td>
				</tr>
				
			</tbody>
		</table>
    <if condition="$dataInfo.status eq 0">
		<div class="row cl" style="margin:20px 0px">
		<if condition="$dataInfo.checks eq 0">
			<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;通过审核/发布订单&nbsp;&nbsp;" style="margin-left: 45px" onclick="publish({$dataInfo['id']})">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;未通过/驳回订单&nbsp;&nbsp;" style="margin-left: 45px;background: #f37b1d;border: 0;" onclick="$('#reje').css('display','block')">&nbsp;&nbsp;&nbsp;
			<div id="reje" style="margin:20px 0px 0px 270px; display: none">
              <textarea name="reject_tex" id="reject_tex" style="width:240px;height:90px;border-radius:5px;"></textarea>
              <br>
              <input type="button" name="" value="确定驳回" style="background: #09F; color:#FFF; padding: 5px 12px;border:0;border-radius:5px" onclick="reject({$dataInfo['id']})">
              <input type="button" name="" value="取  消" style="background: #09F; color:#FFF; padding: 5px 12px;border:0;border-radius:5px" onclick="$('#reje').css('display','none')">
			</div>
			<br>
		</if>
		<br>
			<input type="checkbox" name="" <if condition="$dataInfo.show_company eq 1"> checked="checked"</if> onclick="hidd_company({$dataInfo['id']})">不显示单位名称&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="" <if condition="$dataInfo.show_comp_addr eq 1"> checked="checked"</if>  onclick="hidd_address({$dataInfo['id']})">不显示联系人名&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="" <if condition="$dataInfo.show_contact eq 1"> checked="checked"</if>  onclick="hidd_contact({$dataInfo['id']})">不显示联系电话&nbsp;&nbsp;&nbsp;
		</div>
	</if>
	</div>
</block>