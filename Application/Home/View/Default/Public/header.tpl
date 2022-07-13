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
 font-family:'苹方中黑';
}
.cln2_ul ul li a{
 font-family:'苹方黑细';
}
</style>
<script>
    $(function(){
    	  var w=document.body.clientWidth;
    	  var h=document.body.clientHeight;
    	  var cha=parseInt(parseInt(w)-1420);
    	  var left=cha/2;
    	  $('.banner').css('marginLeft',left);

    	  var ml=parseInt(parseInt(w)-710)/2;
    	  var mt=parseInt(parseInt(h)-475)/2;
    	  $('.show_design').css('marginLeft',ml);
    	  $('.show_design').css('marginTop',mt);
       });
    </script>  
</script>
    <div class="bgs" style="width:2000px;height:3000px;background:rgba(000,000,000,0.6);position:absolute;z-index:9999;left:0;display:none">
        <div class="show_design" style="width:710px;height:475px;border:5px solid #2c7679;position:fixed; z-index:99999;opacity:1;background:url('__IMAGES__/guanzhu1.jpg')">
           <div style="width:38px;height:38px;color:#FFF;font-weight:bold;float:right;background:#2c7679;font-size:22px;cursor:pointer;line-height:38px;text-align:center" onclick="$('.bgs').css('display','none')">╳</div>
        </div>
    </div>

    <div class="bgs1" style="width:2000px;height:3000px;background:rgba(000,000,000,0.6);position:absolute;z-index:9999;left:0;display:none">
        <div class="show_design" style="width:710px;height:475px;border:5px solid #2c7679;position:fixed; z-index:99999;opacity:1;background:url('__IMAGES__/yuyue1.jpg')">
           <div style="width:38px;height:38px;color:#FFF;font-weight:bold;float:right;background:#2c7679;font-size:22px;cursor:pointer;line-height:38px;text-align:center" onclick="$('.bgs1').css('display','none')">╳</div>
        </div>
    </div>
<div class="content">
		<div class="header">
		    <div class="log_div" style="height:120px">
		        <img src="__IMAGES__/yuyue.png" style="width:130px;height:50px;float:left;cursor:pointer;margin-top:65px" onclick="$('.bgs1').css('display','block')">
		        <a class="log" style="height:112px"><img src="__IMAGES__/logo.png"></a>
		        <img src="__IMAGES__/guanzhu.png" style="width:130px;height:50px;float:right;cursor:pointer;margin-top:65px" onclick="$('.bgs').css('display','block')">
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
		                        <li class="first"><a href="{:U('Index/mation',array('menu'=>'康养服务','sign'=>'世外乐享服务'))}">世外乐享服务<em>Yuexiang Services</em></a></li>
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
	            //关闭完毕，标记状态
	            open_status = false;
	        })
	    })();//不会自动提升

	    
	</script>
	<div class="clear"></div>
</div>


<div class="banner" style="width:1420px;align-items:center;display:flex">

	<!--

	  <link href="__STYLE__/css.css" rel="stylesheet" type="text/css" />
		<script src="__JS__/jquery-1.11.1.min.js" type="text/javascript" ></script>

		<div id="solid" style="width:100%; height:520px; text-align:center;margin-left:-255px">
		    
		    <ul>
			    <volist name="focus" id="vo">
			        <li><img src="__ROOT__/{$vo.picture}" style="width:1420px;height:520px" /></li>
			    </volist>
		    </ul>
		    <div id="btt" style="left:65%;top:470px"><span></span> <span></span> <span></span><span></span></div>
		</div>
		<script src="__JS__/fordboy.js"></script>
	-->
	
	<link type="text/css" href="__STYLE__/css_newfocus.css" rel="stylesheet" />

	<div id="focus">
		<ul>
    		<volist name="focus" id="vo">
              <li><a href="#"><img src="__ROOT__/{$vo.picture}" /></a></li>
    		</volist>
		</ul>
	</div>
	<script type="text/javascript" src="__JS__/zepto.min.js"></script>
	<script type="text/javascript" src="__JS__/script.js"></script>

</div>