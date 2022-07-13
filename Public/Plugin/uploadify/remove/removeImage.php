<?php
if ( empty( $_POST['img'] ) ) {
	die( returnValidate( "非法操作", "n" ) );
} else {
	$img = $_POST['img'];
	if ( file_exists( $img ) ) {
		if ( unlink( $img ) ) {
			die( returnValidate( "删除成功", "y" ) );
		} else {
			die( returnValidate( "删除失败", "n" ) );
		}
	} else {
		die( returnValidate( "此图片不存在", "n" ) );
	}
}

function returnValidate( $info = "未知错误", $status = "n", $url = "" ) {
	$array = array();
	$array['info'] = $info;
	$array['status'] = $status;
	$array['url'] = $url;
	return json_encode( $array );
}