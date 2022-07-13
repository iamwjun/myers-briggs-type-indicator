<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>{$config['web_title']}</title>
	<meta name="keywords" content="{$config['web_keywords']}" />
	<meta name="description" content="{$config['web_description']}" />
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="__IMAGES__/favicon.ico">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/bootstrap.min.css?v=3.3.5">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/font-awesome.min.css?v=4.4.0">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/animate.min.css">
    <link rel="stylesheet" href="__PLUGIN__/hplus/css/style.min.css?v=4.0.0">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
	
	<!-- 最大box开始 -->
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
            	<i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                            	<if condition="$userAuth['face'] eq ''">
                            		<if condition="$userAuth['sex'] eq 0">
                            			<img src="__IMAGES__/default_male_face.png" width="64" alt="管理员头像" class="img-circle" />
									<else />
										<img src="__IMAGES__/default_female_face.png" width="64" alt="管理员头像" class="img-circle" />
									</if>
								<else />
									<img src="__ROOT__/{$userAuth['face']}" alt="管理员头像" class="img-circle" />
								</if>
							</span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               		<span class="block m-t-xs">
                               			<strong class="font-bold">{$userAuth['username']}</strong>
									</span>
                                	<span class="text-muted text-xs block">
                                		{$userAuth['nickname']}
										<b class="caret"></b>
									</span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li>
                                	<a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li>
                                <li>
                                	<a class="J_menuItem" href="profile.html">个人资料</a>
                                </li>
                                <li>
                                	<a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li>
                                	<a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                	<a href="{:U('/Admin/logout')}">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
					<!-- 菜单列表开始 -->
					<volist name="menuList" id="volist">
	                    <li>
	                        <a href="javascript:void(0);">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">{$volist['title']}</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                        	<volist name="volist['child']" id="child">
		                            <li>
		                                <a class="J_menuItem" href="{:U($child['url'])}" data-index="0">{$child['title']}</a>
		                            </li>
								</volist>
	                        </ul>
	                    </li>
					</volist>
					<!-- 菜单列表结束 -->
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
		
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        	
			<!-- 右侧顶部开始 -->
			<div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="__PLUGIN__/hplus/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="__PLUGIN__/hplus/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="index_v1.html" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
			<!-- 右侧顶部结束 -->
			
			<!-- 右侧选项卡栏开始 -->
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                	<i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:void(0);" class="active J_menuTab" data-id="{:U('/Admin/basic')}">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                	<i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                    	关闭操作
						<span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive">
                        	<a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll">
                        	<a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther">
                        	<a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="login.html" class="roll-nav roll-right J_tabExit">
                	<i class="fa fa fa-sign-out"></i>
					退出
				</a>
            </div>
			<!-- 右侧选项卡栏结束 -->
			
			<!-- iframe窗口开始 -->
            <div class="row J_mainContent" id="content-main">
                <iframe src="{:U('/Admin/basic')}" data-id="{:U('/Admin/basic')}" class="J_iframe" name="iframe0" width="100%" height="100%" frameborder="0" seamless></iframe>
            </div>
			<!-- iframe窗口结束 -->
			
			<!-- 底部版权开始 -->
            <div class="footer">
                <div class="pull-right">
                	技术支持：<a href="http://www.duoxiang.net" target="_blank">成都多享科技有限公司</a>
                </div>
            </div>
			<!-- 底部版权结束 -->
			
        </div>
        <!--右侧部分结束-->
		
		<!-- 右侧边栏 -->
        <include file="Index/right_sidebar.tpl" />
		
    </div>
	<!-- 最大box结束 -->
	
	<!-- js区域开始 -->
    <script src="__PLUGIN__/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="__PLUGIN__/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="__PLUGIN__/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="__PLUGIN__/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="__PLUGIN__/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="__PLUGIN__/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script src="__PLUGIN__/hplus/js/contabs.min.js"></script>
    <script src="__PLUGIN__/hplus/js/plugins/pace/pace.min.js"></script>
	<!-- js区域结束 -->
	
</body>
</html>