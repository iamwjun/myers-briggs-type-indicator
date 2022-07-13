<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform_configManual">
	<input type="hidden" name="id" value="{$dataInfo['id']}" />

    <div class="panel panel-default mt-10">
    	<div class="panel-header">操作手册</div>
    	<div class="panel-body">
			<div class="row cl">
				<label class="form-label col-r col-1.5">
					<span class="c-red">*</span>操作手册上传：
				</label>
				<div class="formControls col-9">
					<input type="text" name="iphone_install_package" value="{$dataInfo['iphone_install_package']}" datatype="*" nullmsg="请上传操作手册" placeholder="操作手册上传" class="input-text radius" />
				</div>
				<div class="col-1.5"> </div>
			</div>
		</div>
    </div>
	
	<div class="row cl">
		<div class="col-9 col-offset-10">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</form>