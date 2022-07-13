<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <title>微信安全支付</title>
		<script type="text/javascript" src="__JS__/jquery.js"></script>
        <script type="text/javascript">
        	//调用微信JS api 支付
	    		function jsApiCall() {
	    			WeixinJSBridge.invoke(
	    				'getBrandWCPayRequest',
						{$jsApiParameters},
	    				function(res){
	    					WeixinJSBridge.log(res.err_msg);
							var result = res.err_msg;
							if ( result.indexOf( 'ok' ) >= 0 ) {
								location.href = '{$web_url}Cart/payment_success/order_id/{$order_id}';
								// location.href = '{$web_url}Order/notify/order_id/{$order_id}';
							} else {
								// alert(res.err_code + res.err_desc + res.err_msg);
								alert( '支付失败!' );
								location.href = '{$web_url}Cart/payment/id/{$id}';
							}
	    				}
	    			);
	    		}
	    
	    		function callpay(){
	    			if (typeof WeixinJSBridge == "undefined"){
	    			    if( document.addEventListener ){
	    			        document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
	    			    }else if (document.attachEvent){
	    			        document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
	    			        document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
	    			    }
	    			}else{
	    			    jsApiCall();
	    			}
	    		}
				callpay();
				// 设置图片样式
		    	$( function() {
					var callpayObj = $( '.callpayLoading' );
					var width = parseInt( callpayObj.width() ) / 2;
					var height = parseInt( callpayObj.height() ) / 2;
					$( '.callpayLoading' ).css({
						'margin-left' : -width,
						'margin-top' : -height, 
					});
				} );
        </script>
		<style type="text/css">
		.callpayLoading
		{ width:50%; height:auto; position:fixed; left:50%; top:50%;}
		</style>
    </head>
    <body>
    	<img src="__IMAGES__/callpayLoading.gif" class="callpayLoading" />
    </body>
</html>
