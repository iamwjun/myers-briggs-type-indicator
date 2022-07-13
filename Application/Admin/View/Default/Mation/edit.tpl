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
	</script>
	<!-- kindeditor编辑器结束 -->
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/icheck/jquery.icheck.min.js"></script> 
	<script type="text/javascript" src="__PLUGIN_H-ui__/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript" src="__JS__/commodity.js"></script>
	<script type="text/javascript">
		$(function(){
			var ue = UE.getEditor('editor');
		});
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
			<div class="panel panel-default">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
		    	<div class="panel-body">
				    
				    <div class="row cl">
						<label class="form-label col-1">
							分值区间：
						</label>
						<div class="formControls col-9">
							<div>
				    			<span class="select-box radius width-130">
							    	<select name="title" class="select select-class" >
							    	    <option value="选择分值区间">选择分值区间</option>
						                <option value="20-35" <if condition="$dataInfo['title'] eq '20-35'">selected</if>>20-35分</option>
						                <option value="35-50" <if condition="$dataInfo['title'] eq '35-50'">selected</if>>35-50分</option>
						                <option value="50-65" <if condition="$dataInfo['title'] eq '50-65'">selected</if>>50-65分</option>
						                <option value="65-85" <if condition="$dataInfo['title'] eq '65-85'">selected</if>>65-85分</option>
						                <option value="85-100" <if condition="$dataInfo['title'] eq '85-100'">selected</if>>85-100分</option>
						            </select>
								</span>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					
					<!-- <div class="row cl">
						<label class="form-label col-1">图片上传：</label>
						<div class="formControls col-9">
							<div class="uploader-thum-container">
								<div id="fileList" class="uploader-list"></div>
								<div id="filePicker">选择图片</div>
								<input type="hidden" name="picture" value="" id="singleImageUpload" nullmsg="请上传图片" />
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
							<div>
				    			<span class="select-box radius width-130">
							    	<select name="category" class="select" datatype="*" nullmsg="请选择分类" onchange="if(this.value=='情感测试'){$('#sex').css('display','block')}else{$('#sex').css('display','none')}">
						                <option value="">请选择分类</option>
						                <volist name="classList" id="volist">
											<option value="{$volist['title']}" <if condition="$dataInfo['category'] eq $volist['title']">selected</if>>{$volist['title']}</option>
						                </volist>
						            </select>
								</span>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
                   
					<div class="row cl" id="sex" <if condition="$dataInfo['auth'] eq '请选择性别'">style="display:none"<else />style="display:block"</if>>
						<label class="form-label col-1">
							性别选择：
						</label>
						<div class="formControls col-9">
							<div>
				    			<span class="select-box radius width-130">
							    	<select name="auth" class="select select-class" >
							    	    <option value="请选择性别">请选择性别</option>
						                <option value="男生" <if condition="$dataInfo['auth'] eq '男生'">selected</if>>男生</option>
						                <option value="女生" <if condition="$dataInfo['auth'] eq '女生'">selected</if>>女生</option>
						            </select>
								</span>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					
					<div class="row cl">
						<label class="form-label col-1">
							结果分析：
						</label>
						<div class="formControls col-9">
							<script id="editor" name="content" type="text/plain" style="width:100%;height:400px;">{$dataInfo['content']}</script>
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