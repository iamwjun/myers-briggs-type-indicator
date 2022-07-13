

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

	    .content img{
	    	width:100%;
	    	height:auto;
	    }
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
    	  $('#title').css('marginLeft',left);
    	  $('.content').css('marginLeft',left);
       });
    </script>  
  <style>
   @font-face{
	 	font-family: '苹方中黑';
	 	src:url("__STYLE__/苹方中黑.ttf");
	 }
	 @font-face{
	 	font-family: '苹方黑细';
	 	src:url("__STYLE__/苹方黑细.ttf");
	 }
    .cln1_con span a{
    	font-family: '苹方中黑';
    }
    .cln2_ul ul li a{
    	font-family: '苹方黑细';
    }
  </style>
</head>
<body style="overflow-x:hidden">

 <div class="content">
		<div class="header" style="border-bottom:1px solid lightgray">
		    <div class="log_div" style="height:120px">
		        
		        <a class="log" style="height:112px"><img src="__IMAGES__/logo.png"></a>
		    </div>
		    <div class="cln_con" id="header_nav"> 
		        <div class="cln1_con" id="header_menu_list">
		            <span class="a_con a_first"><a href="{:U('Index/index')}">首页<em>Home</em></a></span>
		            <span class="a_con" hid="1"><a <?php if($Think.ACTION_NAME=='jtyw' || $Think.ACTION_NAME=='jddt' || $Think.ACTION_NAME=='cydt'){ ?>style="color:#00a4c0"<?php }?>>新闻中心<em>News Center</em></a></span>
		            <span class="a_con" hid="2"><a <?php if($_GET['menu']=='世外乡村'){ ?>style="color:#00a4c0"<?php }?>>世外乡村<em>Natural Country</em></a></span>
		            <span class="a_con" hid="3"><a <?php if($_GET['menu']=='世外康养'){ ?>style="color:#00a4c0"<?php }?>>世外康养<em>Natural Health</em></a></span>
		            <span class="a_con" hid="4"><a <?php if($_GET['menu']=='康养服务'){ ?>style="color:#00a4c0"<?php }?>>康养服务<em>Health Service</em></a></span>
		            <span class="a_con" hid="5"><a <?php if($Think.CONTROLLER_NAME=='Healthbase'){ ?>style="color:#00a4c0"<?php }?>>康养基地<em>Natural Health Base</em></a></span>
		            <span class="a_con"><a href="{:U('Index/mation',array('menu'=>'世外会员','sign'=>'世外会员介绍'))}" <?php if($_GET['menu']=='世外会员'){ ?>style="color:#00a4c0"<?php }?>>世外会员<em>Natural Member</em></a></span>
		            
		        </div>
		        <div class="cln2_con" id="header_menu_details1">
		            <div class="cln2_div">
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/jtyw',array('page'=>1))}">集团要闻<em>Group highlights</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/jddt',array('page'=>1))}">基地动态<em>Base dynamics</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/cydt',array('page'=>1))}">产业动态<em>Industrial Dynamics</em></a></li>
		                    </ul>
		                </div>
		            </div>
		            <div class="cln2_div">
		                <img src="__IMAGES__/menu5.png" />
		            </div>
		            <div class="clear"></div>
		        </div>
		        <div class="cln2_con" id="header_menu_details2">
		            <div class="cln2_div">
		                
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外乡村','sign'=>'世外百科'))}">世外百科<em>Natural world</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外乡村','sign'=>'集团简介'))}">集团简介<em>Group profile</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外乡村','sign'=>'董事长寄语'))}">董事长寄语<em>Chairman message</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外乡村','sign'=>'集团荣誉'))}">集团荣誉<em>Group honor</em></a></li>
		                    </ul>
		                </div>
		                
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外乡村','sign'=>'企业文化'))}">企业文化<em>Corporate culture</em></a></li>
		                        
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="https://www.ximalaya.com/zhubo/263492752/?mid=1&navId=45&lang=zh" target="_blank">世外之声<em>Voice of Natural</em></a></li>
		                        
		                    </ul>
		                </div>
		                
		            </div>
		            <div class="cln2_div">
		                <img src="__IMAGES__/menu10.png" />
		            </div>
		            <div class="clear"></div>
		        </div>
		        <div class="cln2_con" id="header_menu_details3">
		            <div class="cln2_div">
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外康养','sign'=>'世外康养'))}">世外康养<em>Natural Health</em></a></li>
		                    </ul>
		                </div>
		                
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外康养','sign'=>'世外宣传片'))}">世外宣传片<em>Natural trailer</em></a></li>
		                    </ul>
		                </div>

		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'世外康养','sign'=>'世外内刊'))}">世外内刊<em>Internal Journal</em></a></li>
		                    </ul>
		                </div>
		                
		            </div>
		            <div class="cln2_div">
		                <img src="__IMAGES__/menu7.png" />
		            </div>
		            <div class="clear"></div>
		        </div>
		        <div class="cln2_con" id="header_menu_details4">
		            <div class="cln2_div">
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'康养服务','sign'=>'世外生活服务'))}">世外生活服务<em>Life Service</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'康养服务','sign'=>'世外医养服务'))}">世外医养服务<em>Medical Services</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'康养服务','sign'=>'世外悦享服务'))}">世外悦享服务<em>Yuexiang Services</em></a></li>
		                    </ul>
		                </div>
		            </div>
		            <div class="cln2_div">
		                <img src="__IMAGES__/menu8.png" />
		            </div>
		            <div class="clear"></div>
		        </div>

		        <div class="cln2_con" id="header_menu_details5">
		            <div class="cln2_div">
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Healthbase/information',array('sign'=>'海子山'))}">海子山<em>Haizi Mountain</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Healthbase/information',array('sign'=>'勐赫小镇'))}">勐赫小镇<em>Menghe town</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Healthbase/information',array('sign'=>'天鹅堡.缇香湖'))}">天鹅堡.缇香湖<em>Tixiang Lake</em></a></li>
		                    </ul>
		                </div>
		                <div class="cln2_ul">
		                    <ul>
		                        <li class="first"><a href="{:U('Healthbase/information',array('sign'=>'天鹅堡'))}">天鹅堡<em>Swan Fort</em></a></li>
		                    </ul>
		                </div>
		            </div>
		            <div class="cln2_div">
		                <img src="__IMAGES__/menu9.png" />
		            </div>
		            <div class="clear"></div>
		        </div>
		        
		        <div class="clear"></div>
		    </div>
		    <div class="clear"></div>
		</div>


	<script type="text/javascript">
	/* 这里是 鼠标放上去下面展示二级菜单模块*/

	(function () {
	        var open_status = false;//true表示打开状态
	        var run_status = false;//动画运行状态，true表示正在运行
	        var run1_status = false;//nav的动画状态
	        $('.a_con').on('mouseenter', function () {
	          
	            $(".a_con a").removeClass("on");
	            $(this).children("a").addClass("on");
	            if (open_status) {
	                //打开状态
	                if (!run_status) {
	                    run_status = true;//正在运行
	                    var index = $(this).index();
	                    //$('.cln2_con').slideUp(300, function () {
	                    //    run1_status = false;
	                    //});
	                    $('.cln2_con').css({ "display": "none" });
	                    run1_status = false;
	                    $('#header_menu_details' + $(this).attr("hid")).slideDown();
	                    $("#pageback").css({ "display": "block" });
	                    run1_status = true;
	                    //打开完毕，标记状态
	                    open_status = true;
	                        run_status = false;//结束运行状态
	                }
	            } else {
	                //关闭状态
	                var index = $(this).index();
	                
	                if (!run1_status) {
	                    if (!$(this).hasClass("a_first")) {
	                        $('#header_menu_details' + $(this).attr("hid")).slideDown();
	                        $("#pageback").css({ "display": "block" });
	                        run1_status = true;
	                        //打开完毕，标记状态
	                        open_status = true;
	                    }
	                }
	            }
	        })

	        $('#header_nav').on('mouseleave', function () {
	            //鼠标离开nav区域，关闭header_menu_details
	            $('.cln2_con').slideUp(300, function () {
	                run1_status = false;
	            });
	            $("#pageback").css({ "display": "none" });
	            $(".a_con a").removeClass("on");
	            //关闭完毕`，标记状态
	            open_status = false;
	        })
	    })();//不会自动提升

	    
	</script>
	<div class="clear"></div>
</div>


<div id="title" style="width:1420px; height:50px;float:left;text-align:center;margin-top:10px;font-size:20px; font-weight: bold; color:#0F2B38; background:#f3f3f3;line-height:50px;">
  {$info.title}
</div>

<div class="title" style="width:100%; height:auto;float:left;text-align:center;margin-top:30px; ">
  <img src="__ROOT__/{$info.picture}">
</div>
<style>
.content span{
	font-family: '苹方中黑';
}
</style>
<div class="content" style="width:1420px; height:auto; float:left; margin-top:20px;text-align:left;font-family:'苹方中黑'">

 {$info.content}
   
</div>



<include file="Public:footer" />

</body>
</html>
