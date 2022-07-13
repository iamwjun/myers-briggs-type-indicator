

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

    function prve()
    {
      var page={$_GET['page']};
      if(page==1)
      {
         alert('已经到第一页了！');
      }
      else{
         var turn_page=Number(Number(page)-1);
         window.location="{:U('Index/jtyw')}?page="+turn_page;
      }
    }

    function next()
    {
      var page={$_GET['page']};
      var cont={$page_cont};
      if(page==cont)
      {
         alert('已经到最后一页了！');
      }
      else{
         var turn_page=Number(Number(page)+1);
         window.location="{:U('Index/jtyw')}?page="+turn_page;
      }
    } 
      
     $(function(){
        var w=document.body.clientWidth;
        var cha=parseInt(parseInt(w)-1420);
        var left=(cha/2);
        $('.category').css('marginLeft',left);
        $('.news_content').css('marginLeft',left);
        $('.pages').css('marginLeft',left);
       });
    </script>  

</head>
<body style="overflow-x:hidden">

 <include file="Public:header" />


<div class="category" style="width:1420px; height:48px; background:#efeded;">
   <a  style="width:100px; height:46px; float:left;text-align:center;line-height:46px;color:#000; font-size:14px; border-bottom:2px solid #00a4c0;font-family:'苹方中黑';margin-left:2%;cursor:pointer">集团要闻</a>
   <a href="{:U('Index/jddt',array('page'=>1))}" style="width:100px; height:46px; float:left;text-align:center;line-height:46px;color:#000; font-size:14px; font-family:'苹方中黑';margin-left:1%;cursor:pointer">基地动态</a>
   <a href="{:U('Index/cydt',array('page'=>1))}" style="width:100px; height:46px; float:left;text-align:center;line-height:46px;color:#000; font-size:14px; font-family:'苹方中黑';margin-left:1%;cursor:pointer">产业动态</a>
</div>

<div class="news" style="width:100%; height:120px;float:left;text-align:center;margin-top:30px">
  <img src="__IMAGES__/news.png">
</div>

<div class="news_content" style="width:1420px; height:auto; float:left; margin-top:20px">

<volist name="list" id="vo">
   <a href="{:U('Index/news_info',array('id'=>$vo['id'],'type'=>'jtyw'))}">
      <div style="width:335px; height:335px; float:left; margin:0px 18px 30px 0px; border:1px solid lightgray; cursor:pointer; border-radius:3px">
          <div style="width:335px; height:200px; float:left;">
          <img src="__ROOT__/{$vo.picture}" style="width:335px; height:200px;border-top-left-radius:3px; border-top-right-radius:3px">
          </div>
          <div style="width:319px; height:70px;float:left; margin-top:10px; font-size:14px; color:#3a3939; line-height: 23px; font-weight: bold; padding:8px; font-family:'微软雅黑'">{$vo.title}</div>
          <div style="width:319px; height:22px; float:left;  padding:8px; font-size:14px; line-height: 22px; color:gray;border-top:1px dashed #f1f1f1">
           <span style="color:gray">{$vo.create_time|date="Y/m/d",###}</span>
           <img src="__IMAGES__/turn.png" style="float:right">
          </div>
      </div>
   </a>
</volist>
   
</div>


<div class="pages" style="width:1420px; height:60px; float:left;text-align:center;line-height:60px">
    <a href="javascript:" style="padding:8px 20px; color:#b5b4b4; border:1px solid #b5b4b4" onclick="prve()">上一页</a>
    <?php
      for($i=1;$i<=$page_cont;$i++)
      {
    ?>
       <if condition="$_GET['page'] eq $i">
          <a href="#" style="padding:8px 13px; border:1px solid #00a4c0;background:#00a4c0; color:#FFF"><?=$i?></a>
       <else />
          <a href="{:U('Index/jtyw',array('page'=>$i))}" style="padding:8px 13px; border:1px solid #b5b4b4; color:#b5b4b4" onmouseover="this.style.background='#00a4c0';this.style.color='#FFF'" onmouseout="this.style.background='none';this.style.color='#b5b4b4'"><?=$i?></a>
       </if>
   <?php
      }
   ?>
    <a href="javascript:" style="padding:8px 20px; color:#b5b4b4; border:1px solid #b5b4b4" onclick="next()">下一页</a>
</div>

<include file="Public:footer" />

</body>
</html>
