<extend name="Base/common" />

<block name="link"></block>

<block name="jscript"> 
	<script type="text/javascript">
		$(function(){
			// 表单验证
			plugins.Validform();
		});
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/update" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$dataInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>节点标题：
				</label>
				<div class="formControls col-5">
					<input type="text" name="title" value="{$dataInfo['title']}" datatype="*2-16" nullmsg="节点标题不能为空" placeholder="节点标题" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>节点名称：
				</label>
				<div class="formControls col-5">
					<input type="text" name="name" value="{$dataInfo['name']}" datatype="*2-30" nullmsg="节点名称不能为空" placeholder="节点名称" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-3">
					<span class="c-red">*</span>排序：
				</label>
				<div class="formControls col-5">
					<input type="text" name="sort" value="{$dataInfo['sort']}" datatype="n" nullmsg="排序值不能为空" placeholder="排序值" class="input-text radius" />
				</div>
				<div class="col-4"> </div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>