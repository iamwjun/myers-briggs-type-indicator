$(function(){
	$.twoLinkage = function( parentObj, subObj ) {
		parentObj.change( function() {
			var theVal = $( this ).val();
			var url = $( this ).attr( 'data-url' );
			$.ajax({
				url : url + "/" + Math.random(),
				data : {
					id : theVal,
				},
				type : 'POST',
				async : true,
				dataType : 'json',
				beforeSend : function() {},
				success : function( data ) {
					if ( data['status'] ) {
						var theObj = data['info'];
						var html = "<option value=''>请选择</option>";
						for ( var i = 0; i < theObj.length; i ++ ) {
							html += "<option value='"+theObj[i]['id']+"'>"+theObj[i]['title']+"</option>";
						}
						subObj.html( html );
					}else{
                        subObj.html("<option value=''>请选择</option>");
                    }
				},
			});
		} );
	}
});
