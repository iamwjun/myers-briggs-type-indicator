<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configAppManage">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />

    <div class="panel panel-default mt-10">
    	<div class="panel-header">APP管理</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-r col-1.5">
					<span class="c-red">*</span>IPhone&nbsp;&nbsp;安装包：
				</label>
				<div class="formControls col-9">
					<input type="text" name="iphone_install_package" value="{$dataInfo['iphone_install_package']}" datatype="*" nullmsg="必须上传Iphone安装包" placeholder="Iphone安装包" class="input-text radius" />
				</div>
				<div class="col-1.5"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-r col-1.5">
					<span class="c-red">*</span>Android安装包：
				</label>
				<div class="formControls col-9">
					<input type="text" name="android_install_package" value="{$dataInfo['android_install_package']}" datatype="*" nullmsg="必须上传Android安装包" placeholder="Android安装包" class="input-text radius" />
				</div>
				<div class="col-1.5"> </div>
			</div>
			<!--div class="row cl">
				<label class="form-label col-r col-1.5">
					<span class="c-red">*</span>APP下载二维码：
				</label>
				<div class="formControls col-9">
					<if condition="$dataInfo['app_download_erweima'] neq ''">
						<div class="singleImageShow">
							<img src="__ROOT__/{$dataInfo['app_download_erweima']}" width="100" />
						</div>
					</if>
					<div class="uploader-thum-container">
						<div id="fileList1" class="uploader-list"></div>
						<div id="filePicker1">选择图片</div>
						<input type="hidden" name="app_download_erweima" value="" id="singleImageUpload1" datatype="*" nullmsg="必须上传APP下载二维码" placeholder="APP下载二维码" />
						<input type="button" id="btn-star1" class="btn btn-default btn-uploadstar radius ml-10" value="开始上传" />
					</div>
				</div>
				<div class="col-1.5"> </div>
			</div-->
		</div>
    </div>
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>