<?php
namespace Admin\Model;

/**
 * 会员模型类
 * 
 * @author BoBo
 *        
 */
class MemberModel extends CommModel {
	
	/**
	 * 根据推荐码检测会员并返回会员信息
	 * 
	 * @param $data 数组参数
	 */
	public function checkUser($data) {
		$return = returnMsg ( array ('status' => 0,'info' => '没有数据!' ) );
		if (! empty ( $data ['val'] )) {
			$tempArray = $this->where ( array ('recommend' => $data ['val'] ) )->field ( "username,nickname,tel,sex,email,qq" )->find ();
			if (count ( $return ['info'] ) > 0) {
				$return ['status'] = 1;
				$return ['info'] = $tempArray;
			}
		}
		return $return;
	}
	
	/**
	 * 获取直接、朋友圈粉丝的人数
	 * 
	 * @param $referral_code 推荐人幸运码
	 * @param $type direct直接 indirect间接
	 * @param $count 人数统计
	 */
	public function getFansCount( $referral_code, $type, $count = 0) {
		if ($type == "direct") {
			return $this->where ( array ('recommended_code' => $referral_code ) )->count ();
		} else {
			$newArray = $this->where ( array ('recommended_code' => $referral_code ) )->select ();
			for($i = 0, $size = count ( $newArray ); $i < $size; $i ++) {
				$count ++;
				$count = $this->getFansCount ( $newArray [$i] ['referral_code'], $type, $count );
			}
			return $count;
		}
	}
}