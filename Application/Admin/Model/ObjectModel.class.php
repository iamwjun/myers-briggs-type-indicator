<?php
namespace Admin\Model;
class ObjectModel extends CommModel {

    // 自动验证
    protected $_validate = array(
        array( 'sort', '/^[0-9]+/i', '排序必须为数字!', self::EXISTS_VALIDATE  ),
    );

    // 自动完成
    protected $_auto = array(
        array( 'title', 'filter_label', self::MODEL_BOTH, 'function' ),
        array( 'sort', 'filter_number', self::MODEL_BOTH, 'function' ),
    );

    // 格式化数据
    public function format( $data ) {
    	$category = D( 'Category' );
    	for ( $i = 0, $size = count( $data ); $i < $size; $i ++ ) {
    		$data[$i]['create_time'] = date( "Y-m-d H:i:s", $data[$i]['create_time'] );
    		$data[$i]['type'] = $category->where( array( 'id' => $data[$i]['type'] ) )->getField( 'title' );
    	}
    	return $data;
    }



}