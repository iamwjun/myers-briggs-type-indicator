$( function() {
	
	// 表单验证
	var form = plugins.validate();	
	var e = "<i class='fa fa-times-circle'></i> ";
    form.formId.validate({
        rules: {
            username: {
                required: !0,
                minlength: 2
            },
            password: {
                required: !0,
                minlength: 5
            },
            verify: {
                required: !0,
                minlength: 5,
                maxlength: 5
            }
        },
        messages: {
            username: {
                required: e + "请输入您的用户名",
                minlength: e + "用户名必须两个字符以上"
            },
            password: {
                required: e + "请输入您的密码",
                minlength: e + "密码必须5个字符以上"
            },
            verify: {
                required: e + "请填写验证码",
                minlength: e + "验证码必须为5位",
                maxlength: e + "验证码必须为5位"
            }
        },
		invalidHandler : function(){
			return false;
		},
		submitHandler : function(){
	        $.ajax({
	            url : form.formId.attr( 'action' ),
	            data : form.formId.serialize(),
	            dataType : 'json',
	            type : 'post',
				beforeSend : function() {
					form.button_box.append( form.loading_mask_html );
					form.button_box.find( 'button[type="submit"]' ).addClass( form.button_class );
				},
	            error : function(){
					plugins.toastr({
						'prompt_title' 	: '登录提示：',
						'prompt_info' 	: '请求发生错误!'
					});
					$(form.loading_mask).remove();
					form.button_box.find( 'button[type="submit"]' ).removeClass( form.button_class );
	            },
	            success : function(data){
					var mode = '';
					if ( data['status'] == 1 ) {
						mode = 'success';
						url = loginsuccess_url;
					} else {
						mode = 'error';
						url = false;
						$(form.loading_mask).remove();
						form.button_box.find( 'button[type="submit"]' ).removeClass( form.button_class );
					}
	                plugins.toastr({
						'mode'			: mode,
						'prompt_title' 	: '登录提示：',
						'prompt_info' 	: data['info'],
						'location'		: url
					});
	            }
	        })
		}
    })
	
	// 刷新验证码
	$( document ).on( 'click', '.imgyzm', function() {
		$( this ).attr( 'src', imgyzm_url + "?rnd=" + Math.random() );
	} );
} );