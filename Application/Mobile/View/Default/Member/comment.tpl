<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
	<meta name="viewport" content="initial-scale=2.0,width=device-width,initial-scale=1.0" />
	<title>我的订单</title>
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
</head>
<body>
	<!--头部-->
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">我的订单</h1>
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
	
	<!--我的订单-->
	<div class="user_center">
		<div class="order">
			<div class="order_body">
				<div class="order_worker">
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
							<em style="font-size:12px; color:#FFF">{$user.position}分</em>
						</div>
					</span>
				</div>
				<div class="order_course">
					<div class="order_course_border">
						<div class="order_course_border_box"></div>
					</div>
					<input type="hidden" name="" id="course" value="7" />
					<ul>
						<li id="course1">
							<i>1</i>
							<p>待分配</p>
						</li>
						<li id="course2">
							<i>2</i>
							<p>待上门</p>
						</li>
						<li id="course3">
							<i>3</i>
							<p>待报价</p>
						</li>
						<li id="course4">
							<i>4</i>
							<p>待确认</p>
						</li>
						<li id="course8">
							<i>8</i>
							<p>已完成</p>
						</li>
						<li id="course7">
							<i>7</i>
							<p>待评价</p>
						</li>
						<li id="course6">
							<i>6</i>
							<p>待付款</p>
						</li>
						<li id="course5">
							<i>5</i>
							<p>维修中</p>
						</li>
					</ul>
				</div>
				<div class="order_details">
					<ul>
						<li>
							<label>订单编号：</label>
							<span>{$show_info.order_number}</span>
						</li>
						<li>
							<label>下单时间：</label>
							<span><?php echo date('Y-m-d H:i',$show_info['create_time']);?></span>
						</li>
						<li>
							<label>支付方式：</label>
							<span>在线支付</span>
						</li>
						<li>
							<label>订单状态：</label>
							<em><?php if($_GET['status']!=5){ ?>待确认<?php }else{ ?>维修中<?php }?></em>
						</li>
					</ul>
				</div>
				<div class="order_details">
					<ul>
						<li>
							<label>维修类型：</label>
							<span>
                              <if condition="$show_info.category eq 'bx'">
                               保修服务
                             <elseif condition="$show_info.category eq 'jc'" />
                               检测校准
                             <elseif condition="$show_info.category eq 'az'" />
                                安装升级
                             <else />
                                维修保养
                             </if>
							</span>
						</li>
						<!-- <li>
							<label>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：</label>
							<span>某某品牌</span>
						</li> -->
						<li>
							<label>设备名称：</label>
							<span>{$show_info.name}</span>
						</li>
						<li>
							<label>设备型号：</label>
							<span>{$show_info.model}</span>
						</li>
						<li>
							<label>设备编号：</label>
							<span>{$show_info.number}</span>
						</li>
					</ul>
				</div>
				<div class="order_details">
					<ul>
						<li>
							<label>维修地址：</label>
							<span>{$show_info.address}</span>
						</li>
						<li>
							<label>预约时间：</label>
							<span>{$show_info.times}</span>
						</li>
						<li>
							<label>单位名称：</label>
							<span>{$show_info.company_name}</span>
						</li>
						<li>
							<label>联&nbsp;&nbsp;系&nbsp;人：</label>
							<span>{$show_info.contact_name}</span>
						</li>
						<li>
							<label>联系电话：</label>
							<span>{$show_info.tel}</span>
						</li>
					</ul>
				</div>
				<div class="order_details order_details_message">
					<ul>
						<li>
							<label>故障描述：</label>
							<span>{$show_info.describle}</span>
							<div class="order_details_img">
								<?php
								  $str=explode(',',$show_info['picture']);
								  $ct=count($str);
								  if($ct==1)
								  {
								  ?>
                                     <img src="__ROOT__/<?=$show_info['picture']?>"/>
                                <?php
								  }
								  else
								  {
		                              for($i=0;$i<count($str)-1;$i++)
		                              {
								?>
									<img src="__ROOT__<?=$str[$i]?>"/>
							    <?php
	                                  }
	                              }
							    ?>
							</div>
						</li>
					</ul>
				</div>
				<if condition="$ck eq 1">
				<div class="order_details order_details_message order_details_money">
					<ul>
						<volist name="baojia_list" id="vo">
						 <?php
                          $info=explode('￥',$vo['info']);
						 ?>
						 <li>
						   <label><?=$info[0]?></label>
	                       <span>￥<?=$info[1]?></span>
	                     </li>
						</volist>
						
					</ul>
				</div>
				</if>
				<div class="order_details">
					<ul>
						<li>
							<label>发票类型：</label>
							<span>普通发票</span>
						</li>
						<li>
							<label>发票抬头：</label>
							<span>个人</span>
						</li>
						<li>
							<label>发票内容：</label>
							<em>明细</em>
						</li>
					</ul>
				</div>
				<div class="apply_repair_submit mui-clearfix">
					<a href="{:U('Member/now_comment',array('uid'=>$show_info['do_id'],'oid'=>$show_info['id']))}">立即评价</a>
				</div>
			</div>
		</div>
	</div>
	<!--我的订单-->
	
	
	
</body>
<!--公共js-->
<script src="__JS__/common.js" type="text/javascript" charset="utf-8"></script>
<!--订单详情验证js-->
<script src="__JS__/my_order_detail.js" type="text/javascript" charset="utf-8"></script>
</html>