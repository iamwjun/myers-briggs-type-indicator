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

		function slect_day(obj)
		{
			$('#dd').val(obj);
			$('#s_day').click();
		}
		function slect_month(obj)
		{
			$('#mm').val(obj);
			$('#s_mon').click();
		}
    </script>
</block>

<block name="main">

    <form action="__URL__/index" method="post" class="form form-horizontal" id="formValidform" style="display:none">
      <input type="hidden" value="" id="dd" name="slect_day">
      <input type="submit" id="s_day">
    </form>

    <form action="__URL__/index" method="post" class="form form-horizontal" id="formValidform" style="display:none">
      <input type="hidden" value="" id="mm" name="slect_month">
      <input type="submit" id="s_mon">
    </form>
	
	<!-- 面包屑导航 -->
	<nav class="breadcrumb">
	    <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
		<span class="c-gray en">&gt;</span>&nbsp;平台用户活跃信息
		<span class="c-gray en">&gt;</span>&nbsp;用户登录信息列表
		<a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
	<div class="pd-20">
		
	    <!-- 操作 -->
	    <div class="cl pd-5 bg-1 bk-gray mt-20" >
	    
               
                <div style="width:100%">

                   <div style="width:15%; float:left; margin-left:5%"><label><b style="color:green">平台总活跃</b>数：<span style="font-size:26px; color:#09F; font-weight:bold">{$cont}</span>人</label></div>

                   <div style="width:15%; float:left"><label style=""><b style="color:green">当月活跃</b>数：<span style="font-size:26px; color:#09F; font-weight:bold">{$now_m_cont}</span>人</label></div>

                   <div style="width:15%; float:left"><label style=""><b style="color:green">当日活跃</b>数：<span style="font-size:26px; color:#09F; font-weight:bold">{$now_d_cont}</span>人</label></div>
               

          

                    <div style="width:25%; float:left">
		                <?php $m=date('m',time()); $d=date('d',time());?>
		                
		                <?php echo date('Y');?>年
						<select id="month" onchange="slect_month(this.value)" style="width:50px; height:24px; size:14px;">
						<if condition="$slect_month eq ''">
						   <option value="<?php echo ceil($m);?>"><?php echo ceil($m);?></option>
						<else />
		                    <option value="{$slect_month}">{$slect_month}</option>
						</if>
		                 <?php
		                   for($i=1;$i<=12;$i++)
		                   {
		                 ?>
		                  <option value="{$i}">{$i}</option>
		                 <?php
		                   }
		                 ?>
						</select>
						<label >月活跃数：<span style="font-size:26px; color:red; font-weight:bold">{$m_cont}</span>人</label>
                    </div>


                    <div style="width:25%; float:left; margin-left:-8%">
						<span style="margin-left:50px">当月</span>
						<select id="day" onchange="slect_day(this.value)"  style="width:50px; height:24px; size:14px;">
						<if condition="$slect_day eq ''">
						   <option value="<?php echo ceil($d);?>"><?php echo ceil($d);?></option>
						<else />
		                   <option value="{$slect_day}">{$slect_day}</option>
						</if>
		                 <?php
		                   for($i=1;$i<=31;$i++)
		                   {
		                 ?>
		                  <option value="{$i}">{$i}</option>
		                 <?php
		                   }
		                 ?>
						</select>
						<label>日活跃数：<span style="font-size:26px; color:red; font-weight:bold">{$d_cont}</span>人</label>
                    </div>


				</div>
				
			
	        <!--span class="r">共有数据：<strong>{$dataList|count}</strong> 条</span-->
	   </div>
	   
	   <!-- 列表 -->
	    <div class="mt-20">
	        <table id="TreeTableLIST" class="table table-border table-hover table-bordered table-bg table-sort">
	            <thead>
	                <tr>
						<th >登录账号</th>
						<th >用户昵称</th>
						<th>终端系统</th>
						<th>登录IP</th>
						<th>登录时间</th>
						
	                </tr>
	            </thead>
	            <tbody>
			        <volist name="dataList" id="volist">
		                <tr data-tt-id="{$volist['id']}" data-tt-parent-id="{$volist['pid']?$volist['pid']:''}">
			                <td>
			                	{$volist['username']}
							</td>
							<td>
			                	{$volist['nickname']}
							</td>
							<td>
								{$volist['system']}
							</td>
							<td>
								{$volist['ip']}
							</td>
			                <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
		                </tr>
			        	
			        </volist>
	            </tbody>
	        </table>
	    </div>
	</div>
</block>
