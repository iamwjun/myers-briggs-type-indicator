<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>跟我学炒股-{$config.web_title}</title>
	<meta name="keywords" content="{$config.web_keywords}" />
	<meta name="description" content="{$config.web_description}" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <!--App自定义的css-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/app.css" />
	<link href="__STYLE__/mui.picker.css" rel="stylesheet" />
	<link href="__STYLE__/mui.poppicker.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/mui.picker.min.css" />
    <link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hAjiYxx2WoLGG7owEEwfSuv9d94dxKbD"></script>
	<script type="text/javascript">
     function upload_bill()
	 {
	   $('#tj_img').click();
	   $('#z_photo').click();
	   $('#z_photo').css('display','block');
	   $.getJSON("{:U('Index/show_repair')}",{type: 1},function(json){
	     if(json)
		 {
		   $('#z_photo').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='"+array['picture']+"' onclick='show_pic()' style='width:70px;height:70px'><input type='hidden' value='"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+",this);'></div></div>";
		     $('#z_photo').append(div);
		   });
		 }
	   });
	 }
	 function del_img(id,obj)
	 {
	 	$.ajax({
	 		type:"POST",
	 		url :"{:U('Index/del_img')}",
	 		data:"id="+id,
	 	});
	 	$(obj).parents('.z_addImg').remove();
	 }
	 function show_pic()
	 {
	     $.getJSON("{:U('Index/show_repair')}",{type: 1},function(json){
	     if(json)
		 {
		   $('#z_photo').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='"+array['picture']+"' onclick='show_pic()' style='width:70px;height:70px'><input type='hidden' value='"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+",this);'></div></div>";
		     $('#z_photo').append(div);
		   });
		 }
	   });
	 }

	 function show_mation(obj)
	 {
	 	if(obj.value=='按月收益排序')
	 	{
	 		$('.anyue').css('display','block');
	 		$('.diqu').css('display','none');
	 	}
	 	else if(obj.value=='按地区排序')
	 	{
            $('.diqu').css('display','block');
            $('.anyue').css('display','none');
	 	}
	 	else{
	 		$('.anyue').css('display','none');
	 		$('.diqu').css('display','none');
	 	}
	 }
	</script>
</head>
<body style="background:#FFF">
	<!--头部-->
	<header class="mui-bar mui-bar-nav" style="border-bottom:0">
		<!-- <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color:#FFF"></a> -->
		<h1 class="mui-title" style="color:#000; font-weight:bold">牛人榜</h1>
		<!-- <a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="javascript:;"></a> -->
	</header>
	<div id="header_bg"></div>
	<!--右上角弹出菜单-->
	<div id="topPopover" class="mui-popover mui-active">
		<div class="mui-backdrop"></div>
		<div class="topPopover_head">
			<a id="close_topPopover" href="" class="mui-action-menu mui-icon iconfont icon-chacha mui-pull-right"></a>
		</div>
		<div class="mui-popover-arrow"></div>


	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	
	<div class="apply_repair">
		
		<div style="width:100%; height:55px; background:#f2f2f2">
			<ul>
              <li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px; color:#f00; border-bottom:3px solid #f00">牛人榜</li>
              <a href="{:U('Index/fallowmecg',array('typeid'=>'1'))}" style="color:#000"><li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px">模拟炒股</li></a>
              <a href="{:U('Index/fallowmecg',array('typeid'=>'2'))}" style="color:#000"><li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px">我的战绩</li></a>
			</ul>
		</div>

		<div style="width:100%; height:45px; border-bottom:1px solid #efe8e8; font-size:14px; color:#000; text-align:left; float:left; line-height:45px; padding-left:12px">
			<span style="float:left">排序：</span>
			<select style="color:#f00; width:120px; height:45px; float:left; background:0;margin-left:-12px" onchange="show_mation(this)">
              <option value="按总收益排序">按总收益排序</option>
              <option value="按月收益排序">按月收益排序</option>
              <option value="按地区排序">按地区排序</option>
			</select>
			<img src="__IMAGES__/down.png" style="width:12px; height:12px; margin:0px 0px -3px -15px">
		</div>

        <div class="anyue" style="display:none">
            <div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">龙敏</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">赵琳可</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">王琴</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">姚星</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>

			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">陈雪娇</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>

			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">龙杰</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
        </div>

        <div class="diqu" style="display:none">
            <div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">高晨浩</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">李新莲</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">王倩</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">李沁雪</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>

			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">陈雪娇</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>

			<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
				<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
				<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
					<div style="font-size:14px; color:#000; float:left">张旭阳</div><br>
					<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
					<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
				</div>
				<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
					<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
					<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
						<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
						<span style="float:right; margin-right:15px">关注</span>
					</div>
				</div>
			</div>
        </div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">杨柯</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">张雪傲</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">李慧</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">张扬</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">杨雪</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">谢龙</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">王明浩</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">赵一鸣</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

		<div class="peson_info" style="width:100%; height:105px; border-bottom:1px solid #efe8e8; float:left;">
			<div class="img" style="width:20%; height:105px; line-height:105px; text-align:center; float:left"><img src="__IMAGES__/default.jpg" style="width:60px; height:60px;margin-top:22%"></div>
			<div class="cont" style="width:50%; height:105px; text-align:left; padding:20px 0px 0px 10px; float:left">
				<div style="font-size:14px; color:#000; float:left">隆昌镇</div><br>
				<div style="font-size:14px; color:gray; float:left">总收益：<label style="color:#f00">0.00%</label></div><br>
				<div style="font-size:14px; color:gray; float:left">最近月收益：<label style="color:#f00">0.00%</div></span>
			</div>
			<div class="flow" style="width:30%; height:105px; float:left; padding-top:12px;">
				<label style="color:gray; font-size:14px; margin-left:12px"><span style="color:red">0</span>人已关注</label>
				<div style="width:90px; height:40px; border-radius:8px; border:1px solid red; color:red; font-size:14px; padding:10px 0px 0px 12px; margin-top:8px" onclick="$(this).css({'background':'#b1aeae','border':'0','color':'#FFF'})">
					<img src="__IMAGES__/my-select.png" style="width:20px; height:20px">
					<span style="float:right; margin-right:15px">关注</span>
				</div>
			</div>
		</div>

	</div>
	<div id="allmap" style="display: none;"></div>
	<div style="width:100%; float:left; margin-bottom:60px"></div>
	<!--底部导航-->
	<include file="Public:footer" />
	
</body>
<script src="__JS__/mui.picker.js"></script>
<script src="__JS__/mui.poppicker.js"></script>
<script src="__JS__/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="__JS__/city.data-3.js" type="text/javascript" charset="utf-8"></script>
<script src="__JS__/mui.picker.min.js"></script>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--项目申请js-->
<script src="__JS__/project_application.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
//地址时间联动
(function($, doc) {
	$.init();
	$.ready(function() {
		/**
		 * 获取对象属性的值
		 * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
		 * @param {Object} obj 对象
		 * @param {String} param 属性名
		 */
		var _getParam = function(obj, param) {
			return obj[param] || '';
		};
		//					//级联示例
		var cityPicker3 = new $.PopPicker({
			layer: 3
		});
		cityPicker3.setData(cityData3);
		var showCityPickerButton = doc.getElementById('city_address');
		var cityResult3 = doc.getElementById('city_address');
		showCityPickerButton.addEventListener('tap', function(event) {
			cityPicker3.show(function(items) {
				cityResult3.value = _getParam(items[0], 'text') + _getParam(items[1], 'text')  + _getParam(items[2], 'text');
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
	});
})(mui, document);

(function($) {
	$.init();
	//var result = $('#result')[0];
	var time_val =$('#time_val')[0];
	var btns = $('.btn');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var optionsJson = this.getAttribute('data-options') || '{}';
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute('id');
			/*
			 * 首次显示时实例化组件
			 * 示例为了简洁，将 options 放在了按钮的 dom 上
			 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
			 */
			var picker = new $.DtPicker(options);
			picker.show(function(rs) {
				/*
				 * rs.value 拼合后的 value
				 * rs.text 拼合后的 text
				 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
				 * rs.m 月，用法同年
				 * rs.d 日，用法同年
				 * rs.h 时，用法同年
				 * rs.i 分（minutes 的第二个字母），用法同年
				 */
				//result.innerText = '选择结果: ' + rs.text;
				//result.innerText = rs.y.text+'年'+rs.m.text+'月'+rs.d.text+'日';
				time_val.value = rs.text;
				/* 
				 * 返回 false 可以阻止选择框的关闭
				 * return false;
				 */
				/*
				 * 释放组件资源，释放后将将不能再操作组件
				 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
				 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
				 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
				 */
				picker.dispose();
			});
		}, false);
	});
})(mui);
</script>
</html>