<extend name="Base/common" />

<block name="main">
	<include file="header" />

	<include file="nav" />

	<div class="dislpayArrow">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	
	<include file="body" />
	
	<script type="text/javascript">
		/*资讯-添加*/
		function article_add(title,url){
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);
		}
		/*图片-添加*/
		function picture_add(title,url){
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);
		}
		/*产品-添加*/
		function product_add(title,url){
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);
		}
		/*用户-添加*/
		function member_add(title,url,w,h){
			layer_show(title,url,w,h);
		}
	</script>
</block>
