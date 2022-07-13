<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="1; url={$url}" />
</head>

<style>
@charset "utf-8";
/* CSS Document */
*{margin:0px; padding:0px; font-family:"Microsoft YaHei"; list-style:none; text-decoration:none; border:0;}
body{background:#fff;}
@-moz-keyframes loader_shape {
  0% {
    -moz-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -moz-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-webkit-keyframes loader_shape {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes loader_shape {
  0% {
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
/* :not(:required) hides this rule from IE9 and below */
.loader_shape:not(:required) {
  border: 6px solid #9ac;
  -moz-border-radius: 24px;
  -webkit-border-radius: 24px;
  border-radius: 24px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  overflow: hidden;
  position: relative;
  text-indent: -9999px;
  width: 48px;
  height: 48px;
}
.loader_shape:not(:required)::before {
  -moz-animation: loader_shape 1250ms infinite linear;
  -webkit-animation: loader_shape 1250ms infinite linear;
  animation: loader_shape 1250ms infinite linear;
  -moz-transform-origin: 3px 3px;
  -ms-transform-origin: 3px 3px;
  -webkit-transform-origin: 3px 3px;
  transform-origin: 3px 3px;
  background: #9ac;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  content: '';
  display: block;
  position: absolute;
  width: 6px;
  height: 19.2px;
  left: 15px;
  top: 15px;
}
.loader_shape:not(:required)::after {
  -moz-animation: loader_shape 15000ms infinite linear;
  -webkit-animation: loader_shape 15000ms infinite linear;
  animation: loader_shape 15000ms infinite linear;
  -moz-transform-origin: 3px 3px;
  -ms-transform-origin: 3px 3px;
  -webkit-transform-origin: 3px 3px;
  transform-origin: 3px 3px;
  background: #9ac;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  content: '';
  display: block;
  position: absolute;
  width: 6px;
  height: 16px;
  left: 15px;
  top: 15px;
}
.loader
{width:160px; height:100px; top:50%; margin-top:-50px; left:50%; margin-left:-80px; position:absolute; text-align:center;}
.loader_txt
{line-height:24px; font-size:16px; color:#555; margin-top:10px;}
</style>

<body>
<div class="loader">
    <div class="loader_shape">
        <span>Loading&#8230;</span>
    </div>
    <!--div class="loader_txt">加载中，请稍后！</div-->
</div>
</body>
</html>

  