
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
    
</head>

<body style="overflow-x:hidden">

<section class="header" style="background:#FFF url(__IMAGES__/log_icon.png) no-repeat center /auto 80px;z-index:9999">
    <!-- <div class="header_r"></div> -->
    <div class="header_l header_nva" style="color:#2c7677;background:url('__IMAGES__/head_l.png') no-repeat left center">目录</div>
    <a href="{:U('Index/index')}"></a>
</section>
<section class="nav_con" style="background:#267476;opacity:1;z-index:9999">
    <ul>
        <li class="h_title" style="color:#40d7d9"><span></span>新闻中心<span></span></li>
        <li class="h_list"><a href="{:U('News/jtyw')}">集团要闻</a><a href="{:U('News/jddt')}">基地动态</a><a href="{:U('News/cydt')}">产业动态</a><div class="clear"></div>
        </li>
        <li class="h_title" style="color:#40d7d9"><span></span>世外乡村<span></span></li>
        <li class="h_list"><a href="{:U('Index/mation',array('sign'=>'集团简介'))}">集团简介</a><a href="{:U('Index/mation',array('sign'=>'董事长寄语'))}">董事长寄语</a><a href="{:U('Index/mation',array('sign'=>'集团荣誉'))}">集团荣誉</a><a href="{:U('Index/mation',array('sign'=>'企业文化'))}">企业文化</a><a href="https://www.ximalaya.com/zhubo/263492752/?mid=1&navId=45&lang=zh">世外之声</a><div class="clear"></div>
        </li>
        <li class="h_title" style="color:#40d7d9"><span></span>世外康养<span></span></li>
        <li class="h_list"><a href="{:U('Index/mation',array('sign'=>'世外康养'))}">世外康养</a><a href="{:U('Index/mation',array('sign'=>'世外宣传片'))}">世外宣传片</a><a href="{:U('Index/mation',array('sign'=>'世外内刊'))}">世外内刊</a><div class="clear"></div></li>
        <li class="h_title" style="color:#40d7d9"><span></span>康养服务<span></span></li>
        <li class="h_list"><a href="{:U('Index/mation',array('sign'=>'世外生活服务'))}">世外生活服务</a><a href="{:U('Index/mation',array('sign'=>'世外医养服务'))}">世外医养服务</a><a href="{:U('Index/mation',array('sign'=>'世外悦享服务'))}">世外悦享服务</a><div class="clear"></div>
        </li>
        <li class="h_title" style="color:#40d7d9"><span></span>康养基地<span></span></li>
        <li class="h_list"><a href="{:U('Healthbase/information',array('sign'=>'海子山'))}">海子山</a><a href="{:U('Healthbase/information',array('sign'=>'勐赫小镇'))}">勐赫小镇</a><a href="{:U('Healthbase/information',array('sign'=>'天鹅堡.缇香湖'))}">天鹅堡.缇香湖</a><a href="{:U('Healthbase/information',array('sign'=>'天鹅堡'))}">天鹅堡</a><div class="clear"></div>
        </li>
        <li class="h_title" style="color:#40d7d9"><span></span>世外会员<span></span></li>
        <li class="h_list"><a href="{:U('Index/mation',array('sign'=>'世外会员介绍'))}">世外会员介绍</a><div class="clear"></div>
        </li>
        
        
    </ul>
</section>


<script type="text/javascript">
    $(function () {
        $(".header_l").click(function () {
            if ($(this).hasClass("header_close")) {
                $(".nav_con").slideUp(200);
                $(this).removeClass("header_close");
            }
            else {
                $(".nav_con").slideDown(200);
                $(".header_l").addClass("header_close");
            }
        });

        $(".header_r").click(function () {
            $(".code_img_con img").css({"width":"50%","float":"left"});
            $("#txtImg2").show();
            $("#txtImg").attr("src", "../Images/cod_img_01.jpg");
            $(".code_con").fadeIn(200);
        });

        $(".code_close").click(function () {
            $(".code_con").fadeOut(200);
            $("#txtImg2").hide();
        });
    });

    function yyShow()
    {
        $(".code_img_con img").css({ "width": "100%", "float": "none" });
        $("#txtImg2").hide();
        $("#txtImg").attr("src", "../Images/yy_img.jpg");
        $(".code_con").fadeIn(200);
    }
</script>


<div class="title" style="width:100%; height:50px;float:left;text-align:center;margin-top:10px;font-size:20px; font-weight: bold; color:#0F2B38; background:#f3f3f3;line-height:50px;">
  {$info.title}
</div>

<div class="title" style="width:100%; height:auto;float:left;text-align:center;margin-top:30px; ">
  <img src="__ROOT__/{$info.picture}">
</div>

<div class="content" style="width:100%; height:auto; float:left;margin-top:20px;text-align:center">

 {$info.content}
   
</div>



<include file="Public:footer" />

</body>
</html>
