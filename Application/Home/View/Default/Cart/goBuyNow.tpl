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
        <h3>立即购买</h3>
        <a href="{:U('Index/index')}"><i class="iconfont">&#xe621;</i></a>
    </header>
    
    <!-- 主题内容 -->
	<div class="main">
		<div class="flow-cart blur-div">
			<div class="no-div-message">
				<i class="iconfont icon-biaoqingleiben">&#xe676;</i>
				<p>什么都没有，去逛逛吧！~！</p>
			</div>
		</div>
	</div>
</block>