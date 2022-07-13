<!-- 批量上传图片插件 --> 
<script type="text/javascript" src="../Plugin/uploadify/jquery.uploadify-3.1.js?r=<?php echo rand(1111, 99999); ?>"></script>
<script type="text/javascript" src="../Plugin/uploadify/remove/removeImg.js"></script>
<link rel="stylesheet" type="text/css" href="../Plugin/uploadify/uploadify.css" />
<link rel="stylesheet" type="text/css" href="../Plugin/uploadify/remove/removeImg.css" />
<script type="text/javascript">
$(function() {
    $('#file_upload').uploadify({
        'buttonClass'		: 'fileButtonClass',
    	'auto'     			: true,		//关闭自动上传
    	'removeTimeout' 	: 0,		//文件队列上传完成1秒后删除
        'swf'      			: '../Plugin/uploadify/uploadify.swf',	// flash文件路径
        'uploader' 			: '../Plugin/uploadify/uploadify.php',	// php文件路径
        'method'   			: 'post',	//方法，服务端可以用$_POST数组获取数据
		'buttonText' 		: '选择图片',	//设置按钮文本
        'multi'    			: true,		//允许同时上传多张图片
        'uploadLimit' 		: 10,		//一次最多只允许上传10张图片
        'fileTypeDesc' 		: 'Image Files',		//只允许上传图像
        'fileTypeExts' 		: '*.gif; *.jpg; *.png',//限制允许上传的图片后缀
        'fileSizeLimit' 	: '20000KB',			//限制上传的图片不得超过200KB
        'onUploadSuccess' 	: function(file, data, response) {	//每次成功上传后执行的回调函数，从服务端返回数据到前端
        	data = eval( "("+ data +")" );
			switch( data['status'] ) {
				case "y" :
					val = $( "#picture" ).val();
					value = val == "" ? data['info'] : val + "," + data['info'];
					$( "#picture" ).val( value );
					$( "#picUpload" ).show();
					$( "#pictureList" ).append( "<span class='removeImage'><img src='../Plugin/uploadify/"+data['info']+"' width='100%' /></span>" );
					$.removeImage();
					break;
				case "n" :
					alert( data['info'] );
					break;
				case "error" :
					alert( data['info'] );
					break;
				default :
					alert( "未知错误" );
			}
        },
        'onQueueComplete' : function(queueData) {
        	//上传队列全部完成后执行的回调函数
        }
    });
});
</script>