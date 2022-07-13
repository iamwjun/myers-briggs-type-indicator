<?php
/*
 * Uploadify 后台处理 Demo Author:wind Date:2013-1-4 uploadify 后台处理！
 */

// 设置上传目录
$path = "uploads/" . date( "Y-m-d" );

if (! empty ( $_FILES )) {
	
	// 得到上传的临时文件流
	$tempFile = $_FILES ['Filedata'] ['tmp_name'];
	
	// 允许的文件后缀
	$fileTypes = array ( 'jpg', 'jpeg', 'gif', 'png' );
	
	// 得到文件原名
	$fileName = iconv ( "UTF-8", "GB2312", $_FILES ["Filedata"] ["name"] );
	$fileParts = pathinfo ( $_FILES ['Filedata'] ['name'] );
	
	// 判断当前文件夹是否存在，不存在则新建一个当前文件夹
	if ( !file_exists( $path ) ){ mkdir( $path ); }
	
	// 得到文件扩展名
	$suffix = pathinfo( $fileName, PATHINFO_EXTENSION );
	
	// 文件新名称
	$TempFileName = "wdb_" . rand(rand(0,999999999),rand(100,999999999)) . rand(rand(0,999999999),rand(100,999999999)) . "." . $suffix;
	
	// 移动文件
	$filPath = $path . "/" . $TempFileName;
	if ( move_uploaded_file ( $tempFile, $filPath ) ) {
		returnIsOk( "y", $filPath );
	} else {
		returnIsOk( "n", "$fileName文件上传失败" );
	}
} else {
	returnIsOk( "error", "非法操作" );
}


function returnIsOk( $status, $info ) {
	$array = array( "status"=>$status, "info"=>$info );
	die( json_encode( $array ) );
}
?>