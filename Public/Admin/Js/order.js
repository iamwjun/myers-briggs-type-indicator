$(function(){
    // 确认付款
    var ConfirmPay = $('.ConfirmPay');
    ConfirmPay.click(function(){
        var _this = $(this);
        var TheVal = _this.attr('data-id');
        if (!TheVal) {
            layer.open({
                type: 0,
                title: '错误提示',
                content: '参数有误!'
            });
			return;
        } else {
			$.ajax({
				url : jsObj['TheURL'] +'/confirmPay.html?rnd='+Math.random(),
				data : { id : TheVal },
				type : 'POST',
				async : true,
				dataType : 'json',
				beforeSend : function() {
					TempLayerLoad = layer.load(1, {
					    shade: [0.1,'#000']
					});
				},
				success: function(data){
					layer.close( TempLayerLoad );
					if ( data['status'] == 0 ) {
						layer.open({
							type : 0,
							content : data['info']
						});
					} else {
						layer.msg(data['info'], {
						    time: 0,
						    btn: ['关闭'],
						    yes: function(index){
						        location.href = location.href;
						    }
						});
					}
				}
			});
        }
        
    });
	
	// 订单列表-发货
	$( '.IndexDeliverGoods' ).on( 'click', function(){
		var theId = $( this ).attr( 'data-id' );
		if ( theId == "" ) {
			layer.open({
                type: 0,
                content: '非法操作!'
            });
			return;
		}
		$.ajax({
			url : jsObj['TheURL'] +'/getOrderInfoIdList.html?rnd='+Math.random(),
			data : { id : theId },
			type : 'POST',
			async : true,
			dataType : 'json',
			beforeSend : function() {
				TempLayerLoad = layer.load(1, {
				    shade: [0.1,'#000']
				});
			},
			success: function(data){
				layer.close( TempLayerLoad );
				if ( data['status'] == 1 ) {
					if ( data['info'] == "" ) {
						layer.open({
							type : 0,
							content : '没有数据'
						});
						return;
					}
					var TheURL = jsObj['TheURL'] + "/deliver_goods/id/" + data['info'] + ".html";
					layer_show( '批量发货', TheURL ,'600','350');
				} else {
					layer.open({
						type : 0,
						content : data['info']
					});
				}
			}
		});
	});
	
	// 订单详情-批量发货
	$( '.BatchDeliverGoods' ).on( 'click', function(){
		var _id = plugins.getCheckedId('');
		if ( _id == "" ) {
			layer.open({
                type: 0,
                content: '请选择要发货的商品!'
            });
			return;
		}
		var TheURL = jsObj['TheURL'] + "/deliver_goods/id/" + _id + ".html";
		layer_show( '批量发货', TheURL ,'600','350');
	});
    
    // 日期选择范围
    $('#datemin').focus(function(){
        WdatePicker({});
    });
    $('#datemax').focus(function(){
        WdatePicker({});
    });
});
