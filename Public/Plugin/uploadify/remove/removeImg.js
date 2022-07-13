$( function () {

	// 图片删除
	jQuery.removeImage = function() {
		var imgObj = $( ".removeImage" );
		
		imgObj.hover( function() {
			_this = $( this );
			_this.append( "<em title='点击删除此图片'></em>" );
			var index = _this.index();
			var img = _this.find( "img" ).attr( "src" );
			imgObj.find( "em" ).click( function() {
				$.ajax({
					url:"../Plugin/uploadify/remove/removeImage.php",
					data:{
						img : img.replace( "Plugin/uploadify/", "" ),
						rnd : Math.random()
					},
					type:"post",
					async:true,
					dataType:"json",
					beforeSend:function() {
						_this.append( "<font title='正在删除，请稍等...'></font>" );
					},
					success:function( data,textStatus ) {
						if ( data['status'] == "y" ) {
							var theVal = "";
							var valArray = $( "input[name='Make_picList_txt']" ).val().split( "," );
							var thisVal = valArray[ _this.index() ];
							for ( var i = 0; i < valArray.length; i ++ ) {
								val = valArray[i] == thisVal ? "" : valArray[i];
								if ( val != "" ) {
									theVal += theVal == "" ? val : "," + val;
								}
							}
							$( "input[name='Make_picList_txt']" ).val( theVal );
							_this.remove();
						} else {
							alert( data['info'] );
							_this.find( "font" ).remove();
						}
					},
				});
			} );
		}, function() {
			$( this ).find( "em" ).remove();
		} );
	}
	
	$.removeImage();
	
		
	
} )