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
        <h3>提交成功</h3>
        <a href="{:U('Index/index')}"><i class="iconfont">&#xe621;</i></a>
    </header>
	
	<div class="finish_max">
	<if condition="$return['status']">
		<if condition="($return['pay_way'] eq '在线支付' || $return['pay_way'] eq '网上支付') && $weixin eq 1">
			<form method="post" action="{:U('Cart/js_api_call')}">
		<else />
			<form method="post" action="{:U('Cart/alipay')}">
		</if>
			<input type="hidden" name="id" value="{$return['id']}" />
			<div class="finish_content">
				<i class="iconfont success">&#xe612;</i>
				<span class="span_c">
					订单提交成功!
				</span>
				<ul>
					<li>订单编号：{$return['order_id']}</li>
					<li>应付金额：<a>￥{$return['price']}</a></li>
					<!--li><a href="">温馨提示：订单在24小时之内支付有效</a> </li-->
				</ul>
			</div>
			<if condition="($return['pay_way'] eq '在线支付' || $return['pay_way'] eq '网上支付')">
				{// 微信支付 }
				<div class="padding-all dis-box"><input class="btn-submit box-flex" value='立即支付' type="submit" /></div>
			</if>
		</form>
	<else />
		<div class="finish_content">
			<i class="iconfont success">&#xe612;</i> <span class="span_c">{$return['info']}</span>
		</div>
	</if>
	</div>
</block>