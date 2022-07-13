// JavaScript Document

(function ($){

    var defaults = {
        title:"提醒",    //提示框标题
        text:"操作失败",     //提示内容
        btnTxt:"我知道了！",     //普通提示框
        cartbtn:"去购物车结算",      //购物车提示框按钮文字
        type:1,     //提示框类型：1为普通提示框，2为confirm提示框，3为购物车提示框
        yesTxt:"是",     //confirm提示框 确认按钮文字
        noTxt:"否",     //confirm提示框 取消按钮文字
        color:"#03a9f4",     //提示框主题颜色
        href:"",     //提示框按钮点击后回调的链接
        msgBoxFun:"",      //普通提示框按钮 回调函数
        yesFun:"",     //confirm提示框 确认按钮回调
        noFun:""     //confirm提示框 取消按钮回调
    }
	
    $.popup = function(options){
        var options = $.extend(defaults,options);

        // 普通提示框
        if (options.type==1) {
            var msgBox = [];
            msgBox.push('<div class="eject_prompt_mask"><div class="eject_prompt message_box">');
            msgBox.push('<h2>'+options.title+'</h2>');
            msgBox.push('<div class="text">'+options.text+'</div>');
            msgBox.push('<div class="button" style="color:'+options.color+';">'+options.btnTxt+'</div>');
            msgBox.push('</div></div>');
            $("body").append(msgBox.join("\n"));
            $(".eject_prompt_mask").fadeIn(200).on("click",".eject_prompt .button",function(){
                if (options.href != "" && options.msgBoxFun == "") {
                    location.href = options.href;
                }
                if(options.href == "" && options.msgBoxFun != ""){
                    options.msgBoxFun.call();
                }
                $(".eject_prompt_mask").fadeOut(200);
                setTimeout(function(){
                    $(".eject_prompt_mask").remove();
                },200);
            });
        }


        // confirm提示框
        if (options.type==2) {
            var confirm = [];
            confirm.push('<div class="eject_prompt_mask"><div class="eject_prompt confirm">');
            confirm.push('<h2>'+options.title+'</h2>');
            confirm.push('<div class="text">'+options.text+'</div>');
            confirm.push('<div class="button">');
            confirm.push('<span class="yes">'+options.yesTxt+'</span>');
            confirm.push('<span class="no" style="color:'+options.color+';">'+options.noTxt+'</span>');
            confirm.push('</div></div></div>');

            $("body").append(confirm.join("\n"));
            $(".eject_prompt_mask").fadeIn(200).on("click",".confirm .button span",function(){
                if ($(this).hasClass("yes")) {
                    if (options.yesFun != "") {
                        options.yesFun.call();
                    }
                }
                if ($(this).hasClass("no")) {
                    if (options.noFun != "") {
                        options.noFun.call();
                    }
                }
                $(".eject_prompt_mask").fadeOut(200);
                setTimeout(function(){
                    $(".eject_prompt_mask").remove();
                },200);
            });

        }



        // 添加购物车提示
        if (options.type == 3) {
            var cart = [];
            cart.push('<div class="eject_prompt_mask"><div class="eject_prompt add_cart">');
            cart.push('<div class="package">');
            cart.push('<div class="success_pic"></div>');
            cart.push('<span class="close"><i class="icon-prompt" style="background:'+options.color+';">&#xe600;</i></span></div>');
            cart.push('<div class="text">'+options.text+'</div>');
            cart.push('<div class="button button-close" style="background:'+options.color+';">继续购物</div>');
			cart.push('<div class="button" style="background:'+options.color+';">'+options.cartbtn+'</div></div>');

            $("body").append(cart.join("\n"));
            $(".eject_prompt_mask").fadeIn(200).on("click",".add_cart .package .close,.add_cart .button,.add_cart .package .button-close",function(){
                if($(this).hasClass("button") && !$(this).hasClass("button-close")){
                    location.href = options.href;
                }
                $(".eject_prompt_mask").fadeOut(200);
                setTimeout(function(){
                    $(".eject_prompt_mask").remove();
                },200);
            });
        }

    };

})(jQuery);

