<extend name="Base/common" />

<block name="link">
	<link rel="stylesheet" href="__PLUGIN__/jquery-treetable/stylesheets/jquery.treetable.css" />
    <link rel="stylesheet" href="__PLUGIN__/jquery-treetable/stylesheets/jquery.treetable.theme.default.css" />
</block>

<block name="jscript">
	<script type="text/javascript">
		$(function(){
			// 排序
			plugins.BatchSequence();
			// 删除单条数据
			plugins.singleRemove();
			// 更新数据状态
			plugins.updateStatus();
			plugins.updateState();
		});
	</script>
	<script src="__PLUGIN__/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
    <script>
		$("#TreeTableLIST").treetable({ expandable: true });
    </script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;分类管理
		<span class="c-gray en">&gt;</span>&nbsp;问答分类管理
		<span class="c-gray en">&gt;</span>&nbsp;问答分类列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
		
		<!-- 条件查询 -->
	    <div class="text-c">
	    	<form action="" method="post">
		    	<!-- 分类标题 -->
				<input type="text" name="title" value="{$paramter['title']}" placeholder="输入分类标题" class="input-text radius width-200" />
				<!-- 搜索按钮 -->
		        <button type="submit" class="btn btn-success radius" id="" name="">
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;查询
		        </button>
	    	</form>
	    </div>
	    
	    <!-- 操作 -->
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
				<a href="javascript:void(0);" onclick="layer_show('添加分类','__URL__/add/pid/0','','410')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i>&nbsp;添加分类
				</a>
				<a href="javascript:void(0);" id="BatchSequence" class="btn btn-secondary radius">
					<i class="Hui-iconfont">&#xe675;</i>&nbsp;排序
				</a>
			</span>
	        <!--span class="r">共有数据：<strong>{$dataList|count}</strong> 条</span-->
	   </div>
	   
	   <!-- 列表 -->
	    <div class="mt-20">
	        <table id="TreeTableLIST" class="table table-border table-hover table-bordered table-bg table-sort">
	            <thead>
	                <tr>
						<th width="20%">类别名称</th>
						<th width="15%" style="text-align:center">排序</th>
						<th width="15%" style="text-align:center">封面图</th>
						<th width="15%" style="text-align:center">描述</th>
						<th width="10%" style="text-align:center">状态</th>
						<!-- <th width="10%">首页推荐</th> -->
						<th width="15%" style="text-align:center">操作</th>
	                </tr>
	            </thead>
	            <tbody>
			        <volist name="dataList" id="volist">
		                <tr data-tt-id="{$volist['id']}" data-tt-parent-id="{$volist['pid']?$volist['pid']:''}">
			                <td>
			                	<if condition="$volist['children']|count gt 0">
			                		<span class='folder tree_icon_span'>{$volist['title']}</span>
								<else />
									<span class='file tree_icon_span'>{$volist['title']}</span>
								</if>
								<input type="checkbox" name="dataId" value="{$volist['id']}" style="opacity:0;" />
							</td>
							<td style="text-align:center">
								<input type="text" name="Sequence" value="{$volist['sort']}" class="input-text text-c Sequence-style">
							</td>
							 <td style="text-align:center">
								<if condition="$volist['picture'] neq ''">
									<a href="__ROOT__/{$volist['picture']}" target="_blank" rel="image-viewer" title="{$volist['title']}">
										<img src="__ROOT__/{$volist['picture']}" height="30" class="radius" />
									</a>
								<else />
									无
								</if>
							</td>
			                <td style="text-align:center">{$volist['intro']}</td>
							<td class="td-status" style="text-align:center">
				                <if condition="$volist['status'] eq 0">
				                	<span class="label label-success radius">已启用</span>
				                <else />
				                	<span class="label label-danger radius">已停用</span>
				                </if>
							</td>
							<!-- <td class="td-status">
				                <if condition="$volist['recommend'] eq 0">
				                	<span class="label label-danger radius">未推荐</span>
				                <else />
				                	<span class="label label-success radius">已推荐</span>
				                </if>
							</td> -->
		                    <td class="td-manage" style="text-align:center">
		                    	<if condition="$volist['status'] eq 1">
			                    	<a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="0" data-field="status" title="启用">
			                    		<i class="Hui-iconfont">&#xe6e1;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="1" data-field="status" title="停用">
			                        	<i class="Hui-iconfont">&#xe631;</i>
									</a>
								</if>
								<!-- <if condition="$volist['recommend'] eq '0'">
			                    	<a href="javascript:void(0);" class="updateState" data-id="{$volist['id']}" data-status="1" data-field="recommend" title="首页推荐">
			                    		<i class="Hui-iconfont">&#xe69e;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" class="updateState" data-id="{$volist['id']}" data-status="0" data-field="recommend" title="取消推荐">
			                        	<i class="Hui-iconfont">&#xe69d;</i>
									</a>
								</if>
		                        <a href="javascript:void(0);" onclick="layer_show('添加二级分类','__URL__/add/pid/{$volist['id']}','','410')" title="添加二级分类" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe600;</i>
								</a> -->
		                        <a href="javascript:void(0);" onclick="layer_show('编辑','__URL__/edit/id/{$volist['id']}','','410')" title="编辑" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe6df;</i>
								</a>
		                        <a href="javascript:void(0);" data-id="{$volist['id']}" title="删除" class="ml-5 singleRemove">
		                        	<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
		                    </td>
		                </tr>
			        	<volist name="volist['children']" id="twoList">
			        		<tr data-tt-id="{$twoList['id']}" data-tt-parent-id="{$twoList['pid']?$twoList['pid']:''}">
				                <td>
				                	<if condition="$twoList['children']|count gt 0">
				                		<span class='folder tree_icon_span'>{$twoList['title']}</span>
									<else />
										<span class='file tree_icon_span'>{$twoList['title']}</span>
									</if>
									<input type="checkbox" name="dataId" value="{$twolist['id']}" style="opacity:0;" />
								</td>
								<td>
									<input type="text" name="Sequence" value="{$twoList['sort']}" class="input-text text-c Sequence-style2">
								</td>
								<td>
								<if condition="$twoList['picture'] neq ''">
									<a href="__ROOT__/{$twoList['picture']}" rel="image-viewer" title="{$twoList['title']}">
										<img src="__ROOT__/{$twoList['picture']}" height="30" class="radius" />
									</a>
								<else />
									无
								</if>
								</td>
				                <td>{$twoList['intro']}</td>
				                
								<td class="td-status status-style2">
									<if condition="$twoList['status'] eq 0">
					                	<span class="label label-success radius">已启用</span>
					                <else />
					                	<span class="label label-danger radius">已停用</span>
					                </if>
								</td>
								<td></td>
			                    <td class="operation-style2 td-manage">
									<if condition="$twoList['status'] eq 1">
				                    	<a href="javascript:void(0);" class="updateStatus" data-id="{$twoList['id']}" data-status="0" data-field="status" title="启用">
				                    		<i class="Hui-iconfont">&#xe6e1;</i>
										</a>
									<else />
				                        <a href="javascript:void(0);" class="updateStatus" data-id="{$twoList['id']}" data-status="1" data-field="status" title="停用">
				                        	<i class="Hui-iconfont">&#xe631;</i>
										</a>
									</if>
			                        <a href="javascript:void(0);" onclick="layer_show('添加三级分类','__URL__/add/pid/{$twoList['id']}','','410')" title="添加三级分类" class="ml-5">
			                        	<i class="Hui-iconfont">&#xe600;</i>
									</a>
			                        <a href="javascript:void(0);" onclick="layer_show('编辑','__URL__/edit/id/{$twoList['id']}','','410')" title="编辑" class="ml-5">
			                        	<i class="Hui-iconfont">&#xe6df;</i>
									</a>
			                        <a href="javascript:void(0);" data-id="{$twoList['id']}" title="删除" class="ml-5 singleRemove">
			                        	<i class="Hui-iconfont">&#xe6e2;</i>
									</a>
			                    </td>
			                </tr>
							<volist name="twoList['children']" id="threeList">
				        		<tr data-tt-id="{$threeList['id']}" data-tt-parent-id="{$threeList['pid']?$threeList['pid']:''}">
									<td>
					                	<if condition="$threeList['children']|count gt 0">
					                		<span class='folder tree_icon_span'>{$threeList['title']}</span>
										<else />
											<span class='file tree_icon_span'>{$threeList['title']}</span>
										</if>
										<input type="checkbox" name="dataId" value="{$threeList['id']}" style="opacity:0;" />
									</td>
									<td>
										<input type="text" name="Sequence" value="{$threeList['sort']}" class="input-text text-c Sequence-style3">
									</td>
									<td>
										<if condition="$threeList['picture'] neq ''">
											<a href="__ROOT__/{$threeList['picture']}" rel="image-viewer" title="{$threeList['title']}">
												<img src="__ROOT__/{$threeList['picture']}" height="30" class="radius" />
											</a>
										<else />
											无
										</if>
									</td>
					                <td>{$threeList['intro']}</td>
					                
									<td class="td-status status-style3">
										<if condition="$threeList['status'] eq 0">
						                	<span class="label label-success radius">已启用</span>
						                <else />
						                	<span class="label label-danger radius">已停用</span>
						                </if>
									</td>
									<td></td>
				                    <td class="operation-style3 td-manage">
										<if condition="$threeList['status'] eq 1">
					                    	<a href="javascript:void(0);" class="updateStatus" data-id="{$threeList['id']}" data-status="0" data-field="status" title="启用">
					                    		<i class="Hui-iconfont">&#xe6e1;</i>
											</a>
										<else />
					                        <a href="javascript:void(0);" class="updateStatus" data-id="{$threeList['id']}" data-status="1" data-field="status" title="停用">
					                        	<i class="Hui-iconfont">&#xe631;</i>
											</a>
										</if>
				                        <a href="javascript:void(0);" onclick="layer_show('编辑','__URL__/edit/id/{$threeList['id']}','','410')" title="编辑" class="ml-5">
				                        	<i class="Hui-iconfont">&#xe6df;</i>
										</a>
				                        <a href="javascript:void(0);" data-id="{$threeList['id']}" title="删除" class="ml-5 singleRemove">
				                        	<i class="Hui-iconfont">&#xe6e2;</i>
										</a>
				                    </td>
				                </tr>
				        	</volist>
			        	</volist>
			        </volist>
	            </tbody>
	        </table>
	    </div>
	</div>
</block>
