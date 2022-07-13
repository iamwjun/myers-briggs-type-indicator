<extend name="Base/common" />

<block name="link"></block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="__JS__/list-page.js"></script>
	<script type="text/javascript">
		$( function() {
			// 是否继承父级
			plugins.updateState();
		} );
	</script>
</block>

<block name="main">
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;系统设置
		<span class="c-gray en">&gt;</span>&nbsp;菜单分组列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="pd-20">
	    <div class="text-c">
	    	<form action="" method="post">
	    		<input type="hidden" name="pid" value="{$paramter['pid']}" />
		    	<!-- 群组标题 -->
				<input type="text" name="title" value="{$paramter['title']}" placeholder="输入分组标题" class="input-text radius width-200" />
				<!-- 搜索按钮 -->
		        <button type="submit" class="btn btn-success radius" id="" name="">
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;搜分组
		        </button>
	    	</form>
	    </div>
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
	        	<if condition="$paramter['pid'] gt 0">
	        		<a href="__URL__/index/pid/{$paramter['parent_id']}" class="btn btn-success radius">
		        		<i class="Hui-iconfont">&#xe66b;</i>&nbsp;返回上层
		        	</a>
	        	</if>
				<a href="javascript:void(0);" onclick="layer_show('添加分组','__URL__/add/pid/{$paramter['pid']}','600','350')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i>&nbsp;添加分组
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
	    <div class="mt-20">
	        <table class="table table-border table-bordered table-hover table-bg table-sort">
	            <thead>
	                <tr class="text-c">
	                    <th width="3%">
	                        <input type="checkbox" name="" value="">
	                    </th>
						<th width="5%">编号</th>
						<th width="5%">排序</th>
						<th width="20%">分组标题</th>
						<th width="20%">分组名称</th>
						<th width="5%">Icon图标</th>
						<th width="10%">上一级</th>
						<th width="10%">创建时间</th>
						<if condition="$paramter['pid'] gt 0">
							<th width="10%">是否继承父级</th>
						</if>
						<th width="5%">状态</th>
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
			                	<a href="__URL__/index/pid/{$volist['id']}" class="link-06c">
			                		{$volist['title']}
								</a>
							</td>
							<td>{$volist['name']}</td>
							<td>
								{$volist['icon']}
								<i class="Hui-iconfont">{$volist['icon']?'&':'无'}{$volist['icon']}</i>
							</td>
			                <td>{$volist['parent_title']?$volist['parent_title']:'已是顶级'}</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
							<if condition="$paramter['pid'] gt 0">
								<td>
									<if condition="$volist['inherit'] eq 1">
										<span class="color_green">是&nbsp;&nbsp;</span>
					                	<a href="javascript:void(0);" class="updateState color_green" data-id="{$volist['id']}" data-status="0" data-field="inherit" title="取消继承">[取消继承]</a>
									<else />
										<span class="color_red">否&nbsp;&nbsp;</span>
										<a href="javascript:void(0);" class="updateState color_red" data-id="{$volist['id']}" data-status="1" data-field="inherit" title="设置继承">[设置继承]</a>
									</if>
								</td>
							</if>
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
		                        <a href="javascript:void(0);" onclick="layer_show('编辑','__URL__/edit/id/{$volist['id']}','550','350')" title="编辑" class="ml-5">
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
