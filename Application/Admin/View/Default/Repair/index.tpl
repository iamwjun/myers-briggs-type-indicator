<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript" src="__JS__/order.js"></script>
	<script type="text/javascript">
     function del_order(obj)
     {
     	if(confirm('确认要删除该订单吗？'))
     	{
             var path="__URL__";
	     	 $.ajax({
	     	 	type:"POST",
	     	 	url :path+"/del_order",
	     	 	data:"id="+obj,
	     	 	success:function(date){alert(date);window.location.reload();},
	     	 });
     	}
     	else{
     		return false;
     	}
     	
     }
	</script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;购物车列表管理
		<span class="c-gray en">&gt;</span>&nbsp;用户购物车列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
		
		<!-- 条件查询 -->
	    <div class="text-c" style="display:none">
	    	<form action="" method="post">
	    	
	    		<!-- 订单状态 -->
		    	<span class="select-box radius width-130">
			    	<select name="is_pay" class="select">
		                <option value="0">请选择订单状态</option>
						<option value="-1">待分配</option>
						<option value="1">待上门</option>
						<option value="2">待报价</option>
						<option value="3">待确认</option>
						<option value="5">维修中</option>
						<option value="6">待支付</option>
						<option value="8">已完成</option>
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
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;查询
		        </button>
	    	</form>
	    </div>
	    
	    <!-- 操作 -->
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
	           <a href="javascript:void(0);" class="btn btn-danger radius BatchRemove">
	        		<i class="Hui-iconfont">&#xe6e2;</i>&nbsp;批量删除
			   </a>
			 
			</span>
	        <span class="r">共有数据：<strong>{$dataList|count}</strong> 条</span>
	    </div>
	    
	    <!-- 列表 -->
	    <div class="mt-20">
	        <table class="table table-border table-bordered table-hover table-bg table-sort">
	            <thead>
	                <tr class="text-c">
	                    <th width="3%">
	                        <input type="checkbox" name="" value="">
	                    </th>
						<th width="3%">编号</th>
						<th width="10%">加入购物车时间</th>
						<th width="10%">账户昵称</th>
						
						<th width="10%">商品名称</th>
						<th width="10%">商品数量</th>
						
						<th width="12%">操作</th>
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
			                <td>{$volist['nickname']}</td>
			                
			                <td>{$volist.name}</td>

							<td>{$volist['number']}件</td>
			               
		                    <td class="td-manage">
		                    
		                        <a href="javascript:void(0);" onclick="layer_show('编辑购物车','__URL__/ticheng/id/{$volist['id']}','400','460')" title="编辑购物车" class="ml-5">
					            	<i class="Hui-iconfont">&#xe6df;</i>
								</a>
							
							<!-- 	<a href="javascript:void(0);" class="ml-5 TabSlide" _href="{:U('Order/show',array('id'=>$volist['id']))}" title="查看详情" data-title="查看详情">
		                        	<i class="Hui-iconfont">&#xe695;</i>
								</a> -->
		                        <a href="javascript:void(0);"  onclick="del_order({$volist['id']})" title="删除" class="">
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