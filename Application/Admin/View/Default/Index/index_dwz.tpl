<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<title>{$config['web_title']}</title>
<meta name="keywords" content="{$config['web_keywords']}" />
<meta name="description" content="{$config['web_description']}" />

<!-- kindeditor编辑器开始 -->
<link rel="stylesheet" href="__PLUGIN__/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="__PLUGIN__/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="__PLUGIN__/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="__PLUGIN__/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="__PLUGIN__/kindeditor/plugins/code/prettify.js"></script>
<script>
    var GV = {};
    GV.kindeditor = {
        basePath : '__PLUGIN__/kindeditor/',
        upload : '__PLUGIN__/kindeditor/php/upload_json.php',
        filemanager : '__PLUGIN__/kindeditor/php/file_manager_json.php'
    };
</script>
<!-- kindeditor编辑器结束 -->

<!-- dwz插件区开始 -->
<link href="__PLUGIN__/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="__PLUGIN__/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="__PLUGIN__/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link rel="stylesheet" type="text/css" href="__STYLE__/common.css" />
<!--[if IE]>
<link href="__PLUGIN__/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
<!--[if lte IE 9]>
<script src="__PLUGIN__/dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script type="text/javascript" src="__PLUGIN__/dwz/js/jquery-1.7.2.js"></script>

<!-- fancybox start -->
<script type="text/javascript" src="__PLUGIN__/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="__PLUGIN__/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="__PLUGIN__/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
$( function() {
	$("a[rel=example_group]").fancybox({
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'titlePosition' 	: 'over',
		'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
			return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
		}
	});
} )
</script>
<!-- fancybox end -->

<!-- 滚动条 -->
<script type="text/javascript" src="__PLUGIN__/dwz/js/jquery.nicescroll.js"></script>

<!-- uploadify批量上传图片开始 -->
<script src="__PLUGIN__/uploadify/jquery.uploadify-3.1.js?rnd=<?php echo rand( 1000, 9999 ); ?>" type="text/javascript"></script>
<link href="__PLUGIN__/uploadify/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- uploadify批量上传图片结束 -->

<script type="text/javascript">
    // 设置路径
    var PATAVAR = {
   		//'session_name' : '{:session_name()}',
    	//'session_id' : '{:session_id()}',
        'ROOT' : '__ROOT__',
        'uploadify_path' : '{:U("File/uploadify")}',
        'ROOTPATH' : '__PLUGIN__/',
        'dwzThemePath' : '__PLUGIN__/dwz/',
    };
</script>
<script src="__PLUGIN__/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="__PLUGIN__/dwz/chart/raphael.js"></script>
<script type="text/javascript" src="__PLUGIN__/dwz/chart/g.raphael.js"></script>
<script type="text/javascript" src="__PLUGIN__/dwz/chart/g.bar.js"></script>
<script type="text/javascript" src="__PLUGIN__/dwz/chart/g.line.js"></script>
<script type="text/javascript" src="__PLUGIN__/dwz/chart/g.pie.js"></script>
<script type="text/javascript" src="__PLUGIN__/dwz/chart/g.dot.js"></script>

<script src="__PLUGIN__/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="__PLUGIN__/dwz/js/dwz.print.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换是下面dwz.regional.zh.js还需要引入)
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="__PLUGIN__/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<!-- dwz插件区结束 -->

<!-- 时间日期插件开始 -->
<script src="__PLUGIN__/My97DatePicker/WdatePicker.js" type="text/javascript" ></script>
<!-- 时间日期插件结束 -->

    <script type="text/javascript">
$(function(){

	// 加载dwz
    DWZ.init("__PLUGIN__/dwz/dwz.frag.xml", {
        loginUrl : "{:U('Login/login_dialog')}",
        loginTitle : "登录",                              // 弹出登录对话框
		loginUrl : "{:U('Login/index')}",                // 跳到登录页面
        statusCode : {
            ok : 1,
            error : 0,
            timeout : 2
        },                                               //【可选】
        pageInfo : {
            pageNum : "pageNum",
            numPerPage : "numPerPage",
            orderField : "orderField",
            orderDirection : "orderDirection"
        },                                               //【可选】
        keys : {
            statusCode : "statusCode",
            message : "message"
        },                                               //【可选】
        ui : {
            hideMode : 'offsets'
        },                                               //【可选】hideMode:navTab组件切换的隐藏方式，
                                                         // 支持的值有’display’，’offsets’负数偏移位置的值，
                                                         // 默认值为’display’
        debug : false,                                   // 调试模式 【true|false】
        callback:function(){
            initEnv();
            $("#themeList").theme({themeBase:"__PLUGIN__/dwz/themes"});
        }
    });
});
//清理浏览器内存,只对IE起效，FF不需要
if ($.browser.msie) {
	window.setInterval("CollectGarbage();", 10000);
}
</script>
<!-- dwz插件区结束 -->

</head>

<body scroll="no">
<div id="layout">
    <div id="header">
        <div class="headerNav">
            <a class="logo" href="http://www.duoxiang.net" target="_blank">标志</a>
            <ul class="nav">
                <li><a href="__ROOT__/" target="_blank"><i class="iconfont">&#xe637;</i>网站首页</a></li>
                <li><a href="{:U('Index/uppwd')}" target="dialog" rel="修改密码" title="修改密码"><i class="iconfont">&#xe621;</i>修改密码</a></li>
                <li><a href="{:U('/Admin/logout')}"><i class="iconfont">&#xe636;</i>退出</a></li>
            </ul>
            <!--ul class="themeList" id="themeList">
                <li theme="default"><div class="selected">蓝色</div></li>
                <li theme="green"><div>绿色</div></li>
                <li theme="purple"><div>紫色</div></li>
                <li theme="silver"><div>银色</div></li>
                <li theme="azure"><div>天蓝</div></li>
            </ul-->
        </div>
        <!-- navMenu -->
    </div>

    <div id="leftside">
        <div id="sidebar_s">
            <div class="collapse">
                <div class="toggleCollapse">
                    <div></div>
                </div>
            </div>
        </div>
        <div id="sidebar">
            <div class="toggleCollapse">
            	<i class="iconfont">&#xe639;</i>
                <h2>主菜单</h2>
                <div>收缩</div>
            </div>
            <div class="accordion" fillSpace="sideBar">
				<!-- menu start -->
				<volist name="menuList" id="volist">
	                <div class="accordionHeader">
	                    <h2>
                        	<i class="iconfont">&{$volist['icon']}</i>
	                        <!--span>Folder</span-->
							{$volist['title']}
	                    </h2>
	                </div>
	                <div class="accordionContent">
	                    <ul class="tree treeFolder">
							<volist name="volist['child']" id="childList">
								<if condition="$userAuth['id'] eq 1">
									<li>
										<a href="{:U( $childList['url'] )}" target="navTab" rel="{$childList['rel']}">{$childList['title']}</a>
									</li>
								<elseif condition="strpos($childList['url'],'MemberNode') === false && strpos($childList['url'],'UserNode') === false && strpos($childList['url'],'UserGroup') === false" />
									<li>
										<a href="{:U( $childList['url'] )}" target="navTab" rel="{$childList['rel']}">{$childList['title']}</a>
									</li>
								</if>
							</volist>
	                    </ul>
	                </div>
				</volist>
                <!-- menu end -->
            </div>
        </div>
    </div>
	
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <p>
                           	 欢迎光临，{$userAuth['nickname']}
                            <font style="float:right;">{$Think.now}</font>
                        </p>
                    </div>
                    <div class="pageFormContent" layoutH="80">

                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="footer">
    技术支持：<a href="http://www.duoxiang.net" target="_blank">成都多享科技有限公司</a>
</div>

<!-- 滚动条 -->
<script type="text/javascript">
$("#sidebar").niceScroll({
	cursorcolor:"#222",
	cursoropacitymax:1,
	touchbehavior:false,
	cursorwidth:"4px",
	cursorborder:"0",
	cursorborderradius:"5px"
});
</script>

</body>
</html>