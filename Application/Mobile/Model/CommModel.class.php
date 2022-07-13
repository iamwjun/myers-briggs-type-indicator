<?php
namespace Mobile\Model;

use Think\Model;

/**
 * 公用模型类
 * 
 * @author Administrator
 *        
 */
class CommModel extends Model {

	/**
	 * 获取单条数据
	 * 
	 * @param string $value 值
	 * @param string $field 字段
	 * @param boolean $isArray true返回数组|false返回字段值
	 * @param string $returnField 需返回的字段值
	 * @return array 一级数组
	 */
	public function getOne($value, $field = 'id', $isArray = true, $returnField = 'id') {
		if ($isArray) {
			$returnField = $returnField == "id" ? "*" : $returnField;
			return $this->field ( $returnField )->where ( array ($field => $value ) )->find ();
		} else {
			return $this->where ( array ($field => $value ) )->getField ( $returnField );
		}
	}

	/**
	 * 返回当前有多少条记录
	 *
	 * @param array $condition
	 */
	public function getListCount($condition) {
		return $this->where ( $condition )->count ();
	}

	/**
	 * 获取一组数据[数组条件array]
	 *
	 * @param array $condition 查询条件
	 * @param string $field 查询字段
	 * @param array $limit 获取条数
	 * @return array
	 */
	public function getList($condition, $field = "*", $limit = array( 'begin' => 0, 'num' => 0 ), $order = "sort desc") {
		return $this->where ( $condition )->field ( $field )->limit ( $limit ['begin'], $limit ['num'] )->order ( $order )->select ();
	}

	/**
	 * 获取一组数据[sql条件]
	 *
	 * @param array $sql 查询语句
	 * @param string $field 查询字段
	 * @param array $limit 获取条数
	 * @return array
	 */
	public function getSQLList($sql, $limit = array( 'begin' => 0, 'num' => 20 ), $order = "a.sort desc") {
		// 组合sql
		$sql .= " order by $order";
		if (! empty ( $limit ['num'] )) {
			$sql .= " limit $limit[begin],$limit[num]";
		} else if (! empty ( $limit ['begin'] )) {
			$sql .= " limit $limit[begin]";
		}
		// 返回数据
		return $this->query ( $sql );
	}

	/**
	 * 获取一条数据
	 *
	 * @param int $id 数据id
	 * @return array
	 */
	public function getCommOne($id) {
		$return = returnMsg ();
		if (empty ( $id ) || ! is_numeric ( $id )) {
			$return ['info'] = '参数(id)错误：id必须为数字';
		} else {
			$data = $this->where ( array ('id' => $id ) )->find ();
			if (count ( $data )) {
				$return ['status'] = 1;
				$return ['info'] = $data;
			} else {
				$return ['info'] = '数据不存在';
			}
		}
		return $return;
	}

	/**
	 * 插入一条数据
	 *
	 * @param $data
	 * @return array
	 */
	public function insert($data) {
		$return = returnMsg ();
		$data ['create_time'] = time ();
		if ($this->create ( $data )) {
			$result = $this->add ();
			$return ['status'] = $result ? 1 : 0;
			$return ['info'] = $result ? '新增成功' : $this->getError ();
		} else {
			$return ['status'] = 0;
			$return ['info'] = $this->getError ();
		}
		return $return;
	}

	/**
	 * 修改一条数据
	 *
	 * @param $data
	 * @return array
	 */
	public function update($data) {
		$data ['update_time'] = time ();
		if ($this->create ( $data )) {
			$return = $this->getCommOne ( $data ['id'] );
			if ($return ['status']) {
				$this->save ( $data );
				$return ['info'] = '操作成功!';
			}
		} else {
			$return ['status'] = 0;
			$return ['info'] = $this->getError ();
		}
		return $return;
	}

	/**
	 * 删除一条或一组数据
	 *
	 * @param $idList id列表
	 * @return string
	 */
	public function remove($idList) {
		$return = returnMsg ();
		$condition ['id'] = array ('in',$idList );
		$condition ['is_delete'] = 1;
		$result = $this->save ( $condition );
		if ($result !== false) {
			$return ['status'] = 1;
			$return ['info'] = '操作成功!';
		} else {
			$return ['info'] = '操作失败!';
		}
		return $return;
	}
}