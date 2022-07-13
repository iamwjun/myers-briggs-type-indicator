<extend name="Base/common" />

{// css样式区 }
<block name="link">
	<link rel="stylesheet" type="text/css" href="__STYLE__/robBuy.css" />
</block>

<block name="jscript">

<script type="text/javascript">
	$(function(){
	    /*倒计时*/
	    countDown("2016/11/11 10:00:00","#colockbox1");
	    countDown("2016/11/11 09:00:00","#colockbox2");
	});

	function countDown(time,id){
	    var day_elem = $(id).find('.day');
	    var hour_elem = $(id).find('.hour');
	    var minute_elem = $(id).find('.minute');
	    var second_elem = $(id).find('.second');
	    var end_time = new Date(time).getTime(),//月份是实际月份-1
	        sys_second = (end_time-new Date().getTime())/1000;
	    var timer = setInterval(function(){
	        if (sys_second > 1) {
	            sys_second -= 1;
	            var day = Math.floor((sys_second / 3600) / 24);
	            var hour = Math.floor((sys_second / 3600) % 24);
	            var minute = Math.floor((sys_second / 60) % 60);
	            var second = Math.floor(sys_second % 60);
	            day_elem && $(day_elem).text(day);//计算天
	            $(hour_elem).text(hour<10?"0"+hour:hour);//计算小时
	            $(minute_elem).text(minute<10?"0"+minute:minute);//计算分钟
	            $(second_elem).text(second<10?"0"+second:second);//计算秒杀
	        } else {
	            clearInterval(timer);
	        }
	    }, 1000);
	}
</script>

</block>

<block name="main">

	<body class="">

		<!-- 头部 -->
		<header class="header-menu dis-box">
	    	<a href="javascript:history.go(-1);"><i class="iconfont">&#xe636;</i></a>
	        <h3>疯狂抢购</h3>
	        <a href="{:U('Index/index')}"><i class="iconfont">&#xe621;</i></a>
	    </header>
	    
	    <!-- 主题内容 -->
		<div class="main">
			
			<!-- banner -->
			<div class="banner">
				<img src="__PUBLIC__/Home/Images/banner_Bg.png">
				<div class="txt">
					<p class="title_L">限时购</p>
					<p class="title_s">精选商品 每天底价开抢</p>
				</div>
			</div>

			<!-- 商品部分（内容） -->
			<div class="contentBox">
				<ul>
					<li class="clearfix">
						<a href="#">
							<dl>
								<dt><img src="__PUBLIC__/Home/Images/bag_pro.png"></dt>
								<dd class="title">GUCCI古驰 女士粉红色牛皮单肩包女士粉红色牛皮单肩包</dd>
								<dd class="price"><font>¥13980</font><del>¥15800</del></dd>
								<dd class="time_btn">
									<!--倒计时-->
				                    <div class="colockbox" id="colockbox1">
				                        <!-- <span class="day">00</span><em>天</em> -->
				                        <em>仅剩：</em>
				                        <span class="hour">00</span>:
				                        <span class="minute">00</span>:
				                        <span class="second">00</span>
				                    </div>
								</dd>
							</dl>
						</a>

						<!-- 爆品未抢完按钮 -->
						<!-- <span class="robBtn_">
							<label><em>马上抢</em><i class="iconfont">&#xe664;</i></label>
							<i class="iconfont">&#xe6ee;</i>
						</span> -->
						<span class="robBtn_">
							<img src="__PUBLIC__/Home/Images/fireBtn.png">
							<label><em>马上抢</em><i class="iconfont">&#xe664;</i></label>
						</span>

					</li>
					<li class="clearfix">
						<a href="#">
							<dl>
								<dt><img src="__PUBLIC__/Home/Images/bag_pro.png"></dt>
								<dd class="title">GUCCI古驰 女士粉红色牛皮单肩包女士粉红色牛皮单肩包</dd>
								<dd class="price"><font>¥13980</font><del>¥15800</del></dd>
								<dd class="time_btn">
									<!--倒计时-->
				                    <div class="colockbox" id="colockbox2">
				                        <!-- <span class="day">00</span><em>天</em> -->
				                        <em>仅剩：</em>
				                        <span class="hour">00</span>:
				                        <span class="minute">00</span>:
				                        <span class="second">00</span>
				                    </div>
								</dd>
							</dl>
						</a>

						<!-- 爆品抢完图形 -->
						<span class="robOver_">
							<img src="__PUBLIC__/Home/Images/robOver.png">
						</span>

					</li>
				</ul>
			</div>

		</div>
	</body>
</block>