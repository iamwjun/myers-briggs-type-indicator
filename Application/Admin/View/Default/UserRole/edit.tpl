<extend name="Base/common" />

<block name="link">
</block>

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
					<span class="c-red">*</span>组名：
				</label>
				<div class="formControls col-5">
					<input type="text" name="title" value="{$dataInfo['title']}" datatype="*2-16" nullmsg="组名不能为空" placeholder="群组名称" class="input-text radius" />
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
				<label class="form-label col-3">备注：</label>
				<div class="formControls col-5">
					<textarea name="intro" dragonfly="true" onKeyUp="textarealength(this,100)" placeholder="说点什么...100个字符以内" class="textarea radius">{$dataInfo['intro']}</textarea>
					<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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