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
	
	<script type="text/javascript" src="__PLUGIN__/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript" src="__PLUGIN__/ueditor/1.4.3/ueditor.all.min.js"> </script>
	<script type="text/javascript" src="__PLUGIN__/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script>
	    KindEditor.ready(function(K) {
			K.create('#kindeditor', {
	            pasteType : 2,
				allowFileManager : true
			});
		});
		$(function(){
			var ue = UE.getEditor('editor');
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
		<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="panel panel-default">
		    	<div class="panel-body">
				    <div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>题目名称：
						</label>
						<div class="formControls col-9">
							<input type="text" name="title" value="{$dataInfo['title']}" datatype="*" nullmsg="题目名称不能为空" placeholder="题目名称" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					
					<!-- <div class="row cl" style="display:none">
						<label class="form-label col-1">缩略图：</label>
						<div class="formControls col-9">
							<if condition="$dataInfo['picture'] neq ''">
								<div class="singleImageShow">
									<img src="__ROOT__/{$dataInfo['picture']}" width="100" />
								</div>
							</if>
							<div class="uploader-thum-container">
								<div id="fileList" class="uploader-list"></div>
								<div id="filePicker">选择图片</div>
								<input type="hidden" name="picture" value="{$dataInfo['picture']}" id="singleImageUpload" datatype="*" nullmsg="请上传缩略图" />
								<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
							</div>
						</div>
						<div class="col-2"> </div>
					</div> -->
					<div class="row cl">
						<label class="form-label col-1">
							所属分类：
						</label>
						<div class="formControls col-9">
							<div class="classList" style="display:inline;">
				    			<span class="select-box radius width-130">
							    	<select name="pid" class="select select-class" datatype="*" nullmsg="请选择新闻分类">
						                <option value="">请选择分类</option>
											<option value="449" <if condition="$dataInfo.pid eq '449'">selected</if>>性格测试</option>
											<option value="450" <if condition="$dataInfo.pid eq '450'">selected</if>>情感测试</option>
						            </select>
								</span>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>

					<div class="row cl" id="sex" <if condition="$dataInfo['pid_val'] eq '请选择性别'">style="display:none"<else />style="display:block"</if>>
						<label class="form-label col-1">
							性别选择：
						</label>
						<div class="formControls col-9">
							<div>
				    			<span class="select-box radius width-130">
							    	<select name="pid_val" class="select select-class" >
							    	    <option value="请选择性别">请选择性别</option>
						                <option value="男生" <if condition="$dataInfo['pid_val'] eq '男生'">selected</if>>男生</option>
						                <option value="女生" <if condition="$dataInfo['pid_val'] eq '女生'">selected</if>>女生</option>
						            </select>
								</span>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					
					

					<div class="row cl">
						<label class="form-label col-1">答案A【1分】：</label>
						<div class="formControls col-9">
							<textarea name="intro" style="width:300px;height:120px;border-radius:10px;border:1px solid lightgray;font-size:14px;padding:12px">{$dataInfo['intro']}</textarea>
						</div>
						<div class="col-2"> </div>
					</div>

					<div class="row cl">
						<label class="form-label col-1">答案B【2分】：</label>
						<div class="formControls col-9">
							<textarea name="content" style="width:300px;height:120px;border-radius:10px;border:1px solid lightgray;font-size:14px;padding:12px">{$dataInfo['content']}</textarea>
						</div>
						<div class="col-2"> </div>
					</div>

					<div class="row cl" style="display:none">
						<label class="form-label col-1">
							<span class="c-red">*</span>排序：
						</label>
						<div class="formControls col-9">
							<input type="text" name="sort" value="{$dataInfo['sort']}" datatype="n" nullmsg="排序值不能为空" placeholder="排序" class="input-text radius" />
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