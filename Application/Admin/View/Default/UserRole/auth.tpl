<extend name="Base/common" />

<block name="link">
	<link type="text/css" rel="stylesheet" href="__PLUGIN__/ztree/css/zTreeStyle/zTreeStyle.css" />
</block>

<block name="jscript">
	<script type="text/javascript" src="__PLUGIN__/ztree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="__PLUGIN__/ztree/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="__PLUGIN__/ztree/js/jquery.ztree.excheck-3.5.js"></script>
	
	<script type="text/javascript">
		<!--
		var setting = {
			check: { enable: true },
			data: {
				simpleData: { enable: true }
			}
		};
		var zNodes = {$nodeList};
		$(document).ready(function() {
			$.fn.zTree.init( $('#ZTreeAuth'), setting, zNodes );
			$( '#formValidform' ).submit(function(){
				var treeObj = $.fn.zTree.getZTreeObj( 'ZTreeAuth' );
				var nodes = treeObj.getCheckedNodes(true);
				var auth = ',';
				var _this = $(this);
				for ( var i in nodes ) {
					auth += nodes[i].node + ',';
				}
				if ( auth == "" ) {
					layer.msg( '请选择!', { icon: 5,time:1000 } );
					return false;
				}
				$.ajax({
					url : _this.attr('action') + '?rnd='+ Math.random(),
					data : {
						id : '{$authInfo["id"]}',
						auth : auth
					},
					type : 'POST',
					async : true,
					dataType : 'json',
					beforeSend : function() {
						layer.msg('正在处理……',{icon: 3,time:100000});
					},
					success : function( data ) {
						if ( data['status'] == 0 ) {
							layer.msg(data['info'],{icon: 5,time:1000});
						} else {
							layer.msg(data['info'],{icon: 6,time:1000});
							var index = parent.layer.getFrameIndex(window.name);
							parent.$( '#RefreshButton' ).click();
							parent.layer.close(index);
						}
					}
				});
				return false;
			});
		});
		//->
	</script>
</block>

<block name="main">
	<div class="pd-20">
		<form action="__URL__/auth_save" method="post" class="form form-horizontal" id="formValidform">
			<input type="hidden" name="id" value="{$authInfo['id']}" />
			<div class="row cl">
				<label class="form-label col-4">
					授权组：
				</label>
				<div style="position:relative; top:4px;">{$authInfo['title']}</div>
			</div>
			<div class="row cl">
				<label class="form-label col-4">
					权限列表：
				</label>
				<div class="formControls col-5">
					<ul id="ZTreeAuth" class="ztree"></ul>
				</div>
				<div class="col-3"> </div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</block>