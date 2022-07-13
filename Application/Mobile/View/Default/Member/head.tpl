<div class="cen_d_img">
    <div class="cen_d_te">
        <div class="cen_d_div">
            <div class="cen_d_lef">
	    <if condition="$member['head'] eq ''">
		<img src="__IMAGES__/head.jpg" alt="头像" />
	    <else />
		<img src="__ROOT__/{$member['head']}" alt="头像"/>
	    </if>
	    </div>
            <div class="cen_d_left">
                <p>
                	您好，
					<span>
					<if condition="$member['wx_name'] neq ''">
						{$member['wx_name']}
					<elseif condition="$member['nickname'] neq ''" />
						{$member['nickname']}
					<else />
						{$member['username']}
					</if>
					</span>
				</p>
				<!--if condition="$member['level'] gt 0"-->
                <p style="padding: 3% 0;">幸运号：<span>{$member['referral_code']}</span></p>
				<!--/if-->

            </div>
	    <div class="cen_d_bottom">
		<if condition="$user['level'] == 0">
		<a href="{$config['wx_url']}" class="" style="width:33%;"><i class="iconfont">&#xe643;</i>关注微信</a>
		<a href="{:U('Cart/payment',array('price'=>2,'type'=>'agent'))}" style="width:33%;"><i class="iconfont">&#xe604;</i>2元成为代理</a>
        <a href="{:U('Member/update')}" style="width:33%;"><i class="iconfont">&#xe644;</i>编辑个人信息</a>
		<else/>
		<a href="{$config['wx_url']}" class="" ><i class="iconfont">&#xe643;</i>关注微信</a>
        <a href="{:U('Member/update')}" ><i class="iconfont">&#xe644;</i>编辑个人信息</a>
		</if>
		<!--a href="{:U('Member/app')}">APP下载</a-->
	    </div>
        </div>
    </div>
</div>
	<!-- 关注微信 弹出 -->
	<div class="popup" role="alert">
	<div class="popup_con">
        <div class="popup_con_txt">
		<p></p>
		<img src="__IMAGES__/erweimaimg.jpg" alt=""/>
		<p style="text-align:center;">长按指纹自动识别关注</p>
        </div>
		<a href="#" class="popup_close img-replace">关闭</a>
	</div>
	<script>
		jQuery(document).ready(function($){
			//open popup
			$('.find_password').on('click', function(event){
				event.preventDefault();
				$('.popup').addClass('is-visible');
			});	
			//close popup
			$('.popup').on('click', function(event){
				if( $(event.target).is('.popup_close') || $(event.target).is('.popup') ) {
					event.preventDefault();
					$(this).removeClass('is-visible');
				}
			});
		});
	</script>
</div>
<div class="cen_font">
    <ul>
        <li class="li_font">
            <a href="{:U('Order/index/type/0')}">
                <i class="iconfont" style="color:#ffa11a;">&#xe621;</i>
			</a>
			待付款
        </li>
        <li class="li_font_t">
            <a href="{:U('Order/index/type/1')}">
                <i class="iconfont" style="color:#3fafee;">&#xe61c;</i>
			</a>
			待发货
        </li>
        <li class="li_font_e">
            <a href="{:U('Order/index/type/2')}">
                <i class="iconfont" style="color:#ff6666;">&#xe61d;</i>
			</a>
			待收货
        </li>
        <li class="li_font_e" style="border-right:none;">
            <a href="{:U('Order/index/type/3')}">
                <i class="iconfont" style="color:#3ad4cb;">&#xe61e;</i>
			</a>
			已完成
        </li>
    </ul>
</div>
