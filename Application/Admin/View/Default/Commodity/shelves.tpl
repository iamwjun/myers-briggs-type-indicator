<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript" src="__JS__/commodity.js"></script>
	<script type="text/javascript">
	$(function(){
		// 批量下架
		plugins.BatchOnTheShelf({
			'url' : jsObj['TheURL'] + '/commodityShelf.html'
		});
	});
	</script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;问答管理
		<span class="c-gray en">&gt;</span>&nbsp;问答列表
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
				<input type="text" name="xxss" value="{$paramter['title']}" placeholder="输入题目名称" class="input-text radius width-200" />
		    	
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
					<i class="Hui-iconfont">&#xe68f;</i>&nbsp;所有问答
				</a>
				<a href="javascript:void(0);" onclick="layer_full('添加问答','__URL__/add/pid/0','','');" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i>&nbsp;添加问答
				</a>
				<a href="javascript:void(0);" id="BatchSequence" class="btn btn-secondary radius">
					<i class="Hui-iconfont">&#xe675;</i>&nbsp;排序
				</a>
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
						<th width="5%">编号</th>
						<!-- <th width="5%">排序</th> -->
						<!-- <th width="10%">缩略图</th> -->
						<th width="20%">题目名称</th>
						<th width="10%">所属分类</th>
						<th width="15%">创建时间</th>
						<th width="12%">操作</th>
	                </tr>
	            </thead>
	            <tbody>
			        <volist name="dataList" id="volist">
		                <tr class="text-c">
		                    <td>
		                        <input type="checkbox" value="{$volist['id']}" name="dataId">
		                    </td>
		                    <td>{:( $page['pageNum'] - 1 ) * $page['numperpage'] + ( $key + 1 )}</td>
							<!-- <td>
								<input type="text" name="Sequence" value="{$volist['sort']}" class="input-text text-c">
							</td> -->
			               <!--  <td>
								<if condition="$volist['picture'] neq ''">
									<a href="__ROOT__/{$volist['picture']}" rel="image-viewer" title="{$volist['title']}">
										<img src="__ROOT__/{$volist['picture']}" height="100" class="radius" />
									</a>
								<else />
									无
								</if>
							</td> -->
			                <td class="text-l">
			                	<div class="commodity-list-info">
			                		<strong>{$volist['title']}</strong>
								</div>
							</td>
			                <td>{$volist['nav']}-<if condition="$volist['pid_val'] eq '请选择性别'">通用<else />{$volist.pid_val}</if></td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
		                    <td class="td-manage">
		                        <a href="javascript:void(0);" onclick="layer_full('编辑商品','__URL__/edit/id/{$volist['id']}','','');" title="编辑商品" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe6df;</i>
								</a>
								<!-- <a href="javascript:void(0);" class="ml-5 TabSlide" _href="{:U('CommodityFigure/index',array('pid'=>$volist['id']))}" title="附图管理" data-title="附图管理">
		                        	<i class="Hui-iconfont">&#xe613;</i>
								</a> -->
		                        <a href="javascript:void(0);" data-id="{$volist['id']}" title="删除" class="ml-5 singleRemove">
		                        	<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
		                        <!-- <if condition="$volist['remand'] eq 0">
		                        	<a href="javascript:void(0);" data-id="{$volist['id']}" data-status="1" data-field="remand" title="推荐" class="ml-5 updateState">
			                        	<i class="Hui-iconfont">&#xe69e;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" data-id="{$volist['id']}" data-status="0" data-field="remand" title="取消推荐" class="ml-5 updateState">
			                        	<i class="Hui-iconfont">&#xe69d;</i>
									</a>
		                        </if> -->
		                    </td>
		                </tr>
			        </volist>
	            </tbody>
	        </table>
	    </div>
	</div>
</block>
