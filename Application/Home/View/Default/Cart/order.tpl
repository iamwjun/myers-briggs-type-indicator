<extend name="Base/common" />

{// css样式区 }
<block name="link">
</block>

<block name="jscript">
	<script type="text/javascript" src="__JS__/cart_order.js"></script>
</block>

<block name="main">
	<include file="Public/top" />
	<div id="inf">
	    <form method="post" action="{:U('Cart/addOrder')}" id="payment_form">
	    	<input type="hidden" name="idList" value="{$idList}" />
	    	<input type="hidden" name="address" value="{:$address['id'] ? $address['id'] : 0}" />
			<if condition="$address|count gt 0">
	    	<input type="hidden" name="content" value="{$content}" />
		    <!-- 收货人信息-->
		    <div class="inf_tol">收货人：{$address['nickname']}</div>
		    <!--电话地址-->
		    <div class="q_con_bgs">
		        <div class="q_con_bgss">
		            <p>
		                <span>
		                    <i style="vertical-align: middle"><img src="__IMAGES__/list_men_03.png" alt=""/></i>
							{$address['nickname']}
		                </span>
		                <span class="con_bg_move">
		                    <i style="vertical-align: top"><img src="__IMAGES__/list_phone.png" alt=""/></i>
							{$address['tel']}
		                </span>
		            </p>
		            <p>{$address['provinceString']}{$address['cityString']}{$address['areaString']}{$address['intro']}</p>
		        </div>
		    </div>
			</if>
		    <div class="inf_tol">支付方式</div>
		    <!-- pay way-->
		    <div class="inf_s">
		        <div class="inf_pay" style="line-height:25px;">
		            <div>
		            	<label>
		            		<input name="pay_way" value="货到付款" type="radio"/>线下支付
						</label>
						<br />
		                <span style="color:#999999;font-size:12px;padding-left:15px;">送货上门后再付款，支持现金、POS机刷卡、支票付款</span>
		            </div>
		            <div>
		            	<label>
		            		<input name="pay_way" type="radio" value="在线支付" checked="checked" />在线支付
						</label>
						<!--br />
		                <span style="color:#999999;font-size:12px;padding-left:15px;">即时到帐，支持绝大数银行借记卡及部分银行信用卡</span-->
		            </div>
		        </div>
		    </div>
		    <div class="inf_tol mars">发票信息</div>
		    <!-- 发票-->
		    <div class="inf_piao">
		            <div class="inf_ul">
		                <ul>
		                    <li>
		                        <label for="">发票类型：</label>
								<label>
		                        	<input name="invoice_type" type="radio" value="普通发票" />普通发票
								</label>
								<label>
		                        	<input name="invoice_type" type="radio" value="无" checked="checked" />不要发票
								</label>
		                    </li>
		                    <li>
		                        <label for="">发票抬头：</label>
								<label>
		                        	<input name="invoice_top" type="radio" value="个人" />个人
								</label>
								<label>
			                        <input name="invoice_top" type="radio" value="单位" />单位
			                        <input class="inpu_si" type="text" name="invoice_top_company" />
								</label>
		                    </li>
		                    <li>
		                        <label for="">发票内容：</label>
								<label>
		                        	<input name="invoice_intro" type="text" class="inpu_si" />
								</label>
		                    </li>
		                    <!--li>
		                        <input class="inf_sub save_pay" type="button" value="保存"/>
		                        <a class="inf-a cancel_pay" href="javascript:;">取消</a>
		                    </li-->
		                </ul>
		            </div>
		    </div>
		    <!-- -->
		    <div style="clear: both"></div>
		    <div class="inf_tol hhe">商品信息</div>
		    <!--product information -->
			<!-- 列表开始 -->
			<volist name="dataList['list']" id="volist">
		    <div class="cen_pro">
		        <div class="cen_p_le">
					<a href="{$volist['url']}" title="{$volist['title']}" target="_blank">
	                	<img class="img-responsive" src="__ROOT__{$volist['picture']}" alt="{$volist['title']}"/>
					</a>
				</div>
		        <div class="cen_p_ri">
		            <p>
						<a href="{$volist['url']}" title="{$volist['title']}" target="_blank">
							{$volist['title']}
						</a>
					</p>
		            <p>
		            	<span class="span-color">￥{$volist['member_price']}</span>
						<del>￥{$volist['market_price']}</del>
					</p>
		            <p class="cen_span">简介：<span>{$volist['intro']}</span></p>
		            <p><span class="p_num">x{$volist['num']}</span></p>
		            <p><span class="p_yuan">￥{$volist['total_price']}</span></p>
		        </div>
		        <div style="clear: both"></div>
		    </div>
		    <!-- water baby-->
		    <!--<div class="inf_bay">
		        <span></span>
		        <span class="span_ri">运费：<span style="color: #fe713f">{$volist['send']}</span></span>
		    </div>-->
			</volist>
			<!-- 列表结束 -->
		    <!-- pay-->
		    <div class="inf_divs">
		        <!--<div class="inf_d_div">-->
		        <p>
		            <span style="margin-right: 6%;">
		                <span style="color:#bb3c2d;display: inline-block; width: 15px; ">{$dataList['num']}</span>
						 件商品
		            </span>
					总价：<span class="ding_s">{$dataList['total_price']}</span>
		        </p>
		        <!--<p>
					运费：<span class="ding_s">{$dataList['total_send']}</span>
		        </p>-->
		        <!--p>
					优惠：<span class="ding_s">0</span>
		        </p-->
		    </div>
		    <!--付款 -->
		    <div class="inf_bet">
		        <span class="bet">实付款： <span class="s_col">￥{$dataList['total_price']}</span></span>
		    </div>
		    <!--提交订单 -->
		        <div style="clear: both;"></div>
		    <div class="inf_b"><input type="submit" value="提交订单"/></div>
	    </form>
	</div>
</block>