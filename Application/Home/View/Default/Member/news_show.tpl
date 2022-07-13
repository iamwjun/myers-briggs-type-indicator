<extend name="Base/common" />

{// css样式区 }
<block name="link">
</block>

<block name="jscript">
<script type="text/javascript">
window.onload = function() {
	var width = parseInt( $( window ).width() ) * 0.98;
	$( ".news_fl_con img" ).each( function() {
		if ( parseInt( $( this ).width() ) > width ) {
			$(this).css({"width":"100%"});
		}
	} );
}
</script>
</block>

<block name="main">
	<include file="Public/top" />
    <div id="news_show">
        <div class="news_fl_title">
            {$dataInfo['title']}
        </div>
        <div class="news_fl_title1">
            <span>发布时间：{$dataInfo['create_time']||date="Y-m-d H:i",###}</span>
        </div>
        <div class="news_fl_con">
            {$dataInfo['content']}
        </div>
    </div>
</block>
