

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	世外乡村 - 官方网站
</title>
<meta content="麓世外乡村" name="description" />

<link href="__STYLE__/base.css" rel="stylesheet" />
<link href="__STYLE__/content01.css" rel="stylesheet" />
<script src="__JS__/jquery-1.9.1.min.js"></script>
	<style>
	    .cln2_con .cln2_div .cln2_ul{width:22%;}
	    .header .cln_con .cln1_con{height:21px;overflow:hidden;}
	    .header .cln_con .cln1_con .a_con{vertical-align:top;}
	    .header .cln_con .cln1_con span.a_con a,.header .cln_con .cln1_con span.a_con a>em{display:block;}
	    .cln2_con .cln2_div .cln2_ul ul {display:block;}
	    .cln2_con .cln2_div .cln2_ul ul li a,.cln2_con .cln2_div .cln2_ul ul li a>em{display:block; margin-right:15px;}
	    .cln2_con .cln2_div .cln2_ul ul li.first{overflow:hidden;height:24px; line-height:24px; min-height:24px; max-height:24px;margin-bottom:15px; padding:0 0px;}
	    .cln2_con .cln2_div .cln2_ul ul li.first a,.cln2_con .cln2_div .cln2_ul ul li.first a>em{margin-right:0;}
	    .cln2_con .cln2_div .cln2_ul ul li a{padding:0 10px;}
	    .cln2_con .cln2_div .cln2_ul ul li {height:24px; line-height:24px; min-height:24px; max-height:24px; overflow:hidden; margin-bottom:10px; padding:0 0px;}
	</style>
	<script type="text/javascript">
	    $(function () {
	        $(".header .cln_con .cln1_con span.a_con").hover(function () {
	            $(this).find("a").animate({ marginTop: "-21px" }, 200);
	        }, function () {
	            $(this).find("a").animate({ marginTop: "0px" }, 300);
	        });
	        $(".cln2_con .cln2_div .cln2_ul ul li").hover(function () {
	            $(this).find("a").animate({ marginTop: "-24px" }, 200);
	        }, function () {
	            $(this).find("a").animate({ marginTop: "0px" }, 300);
	        });
	    })
	</script>

	<script type="text/javascript">    
	 $(function(){
	 	if(/Android |webOS |iPhone |iPod|BlackBerry /i.test(navigator.userAgent)){
	 		var dir='__URL__';
	 		var path=dir.split('/Home');
	 		window.location=path[0]+"/Mobile/Index/index";
	 	}
	 	else{

	 	}
	 });     
      
     function type_turn(obj)
     {
     	var path="__URL__";
     	
        window.location=path+"/"+obj+"/page/1";
     }
     
     $(function(){
    	  var w=document.body.clientWidth;
    	  var cha=parseInt(parseInt(w)-1420);
    	  var left=(cha/2);
    	  $('.category').css('marginLeft',left);
    	  $('.content').css('marginLeft',left);
       });
    </script>  
 
 <style>
  .content img{
  	width:100%;
  	height:auto;
  }
 </style>
</head>
<body style="overflow-x:hidden">

 <include file="Public:header" />

<?php $action=$_GET['type'];?>
<div class="category" style="width:1420px; height:48px; background:#efeded;">
   <div style="width:240px; height:46px; float:left;text-align:center;line-height:46px;color:#000; font-size:14px; font-family:'苹方中黑';margin-left:2%;cursor:pointer">
     <a href="{:U('Index/index')}" style="color:#000">首页</a> > <?=$_GET['menu']?>  > <?=$_GET['sign']?> 
   </div>
  
</div>



<div class="content" style="width:1420px; height:auto; float:left; margin-top:20px;text-align:left;font-family:'微软雅黑'">

 {$info.content}
   
</div>



<include file="Public:footer" />

</body>
</html>
