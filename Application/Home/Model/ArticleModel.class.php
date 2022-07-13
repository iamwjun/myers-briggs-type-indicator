<?php
namespace Home\Model;

/**
 * 文章模型
 * @author dx0513
 *
 */
class ArticleModel extends CommModel{
	
	/**
	 * 获取上一篇文章和下一篇文章
	 * @param int $id 当前文章id
	 * @param int $type 当前分类id
	 * @return array
	 */
	public function getPrevNext( $id, $type ) {
		$default = "没有了!";
		$prev = $this->where( "pid = $type and id < $id" )->field( "id,title" )->order( 'id desc' )->limit(1)->find();
		$next = $this->where( "pid = $type and id > $id" )->field( "id,title" )->order( 'id asc' )->limit(1)->find();
		
		if ( is_array( $prev ) ) {
			$array['prev'] = $prev;
		} else {
			$array['prev']['title'] = $default;
			$array['prev']['id'] = $id;
		}
		if ( is_array( $next ) ) {
			$array['next'] = $next;
		} else {
			$array['next']['title'] = $default;
			$array['next']['id'] = $id;
		}
		return $array;
	}
}

?>