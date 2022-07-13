<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    
    <meta name="description" content="{$config['web_description']}" />
    <meta name="keywords" content="{$config['web_keywords']}" />
    <title>{$config['web_title']}</title>  
    </head>
	<script type="text/javascript" src="__JS__/jquery-2.1.4.min.js"></script>
		<if id="sendForm" condition="$weixin eq 1">
			<form style="display:none;" id="sendForm" method="post" action="{:U('Cart/js_api_call')}">
		<else />
			<form style="display:none;" id="sendForm" method="post" action="{:U('Cart/alipay')}">
		</if>
			<input type="hidden" name="id" value="{$return['id']}" />
			<input type="hidden" name="pay_type" value="1" />
			<div class="finish_content">
				<img src="__IMAGES__/finish.png">
				<span class="span_c">
					订单提交成功!
				</span>
				<ul>
					<li>订单编号：{$return['order_id']}</li>
					<li>应付金额：<a>￥{$return['price']}</a></li>
					<!--li><a href="">温馨提示：订单在24小时之内支付有效</a> </li-->
				</ul>
			</div>
				<div class="zhi_button"><input value='立即支付' type="submit" /></div>
		</form>
	<script>
		$('#sendForm').submit();
	</script>
