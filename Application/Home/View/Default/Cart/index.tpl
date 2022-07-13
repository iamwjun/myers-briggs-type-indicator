<extend name="Base/common1" />

{// css样式区 }
<block name="link">
</block>
<link rel="stylesheet" type="text/css" href="__STYLE__/prompt.css" />
<block name="jscript">
<script type="text/javascript" src="__JS__/jquery.scrollUp.min.js "></script>
<script type="text/javascript" src="__JS__/lefttime.js"></script>
<script type="text/javascript" src="__JS__/swiper-3.2.5.min.js"></script>
</block>
<block name="main"> 
<body class="">
	<!-- 头部 -->
	<header class="header-menu dis-box">
    	<a href="javascript:history.go(-1);"><i class="iconfont">&#xe636;</i></a>
        <h3>购物车</h3>
        <a href="{:U('Index/index')}"><i class="iconfont">&#xe621;</i></a>
    </header>
    
    <!-- 主题内容 -->
	<div class="main">
		<div class="flow-cart blur-div">
		<form action="{:U('Cart/add_order')}" method="post" id="cart_form" onsubmit="return ShopCart.cart_form( '#cart_form' );">
			<section class="flow-have-cart select-three j-select-all">
				<section class="j-cart-get-i-more">
					<div class="product-list-small">
						<ul>
						<if condition="$cartList['cartList']">
						<volist name="cartList['cartList']" id="volist">
							<li>
								<div class="dis-box">
									<!-- 选择 -->
									<div class="ect-select">
										<if condition="$volist['check'] eq 1">
						                    <input type="checkbox" name="proId[]" value="{$volist['id']}" class="checkbox_input" checked="checked" />
											<label  class="rec-active active checkbox_img" goods-id="{$volist['id']}" rec-id="111">
											<i class="j-select-btn"></i>
											</label>
										<else />
											<input type="checkbox" name="proId[]" value="{$volist['id']}" class="checkbox_input" />
											<label  class="rec-active checkbox_img" goods-id="{$volist['id']}" rec-id="111">
											<i  class="j-select-btn"></i>
											</label>
										</if>
										
									</div>
									
									<!-- 商品信息 -->
									<div class="box-flex">
										<div class="product-div">
											<div class="p-d-img fl">
												<a href="{$volist['url']}"><img src="__ROOT__/{$volist['picture']}" class="product-list-img"></a>
											</div>
											<div class="product-text">
												<h4 class="onelist-hidden"><a href="{$volist['url']}">{$volist['title']}</a></h4>
												<span class="t-first">¥{$volist['member_price']}</span>
												<div class="div-num dis-box">
													<a class="num-up" data-min-num="1" onclick="ShopCart.jianShopNum({$volist['id']},{$key} );"></a>
													<input onblur="ShopCart.moveoutNum( {$volist['id']}, {$key} );" class="box-flex cart-number active buyNumber" type="number" name="cart_number" readonly value="{$volist['num']}" id="222" cart-id="111">
													<a class="num-next" xiangounum="" onclick="ShopCart.jiaShopNum({$volist['id']},{$key});" data-max-num="999"></a>
												</div>
												<i class="iconfont icon-xiao10" onclick="ShopCart.removeShop( {$volist['id']}, {$key} );" >&#xe665;</i>
											</div>
										</div>
									</div>
								</div>
							</li>
							</volist>
							<else/>
								<div class="no-div-message">
									<i class="iconfont icon-biaoqingleiben">&#xe676;</i>
									<p>亲，您的购物车空空如也，去逛逛吧！~！</p>
								</div>
							</if>
						</ul>
					</div>
				</section>
			</section>
			
		</div>
	</div>
	
	<!-- 结算 -->
	<if condition="$cartList['cartList']">
	<section class="filter-btn f-cart-filter-btn dis-box">
		<div class="box-flex select-three j-cart-get-more j-get-more-all">
			<div class="ect-select">
				<label class="dis-box label-all active checkbox_img">
					<i class="select-btn"></i>
					<span class="box-flex">全选</span>
				</label>
			</div>
			<div class="g-cart-filter-price of-hidden">
				<p class="dis-box"><em class="dis-block">合计：</em>
				  <span class="t-first box-flex onelist-hidden cart-price-show">¥<span class="totalMoney">{$cartList['paymentMoney']}</span></span>
				  <span class="t-first box-flex onelist-hidden cart-price-hidden" style="display:none">¥<span class="totalMoney">{$cartList['paymentMoney']}</span></span>
				</p>
				<p class="t-remark">不含运费</p>
			</div>
		</div>
		
		<div class="g-cart-filter-sb">
				<input type="hidden" name="cart_value" value="">
				<input type="submit" class="btn-submit fl" value="马上结算"/>

		</div>
	</section>
	</form>
	</if>
<script>
	function c_value(){
		var id='';
		$("label").each(function (){
			if($(this).hasClass("rec-active")){
				if($(this).hasClass("active")) {
					id += $(this).attr("rec-id") + ',';
				}
			}
		 })
		if(id==''){
			d_messages('至少选中一个商品', 2);
			return false;
		}
		id = id.substr(0,id.length-1);
		$("input[name=cart_value]").val(id);
		document.getElementById("formid").submit();
	}
	//加载
	 var price = 0;
	 var k = 0;
	 $(".total").each(function(){
			 price  += $(this).attr("price")*1;
	
	 })
	//$(".cart-price-show").text('￥'+price.toFixed(2));
	//删除
	function DropCart(id,sid){
		$(".cart-number-show").text(k);
		//$(".cart-price-show").text('￥'+price.toFixed(2));
		d_messages('已删除');
	 }
	/*-*/
	$(".div-num a").click(function() {
	if (!$(this).parent(".div-num").hasClass("div-num-disabled")) {
		if ($(this).hasClass("num-up")) {
			  
				num = parseInt($(this).siblings("input").val());
				min_num = parseInt($(this).attr("data-min-num"));
				rec      = parseInt($(this).siblings("input").attr("cart-id"));
				if (num > min_num) {
					num -= 1;
					$(this).siblings("input").val(num);
					if($(this).siblings("input").hasClass("active")){
						none = 0;
					}else{
						none = 1;
					}
					var arr = '';
					$(".rec-active").each(function(){
						if($(this).hasClass("active")) {
							arr += $(this).attr("rec-id")+',';
						}
					})
					$.ajax({
							type: "POST",
							url: "index/cart_goods_number", 
							dataType:"json",
							data: {id:rec,number:num,arr:arr,none:none},
							success: function(data){
								if(data.none>0){
									return;
								}
								if(data.error){
									d_messages(data.msg);
									return;
								}
								var number=0;
								$(".cart-number").each(function(){
									if($(this).hasClass("active")) {
										number += $(this).val() * 1;
									}
								})	
								$(".cart-number-show").text(number);
								//$(".cart-price-show") .text(data.content);
								$(".cart-price-hidden") .text(data.content);
								
							}});
	
			} else {
				d_messages("不能小于最小数量");
			}
			return false;
		}
		if ($(this).hasClass("num-next")) {
			num = parseInt($(this).siblings("input").val());
			max_num = parseInt($(this).attr("data-max-num"));
			xiangounum = parseInt($(this).attr("xiangounum"));
			if(xiangounum){
				if(num>=xiangounum){
				   d_messages('不能超过限购');
				   return;
				}
			}
			rec      = parseInt($(this).siblings("input").attr("cart-id"));
			//限购
			if (num < max_num) {
				num += 1;
				$(this).siblings("input").val(num);
				$(this).siblings("input").val(num);
				if($(this).siblings("input").hasClass("active")){
					none = 0;
				}else{
					none = 1;
				}
				var arr = '';
				$(".rec-active").each(function(){
					if($(this).hasClass("active")) {
						arr += $(this).attr("rec-id")+',';
					}
				})
				$.ajax({
					type: "POST",
					url: "index/cart_goods_number", 
					dataType:"json",
					data: {id:rec,number:num,arr:arr,none:none},
					success: function(data){
	
						if(data.none>0){
							return;
						}
						if(data.error){
							d_messages(data.msg);
							return;
						}
						var number=0;
						$(".cart-number").each(function(){
							if($(this).hasClass("active")) {
								number+=$(this).val()*1;
							}
						})
						$(".cart-number-show").text(number);
						//$(".cart-price-show") .text(data.content);
						$(".cart-price-hidden") .text(data.content);
					}});
	
			} else {
				d_messages("不能大超过最大数量");
			}
			return false;
		}
	} else {
		d_messages("该商品不能增减");
	}
	});
	$(".div-num a").click(function() {
		if (!$(this).parent(".div-num").hasClass("div-num-disabled")) {
			if ($(this).hasClass("num-less")) {
				num = parseInt($(this).siblings("input").val());
				min_num = parseInt($(this).attr("data-min-num"));
				if (num > min_num) {
					num -= 1;
					$(this).siblings("input").val(num);
				} else {
					d_messages("不能小于最小数量");
				}
				return false;
			}
			if ($(this).hasClass("num-plus")) {
				num = parseInt($(this).siblings("input").val());
				max_num = parseInt($(this).attr("data-max-num"));
				if (num < max_num) {
					num += 1;
					$(this).siblings("input").val(num);
				} else {
					d_messages("不能大超过最大数量");
				}
				return false;
			}
		} else {
			d_messages("该商品不能增减");
		}
	});
	$(".div-num input").bind("change", function() {
		num = parseInt($(this).val());
		max_num = parseInt($(this).siblings(".num-plus").attr("data-max-num"));
		min_num = parseInt($(this).siblings(".num-less").attr("data-min-num"));
		if (num > max_num) {
			$(this).val(max_num);
			d_messages("不能大超过最大数量");
			return false;
		}
		if (num < min_num) {
			$(this).val(min_num);
			d_messages("不能小于最小数量");
			return false;
		}
	});
	/*多选*/
	$(".j-cart-get-more .ect-select").click(function() {
		if (!$(this).find("label").hasClass("active")) {
			$(this).find("label").addClass("active");
			$("input[name=cart_number]").addClass("active");
			if ($(this).find("label").hasClass("label-all")) {
				$(".j-select-all").find(".ect-select label").addClass("active");
				/*hu*/
				var rec_id = '';
				$(".rec-active").each(function(){
					var goods_id = $(this).attr("goods-id");
					if ($(this).hasClass("active")) {
	
						if($(this).attr("rec-id")!=undefined && $(this).attr("rec-id")>0){
							rec_id+=$(this).attr("rec-id")+',';
							$("#"+goods_id+"").addClass("active");
						}
					}
				});
			}
		} else {
			$(this).find("label").removeClass("active");
			$("input[name=cart_number]").removeClass("active");
			if ($(this).find("label").hasClass("label-all")) {
				/*hu*/
				//$(".cart-price-show").text("￥0.00");
				$(".cart-number-show").text(0);
				/*hu*/
				$(".j-select-all").find(".ect-select label").removeClass("active");
			}
		}
	});
	/*多选只点击单选按钮 - 全选，全不选*/
	$(".j-cart-get-i-more .j-select-btn").click(function() {
		if ($(this).parents(".ect-select").hasClass("j-flowcoupon-select-disab")) {
			d_messages("同商家只能选择一个", 2);
		} else {
			is_select_all = true;
			if ($(this).parent("label").hasClass("label-this-all")) {
				if (!$(this).parent("label").hasClass("active")) {
					$(this).parents(".j-cart-get-i-more").find(".ect-select label").addClass("active");
				} else {
					$(this).parents(".j-cart-get-i-more").find(".ect-select label").removeClass("active");
				}
			}
	
			if (!$(this).parent("label").hasClass("label-this-all") && !$(this).parent("label").hasClass("label-all")) {
				$(this).parent("label").toggleClass("active");
				is_select_this_all = true;
				select_this_all = $(this).parents(".j-cart-get-i-more").find(".ect-select label").not(".label-this-all");
	
				select_this_all.each(function() {
					if (!$(this).hasClass("active")) {
						is_select_this_all = false;
						return false;
					}
				})
				if (is_select_this_all) {
					$(this).parents(".j-cart-get-i-more").find(".label-this-all").addClass("active");
				} else {
					$(this).parents(".j-cart-get-i-more").find(".label-this-all").removeClass("active");
				}
			}
	
			var select_all = $(".j-select-all").find(".ect-select label");
			select_all.each(function() {
				if (!$(this).hasClass("active")) {
					is_select_all = false;
					return false;
				}
			});
			if (is_select_all) {
				$(".label-all").addClass("active");
			} else {
				$(".label-all").removeClass("active");
			}
		}
		/*hu*/
		var rec_id = '';
		$(".rec-active").each(function(){
			var goods_id = $(this).attr("goods-id");
			if ($(this).hasClass("active")) {
	
				if($(this).attr("rec-id")!=undefined && $(this).attr("rec-id")>0){
					rec_id+=$(this).attr("rec-id")+',';
					$("#"+goods_id+"").addClass("active");
				}
			}else{
				$("#"+goods_id+"").removeClass("active");
			}
		});
		/*hu*/
	});
</script>
<script type="text/javascript" src="__JS__/shopping.js"></script>
</block>