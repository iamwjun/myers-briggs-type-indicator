

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>情感、性格 - 问答测试</title>
    <!--公共的引用-->
    <meta http-equiv="Content-Type" content="textml; charset=utf-8" /><meta name="viewport" content="target-densitydpi=device-dpi, width=720px, user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="white" /><meta name="msapplication-tap-highlight" content="no" /><meta name="format-detection" content="telephone=no" />
     <!--样式-->
    <!--JQ-->
    <script src="https://code.jquery.com/jquery-1.4.min.js"></script>
    <script type="text/javascript">    
	 $(function(){
	 	if(/Android |webOS |iPhone |iPod|BlackBerry /i.test(navigator.userAgent)){
	 		
	 	}
	 	else{
            var dir='__URL__';
	 		var path=dir.split('/Mobile');
	 		window.location=path[0]+"/Home/Index/index";
	 	}
	 });   
	 
	 $(function(){
	    var u = navigator.userAgent;
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
        if(isiOS){
            $(document.body).css({'margin':'3%'});
        }else if(isAndroid){
            
        }
	 });
	 
	
	 function change_1(obj)
	 {
	 	$("#girl").attr("src","__IMAGES__/girl_on.png");
	 	$("#boy").attr("src","__IMAGES__/boy.png");
	 }

	 function change_2(obj)
	 {
	 	$("#boy").attr("src","__IMAGES__/boy_on.png");
	 	$("#boy").css("borderRadius","10px");
	 	$("#girl").attr("src","__IMAGES__/girl.png");
	 	$("#girl").css("borderRadius","10px");
	 	$("#girl").css("marginTop","1px");
	 }

	 function chioce(score,obj)
	 {
       $('.ans').css({'background':'#f3f1f1','color':'#000'});
	   $(obj).css({'background':'#7073e8','color':'#FFF'});
       var sex=$('#sex').val();
       var page=$('#page').val();
       var cont=$('#cont').val();
       var base=$('#score').val();
       var total_score=parseInt(parseInt(base)+parseInt(score));
       if(page<cont)
       {
	       var turn=parseInt(parseInt(page)+1);
	       window.location="{:U('Index/question')}?sex="+sex+"&page="+turn+"&score="+total_score;
	   }
	   else{
	   	$('#score').val(total_score);
	   	$('#pay').css('display','block');
	   }

	 }
      
      function prve()
      {
      	   var sex=$('#sex').val();
	       var page=$('#page').val();
	       var cont=$('#cont').val();
	       var score=$('#score').val();
	       if(page>1)
	       {
	       /*
	       	 var turn=parseInt(parseInt(page)-1);
	         window.location="{:U('Index/question')}?sex="+sex+"&page="+turn+"&score="+score;
	         */
	         history.back();
	       }
	       else{
	       	 alert('已经是第一题了！');
	       }
      }

      function next()
      {
      	   var sex=$('#sex').val();
	       var page=$('#page').val();
	       var cont=$('#cont').val();
	       var score=$('#score').val();
	       if(page<cont)
	       {
	       	 var turn=parseInt(parseInt(page)+1);
	         window.location="{:U('Index/question')}?sex="+sex+"&page="+turn+"&score="+score;
	         history.back();
	       }
	       else{
	       	 alert('已经是最后一题了！');
	       }
      }
      
      function show_result()
      {
        /*
        var score=$('#score').val();
        var sex=$('#sex').val();
        
        $.ajax({
          type:"post",
          url :"{:U('Index/search_jg_res')}",
          data:"score="+score+"&sex="+sex,
          success:function(date){
            $('#content').html(date);
            $('.result').css('display','block');
          },
        });
        */
        
        var score=$('#score').val();
        var sex=$('#sex').val();
        var openid=$('#open_id').val();
        
        $.ajax({
             type:"post",
             url :"{:U('Index/payOrder')}",
             data:"openid="+openid+"&money=29.9"+"&sex="+sex+"&score="+score,
             success:function(date){
             var strs=JSON.parse(date);
                     WeixinJSBridge.invoke(
                      'getBrandWCPayRequest', {
                         "appId":"wxd0db865bdf829c3a",     //公众号ID，由商户传入     
                         "timeStamp":strs.timeStamp,         //时间戳，自1970年以来的秒数     
                         "nonceStr":strs.nonceStr, //随机串     
                         "package":strs.package,     
                         "signType":"MD5",         //微信签名方式：     
                         "paySign":strs.paySign //微信签名 
                      },
                      function(res){
                      if(res.err_msg == "get_brand_wcpay_request:ok" ){
                        alert('提交成功！');
                        window.location="{:U('Payment/notify_pay')}?uid="+uid+"&goodsid="+goodsid+"&money="+money;
                      } 
                      else{
                        alert('支付失败！');
                      }
                   }); 
             
             }
          });
      }
    </script>  
    
</head>
<body style="overflow-x:hidden;width:100%">
  <input type="hidden" id="open_id" value="{$open_id}">
  <input type="hidden" id="sex" value="<?=$_GET['sex']?>">
  <input type="hidden" id="page" value="<?=$_GET['page']?>">
  <input type="hidden" id="cont" value="{$jg_cont}">
  <input type="hidden" id="score" value="<?=$_GET['score']?>">

  <div class="main" style="width:100%;height:1240px;background:#5d65e1">
     <!--<img src="__IMAGES__/zscs_bg.jpg" style="width:100%;height:auto">-->
    
     
     <div class="result" style="width:90%;height:1050px;position:absolute;background:rgb(112, 115, 232);border:5px solid #FFF;top:5%;left:5%;display:block">
        <div style="width:80px;height:40px;background:#FFF;color:rgb(112, 115, 232);float:right;font-size:18px;text-align:center;line-height:40px;display:none" onclick="$('.result').css('display','none')">
          关闭
        </div>
        <div style="width:100%;height:60px;float:left;margin-top:50px;text-align:center;font-size:30px;color:#FFF">
           测试结果分析
        </div>
        <div id="content" style="width:80%;height:720px;background:#FFF;float:left;margin:5% 0px 0px 5%;font-size:26px;color:rgb(112, 115, 232);padding:5%">
           {$res}
        </div>
     </div>
     
  </div>
       
</body>
</html>
<script>
    
</script>

