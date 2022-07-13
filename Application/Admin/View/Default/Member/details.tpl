<extend name="Base/common" />

<block name="link">
	<style type="text/css">
		.panel-custom { width:24%; height:280px; overflow:hidden; float:left; margin-left:0.5%; }
		.panel-data-count { width:98%; float:left;m argin-top:10px; margin-left:0.5%; margin-bottom:10px; }
	</style>
</block>

<block name="jscript"></block>

<block name="main">
	<div class="pd-20">
		<!-- 账户信息 -->
		<div class="panel panel-default panel-custom">
	    	<div class="panel-header">账户信息</div>
	    	<div class="panel-body">
			    <p>会员ID (幸运号）: {$dataInfo['referral_code']}</p>
			    <p>微信昵称：{:json_decode($dataInfo['wx_name'])}</p>
			    <p>用户名：{$dataInfo['username']}</p>
			    <p>姓名：{$dataInfo['nickname']}</p>
			    <p>级别：{$dataInfo['level_title']}</p>
			    <p>推荐人ID（幸运号）：{$dataInfo['recommended_code']?$dataInfo['recommended_code']:'无推荐人'}</p>
			</div>
		</div>
		<!-- 基本信息 -->
		<div class="panel panel-default panel-custom">
	    	<div class="panel-header">基本信息</div>
	    	<div class="panel-body">
			    <p>手机：{$dataInfo['tel']}</p>
			    <p>邮箱：{$dataInfo['email']}</p>
			    <p>电话：{$dataInfo['phone']}</p>
			    <p>QQ号：{$dataInfo['email']}</p>
			    <p>地址：{$dataInfo['address']}</p>
			    <p>单位：{$dataInfo['unit']}</p>
			    <p>职位：{$dataInfo['position']}</p>
			</div>
		</div>
		<!-- 收货信息 -->
		<div class="panel panel-default panel-custom">
	    	<div class="panel-header">收货信息</div>
	    	<div class="panel-body">
			    <p>收货人：{$dataInfo['tel']}</p>
			    <p>电话：{$dataInfo['email']}</p>
			    <p>地址：{$dataInfo['phone']}</p>
			</div>
		</div>
		<!-- 账户信息 -->
		<div class="panel panel-default panel-custom">
	    	<div class="panel-header">银行信息</div>
	    	<div class="panel-body">
			    <p>银行类别：{$dataInfo['bank_type']}</p>
			    <p>开户行：{$dataInfo['bank_hang']}</p>
			    <p>账号：{$dataInfo['bank_id']}</p>
			    <p>户名：{$dataInfo['bank_name']}</p>
			</div>
		</div>
		<div class="panel panel-default panel-data-count">
	    	<div class="panel-header">数据统计[还未统计]</div>
	    	<div class="panel-body">
	    		<p>直接粉丝人数：50个；朋友圈人数：100个</p>
	    		<table class="table table-border table-bordered table-hover table-bg table-sort">
	                <thead>
	                    <tr class="text-c">
	                        <th width="5%">项目</th>
	                        <th width="5%">订单</th>
	                        <th width="5%">成交额</th>
	                        <th width="10%">积分</th>
	                    </tr>
	                </thead>
	                <tbody class="text-c">
	                	<tr>
	                		<td>个人消费</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>直接推荐</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>间接推荐</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>分享宣传</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>引进商品</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>以上合计</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>已用积分</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                	<tr>
	                		<td>剩余积分</td>
	                		<td>1</td>
	                		<td>1</td>
	                		<td>1</td>
	                	</tr>
	                </tbody>
                </table>
	    	</div>
		</div>
	</div>
</block>