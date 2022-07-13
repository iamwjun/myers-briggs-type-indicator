

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>世外乡村 - 官方网站</title>
    <!--公共的引用-->
    <meta http-equiv="Content-Type" content="textml; charset=utf-8" /><meta name="viewport" content="target-densitydpi=device-dpi, width=720px, user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="white" /><meta name="msapplication-tap-highlight" content="no" /><meta name="format-detection" content="telephone=no" />
    <!--样式-->
    <link href="__STYLE__/base.css" rel="stylesheet" />
    <link href="__STYLE__/common.css" rel="stylesheet" />
    <link href="__STYLE__/content.css" rel="stylesheet" />
    <!--JQ-->
    <script src="http://code.jquery.com/jquery-1.4.min.js"></script>
    <style type="text/css">
       .home_bottom_txt .bottom_txt a{font-size:22px;}
    </style>
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
      
      function turn(obj)
      {
          var dir='__URL__';
          var path=dir.split('/Mobile');
          window.location=path[0]+"/Mobile/News/"+obj;
      }
    </script>  
    
</head>
<body style="overflow-x:hidden">

        
<include file="Public:header_m" />


<div class="news" style="width:100%; height:120px;float:left;text-align:center;margin-top:90px;">
  <!-- <img src="__IMAGES__/news.png"> -->
  <div style="width:100%; height:80px;float:left;z-index:999999">
     <a href="{:U('News/jtyw')}" style="width:33.3%;height:80px;float:left;text-align:center;line-height:88px;color:#2c7679; padding:0;font-size:24px;<?php if($Think.ACTION_NAME=='jtyw'){ ?>border-bottom:2px solid #2c7679;<?php }?>">集团要闻</a>
     <a href="{:U('News/jddt')}" style="width:33.3%;height:80px;float:left;text-align:center;line-height:88px;color:#2c7679; padding:0;font-size:24px;<?php if($Think.ACTION_NAME=='jddt'){ ?>border-bottom:2px solid #2c7679;<?php }?>">基地动态</a>
    <a href="{:U('News/cydt')}" style="width:33.3%;height:80px;float:left;text-align:center;line-height:88px;color:#2c7679; padding:0;font-size:24px;<?php if($Think.ACTION_NAME=='cydt'){ ?>border-bottom:2px solid #2c7679;<?php }?>">产业动态</a>
  </div>
</div>


<div style="width:100%; min-height:580px">
    <volist name="list" id="vo">
        <a href="{:U('News/info',array('id'=>$vo['id']))}" style="padding:0;display:block">
            <div style="width:96%;height:210px;float:left; margin-left:2%;">
              <div style="width:30%;height:150px;float:left"><img src="__ROOT__/{$vo.picture}" style="width:200px;height:150px"></div>
              <div style="width:70%;height:150px;float:left">
                 <div style="width:100%; height:60px;font-size:22px;color:#000;font-weight:bold;font-family:'微软雅黑';overflow:hidden">{$vo.title}</div>
                 <div style="width:100%; height:74px;font-size:18px;color:#000;line-height:24px;float:left;font-family:'微软雅黑';overflow:hidden;margin-top:12px">{$vo.content}</div>
              </div>

              <div style="width:100%;height:50px;float:left;border-bottom:1px solid lightgray">
                <span style="float:left; margin:20px 0px 0px 0px;font-size:16px">{$vo.create_time|date="Y/m/d",###}</span>
                <img src="__IMAGES__/turn.png" style="float:right;margin:9px 0px 0px 0px">
              </div>
            </div>
        </a>
    </volist>
</div>


<include file="Public:footer_m" />

       
</body>
</html>
<script>
    
</script>

