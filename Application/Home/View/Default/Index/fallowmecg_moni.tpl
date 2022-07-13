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


	 function buy_ct(obj)
	 {
	 	$(obj).next().css({'background':'#FFF','color':'#f00'});
	 	$(obj).css({'background':'#f00','color':'#FFF'});
        $('.buy').css('display','block');
	 	$('.sell').css('display','none');
	 }
	 function sell_ct(obj)
	 {
	 	$(obj).prev().css({'background':'#FFF','color':'#f00'});
	 	$(obj).css({'background':'#f00','color':'#FFF'});
	 	$('.buy').css('display','none');
	 	$('.sell').css('display','block');
	 }
	</script>
</head>
<body style="background:#f2f2f2">
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
	
	
	<div class="apply_repair" style="background:#FFF">

		<div style="width:100%; height:50px; background:#f00; line-height:50px; text-align:center; color:#FFF; font-size:16px">
          模拟炒股
		</div>

		<div style="width:100%; height:55px; background:#f2f2f2">
			<ul>
              <a href="{:U('Index/fallowmecg')}" style="color:#000"><li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px">牛人榜</li></a>
              <li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px; color:#f00; border-bottom:3px solid #f00">模拟炒股</li>
              <a href="{:U('Index/fallowmecg',array('typeid'=>'2'))}" style="color:#000"><li style="width:33%; text-align:center; line-height:55px;float:left;font-size:14px">我的战绩</li></a>
			</ul>
		</div>
        
        <div style="width:100%; height:40px; margin-top:12px; background:#FFF">
          <div style="width:50%; height:40px; line-height:40px; text-align:center; color:#FFF; background:#f00; border:1px solid #f00; font-size:14px; float:left" onclick="buy_ct(this)">买入</div>
          <div style="width:50%; height:40px; line-height:40px; text-align:center; color:#f00; font-size:14px; border:1px solid #f00; float:left" onclick="sell_ct(this)">卖出</div>
        </div>

        <div class="buy">
	        <div style="width:100%; height:auto; text-align:center; line-height:36px; float:left; padding-top:30px; background:#FFF; padding-bottom:12px">
	           <ul>
	             <li><label style="color:gray;font-size:14px;">股票代码</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">股票名称</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">买入价格</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">可买股数</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">买入数量</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">资金金额</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px; color:#000" value="1000000"></li>
	           </ul>

	           <input type="button" value="确认买入" style="width:280px; height:40px; padding:10px 50px; color:#FFF; font-size:14px; background:#f00; border:0; border-radius:5px">
	        </div>

	        <div style="width:100%; height:40px; background:#FFF; color:#000; float:left; margin-top:12px;">
	        	<ul style=" margin:12px 0px 0px 28px">
	              <li style="width:23%; font-size:14px; color:#000; float:left">股票名称</li>
	              <li style="width:22%; font-size:14px; color:#000; float:left">成本价</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">现价</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">亏盈</li>
	              <li style="width:19%; font-size:14px; color:#000; float:left">股数</li>
	        	</ul>
	        </div>
	        <div style="width:100%; height:40px; color:#000; float:left; font-size:14px; line-height:40px; font-weight:bold; padding-left:12px">当前委托</div>
	        <div style="width:100%; height:40px; background:#FFF; color:#000; float:left;">
	        	<ul style=" margin:12px 0px 0px 28px">
	              <li style="width:23%; font-size:14px; color:#000; float:left">股票代码</li>
	              <li style="width:23%; font-size:14px; color:#000; float:left">股票名称</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">委托价</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">股数</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">状态</li>
	        	</ul>
	        </div>
        </div>

        <div class="sell" style="display:none">
	        <div style="width:100%; height:auto; text-align:center; line-height:36px; float:left; padding-top:30px; background:#FFF; padding-bottom:12px">
	           <ul>
	             <li><label style="color:gray;font-size:14px;">股票代码</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">股票名称</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">卖出价格</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">可卖股数</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">卖出数量</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px"></li>
	             <li><label style="color:gray;font-size:14px;">资金余额</label><input type="text" style="width:200px; height:36px; border:1px solid #000; margin-left:12px; color:#000" value="1000000"></li>
	           </ul>

	           <input type="button" value="确认卖出" style="width:280px; height:40px; padding:10px 50px; color:#FFF; font-size:14px; background:#f00; border:0; border-radius:5px">
	        </div>

	        <div style="width:100%; height:40px; background:#FFF; color:#000; float:left; margin-top:12px;">
	        	<ul style=" margin:12px 0px 0px 28px">
	              <li style="width:23%; font-size:14px; color:#000; float:left">股票名称</li>
	              <li style="width:22%; font-size:14px; color:#000; float:left">成本价</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">现价</li>
	              <li style="width:18%; font-size:14px; color:#000; float:left">亏盈</li>
	              <li style="width:19%; font-size:14px; color:#000; float:left">股数</li>
	        	</ul>
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