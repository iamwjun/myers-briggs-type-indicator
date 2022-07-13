<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript">
	$(function(){
		// 日期选择范围
		$( '#datemin' ).focus( function() {
			WdatePicker({});
		} );
		$( '#datemax' ).focus( function() {
			WdatePicker({});
		} );
	});
	</script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;首页幻灯
		<span class="c-gray en">&gt;</span>&nbsp;幻灯列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
		
		<!-- 条件查询 
	    <div class="text-c">
	    	<form action="" method="post">
		    	
				<input type="text" name="title" value="{$paramter['title']}" placeholder="输入幻灯标题" class="input-text radius width-200" />
		    	
				<input type="text" name="start_time" value="{$paramter['start_time']}" id="datemin" placeholder="开始日期" class="input-text radius Wdate width-200">
				-
		    	
				<input type="text" name="end_time" value="{$paramter['end_time']}" id="datemax" placeholder="结束日期" class="input-text radius Wdate width-200">
				
		        <button type="submit" class="btn btn-success radius" id="" name="">
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;查询
		        </button>
	    	</form>
	    </div>-->
	    
	    <!-- 操作 -->
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
				<a href="javascript:void(0);" onclick="layer_show('添加幻灯','__URL__/add','650','450');" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i>&nbsp;添加幻灯
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
						<th width="5%">排序</th>
						<th width="12%">标题</th>
						<th width="20%">图片</th>
						<th width="15%">创建时间</th>
						<th width="10%">状态</th>
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
			                <td>{$volist['title']}</td>
			                <td>
								<if condition="$volist['picture'] neq ''">
									<img src="__ROOT__/{$volist['picture']}" height="100" class="radius" />
								<else />
									无
								</if>
							</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
							<td class="td-status">
				                <if condition="$volist.status eq 0">
				                	<span class="label label-success radius">已启用</span>
				                <else />
				                	<span class="label label-danger radius">已停用</span>
				                </if>
							</td>
		                    <td class="td-manage">
		                    	<if condition="$volist['status'] eq 1">
			                    	<a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="0" data-field="status" title="启用">
			                    		<i class="Hui-iconfont">&#xe6e1;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="1" data-field="status" title="停用">
			                        	<i class="Hui-iconfont">&#xe631;</i>
									</a>
								</if>
		                        <a href="javascript:void(0);" onclick="layer_show('编辑幻灯','__URL__/edit/id/{$volist['id']}','650','450');" title="编辑幻灯" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe6df;</i>
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
