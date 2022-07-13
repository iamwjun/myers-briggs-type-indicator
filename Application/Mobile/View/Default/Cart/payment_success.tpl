<extend name="Base/common1" />

{// css样式区 }
<block name="link">
</block>

<block name="jscript">
</block>

<block name="main">
<body class="">
	<!-- 头部 -->
	<header class="header-menu dis-box">
    	<a href="javascript:history.go(-1);"><i class="iconfont">&#xe636;</i></a>
        <h3>订单支付成功</h3>
        <a href="{:U('Index/index')}"><i class="iconfont">&#xe621;</i></a>
    </header>
	
	<div class="finish_max">
		<if condition="($return['pay_way'] eq '在线支付' || $return['pay_way'] eq '网上支付') && $weixin eq 1">
			<form method="post" action="{:U('Cart/js_api_call')}">
		<else />
			<form method="post" action="{:U('Cart/js_api_call')}">
		</if>
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="finish_content">
				<i class="iconfont success">&#xe612;</i>
				<span class="span_c">
					订单支付成功
				</span>
				<ul>
					<li>订单编号：{$dataInfo['order_id']}</li>
					<li>订单金额：<a>￥{$dataInfo['price']}</a></li>
				</ul>
			</div>
			
			<div class="ect-button-more dis-box padding-all">
				<a class="btn-submit box-flex" href="{:U('Order/index')}">返回订单</a>
				<a class="btn-submit box-flex close" href="{:U('Index/index')}">回到首页</a>
			</div>
		</form>
	</div>
</block>