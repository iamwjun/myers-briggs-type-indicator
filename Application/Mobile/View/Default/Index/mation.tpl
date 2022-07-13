

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
      
    </script>  
    <style>
      .content{
      	width:90%;
      	height: auto;
      	text-align: left;
      	align-items: center;
      	display:inline-block;
        line-height: 35px;
        font-family: "微软雅黑";
      	margin-left:5%;
      }
      .content img{
      	width:100%; 
      	height:auto;
      	float:left;
      	text-align:center;
      }
      .content p{
        font-size: 24px;
        font-family: "微软雅黑";
      }
    </style>
</head>
<body style="overflow-x:hidden">

        
<include file="Public:header_m" />


<div class="title" style="width:90%; margin-left: 5%; height:80px;float:left;text-align:center;margin-top:120px;font-size:30px;font-weight:bold">
  {$info.title}
</div>

<div class="content">
  {$info.content}
</div>


<include file="Public:footer_m" />


       
</body>
</html>
<script>
    
</script>

