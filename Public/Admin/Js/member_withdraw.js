$(function(){
    // 确认付款
    var handleBank = $('.handleBank');
    handleBank.click(function(){
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
				url : jsObj['TheURL'] +'/handleBank.html?rnd='+Math.random(),
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
});
