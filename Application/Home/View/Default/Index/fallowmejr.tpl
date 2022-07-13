<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>跟我学金融-{$config.web_title}</title>
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
	</script>
</head>
<body style="background:#FFF">
	<!--头部-->
	<header class="mui-bar mui-bar-nav" style="background:#e64343">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color:#FFF"></a>
		<h1 class="mui-title" style="color:#FFF">跟我学金融</h1>
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
	
	<!--申请报修-->
	<div class="apply_repair">
		
		<ul>
		    <li style="width:30%; height:70px; float:left; margin:23px 2% 12px 1.2%; background:#fff">
               <a href="{:U('Index/repair',array('cid'=>0))}">
	             	<div style="text-align:center; height: 50px; font-size:13px; color:#333">
	                    <img src="__IMAGES__/menu.png" style="width:50px; height:50px;">
	             	</div>
	             	<div style="text-align:center; height:20px; line-height:20px; color:#000; font-size:12px; font-family:'正楷'">全部更新</div>
             	</a>
            </li>
	       <volist name="nav" id="vo">
	             <li style="width:30%; height:70px; float:left; margin:23px 2% 12px 1.2%; background:#fff">
	               <a href="{:U('Index/repair',array('cid'=>$vo['id']))}">
		             	<div style="text-align:center; height: 50px; font-size:13px; color:#333">
		                    <img src="__IMAGES__/menu.png" style="width:50px; height:50px;">
		             	</div>
		             	<div style="text-align:center; height:20px; line-height:20px; color:#000; font-size:12px; font-family:'正楷'">{$vo.title}</div>
	             	</a>
	             </li>
	        </volist>
	    </ul>

	</div>
	<div id="allmap" style="display: none;"></div>

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