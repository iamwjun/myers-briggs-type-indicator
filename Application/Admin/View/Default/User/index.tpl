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
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;管理员管理
		<span class="c-gray en">&gt;</span>&nbsp;管理员列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
	    <div class="text-c">
	    	<form action="" method="post">
	    		<!-- 群组 -->
		    	<span class="select-box radius width-130">
			    	<select name="auth" class="select">
		                <option value="0">请选择群组</option>
		                <volist name="roleList" id="volist">
						<if condition="$volist['id'] == $paramter['auth']">
		                    <option value="{$volist['id']}" selected="selected">{$volist['title']}</option>
						<else />
							<option value="{$volist['id']}">{$volist['title']}</option>
						</if>
		                </volist>
		            </select>
				</span>
		    	<!-- 用户名 -->
				<input type="text" name="username" value="{$paramter['username']}" placeholder="输入用户名" class="input-text radius width-200" />
		    	<!-- 真实姓名 -->
				<input type="text" name="nickname" value="{$paramter['nickname']}" placeholder="输入真实姓名" class="input-text radius width-200">
		    	<!-- 开始日期 -->
				<input type="text" name="start_time" value="{$paramter['start_time']}" id="datemin" placeholder="开始日期" class="input-text radius Wdate width-200">
				-
		    	<!-- 结束日期 -->
				<input type="text" name="end_time" value="{$paramter['end_time']}" id="datemax" placeholder="结束日期" class="input-text radius Wdate width-200">
				<!-- 搜索按钮 -->
		        <button type="submit" class="btn btn-success radius" id="" name="">
		            <i class="Hui-iconfont">&#xe665;</i>&nbsp;搜管理员
		        </button>
	    	</form>
	    </div>
	    
	    <div class="cl pd-5 bg-1 bk-gray mt-20">
	        <span class="l">
				<a href="javascript:void(0);" onclick="layer_show('添加管理员','__URL__/add','','510')" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe600;</i>&nbsp;添加管理员
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
						<th width="10%">用户名</th>
						<th width="10%">真实姓名</th>
						<th width="10%">所属群组</th>
						<th width="15%">描述</th>
						<th width="10%">创建时间</th>
						<th width="10%">最后登录时间</th>
						<th width="10%">最后登录IP</th>
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
			                	<a href="javascript:void(0);" class="link-06c" onclick="layer_show('管理员[{$volist['nickname']}]的详细信息','__URL__/show/id/{$volist['id']}',360,450)" title="查看{$volist['nickname']}的详细信息">
			                		{$volist['username']}
								</a>
							</td>
			                <td>{$volist['nickname']}</td>
			                <td>{$volist['auth_title']}</td>
			                <td>{$volist['intro']}</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
			                <td>
				                <if condition="$volist['last_login_time'] eq 0">
									暂无
								<else />
				                	{$volist['last_login_time']|date='Y-m-d H:i:s',###}
								</if>
							</td>
			                <td>{$volist['last_login_ip']?long2ip($volist['last_login_ip']):'暂无'}</td>
							<td class="td-status">
				                <if condition="$volist.status eq 0">
				                	<span class="label label-success radius">已启用</span>
				                <else />
				                	<span class="label label-danger radius">已停用</span>
				                </if>
							</td>
		                    <td class="td-manage">
		                    	<!-- <if condition="$volist['status'] eq 1">
			                    	<a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="0" title="启用">
			                    		<i class="Hui-iconfont">&#xe6e1;</i>
									</a>
								<else />
			                        <a href="javascript:void(0);" class="updateStatus" data-id="{$volist['id']}" data-status="1" title="停用">
			                        	<i class="Hui-iconfont">&#xe631;</i>
									</a>
								</if> -->
		                        <a href="javascript:void(0);" onclick="layer_show('编辑管理员','__URL__/edit/id/{$volist['id']}','','510')" title="编辑管理员" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe6df;</i>
								</a>
		                        <!-- <a href="javascript:void(0);" onclick="layer_show('修改密码','__URL__/pass_edit/id/{$volist['id']}','600','270')" title="修改密码" class="ml-5">
		                        	<i class="Hui-iconfont">&#xe63f;</i>
								</a> -->
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
