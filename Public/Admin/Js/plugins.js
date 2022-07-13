var plugins = {}

/**
 * 表单验证及加载按钮所需信息
 */
plugins.validate = function() {
	this.formId = $( '#signupForm' ); // 表单通用ID
	this.button_box = $( '.form-loading-button-box' ); // 提交按钮容器节点对象
	this.button_class = 'form-loading-button'; // 按钮class
	this.loading_mask = '.form-loading-button-mask'; // 加载按钮节点对象
	var loading_mask_html = '<div class="form-loading-button-mask">';
	    loading_mask_html += '		<div class="sk-spinner sk-spinner-circle">';
		loading_mask_html += '		<div class="sk-circle1 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle2 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle3 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle4 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle5 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle6 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle7 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle8 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle9 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle10 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle11 sk-circle"></div>';
		loading_mask_html += '		<div class="sk-circle12 sk-circle"></div>';
		loading_mask_html += '		</div>';
		loading_mask_html += '</div>';
	this.loading_mask_html = loading_mask_html; // 加载按钮html
	return this;
}

/**
 * 信息提示插件
 * 
 * @param {Object} options 参数
 */
plugins.toastr = function( options ) {
	// 默认参数
	var defaults = {
		"closeButton" : true,
		"debug" : true,
		"progressBar" : true,
		// 		positionClass的参数：toast-top-right 右上 | toast-bottom-right 右下
		// 					toast-bottom-left 左下 | toast-top-left 左上 | toast-middle-center 垂直居中
		// 		positionClass的参数：toast-top-full-width 顶部全宽 | toast-bottom-full-width 底部全宽
		// 					toast-top-full-width 顶部居中 | toast-bottom-full-width 底部居中 | toast-middle-full-width 底部居中
		"positionClass" 	: "toast-middle-center",
		"showDuration" 		: "400",
		"hideDuration" 		: "1000",
		"timeOut" 			: "7000",
		"extendedTimeOut" 	: "1000",
		"showEasing" 		: "swing",
		"hideEasing" 		: "linear",
		"showMethod" 		: "fadeIn",
		"hideMethod" 		: "fadeOut",
		"mode" 				: 'error', // success成功|info信息|warning警告|error错误
		'prompt_title' 		: "未知的提示标题",
		'prompt_info' 		: "未知的提示信息",
		'location'			: false,
	}
	// 合并参数
	var options = $.extend( defaults, options );
	toastr.options = {
		"closeButton"		: options.closeButton,
		"debug"				: options.debug,
		"progressBar"		: options.progressBar,
		"positionClass"		: options.positionClass,
		"showDuration"		: options.showDuration,
		"hideDuration"		: options.hideDuration,
		"timeOut"			: options.timeOut,
		"extendedTimeOut"	: options.extendedTimeOut,
		"showEasing"		: options.showEasing,
		"hideEasing"		: options.hideEasing,
		"showMethod"		: options.showMethod,
		"hideMethod"		: options.hideMethod
	}
	toastr[ options.mode ]( options.prompt_info, options.prompt_title );
	if ( options.location ) { location.href = options.location; }
}

/**
 * Validform验证表单
 * 
 * @param {Object} options 参数对象
 */
plugins.Validform = function( options ) {
	var defaults = {
			formName : "#formValidform",
			tiptype : 2,
			ajaxPost : true,
			showAllError : true,
			refreshBtn : "#RefreshButton"
		}
	var _opt = $.extend(defaults,options);
	// 实例化
	$( _opt.formName ).Validform({
		tiptype : _opt.tiptype,
		ajaxPost : _opt.ajaxPost,
		showAllError : _opt.showAllError,
		datatype:{//传入自定义datatype类型
			"price" : /^(([1-9][0-9]*)|(([0-9]*\.[1-9])|([0-9]*\.[1-9][0-9])|([0-9]*\.[1-9]{2})|([0-9]*\.[0-9][1-9])))$/,
		},
		callback : function( data ){
			setTimeout( function() {
				if ( data['status'] == 0 ) {
					$.Hidemsg();
				} else {
					var index = parent.layer.getFrameIndex(window.name);
					parent.$( _opt.refreshBtn ).click();
					parent.layer.close(index);
				}
			}, 1000 );
		}
	});
}

/**
 * 单图上传
 * 
 * @param {Object} options 参数对象
 */
plugins.singleImageUpload = function( options ) {
	var defaults = {
			list : '#fileList',
			btn : '#btn-star',
			pickId : '#filePicker',
			inputBox : '#singleImageUpload',
			state : 'pending',
		}
	var _opt = $.extend(defaults,options);
	$list = $( _opt.list ),
	$btn = $( _opt.btn ),
	state = _opt.state,
	uploader;

	

	var uploader = WebUploader.create({
		auto: false,
		swf: jsObj['plugins_H-ui'] + '/lib/webuploader/0.1.5/Uploader.swf',
		// 文件接收服务端。
		server: jsObj['root'] + '/Admin/File/singleImageUpload',
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: {
			id : _opt.pickId,
			multiple : false
		},
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});

	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.html( $li );
		thumbnailWidth = 100;
		thumbnailHeight = 100;
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file, response ) {
		var txt = "";
		if ( response['status'] == 1 ) {
			$( _opt.inputBox ).val( response['savepath'] );
			txt = "上传成功";
		} else {
			layer.msg(response['info'],{icon: 5,time:2000});
			txt = "<font style='color:red;'>"+ response['info'] +"</font>";
		}
		$( '#'+file.id ).addClass('upload-state-success').find(".state").html(txt);
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	// 先从文件队列中移除之前上传的图片，第一次上传则跳过
	$( _opt.pickId ).on('click', function () {
		if (!WebUploader.Uploader.support()) {
            var error = "上传控件不支持您的浏览器！请尝试升级flash版本或者使用Chrome引擎的浏览器。";
            console.log(error);
            return;
        }
		
		var id = $list.find("div").attr('id');
		if (undefined != id) {
			uploader.removeFile(uploader.getFile(id));
			// 新加代码，意为删除图片上传队列列表
			$( '.webuploader-element-invisible' ).on( 'change', function() {
				var tempObj = $list.find("div.item:not(:last)");
				if ( tempObj.size() > 0 ) {
					tempObj.remove();
				}
			} );
		}

    });
}

/**
 * 批量更新排序
 * 
 * @param {Object} options 参数对象
 */
plugins.BatchSequence = function( options ) {
	var defaults = {
		'clickObj' : '#BatchSequence',
		'sortObj' : 'input[name="Sequence"]',
		'idObj' : 'input[name="dataId"]',
		'url' : jsObj['TheURL'] + '/BatchSequence.html',
		'event' : 'click',
		'refreshBtn' : '#RefreshButton'
	};
	var _opt = $.extend( defaults, options );
	$( _opt.clickObj ).on( _opt.event, function() {
		var sortObj = $( _opt.sortObj );
		var idObj = $( _opt.idObj );
		var paramString = "";
		sortObj.each( function( index ) {
			paramString += paramString == "" ? "" : "|";
			paramString += idObj.eq( index ).val() + "-" + $( this ).val();
		} );
		$.ajax({
			url : _opt.url + '?rnd=' + Math.random(),
			data : {
				param : paramString
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
					setTimeout( function() {
						$( _opt.refreshBtn ).click();
					}, 1000 );
				}
			}
		});
	} );
}

/**
 * 删除单条数据
 * 
 * @param {Object} options 参数对象
 */
plugins.singleRemove = function( options ) {
	var defaults = {
		'clickObj' : '.singleRemove',
		'url' : jsObj['TheURL'] + '/remove.html',
		'event' : 'click'
	};
	var _opt = $.extend( defaults, options );
	
	$( _opt.clickObj ).on( _opt.event, function() {
		var _this = $( this );
		var _id = _this.attr( 'data-id' );
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				url : _opt.url + '?rnd=' + Math.random(),
				data : {id:_id},
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
						_this.parents("tr").remove();
						layer.msg('已删除!',{icon:6,time:1000});
					}
				}
			});
		});
	} );
}

/**
 * 批量删除数据
 * 
 * @param {Object} options 参数对象
 */
plugins.BatchRemove = function( options ) {
	var defaults = {
		'clickObj' : '.BatchRemove',
		'url' : jsObj['TheURL'] + '/remove.html',
		'event' : 'click',
		'refreshBtn' : '#RefreshButton'
	};
	var _opt = $.extend( defaults, options );
	$( _opt.clickObj ).on( _opt.event, function() {
		var _this = $( this );
		var _id = plugins.getCheckedId('');
		if ( _id == "" ) {
			layer.msg('请选择要删除的数据!',{icon: 3,time:2000});
			return;
		}
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				url : _opt.url + '?rnd=' + Math.random(),
				data : {id:_id},
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
						$( _opt.refreshBtn ).click();
						layer.msg('已删除!',{icon:6,time:1000});
					}
				}
			});
		});
	} );
}

/**
 * 会员钱包充值
 * 
 * @param {Object} options 参数对象
 */
plugins.walletRecharge = function( options ) {
	var defaults = {
		'clickObj' : '',
		'url' : '',
		'event' : 'click',
		'refreshBtn' : '#RefreshButton'
	};
	var _opt = $.extend( defaults, options );
	$( _opt.clickObj ).on( _opt.event, function() {
		var _this = $( this );
		var _id = plugins.getCheckedId('');
		if ( _id == "" ) {
			layer.msg('请选择要充值的会员!',{icon: 3,time:2000});
			return;
		}
		layer.confirm('确认要为这些会员充值吗？',function(index){
			layer_show('钱包充值',_opt.url+'/id/'+_id,'600','350');
		});
	} );
}

/**
 * 批量上下架商品
 * 
 * @param {Object} options 参数对象
 */
plugins.BatchOnTheShelf = function( options ) {
	var defaults = {
		'clickObj' : '.BatchOnTheShelf',
		'url' : '',
		'event' : 'click',
		'refreshBtn' : '#RefreshButton'
	};
	var _opt = $.extend( defaults, options );
	$( _opt.clickObj ).on( _opt.event, function() {
		var _this = $( this );
		var _id = plugins.getCheckedId('');
		if ( _id == "" ) {
			layer.open({
				type : 0,
				content : '请先选择商品!'
			});
			return;
		}
		layer.confirm('确认要进行此操作吗？',function(index){
			layer.close(index);
			$.ajax({
				url : _opt.url + '?rnd=' + Math.random(),
				data : {id:_id},
				type : 'POST',
				async : true,
				dataType : 'json',
				beforeSend : function() {
					TempLayerLoad = layer.load( 1, { shade: [0.1,'#000'] } );
				},
				success : function( data ) {
					layer.close( TempLayerLoad );
					if ( data['status'] == 0 ) {
						layer.open({
							type : 0,
							content : data['info']
						});
					} else {
						$( _opt.refreshBtn ).click();
						layer.msg(data['info'],{icon:6,time:1000});
					}
				}
			});
		});
	} );
}

/**
 * 更新一条数据的状态
 * 
 * @param {Object} options 对象节点
 */
plugins.updateStatus = function( options ) {
	var defaults = {
		'clickObj' : '.updateStatus',
		'event' : 'click'
	};
	var _opt = $.extend( defaults, options );
	
	$( document ).on( _opt.event, _opt.clickObj, function() {
		_this = $( this );
		var _id = _this.attr( 'data-id' );
		var _status = _this.attr( 'data-status' );
		var _field = _this.attr( 'data-field' );
		var confirmInfo = _status == 1 ? '确认要停用吗？' : '确认要启用吗？';
		layer.confirm(confirmInfo,function(index){
			$.ajax({
				url : jsObj['TheURL'] + '/commSetStatus/id/'+ _id +'/param/'+ _field +'-'+ _status +'.html?rnd='+ Math.random(),
				data : {},
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
						if ( _status == 0 ) {
							_this.parents("tr").find(".td-manage").prepend('<a href="javascript:void(0);" class="updateStatus" data-id="'+ _id +'" data-status="1" data-field="status" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
							_this.parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
						} else if ( _status == 1 ) {
							_this.parents("tr").find(".td-manage").prepend('<a href="javascript:void(0);" class="updateStatus" data-id="'+ _id +'" data-status="0" data-field="status" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
							_this.parents("tr").find(".td-status").html('<span class="label label-danger radius">已停用</span>');
						}
						_this.remove();
						layer.msg(data['info'],{icon: 6,time:1000});
					}
				}
			});
		});
	} );
}

/**
 * 更新一条数据的状态
 * 
 * @param {Object} options 对象节点
 */
plugins.updateState = function( options ) {
	var defaults = {
		'clickObj' : '.updateState',
		'event' : 'click',
		'refreshBtn' : '#RefreshButton'
	};
	var _opt = $.extend( defaults, options );
	
	$( document ).on( _opt.event, _opt.clickObj, function() {
		_this = $( this );
		var _id = _this.attr( 'data-id' );
		var _status = _this.attr( 'data-status' );
		var _field = _this.attr( 'data-field' );
		var confirmInfo = '确认要执行操作吗？';
		layer.confirm( confirmInfo,function(index){
			$.ajax({
				url : jsObj['TheURL'] + '/commSetStatus/id/'+ _id +'/param/'+ _field +'-'+ _status +'.html?rnd='+ Math.random(),
				data : {},
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
						setTimeout( function(){
							$( _opt.refreshBtn ).click();
						}, 1000 );
					}
				}
			});
		});
	} );
}

/**
 * 获取checkbox的值，以逗号连接
 * 
 * @param {String} object 节点名称
 */
plugins.getCheckedId = function( objName ) {
	var objName = objName != "" ? objName : 'input[name="dataId"]';
	var string = "";
	$( objName ).each( function( index ) {
		if ( $( this ).prop( 'checked' ) ) {
			var theVal = $( this ).val();
			string += string == "" ? theVal : "," + theVal;
		}
	} );
	return string;
}

/**
 * 刷新当前页面
 * 
 * @param {Object} 按钮名称
 */
plugins.RefreshThis = function( refreshBtn ) {
	var refreshBtn = refreshBtn == "" ? "#RefreshButton" : refreshBtn;
	$( refreshBtn ).on( 'click', function() {
		location.reload(true);
	} );
}('')

plugins.TabSlide = function() {
	$( '.TabSlide' ).on( 'click', function() {
		Hui_admin_tab( $( this ) );
	} );
}()


