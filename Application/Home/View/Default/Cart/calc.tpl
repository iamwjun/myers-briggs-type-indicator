<extend name="Base/common" />

{// css样式区 }
<block name="link">
</block>

<block name="jscript">
</block>

<block name="main">
	<include file="Public/top" />
	<div id="pays">
		<form method="post" action="{:U('Cart/order')}">
			<input type="hidden" name="idList" value="{$idList}" />
		    <div class="pays_pro">
			<!-- 结算列表开始 -->
			<volist name="dataList['list']" id="volist">
		        <div class="pays_move_d">
		            <!-- 左 图-->
		            <div class="pays_left">
						<a href="{$volist['url']}" title="{$volist['title']}" target="_blank">
		                	<img class="img-responsive" src="__ROOT__{$volist['picture']}" alt="{$volist['title']}"/>
						</a>
		            </div>
		            <!-- 右内容-->
		            <div class="pays_right">
		                <p>
							<a href="{$volist['url']}" title="{$volist['title']}" target="_blank">
								{$volist['title']}
							</a>
						</p>
		                <p class="pays_col"><span>￥{$volist['member_price']}</span> <del>￥{$volist['market_price']}</del></p>
		                <p class="pays_size">简介：{$volist['intro']}</p>
		                <p class="pays_move"><span>x{$volist['num']}</span></p>
		                <div style="clear: both;"></div>
		                <p class="pays_m_t"> <span>￥{$volist['total_price']}</span></p>
		            </div>
		        </div>
		        <!-- 包邮-->
		        <div style="clear: both;"></div>
		        <!--<div class="pays_comm">
		            <span>{$volist['title']}</span>
		            <p style="float: right;">运费：<span>{$volist['send']}</span></p>
		        </div>-->
			</volist>
			<!-- 结算列表结束 -->
		        <!-- 留言-->
		        <div class="pays_word">
		            <textarea placeholder="给卖家留言：" name="content"></textarea>
		        </div>
		    </div>
		    <!-- heji-->
		    <div class="pays_tol">
		        <div class="pays_col_move">
					合计：<span >￥{$dataList['total_price']}</span>
		        </div>
		        <div class="pays_input">
		            <div style="clear: both;"></div>
		            <input type="submit" value="确认"/>
		        </div>
		    </div>
		</form>
	</div>
</block>