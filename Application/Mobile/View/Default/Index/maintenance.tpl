<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>设备维保-{$config.web_title}</title>
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
	   $.getJSON("{:U('Index/show_repair')}",{type: 4},function(json){
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
	     $.getJSON("{:U('Index/show_repair')}",{type: 4},function(json){
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
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">设备维保</h1>
		<a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="javascript:;"></a>
	</header>
	<div id="header_bg"></div>
	<!--右上角弹出菜单-->
	<div id="topPopover" class="mui-popover mui-active">
		<div class="mui-backdrop"></div>
		<div class="topPopover_head">
			<a id="close_topPopover" href="" class="mui-action-menu mui-icon iconfont icon-chacha mui-pull-right"></a>
		</div>
		<div class="mui-popover-arrow"></div>
		<div class="mui-scroll-wrapper">
			<div class="mui-scroll">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a href="{:U('Article/about_us')}">关于我们</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/agreement')}">服务协议</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/service_flow')}">服务流程</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/member_notes')}">会员须知</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/privacy')}">隐私说明</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/help')}">使用帮助</a>
					</li>
					<li class="mui-table-view-cell"><a href="{:U('Article/contact_us')}">联系我们</a>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	<!--安装培训-->
	<div class="apply_repair">
		<div class="apply_repair_box">
			<div class="apply_repair_title">维修类型</div>
			<div class="apply_repair_type">维保升级</div>
			<input type="hidden" name="" id="project_tpye" value="3" />
			<div class="apply_repair_ul">
				<ul>
					<li id="equipment">
						<div class="mui-input-row mui-radio mui-left">
							<label>单设备</label>
							<input name="radio1" type="radio" checked="checked" value="0" id="single_equipment">
						</div> 
						<div class="mui-input-row mui-radio mui-left">
							<label>批量</label>
							<input name="radio1" type="radio" id="batch_equipment" value="1">
						</div>
					</li>
					<li id="batch_equipment_box">
						<textarea name="" rows="" cols="" id="Device_Info" placeholder="请填写设备名称、型号等基本信息"></textarea>
						<p>请填写设备名称、型号等基本信息，平台客服人员在接收到您提交的订单后，会立即与您联系。</p>
					</li>
					<div id="single_equipment_box">
					<li>
						<div class="mui-input-row">
							<label>设备名称:</label>
							<input type="text" id="device_name" placeholder="请输入设备名称">
						</div>
					</li>
					<li>
						<div class="mui-input-row">
							<label>设备型号:</label>
							<input type="text" id="device_type" placeholder="请输入设备型号">
						</div>
					</li>
					<li>
						<div class="mui-input-row">
							<label>设备编号:</label>
							<input type="text" id="device_number" placeholder="请输入设备编号">
						</div>
					</li>
					</div>
				</ul>
			</div>
		</div>
		<div class="apply_repair_box">
			<div class="apply_repair_title">维修地址</div>
			<div class="apply_repair_ul">
				<ul>
					<li>
						<div class="mui-input-row">
							<label>所在地区:</label>
							<input type="text" id="city_address" value="正在定位">
						</div>
						<i class="mui-icon iconfont icon-dizhi"></i>
					</li>
					<li>
						<div class="mui-input-row">
							<label>详细地址:</label>
							<input type="text" id="detail_address" placeholder="请输入详细地址">
						</div>
					</li>
					<li id='demo2' data-options='{"type":"date","beginYear":1000,"endYear":5000}' class="btn">
						<div class="mui-input-row">
							<label>预约时间:</label>
							<input type="text" placeholder="请选择上门时间" id="time_val">
						</div>
						<i class="mui-icon mui-icon-forward"></i>
					</li>
				</ul>
				
			</div>
		</div>
		<div class="apply_repair_box">
			<div class="apply_repair_ul">
				<ul>
					<li id="user">
						<div class="mui-input-row mui-radio mui-left">
							<label>单位用户</label>
							<input name="user_type" type="radio" value="0" checked="checked" id="unit_user">
						</div> 
						<div class="mui-input-row mui-radio mui-left">
							<label>个人用户</label>
							<input name="user_type" type="radio" value="1" id="personal_user">
						</div>
					</li>
					<li id="unit_user_name">
						<div class="mui-input-row">
							<label>单位名称:</label>
							<input type="text" id="company_name" placeholder="请输入单位名称">
						</div>
					</li>
					<li>
						<div class="mui-input-row">
							<label>联  系  人 :</label>
							<input type="text" id="contact_name" placeholder="请输入姓名">
						</div>
					</li>
					<li>
						<div class="mui-input-row">
							<label>联系方式:</label>
							<input type="text" id="tel" placeholder="请输入联系方式">
						</div>
					</li>
				</ul>
			</div>
		</div>
		
        <div class="order_details order_details_message">
			<ul>
				<li>
					<label>发票类型：</label>
					<div class="mui-input-row mui-radio mui-left">
						<i>普通发票</i>
						<input name="bill_type" type="radio" id="plain_invoice" checked="checked" onclick="$('#fp_type').val(0);$('#added_value_tax').css('display','none');$('#debit_note_type').css('display','block');$('#plain_tax').css('display','block')" value="0">
					</div> 
					<div class="mui-input-row mui-radio mui-left">
						<i>增值税发票</i>
						<input name="bill_type" type="radio" id="added_value_invoice" onclick="$('#fp_type').val({$fp_info['id']});$('#added_value_tax').css('display','block');$('#debit_note_type').css('display','none');$('#plain_tax').css('display','none')" value="1">
					</div>
					<input type="hidden" name="fp_type" value="0" id="fp_type">
				</li>
				<li id="debit_note_type">
					<label>发票抬头：</label>
					<div class="mui-input-row mui-radio mui-left">
						<i>个人</i>
						<input name="user_types" type="radio" onclick="$('#fp_top').val('个人')" checked="checked" value="0">
					</div> 
					<div class="mui-input-row mui-radio mui-left">
						<i>单位</i>
						<input name="user_types" type="radio" onclick="$('#fp_top').val('单位')" value="1">
					</div>
					<input type="hidden" name="fp_top" value="个人" id="fp_top">
				</li>
				<div id="added_value_tax" style="display: none;">
				<if condition="$fp_cont eq 0">
					<li>
						<label>您没有设置相关发票信息，请点击下面按钮前往设置！</label>
						<a href="{:U('Member/invoice')}">发票管理</a>
					</li>
				<else />
					<li>
						<label>发票抬头：</label>
						<p>{$fp_info.fp_top}</p>
					</li>
					<li>
						<label>税务登记证号：</label>
						<p>{$fp_info.sw_number}</p>
					</li>
					<li>
						<label>基本开户银行名称：</label>
						<p>{$fp_info.bank_name}</p>
					</li>
					<li>
						<label>基本开户账号：</label>
						<p>{$fp_info.bank_id}</p>
					</li>
					<li>
						<label>注册场所地址：</label>
						<p>{$fp_info.address}</p>
					</li>
					<li>
						<label>注册固定电话：</label>
						<p>{$fp_info.phone}</p>
					</li>
					<li>
						<label>发票寄送地址：</label>
						<p>{$fp_info.youji_addr}</p>
					</li>
					<li>
						<label>取件人：</label>
						<p>{$fp_info.qujianren}</p>
					</li>
					<li>
						<label>联系电话：</label>
						<p>{$fp_info.tel}</p>
					</li>
				</if>
				</div>
				<div id="plain_tax">
					<div id="personal">
						<li>
							<label>个人/单位：</label>
							<input type="text" name="" id="personal_name" value="" placeholder="请填写个人/单位名称" />
						</li>
					</div>
					<div id="unit" style="display:none;">
						<li>
							<label>单位名称：</label>
							<input type="text" name="" id="unit_name" value="" placeholder="请填写单位名称" />
						</li>
					</div>
					<li>
						<label>发票内容：</label>
						<textarea name="" rows="" id="debit_note" placeholder="请输入发票内容"></textarea>
					</li>
				</div>
			</ul>
		</div>

		<div class="apply_repair_box">
			<div class="mui-input-row">
				<div class="z_photo">
					<label>上传图片:</label>
		            <form action="{:U('Index/upload_imginfo')}" method="post" enctype="multipart/form-data" target="id_iframe" style="display: none">
					  <input type="file" name="file1" id="file1" value="" onchange="upload_bill()" accept="image/*" multiple/>
					  <input type="hidden" name="types" value="4">
					  <input type="submit" name="tj_img" id="tj_img">
					</form>
					<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>
		            <div class="z_file">
		            	<div class="z_file_text">选择图片</div>
		                <input id="file" onclick="$('#file1').click()">  
		            </div>
		            <div class="mui-clearfix"></div>
		            <img id="xz_pic" onclick="show_pic()" src="" style="width:50px; height: 50px;display: none">
		            <input type="button" value="显示"  id="xx" style="display: none">
		            <div id="z_photo" style="display: none" onclick="show_pic()">
			            图片未显示请点击这里
			        </div>
		            <div class="mui-clearfix z_file_txt">图片格式jpg、png;图片大小不超过1M</div>
		      	</div>
			</div>
			<div class="apply_repair_txt">
				<textarea name="" rows="" cols="" id="diagnosis" placeholder="请填写故障描述"></textarea>
			</div>
		</div>
		
		<div class="apply_repair_submit">
			<input type="submit" id="submit_from" name="" value="发布需求" />
		</div>

	</div>
	<div id="allmap" style="display: none;"></div>
	<!--安装培训-->
	
</body>
<script src="__JS__/mui.picker.js"></script>
<script src="__JS__/mui.poppicker.js"></script>
<script src="__JS__/city.data.js" type="text/javascript" charset="utf-8"></script>
<script src="__JS__/city.data-3.js" type="text/javascript" charset="utf-8"></script>
<script src="__JS__/mui.picker.min.js"></script>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--项目申请js-->
<script src="__JS__/project_application_weibao.js" type="text/javascript" charset="utf-8"></script>

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