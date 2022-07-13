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

<!--banner-->
<!-- <div class="banner" style="margin-top:100px">
 
       <link href="__STYLE__/css.css" rel="stylesheet" type="text/css" />
		<script src="__JS__/jquery-1.11.1.min.js" type="text/javascript" ></script>

		<div id="solid" style="width:750px; height:375px; text-align:center;margin-left:-16px">
		    
		    <ul>
            <volist name="focus" id="vo">
		        <li><img src="__ROOT__/{$vo.picture}" style="width:750px;height:450px" /></li>
		    </volist>
		    </ul>
		    <div id="btt" style="left:45%;top:400px"><span></span> <span></span> <span></span><span></span></div>
		</div>
		<script src="__JS__/fordboy.js"></script>
</div> -->



<div class="banner" style="width:1420px; margin-left:-28px">


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