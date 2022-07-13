<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>跳转提示</title>
	<link type="text/css" rel="stylesheet" href="__STYLE__/initital.css" />
	<link type="text/css" rel="stylesheet" href="__STYLE__/home.css" />
</head>
<body>
<!--跳转-->

<div class="tiaozhuan">
    <div class="tiao_img"><img class="img-responsive" src="__IMAGES__/tiaozhuans.png" alt=""/></div>
    <div class="tiao_denglu">
        <ul>
            <li class="tiao_li1"><img src="__IMAGES__/load_bg_03.png" alt=""/></li>
            <li class="tiao_li2">
            	<span>
					<?php if(isset($message)) {?>
		            	<?php echo($message); ?>
		            <?php }else{?>
						<font style="color:red;"><?php echo($error); ?></font>
		            <?php }?>
				</span>
			</li>
            <li class="tiao_li3"><img src="__IMAGES__/load_bg_05.png" alt=""/></li>
        </ul>
    </div>
    <div class="tiao_divs">页面自动 <a href="<?php echo($jumpUrl); ?>" id="href">跳转</a>等待时间：<span id="wait"><?php echo($waitSecond); ?></span></div>
	<script type="text/javascript">
        (function(){
            var wait = document.getElementById('wait'), href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if (time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
                    }, 1000);
        })();
    </script>
</div>
</body>
</html>