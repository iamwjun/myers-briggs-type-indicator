<?php
namespace Admin\Controller;

use Think\Upload;

/**
 * 文件上传
 *
 * @author Administrator
 *        
 */
class FileController extends CommController {
	
	/**
	 * 单图上传方法
	 */
	public function singleImageUpload() {
		$upload = new Upload ();
		$upload->rootPath = C ( 'UPLOAD_PATH' );
		$upload->maxSize = 10048579;
		$resultInfo = $upload->upload ();
		$returnMsg = returnMsg ();
		if ( $resultInfo ) {
			$returnMsg ['savepath'] = str_replace( './', '', C( 'UPLOAD_PATH' ) ) . $resultInfo ['file'] ['savepath'] . $resultInfo ['file'] ['savename'];
			$returnMsg ['showpath'] = __ROOT__ . '/' . $returnMsg ['savepath'];
			$returnMsg ['tempname'] = $_FILES ["file"] ["name"];
			$returnMsg ['status'] = 1;
		} else {
			$returnMsg ['info'] = $upload->getError ();
		}
		$this->ajaxReturn ( $returnMsg );
	}
	// 删除图片
	public function removeImage() {
		$returnMsg = returnMsg ();
		if (empty ( $_POST ['img'] )) {
		} else {
			$root = __ROOT__ . '/';
			$img = str_replace ( $root, '', $_POST ['img'] );
			if (file_exists ( $img )) {
				if (unlink ( $img )) {
					$returnMsg['status'] = 1;
					$returnMsg['info'] = "删除成功";
				} else {
					$returnMsg['info'] =  "删除失败";
				}
			} else {
				$returnMsg['info'] =  "此图片不存在";
			}
		}
		$this->HuiMsg ( $returnMsg );
	}
}

?>