<extend name="Base/common" />

<block name="link">
    <style type="text/css">
        .input-text { margin-bottom:5px; }
        .relative,.select-box { position:relative; top:-3px; }
    </style>
</block>

<block name="jscript">
    <script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="__PLUGIN_H-ui__/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="__JS__/list-page.js"></script>
    <script type="text/javascript" src="__JS__/commodity.js"></script>
    <script type="text/javascript">
    $(function(){
    	plugins.walletRecharge({
    		'clickObj' : '.walletRecharge',
    		'url' : '__URL__/walletRecharge'
    	});
    });
    /*
    function del_user(id)
    {
      var path="__URL__";
      $.ajax({
        type:"POST",
        url :path+"/del_user",
        data:"uid="+id,
      });
    }*/
    </script>
</block>

<block name="main">
	
	<!-- 面包屑导航 -->
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i>&nbsp;首页
        <span class="c-gray en">&gt;</span>&nbsp;会员管理
        <span class="c-gray en">&gt;</span>&nbsp;会员列表
        <a class="btn btn-success radius r mr-20" id="RefreshButton" href="javascript:void(0);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    
    <div class="pd-20">
    	
    	<!-- 条件查询 -->
        <div class="text-c">
            <form action="" method="post">
                <!-- 姓名 -->
                <input type="text" name="nickname" value="{$paramter['nickname']}" placeholder="输入姓名" class="input-text radius width-200" />
         
                
                <!-- 开始日期 -->
                <input type="text" name="start_time" value="{$paramter['start_time']}" id="datemin" placeholder="开始日期" class="input-text radius Wdate width-200">
                -
                <!-- 结束日期 -->
                <input type="text" name="end_time" value="{$paramter['end_time']}" id="datemax" placeholder="结束日期" class="input-text radius Wdate width-200">
                <!-- 用户类型 -->
              <!--   <span class="select-box radius width-130">
                   <select name="type" class="select">
                     <option value="">请选择会员类型</option>
                      
                            <option value="-1">普通会员</option>
                            <option value="1">工程师</option>
                        
                   </select>
                </span> -->

                <!-- 搜索按钮 -->
                <button type="submit" class="btn btn-success radius relative" id="" name="">
                    <i class="Hui-iconfont">&#xe665;</i>&nbsp;查询
                </button>
            </form>
        </div>
        
        <!-- 操作 -->
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a href="" class="btn btn-success radius">
                    <i class="Hui-iconfont">&#xe68f;</i>&nbsp;全部用户
                </a>
                <a href="javascript:void(0);" class="btn btn-danger radius BatchRemove">
                    <i class="Hui-iconfont">&#xe6e2;</i>&nbsp;批量删除
                </a>
            </span>
            <span class="r">共有数据：<strong>{$dataList|count}</strong> 条</span>
        </div>
        
        <!-- 列表 -->
        <div class="mt-20">
            <table class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                    <tr class="text-c">
                        <th width="2%">
                            <input type="checkbox" name="" value="">
                        </th>
                        <th width="5%">编号</th>
                        <th width="5%">排序</th>
                        <th width="8%">用户账号</th>
                        <th width="8%">用户角色</th>
                        <th width="10%">微信昵称</th>
                        <th width="10%">姓名</th>
                        <th width="10%">单位名称</th>
                        <th width="15%">单位地址</th>
                        <th width="10%">注册时间</th>
                        <th width="10%">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <volist name="dataList" id="volist">
                        <tr class="text-c">
                            <td>
                                <input type="checkbox" value="{$volist['id']}" name="dataId">
                            </td>
                            <td>{:( $page['pageNum'] - 1 ) * $page['numperpage'] + ( $key + 1 )}</td>
                            <td>
                                <input type="text" name="Sequence" value="{$volist['sort']}" class="input-text text-c">
                            </td>
                            <td>{$volist['username']}</td>
                            <td>
                            <if condition="$volist.unit eq 1">
                            工程师
                            <elseif condition="$volist.unit eq 2" />
                            经销商
                            <elseif condition="$volist.unit eq 3" />
                            供应商
                            <elseif condition="$volist.unit eq 4" />
                            计量检测
                            <else />
                            普通用户
                            </if>
                            </td>
                            <td><if condition="$volist.wx_name neq ''">{:json_decode($volist['wx_name'])}<else />非微信用户</if></td>
                            <td>{$volist['nickname']}</td>
                            <td>{$volist['company']}</td>
                            <td>{$volist['company_addr']}</td>
                            <td>{$volist['create_time']|date='Y-m-d H:i:s',###}</td>
                            <td class="td-manage">
                                <if condition="$volist['status'] eq 0">
                                    <a href="javascript:void(0);" data-id="{$volist['id']}" data-status="1" data-field="status" title="禁用" class="ml-5 updateStatus">
                                        <i class="Hui-iconfont">&#xe631;</i>
                                    </a>
                                <else />
                                    <a href="javascript:void(0);" data-id="{$volist['id']}" data-status="0" data-field="status" title="启用" class="ml-5 updateStatus">
                                        <i class="Hui-iconfont">&#xe6e1;</i>
                                    </a>
                                </if>
                                <!-- <a href="javascript:void(0);" onclick="layer_full('编辑商品','__URL__/edit/id/{$volist['id']}','','');" title="编辑商品" class="ml-5">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>

                                <a href="javascript:void(0);" _href="__URL__/details/id/{$volist['id']}" data-title="查看信息" title="查看信息" class="ml-5 TabSlide">
                                    <i class="Hui-iconfont">&#xe695;</i> -->
                                </a>
                                <a href="javascript:void(0);" data-id="{$volist['id']}" onclick="del_user(<?=$volist['id']?>)" title="删除" class="ml-5 singleRemove">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </tr>
                    </volist>
                </tbody>
            </table>
        </div>
    </div>
</block>
