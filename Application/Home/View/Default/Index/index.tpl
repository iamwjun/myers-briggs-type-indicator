

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

	   $(obj).css({'background':'#7073e8','color':'#FFF'});
       var type=$('#type').val();
       var page=$('#page').val();
       var cont=$('#cont').val();
       var base=$('#score').val();
       var total_score=parseInt(parseInt(base)+parseInt(score));
       if(page<cont)
       {
	       var turn=parseInt(parseInt(page)+1);
	       window.location="{:U('Index/question_xgcs')}?type="+type+"&page="+turn+"&score="+total_score;
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
      	   var type=$('#type').val();
	       var page=$('#page').val();
	       var cont=$('#cont').val();
	       var score=$('#score').val();
	       if(page<cont)
	       {
	       	 var turn=parseInt(parseInt(page)+1);
	         window.location="{:U('Index/question_xgcs')}?type="+type+"&page="+turn+"&score="+score;
	       }
	       else{
	       	 alert('已经是最后一题了！');
	       }
      }
      
      function show_result()
      {
        
        var score=$('#score').val();
        
        $.ajax({
          type:"post",
          url :"{:U('Index/search_xg_res')}",
          data:"score="+score,
          success:function(date){
            $('#content').html(date);
            $('.result').css('display','block');
          },
        });
      }
    </script>  
    
</head>
<body style="overflow-x:hidden;width:100%">
  <input type="hidden" id="open_id" value="{$open_id}">
  <input type="hidden" id="type" value="<?=$_GET['type']?>">
  <input type="hidden" id="page" value="<?=$_GET['page']?>">
  <input type="hidden" id="cont" value="{$jg_cont}">
  <input type="hidden" id="score" value="<?=$_GET['score']?>">

  <div class="main" style="width:100%;height:1240px;background:#5d65e1">
     <img src="__IMAGES__/xgcs_bg.jpg" style="width:100%;height:auto">
     <div style="width:80%;height:500px;background:#FFF;border-radius:10px;position:absolute;top:34%;left:11%">
        <div class="page" style="width:95%;height:70px;float:left;line-height:70px;font-size:24px;padding-left:5%">
           <b class="now_p" style="font-size:36px;float:left"><?=$_GET['page']?></b><span style="font-size:26px;color:lightgray;float:left;margin-left:5px">/{$jg_cont}</span>
        </div>
        <div class="title" style="width:90%;height:80px;float:left;padding-left:5%;font-size:26px;color:#000;line-height:32px">
           {$jg_list[0]['title']}
        </div>
        <div class="ans_1" style="width:79%;height:80px;float:left;background: #f3f1f1;margin:5% 0px 0px 6%;border-radius:10px;line-height:80px;padding-left:5%;font-size:24px" onclick="chioce(1,this)">
          A&nbsp;{$jg_list[0]['intro']}
        </div>
        <div class="ans_2" style="width:79%;height:80px;float:left;background: #f3f1f1;margin:8% 0px 0px 6%;border-radius:10px;line-height:80px;padding-left:5%;font-size:24px" onclick="chioce(2,this)">
          B&nbsp;{$jg_list[0]['content']}
        </div>
     </div>

     <div style="width:120px;height:40px;background:#FFF;border-radius:10px;font-size:22px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:8px 20px 8px 15px;position:absolute;top:74%;left:20%" onclick="prve()"><<上一题</div>
     <div style="width:120px;height:40px;background:#FFF;border-radius:10px;font-size:22px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:8px 20px 8px 15px;position:absolute;top:74%;left:60%" onclick="next()">下一题>></div>

     <div id="pay" style="height:40px;background:#FFF;border-radius:10px;font-size:22px;color:#7073e8;text-align:center;line-height:40px;font-weight:bold;padding:8px 20px 8px 15px;position:absolute;top:84%;left:30%;display:block" onclick="show_result()">点击支付29.9元查看测试结果</div>
     
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

