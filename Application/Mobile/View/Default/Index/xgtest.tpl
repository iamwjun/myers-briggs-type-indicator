

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
           
	 	}
	 });   
	 
	 
	 /*判断浏览器终端*/
	 $(function(){
	   let ua = window.navigator.userAgent.toLowerCase()
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
          //这是微信浏览器
          $('#test1').css('top','33.6%');    
          $('#test2').css('top','33.6%'); 
          $('#go_test').css('top','71%');
        }
        else{
         //这是手机自带浏览器
          $('#test1').css('top','37%');  
          $('#test2').css('top','37%'); 
          $('#go_test').css('bottom','14%');
        }
	 })
	 
	 $(function(){
	    var u = navigator.userAgent;
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
        if(isiOS){
            $(document.body).css({'margin':'0'});
        }else if(isAndroid){
            
        }
	 });
	 
	
	 function change_1(obj)
	 {
	 	$("#girl").attr("src","__IMAGES__/wzb_on.png");
	 	$("#boy").attr("src","__IMAGES__/scb.png");
	 	$('#type').val(1);
	 }

	 function change_2(obj)
	 {
	 	$("#boy").attr("src","__IMAGES__/scb_on.png");
	 	$("#boy").css("borderRadius","10px");
	 	$("#girl").attr("src","__IMAGES__/wzb.png");
	 	$("#girl").css("borderRadius","10px");
	 	$("#girl").css("marginTop","1px");
	 	$('#type').val(2);
	 }
      
     function go_ques()
     {
     	var type=$("#type").val();
     	window.location="{:U('Index/question_xgcs')}?type="+type+"&page=1&score=0";
     }
    </script>  
    
</head>
<body style="overflow-x:hidden;width:100%;">

  <div class="main" style="width:100%;height:1240px;">
     <img src="__IMAGES__/bbgg.png" style="width:100%;height:auto">
     <div id="test1" style="width:320px;height:465px;position:absolute;top:33.6%;left:5%;border-radius:10px">
        <img id="girl" src="__IMAGES__/wzb_on.png" style="width:100%;height:auto" onclick="change_1(this)">
        <b style="font-size:40px;position:absolute;left:35%;top:50%">93题</b>
     </div>
     <div id="test2" style="width:320px;height:465px;position:absolute;top:33.6%;left:53%;border-radius:10px">
        <img id="boy" src="__IMAGES__/scb.png" style="width:100%;height:auto" onclick="change_2(this)">
        <b style="font-size:40px;position:absolute;left:35%;top:50%">48题</b>
     </div>
     
     <input type="hidden" id="type" value="1">
     <!--<div id="go_test" style="width:660px;height:90px;position:absolute;top:71%;left:5%;" onclick="go_ques()"></div>-->
     <div id="go_test" style="width: 660px; height: 90px; position: absolute; top: 78%; left: 5%;background:#FFF;color:#5c89de;font-size:30px;text-align:center;line-height:90px;border-radius:5px" onclick="go_ques()">立即测试</div>
  </div>
       
</body>
</html>

