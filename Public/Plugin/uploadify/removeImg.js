$( function () {

	// 图片删除
	jQuery.removeImage = function( boxObj ) {
		// 默认对象
		var imgObj = $( ".removeImage" );
		// 根路径
		var rootPath = "";
		if ( arguments[1] ) {
			rootPath = arguments[1];
		} else {
			rootPath = jsObj['root'];
		}
		
		imgObj.hover( function() {
			_this = $( this );
			_this.append( "<em title='点击删除此图片'></em>" );
			var index = _this.index();
			var img = _this.find( "img" ).attr( "src" );
			
			imgObj.find( "em" ).click( function() {
				$.ajax({
					url : rootPath + "/Home/File/removeImage.html?rnd=" + Math.random(),
					data:{
						img : img,
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
							var valArray = boxObj.val().split( "," );
							var thisVal = valArray[ _this.index() ];
							for ( var i = 0; i < valArray.length; i ++ ) {
								val = valArray[i] == thisVal ? "" : valArray[i];
								if ( val != "" ) {
									theVal += theVal == "" ? val : "," + val;
								}
							}
							boxObj.val( theVal );
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
} )