

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>情感、性格 - 问答测试</title>
    <!--公共的引用-->
    <meta http-equiv="Content-Type" content="textml; charset=utf-8" /><meta name="viewport" content="target-densitydpi=device-dpi, width=720px, user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="white" /><meta name="msapplication-tap-highlight" content="no" /><meta name="format-detection" content="telephone=no" />
     <!--样式-->
    <!--JQ-->
    <script src="__JS__/jquery-1.4.min.js"></script>
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
	  var trade=$('#out_trade_no').val();
	  if(trade!='')
	  {
	     $('#ck_pay').css({'top':'91%','background':'#cf3535','color':'#FFF','display':'block','left':'38%'});
	  }
	 })
	 
	 /*判断浏览器终端*/
	 $(function(){
	   let ua = window.navigator.userAgent.toLowerCase()
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
          //这是微信浏览器
          $('#prve_tm').css('top','74%');    
          $('#next_tm').css('top','74%'); 
        }
        else{
         //这是手机自带浏览器
          $('#prve_tm').css('top','79%');    
          $('#next_tm').css('top','79%'); 
          $('#pay').css('top','91%');
          $('#h5_pay').css('top','91%');
        }
	 })
	 
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

	   $(obj).css({'background':'#7073e8','color':'#FFF'});
       var type=$('#type').val();
       var page=parseInt($('#page').val());
       var cont=parseInt($('#cont').val());
       var base=$('#score').val();
       var total_score=parseInt(parseInt(base)+parseInt(score));
       if(page<cont)
       {
	       var turn=parseInt(parseInt(page)+1);
	       window.location="{:U('Index/question_zscs')}?type="+type+"&page="+turn+"&score="+total_score;
	   }
	   else{
	   	    $('#score').val(total_score);
	   	    let ua = window.navigator.userAgent.toLowerCase()
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
              //这是微信浏览器
              $('#pay').css('display','block');
              $('#h5_pay').css('display','none');
            }
            else{
             //这是手机自带浏览器
              $('#pay').css('display','none');
              $('#h5_pay').css('display','block');
              $('#ck_pay').css('display','none');
            }
	   }

	 }
      
      function prve()
      {
      	   var sex=$('#sex').val();
	       var page=parseInt($('#page').val());
	       var cont=parseInt($('#cont').val());
	       var score=$('#score').val();
	       if(page>1)
	       {
	       	 /*
	       	 var turn=parseInt(parseInt(page)-1);
	         window.location="{:U('Index/zstest')}?sex="+sex+"&page="+turn+"&score="+score;
	         */
	         history.back();
	       }
	       else{
	       	 alert('已经是第一题了！');
	       }
      }

      function next()
      {
      	   var type=$('#type').val();
	       var page=parseInt($('#page').val());
	       var cont=parseInt($('#cont').val());
	       var score=$('#score').val();
	       if(page<cont)
	       {
	       	 var turn=parseInt(parseInt(page)+1);
	         window.location="{:U('Index/question_zscs')}?type="+type+"&page="+turn+"&score="+score;
	       }
	       else{
	       	 alert('已经是最后一题了！');
	       }
      }
      
      function show_result()
      {
        
        var score=$('#score').val();
        var type=$('#type').val();
        var openid=$('#open_id').val();
        
        $.ajax({
             type:"post",
             url :"{:U('Index/payOrder_zs')}",
             data:"openid="+openid+"&money=29.9&type="+type+"&score="+score,
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
                        //alert('支付成功！');
                        window.location="{:U('Index/notify_pay_zs')}?type="+type+"&score="+score;
                      } 
                      else{
                        alert('支付失败！');
                      }
                   }); 
             
             }
          });
      }
      
      function h5_pay()
      {
        var score=$('#score').val();
        var sex=$('#sex').val();
        var openid=$('#open_id').val();
        var page=$('#page').val();
        
        $.ajax({
             type:"post",
             url :"{:U('Index/h5_payOrder')}",
             data:"money=29.9&type=1&score="+score+"&category=3&page="+page,
             success:function(date){
               window.location=date;
             }
          });
          setTimeout(function () {
             $('#h5_pay').css('display','none');
             $('#ck_pay').css({'top':'91%','background':'#cf3535','color':'#FFF','display':'block','left':'38%'});
          }, 2000);
      }
      
      function get_pay_status()
      {
        var trade=$("#out_trade_no").val();
        var category=$('#category').val();
        var sex=$('#sex').val();
        var score=$('#score').val();
        if(trade=='')
        {
          h5_pay();
        }
        else{
            $.ajax({
                 type:"post",
                 url :"{:U('Index/get_pay_status')}",
                 data:"category="+category+"&sex="+sex+"&score="+score+"&trade="+trade,
                 success:function(date){
                     if(date=='NOTPAY')
                     {
                        h5_pay();
                     }
                     else{
                       if(category==1)
                       {
                         window.location="http://www.zug365.cn/Mobile/Index/search_jg_res/sex/"+sex+"/score/"+score;
                       }
                       else if(category==2)
                       {
                         window.location="http://www.zug365.cn/Mobile/Index/search_xg_res/type/1/score/"+score;
                       }
                       else{
                         window.location="http://www.zug365.cn/Mobile/Index/search_zs_res/type/1/score/"+score;
                       }
                     }
                 }
              }); 
        }
      }
    </script>  
    
</head>
<body style="overflow-x:hidden;width:100%">
 <input type="hidden" id="open_id" value="{$open_id}">
  <input type="hidden" id="type" value="<?=$_GET['type']?>">
  <input type="hidden" id="page" value="<?=$_GET['page']?>">
  <input type="hidden" id="cont" value="{$jg_cont}">
  <input type="hidden" id="score" value="<?=$_GET['score']?>">
  <input type="hidden" id="out_trade_no" value="<?=$_GET['out_trade_no']?>">
  <input type="hidden" id="category" value="<?=$_GET['category']?>">

  <div class="main" style="width:100%;height:1240px;background:#5d65e1">
     <img src="__IMAGES__/zscs_bg.jpg" style="width:100%;height:auto">
     <div style="width:80%;height:500px;background:#FFF;border-radius:10px;position:absolute;top:34%;left:11%">
        <div class="page" style="width:95%;height:70px;float:left;line-height:70px;font-size:24px;padding-left:5%">
           <b class="now_p" style="font-size:36px;float:left"><?=$_GET['page']?></b><span style="font-size:26px;color:lightgray;float:left;margin-left:5px">/{$jg_cont}</span>
        </div>
        <div class="title" style="width:90%;height:70px;float:left;padding-left:5%;font-size:32px;color:#000;font-weight:bold;line-height:32px">
           {$jg_list[0]['title']}
        </div>
        <div class="ans" style="width:79%;height:auto;float:left;background: #f3f1f1;margin:2% 0px 0px 6%;border-radius:10px;line-height:40px;padding:10px  10px 10px 5%;font-size:28px;color:#000;font-weight:bold" onclick="chioce(1,this)">
          A&nbsp;{$jg_list[0]['intro']}
        </div>
        <div class="ans" style="width:79%;height:auto;float:left;background: #f3f1f1;margin:5% 0px 0px 6%;border-radius:10px;line-height:40px;padding:10px  10px 10px 5%;font-size:28px;color:#000;font-weight:bold" onclick="chioce(2,this)">
          B&nbsp;{$jg_list[0]['content']}
        </div>
     </div>

     <div id="prve_tm" style="width:120px;height:40px;background:#FFF;border-radius:10px;font-size:28px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:12px 40px 12px 40px;position:absolute;top:74%;left:18%" onclick="prve()"><<上一题</div>
     <div id="next_tm" style="width:120px;height:40px;background:#FFF;border-radius:10px;font-size:28px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:12px 40px 12px 40px;position:absolute;top:74%;left:58%" onclick="next()">下一题>></div>

     <div id="pay" style="height:40px;background:#FFF;border-radius:10px;font-size:26px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:16px 26px 16px 20px;position:absolute;top:84%;left:26%;display:none" onclick="show_result()">点击支付29.9元查看测试结果</div>
     
     <div id="h5_pay" style="height:40px;background:#FFF;border-radius:10px;font-size:26px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:16px 26px 16px 20px;position:absolute;top:84%;left:26%;display:none" onclick="h5_pay()">点击支付29.9元查看测试结果</div>
     
     <div id="ck_pay" style="height:40px;background:#FFF;border-radius:10px;font-size:26px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:16px 26px 16px 26px;position:absolute;top:84%;left:40%;display:none" onclick="get_pay_status()">查看测试结果</div>
     
     <div class="result" style="width:90%;height:1050px;position:absolute;background:rgb(112, 115, 232);border:5px solid #FFF;top:5%;left:5%;display:none">
        <div style="width:80px;height:40px;background:#FFF;color:rgb(112, 115, 232);float:right;font-size:18px;text-align:center;line-height:40px" onclick="$('.result').css('display','none')">
          关闭
        </div>
        <div style="width:100%;height:60px;float:left;margin-top:50px;text-align:center;font-size:30px;color:#FFF">
           测试结果分析
        </div>
        <div id="content" style="width:80%;height:720px;background:#FFF;float:left;margin:5% 0px 0px 5%;font-size:26px;color:rgb(112, 115, 232);padding:5%">
          
        </div>
     </div>
  </div>
       
</body>
</html>
<script>
    
</script>

