$( function() {
	// 读取商品分类
	var ClassLIST = $( '.classList' );
	ClassLIST.on( 'change', '.select-class', function() {
		var _this = $( this );
		var TheVal = $( this ).val();
		if ( TheVal == 0 ) {
			_this.parent().nextAll( '.select-box' ).remove();
			_this.attr( 'name', 'pid' );
			_this.attr( 'datatype', '*' );
			_this.attr( 'nullmsg', '请选择商品分类' );
		} else {
			$.ajax({
				url : jsObj['TheURL'] +'/getNextClassList.html?rnd='+Math.random(),
				data : { pid : TheVal },
				type : 'POST',
				async : true,
				dataType : 'json',
				beforeSend : function() {},
				success : function( data ) {
					if ( data['status'] == 0 ) {
						alert( data['info'] );
					} else {
						var tempList = data['info'];
						if ( !tempList ) { return; }
						// 组合HTML代码
						var tempHTML = '<span class="select-box radius width-130">';
			    			tempHTML += '	<select name="pid" class="select select-class" datatype="*" nullmsg="请选择商品分类">';
		                	tempHTML += '		<option value="">请选择分类</option>';
		                	for ( var i = 0, size = tempList.length; i < size; i ++ ) {
								tempHTML += '		<option value="'+ tempList[i]['id'] +'">'+ tempList[i]['title'] +'</option>';
		                	}
		            		tempHTML += '	</select>';
							tempHTML += '</span>';
						_this.parent().nextAll( '.select-box' ).remove();
						_this.removeAttr( 'name' );
						_this.removeAttr( 'datatype' );
						_this.removeAttr( 'nullmsg' );
						ClassLIST.append( tempHTML );
					}
				}
			});
		}
	} );
	
	// 设置商品所属-添加检索商品推荐人HTML节点
	var TheGoodsObj = $( 'input[name="uid"]' );
	var TheGoodsBox = $( '.TheGoods' );
	var TheGoodsInfo = $( '.TheGoodsInfo' );
	TheGoodsObj.on( 'click', function(){
		var TheVal = $( this ).attr( 'id' );
		if ( TheVal == 'uid-2' ) {
			if ( TheGoodsBox.html().replace( /\n\r\t/g, '' ) != '' ) { return; }
			var goodsHTML = '<div class="row cl">';
				goodsHTML += '	<label class="form-label col-1">';
				goodsHTML += '		<span class="c-red">*</span>幸运码：';
				goodsHTML += '	</label>';
				goodsHTML += '	<div class="formControls col-9">';
				goodsHTML += '		<input type="text" value="" datatype="*" nullmsg="幸运码不能为空" placeholder="幸运码" class="input-text radius TheGoodsQuery" style="width:40%;border-color:#3bb4f2" />';
				goodsHTML += '	</div>';
				goodsHTML += '	<div class="col-2"> </div>';
				goodsHTML += '</div>';
			TheGoodsBox.append( goodsHTML );
			// 检索商品推荐人
			var TheGoodsQuery = $( '.TheGoodsQuery' );
			TheGoodsQuery.on( 'blur', function() {
				var TempVal = $( this ).val();
				if ( TempVal == '' ) {
					layer.open({
						type : 0,
						title : '错误提示',
						content : '请输入商品推荐人的幸运码以进行检索商品推荐人是否存在!'
					});
					return;
				}
				$.ajax({
					url : jsObj['TheURL'] +'/searchMember.html?rnd='+Math.random(),
					data : { code : TempVal },
					type : 'POST',
					async : true,
					dataType : 'json',
					beforeSend : function() {
						TempLayerLoad = layer.load(1, {
						    shade: [0.1,'#000']
						});
					},
					success: function(data){
						layer.close( TempLayerLoad );
						if ( data['status'] == 0 ) {
							layer.open({
								type : 0,
								content : data['info']
							});
						} else {
							TheGoodsObj.eq(1).val( data['id'] );
							TheGoodsInfo.show().find( 'div' ).html( data['info'] );
						}
					}
				});
			} );
		} else {
			TheGoodsBox.html('');
			TheGoodsInfo.hide();
		}
	} );
	
	// 推荐商品
	plugins.updateState();
	
	// 日期选择范围
	$( '#datemin' ).focus( function() {
		WdatePicker({});
	} );
	$( '#datemax' ).focus( function() {
		WdatePicker({});
	} );
} );
