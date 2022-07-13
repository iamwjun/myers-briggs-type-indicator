<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>确认完成</title>
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
	<!-- <script type="text/javascript">
     function result()
     {
     	var myd=$('#myd').val();
     	var zyx=$('#zyx').val();
     	var res=(parseInt(parseInt(myd*10))+parseInt(parseInt(zyx*10)))/2/10;
     	var uid=<?=$_GET['uid']?>;
     	var oid=<?=$_GET['oid']?>;
     	$.ajax({
     		type:"POST",
     		url :"{:U('Member/add_comment')}",
     		data:"uid="+uid+"&&point="+res+"&&oid="+oid,
     		success:function(date){alert(date);window.location="{:U('Member/ok_order')}";},
     	});
     }
	</script> -->
</head>
<body>
    <input type="hidden" id="oid" value="<?=$_GET['oid']?>">
    <input type="hidden" id="do_id" value="<?=$_GET['do_id']?>">
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">确认完成</h1>
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
	
	<!--评价-->
	<div class="user_center">
		<div class="order">
			<div class="order_body">
				<div class="order_worker evaluate_worker">
					<if condition="$user.face neq ''">
                     <img src="__ROOT__{$user.face}"/>
				    <else />
                     <img src="__PUBLIC__/Home/Images/head.jpg"/>
				    </if>
					<span>
						<h5>{$user.nickname}</h5>
						<p>
                         <if condition="$user.unit eq 1">
						  {$members.self_jn} <span style="font-size: 13px">工程师 -- {$members.truename}</span>
						 </if>
						 <if condition="$user.unit eq 4">
						  <span style="font-size: 13px">计量检测单位</span>
						 </if>
						</p>
						<div class="icons mui-inline">
							<input type="hidden" name="star" id="star" value="{$user.position}" />
							<span id="star_box"></span>
							<em>{$user.position}分</em>
						</div>
					</span>
				</div>
				<div class="evaluate_form">
					<div class="icons mui-inline" id="satisfaction">
						<span>满意度</span>
						<i data-index="1" class="mui-icon mui-icon-star-filled" onclick="$('#myd').val(0.1)"></i>
						<i data-index="2" class="mui-icon mui-icon-star-filled" onclick="$('#myd').val(0.2)"></i>
						<i data-index="3" class="mui-icon mui-icon-star-filled" onclick="$('#myd').val(0.3)"></i>
						<i data-index="4" class="mui-icon mui-icon-star-filled" onclick="$('#myd').val(0.4)"></i>
						<i data-index="5" class="mui-icon mui-icon-star-filled" onclick="$('#myd').val(0.5)"></i>
					</div>
					<input type="hidden" name="myd" id="myd">
					<div class="mui-clearfix"></div>
					<div class="icons mui-inline" id="professional">
						<span>专业性</span>
						<i data-index="1" class="mui-icon mui-icon-star-filled" onclick="$('#zyx').val(0.1)"></i>
						<i data-index="2" class="mui-icon mui-icon-star-filled" onclick="$('#zyx').val(0.2)"></i>
						<i data-index="3" class="mui-icon mui-icon-star-filled" onclick="$('#zyx').val(0.3)"></i>
						<i data-index="4" class="mui-icon mui-icon-star-filled" onclick="$('#zyx').val(0.4)"></i>
						<i data-index="5" class="mui-icon mui-icon-star-filled" onclick="$('#zyx').val(0.5)"></i>
					</div>
					<input type="hidden" name="zyx" id="zyx">
					<p>您的评价，是我们进步的阶梯</p>
					<textarea name="" rows="" cols="" id="evaluate_text" placeholder="请输入评价内容"></textarea>
					<div class="apply_repair_submit mui-clearfix">
						<input type="button" id="evaluate_submit" name="" style="color:#FFF" value="确认完成提交评价" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--评价-->

</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--评价验证-->
<script src="__JS__/completion.js" type="text/javascript" charset="utf-8"></script>
</html>