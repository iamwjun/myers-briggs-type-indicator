<?php
namespace Admin\Model;

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
	 * @param string $value 值
	 * @param string $field 字段
	 * @param boolean $isArray true返回数组|false返回字段值
	 * @param string $returnField 需返回的字段值
	 * @return array 一级数组
	 */
	public function getOne( $value, $field = 'id', $isArray = true, $returnField = '*' ) {
		if ( $isArray ) {
			return $this->field( $returnField )->where ( array ( $field => $value ) )->find ();
		} else {
			return $this->where ( array ( $field => $value ) )->getField ( $returnField );
		}
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
		return $this->where ( $condition )->field ( $field )->limit ( $limit['begin'],$limit['num'] )->order ( $order )->select ();
	}
	public function getProList($condition, $field = "*", $limit = array( 'begin' => 0, 'num' => 0 ), $order = "create_time desc") {
		return $this->where ( $condition )->field ( $field )->limit ( $limit['begin'],$limit['num'] )->order ( $order )->select ();
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
		if ( !empty( $limit['num'] ) ) {
			$sql .= " limit $limit[begin],$limit[num]";
		} else if ( !empty( $limit['begin'] ) ) {
			$sql .= " limit $limit[begin]";
		}
		// 返回数据
		return $this->query( $sql );
	}

	/**
	 * 删除一条或一组数据[真删除]
	 *
	 * @param $idList id列表
	 * @return string
	 */
	public function remove($idList) {
		$return = returnMsg ();
		$condition ['id'] = array ( 'in', $idList );
		$result = $this->delete ( $idList );
		if ($result !== false) {
			$return ['info'] = '操作成功!';
		} else {
			$return ['status'] = '0';
			$return ['info'] = '操作失败!';
		}
		return $return;
	}

	/**
	 * 获取一条数据
	 *
	 * @param int $id 数据id
	 * @return array
	 */
	public function getCommOne($id) {
		$return = returnMsg();
		if (empty ( $id ) || ! is_numeric ( $id )) {
			$return ['info'] = '参数(id)错误：id必须为数字';
		} else {
			$data = $this->where ( array ( 'id' => $id ) )->find ();
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
	public function commInsert($data) {
		$return = returnMsg ();
		$data ['create_time'] = time ();
		$data ['update_time'] = time ();
		
		if ($this->create ( $data )) {
			$result = $this->add ($data);
			$return ['status'] = $result ? 1 : 0;
			$return ['info'] = "创建成功!";
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
	public function commUpdate($data) {
		$data ['update_time'] = time ();
		if ($this->create ( $data )) {
			$return = $this->getCommOne ( $data ['id'] );
			if ($return ['status']) {
				$this->save ( $data );
				$return ['info'] = '操作成功!';
			}
		} else {
			$return['status'] = 0;
			$return['info'] = $this->getError();
		}
		return $return;
	}

	/**
	 * 删除一条或一组数据[假删除]
	 *
	 * @param $idList id列表
	 * @return string
	 */
	public function commRemove($idList) {
		$returnMsg = returnMsg ();
		$condition ['id'] = array ( 'in', $idList );
		$condition ['is_delete'] = 1;
		if ( $this->save ( $condition ) ) {
			$returnMsg ['info'] = '操作成功!';
			$returnMsg ['status'] = 1;
		} else {
			$returnMsg ['status'] = '0';
			$returnMsg ['info'] = '操作失败!';
		}
		return $returnMsg;
	}

	/**
	 * 设置一条或一组数据的状态
	 *
	 * @param string $idList id字符串
	 * @param array $param $param[0]字段名 $param[1]值
	 * @return array
	 */
	public function commSetStatus($idList, $param) {
		$return = returnMsg ( array ( "status" => 0, "info" => "设置失败!" ) );
		// 参数判断
		if (count ( $param ) != 2 || ! is_numeric ( $param [1] )) {
			$return ['info'] = '参数传递有误!';
			return $return;
		}
		
		// 条件组合
		$condition ['id'] = array ( 'in', $idList );
		$condition [$param [0]] = $param [1];
		// 执行更新
		if ($this->save ( $condition )) {
			$return ['status'] = 1;
			$return ['info'] = '设置成功!';
		} else {
			$return ['info'] = '设置失败!';
		}
		return $return;
	}
	
	/**
	 * 批量更新排序
	 * 
	 * @param string $param 参数
	 * @return array
	 */
	public function BatchSequence( $param ) {
		$returnMsg = returnMsg();
		$param = array_merge( array_filter( explode( "|", $param ) ) );
		if ( empty( $param ) ) {
			$returnMsg['info'] = '参数为空，请勿非法操作1!';
		} else {
			foreach ( $param as $rows ) {
				$array = explode( "-", $rows );
				$this->setField( array( 'id' => $array[0], 'sort' => $array[1] ) );
			}
			$returnMsg['status'] = 1;
			$returnMsg['info'] = '排序成功!';
		}
		return $returnMsg;
	}
}