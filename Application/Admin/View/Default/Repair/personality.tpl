<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript" src="__JS__/order.js"></script>
</block>

<block name="main">
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;订单管理
		<span class="c-gray en">&gt;</span>&nbsp;商品订单
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="pd-20">
	    <div class="text-c">
	    	<form action="" method="post">
	    		<!-- 付款方式 -->
		    	<span class="select-box radius width-130">
			    	<select name="pay_way" class="select">
		                <option value="0">请选择付款方式</option>
						<if condition="$paramter['pay_way'] eq '网上支付'">
		                    <option value="网上支付" selected="selected">网上支付</option>
							<option value="现金/刷卡">现金/刷卡</option>
						<elseif condition="$paramter['pay_way'] eq '现金/刷卡'" />
		                    <option value="网上支付">网上支付</option>
							<option value="现金/刷卡" selected="selected">现金/刷卡</option>
						<else />
		                    <option value="网上支付">网上支付</option>
							<option value="现金/刷卡">现金/刷卡</option>
						</if>
		            </select>
				</span>
	    		<!-- 订单状态 -->
		    	<span class="select-box radius width-130">
			    	<select name="is_pay" class="select">
		                <option value="0">请选择订单状态</option>
						<if condition="$paramter['is_pay'] eq 1">
		                    <option value="1" selected="selected">已付款</option>
							<option value="0">未付款</option>
						<else if condition="$paramter['is_pay'] eq 0" />
		                    <option value="1">已付款</option>
							<option value="0" selected="selected">未付款</option>
						<else />
		                    <option value="1">已付款</option>
							<option value="0">未付款</option>
						</if>
		            </select>
				</span>
	    		<!-- 下单会员 -->
		    	<span class="select-box radius width-130">
			    	<select name="is_pay" class="select">
		                <option value="0">请选择下单会员</option>
						<volist name="memberList" id="volist">
						<if condition="$volist['id'] == $paramter['uid']">
		                    <option value="{$volist['id']}" selected="selected">{$volist['username']}</option>
						<else />
							<option value="{$volist['id']}">{$volist['username']}</option>
						</if>
		                </volist>
		            </select>
				</span>
		    	<!-- 商品名称 -->
				<input type="text" name="order_id" value="{$paramter['order_id']}" placeholder="输入订单编号" class="input-text radius width-200" />
		    	<!-- 开始日期 -->
				<input type="text" name="start_time" value="{$paramter['start_time']}" id="datemin" placeholder="开始日期" class="input-text radius Wdate width-200">
				-
		    	<!-- 结束日期 -->
				<input type="text" name="end_time" value="{$paramter['end_time']}" id="datemax" placeholder="结束日期" class="input-text radius Wdate width-200">
				<!-- 搜索按钮 -->
		        <button type="submit" class="btn btn-success radius" id="" name="">
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;搜商品
		        </button>
	    	</form>
	    </div>
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
	        	<a href="javascript:void(0);" class="btn btn-danger radius BatchRemove">
	        		<i class="Hui-iconfont">&#xe6e2;</i>&nbsp;批量删除
				</a>
			</span>
	        <span class="r">共有数据：<strong>{$dataList|count}</strong> 条</span>
	    </div>
	    <div class="mt-20">
	        <table class="table table-border table-bordered table-hover table-bg table-sort">
	            <thead>
	                <tr class="text-c">
	                    <th width="3%">
	                        <input type="checkbox" name="" value="">
	                    </th>
						<th width="5%">编号</th>
						<th width="10%">下单时间</th>
						<th width="10%">订单号</th>
						<th width="22%">商品信息</th>
						<th width="10%">小计</th>
						<th width="10%">会员ID</th>
						<th width="10%">支付方式</th>
						<th width="10%">订单状态</th>
						<th width="10%">操作</th>
	                </tr>
	            </thead>
	            <tbody>
			        <volist name="dataList" id="volist">
		                <tr class="text-c">
		                    <td>
		                        <input type="checkbox" value="{$volist['id']}" name="dataId">
		                    </td>
		                    <td>{$key+1}</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
			                <td>{$volist['order_id']}</td>
			                <td>自定义商品</td>
			                <td>
								<div class="commodity-list-info">
									<if condition="$volist['custom_price'] gt 0">
			                			<strong>￥{$volist['custom_price']}</strong>
									<else />
										<strong>￥{$volist['price']}</strong>
									</if>
								</div>
								<div class="commodity-list-info">
			                		<a href="javascript:void(0);" class="color_blue" onclick="layer_show('修改价格','__URL__/price_edit/id/{$volist['id']}','400','210')">修改价格</a>
								</div>
							</td>
			                <td>{$volist['member_username']}</td>
			                <td>{$volist['pay_way']}</td>
			                <td>
			                	<if condition="$volist['is_pay'] eq 0">
									<div class="commodity-list-info">
				                		<strong>待付款</strong>
									</div>
									<if condition="$volist['pay_way'] eq '现金/刷卡'">
										<div class="commodity-list-info">
					                		<a href="javascript:void(0);" class="color_blue ConfirmPay" data-id="{$volist['id']}">确认付款</a>
										</div>
									</if>
								<else />
									<div class="commodity-list-info">
				                		<strong>待发货</strong>
									</div>
									<if condition="$volist['is_send'] eq 1">
										<div class="commodity-list-info">
					                		<a href="javascript:void(0);" class="color_blue IndexDeliverGoods" data-id="{$volist['id']}">发货</a>
										</div>
									</if>
								</if>
							</td>
		                    <td class="td-manage">
								<a href="javascript:void(0);" class="ml-5 TabSlide" _href="{:U('Order/show',array('id'=>$volist['id']))}" title="查看详情" data-title="查看详情">
		                        	<i class="Hui-iconfont">&#xe695;</i>
								</a>
		                        <a href="javascript:void(0);" data-id="{$volist['id']}" title="删除" class="ml-5 singleRemove">
		                        	<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
		                    </td>
		                </tr>
			        </volist>
	            </tbody>
	        </table>
	    </div>
	</div>
</block>