;
(function($){
	$.fn.table = function( options ) {
		var _this = $( this );
		var defaults = {
				colSpan : 0,
				url : '',
				noDataList : function( ColSpan, showMsg ) {
					return '<tr><td colspan="'+ ColSpan +'" class="noDataList">'+ showMsg +'</td></tr>';
				},
				loadingDataList : function( ColSpan, showMsg ) {
					if ( showMsg == '' ) {
						showMsg = '<div class="sk-spinner sk-spinner-wave"><div class="sk-rect1"></div>\n<div class="sk-rect2"></div>\n<div class="sk-rect3"></div>\n<div class="sk-rect4"></div>\n<div class="sk-rect5"></div>\n</div>';
					}
					return '<tr><td colspan="'+ ColSpan +'" class="loadingDataList">'+ showMsg +'</td></tr>';
				},
				pageNumber : 1,
				pageSize : 10,
				style : {
					pagination : '#tableListPage',
					showLoad : '.loadingDataList'
				}
			};
		var defaults = $.extend( defaults, options );
		
		$.ajax({
			url : defaults.url,
			data : {},
			type : 'POST',
			async : true,
			dataType : 'json',
			beforeSend : function() {
				_this.append( defaults.loadingDataList( defaults.colSpan, '' ) );
			}, 
    		success : function( data ){
				if ( data['status'] == 1 ) {
					var DataList = data['dataList'];
					if ( DataList && DataList.length > 0 ) {
						formatList( DataList );
					} else {
						errorMsg( '还没有任何记录!!!' );
					}
				} else {
					errorMsg( '操作错误!!!' )
				}
			}
		});
		
		// 失败显示
		function errorMsg( info ) {
			$( defaults.style.showLoad ).hide();
			_this.append( defaults.noDataList( defaults.colSpan, info ) );
		}
		
		// 串接数据
		function formatList( data ) {
			$( defaults.style.showLoad ).hide();
			var node = '';
			for ( var i = 0,size = data.length; i < size; i ++ ) {
				var temp = data[i];
				node += '<tr>';
                node += '	<td>';
                node += '		<input name="select-item" value="'+ temp['id'] +'" type="checkbox">';
                node += '	</td>';
                node += '	<td>'+ temp['id'] +'</td>';
                node += '	<td>'+ temp['name'] +'</td>';
                node += '	<td>'+ temp['price'] +'</td>';
            	node += '</tr>';
			}
			_this.append( node );
		}
		
	}
})(jQuery);
