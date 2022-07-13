<?php
namespace Admin\Model;

class CategoryModel extends CommModel {

	// 自动验证
	protected $_validate = array(
		array( 'title', '1,20', '请填写类别标题!', self::EXISTS_VALIDATE, 'length' ),
		array( 'sort', '/^[0-9]+/i', '排序必须为数字!', self::EXISTS_VALIDATE  ),
		array( 'pid', '/^[0-9]+/i', '父级id必须为数字!', self::EXISTS_VALIDATE  ),
	);

	// 自动完成
	protected $_auto = array(
		array( 'title', 'filter_label', self::MODEL_BOTH, 'function' ),
		array( 'sort', 'filter_number', self::MODEL_BOTH, 'function' ),
		array( 'pid', 'filter_number', self::MODEL_BOTH, 'function' ),
	);

	/**
	 * 格式化数据列表
	 * @param $tempList 数据数组
	 * @return array
	 */
	public function format( $tempList ) {
		for ( $i = 0, $size = count( $tempList ); $i < $size; $i ++ ) {
			$condition['id'] = $tempList[$i]['pid'];
			$pidString = $this->where( $condition )->getField( 'title' );
			$tempList[$i]['pidString'] = empty( $pidString ) ? "无" : $pidString;
			$tempList[$i]['create_time'] = date( 'Y-m-d H:i:s', $tempList[$i]['create_time'] );
		}
		return $tempList;
	}


	//格式化数据返回根据标题
    public function returnTitle($id)
    {
        if (!empty($id)) {
            $data['id'] = $id;
            $result = $this->where( $data )->find();
            if (empty($result)) {
                return null;
            }
            return $result['title'];
        } else {
            return null;
        }
    }

    //获取数据
    public function getidList($data) {
        $result = array();
        $category = M("Category");
        if (!empty($data['pid'])) {
            $condition['pid'] = $data['pid'];
        }
        $result = $category->where($condition)->select();
        return $result;
    }

    //格式化单条数据
    public function formatone($id)
    {
        $result = 0;
        if (!empty($id)) {
            $condition['id'] = $id;
            $result = $this->where( $condition )->getField( 'title' );
        }
        return $result;
    }
}