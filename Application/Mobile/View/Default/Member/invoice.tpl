<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>发票管理</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="__JS__/mui.min.js"></script>
    <link href="__STYLE__/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="__STYLE__/style.css"/>
    <!--[if lt ie 9]> 
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="__STYLE__/iconfont.css"/>
	<script type="text/javascript">
     function upload_bill()
	 {
	   $('#tj_img').click();
	   $('#z_photo').click();
	   $('#z_photo').css('display','block');
	   $.getJSON("{:U('Index/show_repair')}",{type: 333333},function(json){
	     if(json)
		 {
		   $('#z_photo').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo').append(div);
		   });
		 }
	   });
	 }
	 function del_img(id)
	 {
	 	$.ajax({
	 		type:"POST",
	 		url :"{:U('Member/del_img')}",
	 		data:"id="+id,
	 	});
	 }
	 function show_pic()
	 {
	     $.getJSON("{:U('Index/show_repair')}",{type: 333333},function(json){
	     if(json)
		 {
		   $('#z_photo').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo').append(div);
		   });
		 }
	   });
	 }
	 function upload_bill_1()
	 {
	   $('#tj_img_1').click();
	   $('#z_photo_1').click();
	   $('#z_photo_1').css('display','block');
	   $.getJSON("{:U('Index/show_repair')}",{type: 555555},function(json){
	     if(json)
		 {
		   $('#z_photo_1').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic_1()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo_1').append(div);
		   });
		 }
	   });
	 }
	 function show_pic_1()
	 {
	     $.getJSON("{:U('Index/show_repair')}",{type: 555555},function(json){
	     if(json)
		 {
		   $('#z_photo_1').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic_1()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo_1').append(div);
		   });
		 }
	   });
	 }
	 function upload_bill_2()
	 {
	   $('#tj_img_2').click();
	   $('#z_photo_2').click();
	   $('#z_photo_2').css('display','block');
	   $.getJSON("{:U('Index/show_repair')}",{type: 666666},function(json){
	     if(json)
		 {
		   $('#z_photo_2').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic_2()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo_2').append(div);
		   });
		 }
	   });
	 }
	 function show_pic_2()
	 {
	     $.getJSON("{:U('Index/show_repair')}",{type: 666666},function(json){
	     if(json)
		 {
		   $('#z_photo_2').empty();
		   $.each(json,function(index,array){
		     var div="<div class='z_addImg'><img src='/kelite"+array['picture']+"' onclick='show_pic_2()' style='width:70px;height:70px'><input type='hidden' value='/kelite"+array['picture']+"'><div class='imgAdd_close mui-icon mui-icon-closeempty' onclick='del_img("+array['id']+")'></div></div>";
		     $('#z_photo_2').append(div);
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
		<h1 class="mui-title">发票管理</h1>
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
				<?php $gywm=explode(',',$gywm);$fwxy=explode(',',$fwxy);$fwlc=explode(',',$fwlc);$hyxz=explode(',',$hyxz);$yssm=explode(',',$yssm);$sybz=explode(',',$sybz);$lxwm=explode(',',$lxwm);?>
				<?php if($gywm[0]==$unit || $gywm[1]==$unit || $gywm[2]==$unit || $gywm[3]==$unit || $gywm[4]==$unit){ ?>
					<li class="mui-table-view-cell">
						<a href="{:U('Article/about_us')}">关于我们</a>
					</li>
				<?php }?>
				<?php if($fwxy[0]==$unit || $fwxy[1]==$unit || $fwxy[2]==$unit || $fwxy[3]==$unit || $fwxy[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/agreement')}">服务协议</a></li>
				<?php }?>
				<?php if($fwlc[0]==$unit || $fwlc[1]==$unit || $fwlc[2]==$unit || $fwlc[3]==$unit || $fwlc[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/service_flow')}">服务流程</a></li>
				<?php }?>
			    <?php if($hyxz[0]==$unit || $hyxz[1]==$unit || $hyxz[2]==$unit || $hyxz[3]==$unit || $hyxz[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/member_notes')}">会员须知</a></li>
				<?php }?>
				<?php if($yssm[0]==$unit || $yssm[1]==$unit || $yssm[2]==$unit || $yssm[3]==$unit || $yssm[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/privacy')}">隐私说明</a></li>
				<?php }?>
				<?php if($sybz[0]==$unit || $sybz[1]==$unit || $sybz[2]==$unit || $sybz[3]==$unit || $sybz[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/help')}">使用帮助</a></li>
				<?php }?>
				<?php if($lxwm[0]==$unit || $lxwm[1]==$unit || $lxwm[2]==$unit || $lxwm[3]==$unit || $lxwm[4]==$unit){ ?>
					<li class="mui-table-view-cell"><a href="{:U('Article/contact_us')}">联系我们</a></li>
				<?php }?>
				</ul>
			</div>
		</div>

	</div>
	<!--右上角弹出菜单-->
	<!--头部-->
	
	<!--发票管理-->
	<form action="" method="post" enctype="multipart/form-data">
	<div class="user_center">
		<div class="invoice_management">
			<ul>
				<li>
					<div class="mui-input-row">
						<label>发票抬头：</label>
						<input type="text" id="invoice_title" name="fp_top" value="{$fp_info.fp_top}" placeholder="请输入发票抬头">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>税务登记证号：</label>
						<input type="text" id="tax_number" name="sw_number" value="{$fp_info.sw_number}" placeholder="请输入税务登记证号">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>基本开户银行名称：</label>
						<input type="text" id="bank_name" name="bank_name" value="{$fp_info.bank_name}" placeholder="请输入基本开户银行名称">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>基本开户账号：</label>
						<input type="text" id="bank_user" name="bank_id" value="{$fp_info.bank_id}" placeholder="请输入基本开户账号">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>注册场所地址：</label>
						<input type="text" id="bank_address" name="address" value="{$fp_info.address}" placeholder="请输入注册场所地址">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>注册固定电话：</label>
						<input type="text" id="bank_tel" name="phone" value="{$fp_info.phone}" placeholder="请输入注册固定电话">
					</div>
				</li>
			</ul>
		</div>
		<div class="invoice_manage">
			<div class="apply_repair_box invoice_management">
				<div class="mui-input-row">
					<div class="z_photo z_photo1">
						<label>营业执照复印件:</label>
						
			            <div class="z_file z_file2">
			            	<div class="z_file_text">选择图片</div>
			                <input id="file" onclick="$('#file1').click()">  
			            </div>
			            <div class="mui-clearfix"></div>
			            <div class="mui-clearfix z_file_txt">图片格式jpg、png;图片大小不超过1M</div>
			            <if condition="$fp_info.zhizhao_pic eq ''">
			            <div id="z_photo" style="display: none" onclick="show_pic()">
				            图片未显示请点击这里
				        </div>
				        <else />
                           <div id="z_photo" onclick="show_pic()">			             
	                             <div class="z_addImg">
						           <img src='__ROOT__/{$fp_info.zhizhao_pic}'>
						           <input type="hidden" value='__ROOT__/{$fp_info.zhizhao_pic}'>
						           <!-- <div class="imgAdd_close mui-icon mui-icon-closeempty"></div> -->
					            </div>
					        </div>
				        </if>
			            
			            
			      	</div>
				</div>
			</div>
			<div class="apply_repair_box invoice_management">
				<div class="mui-input-row">
					<div class="z_photo z_photo2">
						<label>税务登记复印件:</label>
						
			            <div class="z_file z_file2">
			            	<div class="z_file_text">选择图片</div>
			                <input id="file" onclick="$('#file2').click()">  
			            </div>
			            <div class="mui-clearfix"></div>
			            <div class="mui-clearfix z_file_txt">图片格式jpg、png;图片大小不超过1M</div>
			            <if condition="$fp_info.shuiwu_pic eq ''">
			            <div id="z_photo_1" style="display: none" onclick="show_pic_1()">
				            图片未显示请点击这里
				        </div>
				        <else />
                           <div id="z_photo_1" onclick="show_pic_1()">			             
	                             <div class="z_addImg">
						           <img src='__ROOT__/{$fp_info.shuiwu_pic}'>
						           <input type="hidden" value='__ROOT__/{$fp_info.shuiwu_pic}'>
						           <!-- <div class="imgAdd_close mui-icon mui-icon-closeempty"></div> -->
					            </div>
					        </div>
				        </if>
			            
			      	</div>
				</div>
			</div>
			<div class="apply_repair_box invoice_management">
				<div class="mui-input-row">
					<div class="z_photo z_photo3">
						<label>一般纳税人资格认证复印件:</label>
						
						<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>
			            <div class="z_file z_file3">
			            	<div class="z_file_text">选择图片</div>
			                <input id="file" onclick="$('#file3').click()">
			            </div>
			            <div class="mui-clearfix"></div>
			            <div class="mui-clearfix z_file_txt">图片格式jpg、png;图片大小不超过1M</div>
			            <if condition="$fp_info.nasui_pic eq ''">
			            <div id="z_photo_2" style="display: none" onclick="show_pic_2()">
				            图片未显示请点击这里
				        </div>
				        <else />
                           <div id="z_photo_2" onclick="show_pic_2()">			             
	                             <div class="z_addImg">
						           <img src='__ROOT__/{$fp_info.nasui_pic}'>
						           <input type="hidden" value='__ROOT__/{$fp_info.nasui_pic}'>
						           <!-- <div class="imgAdd_close mui-icon mui-icon-closeempty"></div> -->
					            </div>
					        </div>
				        </if>
			            
			      	</div>
				</div>
			</div>
		</div>
		<div class="invoice_management">
			<ul>
				<li>
					<div class="mui-input-row">
						<label>发票寄送地址：</label>
						<input type="text" id="user_adress" name="youji_addr" value="{$fp_info.youji_addr}" placeholder="请填写发票寄送地址">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>取件人：</label>
						<input type="text" id="user_name" name="qujianren" value="{$fp_info.qujianren}" placeholder="请输入取件人姓名">
					</div>
				</li>
				<li>
					<div class="mui-input-row">
						<label>联系电话：</label>
						<input type="text" id="user_tel" name="tel" value="{$fp_info.tel}" placeholder="请填写联系电话">
					</div>
				</li>
			</ul>
		</div>
		<div class="apply_repair_submit mui-clearfix">
		<if condition="$fp_cont eq 0">
			<input type="submit" class="invoice_submit"  name="save" value="保存" />
		<else />
            <input type="submit" class="invoice_submit" name="update" value="确认修改" />
		</if>
		</div>
	</div>
	</form>

	<form action="{:U('Index/upload_imginfo')}" method="post" enctype="multipart/form-data" target="id_iframe" style="display: none">
	  <input type="file" name="file1" id="file1" value="" onchange="upload_bill()" accept="image/*" multiple/>
	  <input type="hidden" name="types" value="333333">
	  <input type="submit" name="tj_img" id="tj_img">
	</form>
	<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>

	<form action="{:U('Index/upload_imginfo')}" method="post" enctype="multipart/form-data" target="id_iframe" style="display: none">
	  <input type="file" name="file2" id="file2" value="" onchange="upload_bill_1()" accept="image/*" multiple/>
	  <input type="hidden" name="types" value="555555">
	  <input type="submit" name="tj_img_1" id="tj_img_1">
	</form>
	<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe>

	<form action="{:U('Index/upload_imginfo')}" method="post" enctype="multipart/form-data" target="id_iframe" style="display: none">
	  <input type="file" name="file3" id="file3" value="" onchange="upload_bill_2()" accept="image/*" multiple/>
	  <input type="hidden" name="types" value="666666">
	  <input type="submit" name="tj_img_2" id="tj_img_2">
	</form>
	<!--发票管理-->
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--发票管理js-->
<script src="__JS__/invoice_management.js" type="text/javascript" charset="utf-8"></script>
</html>