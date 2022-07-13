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

		$('.pid-select').change(function(){
				var $this = $(this);
				var id = $this.val();
				if(id==30){
					$('.addInfo').css('display','block');
					$('.addInfo .col-1').html('抢购时间:');
				}else{
					$('.addInfo').css('display','none');
				}
				
			})
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
							<span class="c-red">*</span>商品名称：
						</label>
						<div class="formControls col-9">
							<input type="text" name="title" value="{$dataInfo['title']}" datatype="*" nullmsg="商品标题不能为空" placeholder="商品标题" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">封面图：</label>
						<div class="formControls col-9">
							<if condition="$dataInfo['picture'] neq ''">
								<div class="singleImageShow">
									<img src="__ROOT__/{$dataInfo['picture']}" width="100" />
								</div>
							</if>
							<div class="uploader-thum-container">
								<div id="fileList" class="uploader-list"></div>
								<div id="filePicker">选择图片</div>
								<input type="hidden" name="picture" value="{$dataInfo['picture']}" id="singleImageUpload" datatype="*" nullmsg="请上传商品封面图" />
								<input type="button" id="btn-star" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>所需积分：
						</label>
						<div class="formControls col-9">
							<input type="text" name="integral" value="{$dataInfo['integral']}" datatype="*" nullmsg="商品积分不能为空" placeholder="积分" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>排序：
						</label>
						<div class="formControls col-9">
							<input type="text" name="sort" value="{$dataInfo['sort']}" datatype="n" nullmsg="排序值不能为空" placeholder="排序" class="input-text radius" />
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							<span class="c-red">*</span>是否上架：
						</label>
						<div class="formControls col-9 skin-minimal">
							<div class="radio-box">
								<if condition="$dataInfo['shelves'] eq 1">
									<input type="radio" name="shelves" value="1" checked="checked" id="shelves-1" datatype="*" nullmsg="请选择是否上架" />
								<else />
									<input type="radio" name="shelves" value="1" id="shelves-1" datatype="*" nullmsg="请选择是否上架" />
								</if>
								<label for="shelves-1">是</label>
							</div>
							<div class="radio-box">
								<if condition="$dataInfo['shelves'] eq 0">
									<input type="radio" name="shelves" value="0" checked="checked" id="shelves-2" />
								<else />
									<input type="radio" name="shelves" value="0" id="shelves-2" />
								</if>
								<label for="shelves-2">否</label>
							</div>
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">商品简介：</label>
						<div class="formControls col-9">
							<textarea name="intro" dragonfly="true" onKeyUp="textarealength(this,100)" placeholder="几句描述商品的话...100个字符以内" class="textarea radius">{$dataInfo['intro']}</textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
						</div>
						<div class="col-2"> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-1">
							商品详情：
						</label>
						<div class="formControls col-9">
							<textarea name="content" id="kindeditor">{$dataInfo['content']}</textarea>
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