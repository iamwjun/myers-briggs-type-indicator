<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript" src="__JS__/commodity.js"></script>
	<script type="text/javascript">
	$(function(){
		// 批量上架
		plugins.BatchOnTheShelf({
			'url' : jsObj['TheURL'] + '/commodityShelves.html'
		});
	});
	</script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;商品管理
		<span class="c-gray en">&gt;</span>&nbsp;商品列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
		
		<!-- 条件查询 -->
	    <div class="text-c">
	    	<form action="" method="post">
	    		<!-- 分类 -->
	    		<div class="classList" style="display:inline;">
	    			<span class="select-box radius width-130">
				    	<select name="pid" class="select select-class">
			                <option value="">请选择分类</option>
			                <volist name="classList" id="volist">
								<if condition="$volist['id'] == $paramter['pid']">
				                    <option value="{$volist['id']}" selected="selected">{$volist['title']}</option>
								<else />
									<option value="{$volist['id']}">{$volist['title']}</option>
								</if>
			                </volist>
			            </select>
					</span>
				</div>
		    	<!-- 商品名称 -->
				<input type="text" name="tilte" value="{$paramter['title']}" placeholder="输入商品名称" class="input-text radius width-200" />
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
				<a href="" class="btn btn-success radius">
					<i class="Hui-iconfont">&#xe68f;</i>&nbsp;所有商品
				</a>
	        	<a href="javascript:void(0);" class="btn btn-warning radius BatchOnTheShelf">
	        		<i class="Hui-iconfont">&#xe6e2;</i>&nbsp;批量上架
				</a>
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
						<th width="5%">排序</th>
						<th width="20%">封面图</th>
						<th width="40%">产品信息</th>
						<th width="10%">产品所属</th>
						<th width="10%">创建时间</th>
						<th width="7%">操作</th>
	                </tr>
	            </thead>
	            <tbody>
			        <volist name="dataList" id="volist">
		                <tr class="text-c">
		                    <td>
		                        <input type="checkbox" value="{$volist['id']}" name="dataId">
		                    </td>
		                    <td>{:( $page['pageNum'] - 1 ) * $page['numperpage'] + ( $key + 1 )}</td>
							<td>
								<input type="text" name="Sequence" value="{$volist['sort']}" class="input-text text-c">
							</td>
			                <td>
								<if condition="$volist['picture'] neq ''">
									<a href="__ROOT__/{$volist['picture']}" rel="image-viewer" title="{$volist['title']}">
										<img src="__ROOT__/{$volist['picture']}" height="100" class="radius" />
									</a>
								<else />
									无
								</if>
							</td>
			                <td class="text-l">
			                	<div class="commodity-list-info">
			                		<strong>{$volist['title']}</strong>
								</div>
			                	<div class="commodity-list-info">
			                		{$volist['pid']|tmpl_commodityClassLevel}
								</div>
			                	<div class="commodity-list-info">
			                		<span>市场价：{$volist['market_price']}</span>
									<span>会员价：{$volist['member_price']}</span>
									<span>成本价：{$volist['cost_price']}</span>
			                	</div>
							</td>
			                <td>
								<if condition="$volist['uid'] neq 0">
									{$volist['uid']|tmpl_getMemberName}
								<else />
									官方自营
								</if>
							</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
		                    <td class="td-manage">
		                        <a href="javascript:void(0);" onclick="layer_full('编辑商品','__URL__/edit/id/{$volist['id']}','','');" title="编辑商品" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe6df;</i>
								</a>
								<a href="javascript:void(0);" class="ml-5 TabSlide" _href="{:U('CommodityFigure/index',array('pid'=>$volist['id']))}" title="附图管理" data-title="附图管理">
		                        	<i class="Hui-iconfont">&#xe613;</i>
								</a>
		                        <a href="javascript:void(0);" data-id="{$volist['id']}" title="删除" class="ml-5 singleRemove">
		                        	<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
		                        <if condition="$volist['remand'] eq 0">
		                        	<a href="javascript:void(0);" data-id="{$volist['id']}" data-status="1" data-field="remand" title="推荐" class="ml-5 updateState">
			                        	<i class="Hui-iconfont">&#xe69e;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" data-id="{$volist['id']}" data-status="0" data-field="remand" title="取消推荐" class="ml-5 updateState">
			                        	<i class="Hui-iconfont">&#xe69d;</i>
									</a>
		                        </if>
		                    </td>
		                </tr>
			        </volist>
	            </tbody>
	        </table>
	    </div>
	</div>
</block>
