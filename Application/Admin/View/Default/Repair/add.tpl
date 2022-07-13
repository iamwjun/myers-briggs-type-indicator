<extend name="Base/common" />

<block name="link">
	<link href="__PLUGIN_H-ui__/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</block>

<block name="jscript">
	<!-- kindeditor编辑器开始 -->
	<link rel="stylesheet" href="__PLUGIN__/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="__PLUGIN__/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="__PLUGIN__/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="__PLUGIN__/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="__PLUGIN__/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/My97DatePicker/WdatePicker.js"></script>
	<script>
	    KindEditor.ready(function(K) {
			K.create('#kindeditor', {
	            pasteType : 2,
				allowFileManager : true
			});
		});
	</script>
	<!-- kindeditor编辑器结束 -->
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/icheck/jquery.icheck.min.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript" src="__JS__/commodity.js"></script>
	<script type="text/javascript">
		$(function(){
			// radio插件
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});

			// 单图上传
			plugins.singleImageUpload();
			
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/create" method="post" class="form form-horizontal" id="formValidform">
			<div class="panel panel-default">
			    <input type="hidden" value="<?php $day=date('Ymd',time());$number=$day.'0000'.($maxid+1); echo $number;?>" name="order_number">
			    <input type="hidden" value="" name="pl_info">
			    <input type="hidden" value="1" name="u_type">
			    <input type="hidden" value="1" name="status">
			    <input type="hidden" value="0" name="sort">
			    <input type="hidden" value="0" name="is_delete">
			    <input type="hidden" value="1" name="type">
			    <input type="hidden" value="23" name="create_time">
		    	<div class="panel-body">
		    	    <div class="row c1">
                        <label class="form-label col-1">
							<span class="c-red">*</span>拆分订单：
						</label>
						<select name="uid" style="height: 24px">
                          <option value="请选择要拆分的批量订单">请选择要拆分的批量订单</option>
                          <volist name="pl_list" id="vo">
                           <option value="{$vo.uid}">{$vo.order_number}</option>
                          </volist>
						</select>
					</div>
					<div class="row c1">
                        <label class="form-label col-1">
							<span class="c-red">*</span>服务类别：
						</label>
						<select name="category" style="height: 24px">
                          <option value="请选择服务类别">请选择服务类别</option>
                          <option value="bx">报修服务</option>
                          <option value="jc">检测校准</option>
                          <option value="az">安装升级</option>
                          <option value="wb">保养维护</option>
						</select>
					</div>
				    <div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>设备名称：
						</label>
						<div class="formControls col-9">
							<input type="text" name="name" value="" datatype="*" nullmsg="设备名称不能为空" placeholder="设备名称" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>设备型号：
						</label>
						<div class="formControls col-9">
							<input type="text" name="model" value="" datatype="*" nullmsg="设备型号不能为空" placeholder="设备型号" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>产品编号：
						</label>
						<div class="formControls col-9">
							<input type="text" name="number" value="" datatype="*" nullmsg="产品编号不能为空" placeholder="产品编号" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">封面图：</label>
						<div class="formControls col-9">
							<div class="uploader-thum-container">
								<div id="fileList" class="uploader-list"></div>
								<div id="filePicker">选择图片</div>
								<input type="hidden" name="picture" value="" id="singleImageUpload" datatype="*" nullmsg="请上传商品封面图" />
								<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row c1">
                        <label class="form-label col-1">
							<span class="c-red">*</span>工程师：
						</label>
						<select name="do_id" style="height: 24px">
                          <option value="请选择上门服务的工程师">请选择上门服务的工程师</option>
                          <volist name="engineer" id="vo">
                           <option value="{$vo.uid}">【<if condition="$vo.category neq ''">{$vo.category}<else />计量检测师</if>】{$vo.truename}</option>
                          </volist>
						</select>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>上门时间：
						</label>
						<div class="formControls col-9">
							<input type="text" name="times" value="" datatype="*"  placeholder="工程师上门服务时间" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							单位名称：
						</label>
						<div class="formControls col-9">
							<input type="text" name="company_name" value="{$title}"  placeholder="客户单位名称" class="input-text" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>联系人：
						</label>
						<div class="formControls col-9">
							<input type="text" name="contact_name" value="{$title}" datatype="*"  placeholder="联系人" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>联系电话：
						</label>
						<div class="formControls col-9">
							<input type="text" name="tel" value="{$title}" datatype="*"  placeholder="联系电话" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>维修地址：
						</label>
						<div class="formControls col-9">
							<input type="text" name="address" value="{$title}" datatype="*"  placeholder="维修地址" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">故障描述：</label>
						<div class="formControls col-9">
							<textarea name="describle" dragonfly="true" onKeyUp="textarealength(this,100)" placeholder="几句描述商品的话...100个字符以内" class="textarea radius"></textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
						</div>
						<div class="col-2"> </div>
					</div>
				</div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-9">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>