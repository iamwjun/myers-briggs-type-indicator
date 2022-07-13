<?php
namespace Home\Controller;

/**
 * 商品控制器
 *
 * @author BoBo
 *        
 */
class CommodityController extends CommController {

	/**
	 * 构造函数
	 */
	public function _initialize() {
		parent::_initialize ();
		// 模型
		$this->model = D ( 'Commodity' );
	}

	/**
	 * 商品分类
	 */
	public function sort() {
		// 分类列表
		$this->assign ( 'sortList', D( 'CommodityClass' )->getAllList() );
		// 栏目名称
		$this->assign ( 'columnTitle', '商品分类' );
		$level = D( 'CommodityClass' )->arrayLevel(D( 'CommodityClass' )->getAllList());
		// 渲染模板
		if($level > 6){
			$this->display ('_sort');
		}else{
			$this->display ();
		}
		
	}

	/**
	 * 商品列表
	 */
	public function clist() {

		// 设置模型
		header("Content-type:text/html;charset=utf-8");
		$classModel = D( 'CommodityClass' );
		$pageTitle = '全部商品';
		// 设置数据查询条件
		$condition = array ();
		$condition['is_delete'] = 0;
		$condition['shelves'] = 1;
		$condition['status'] = 0;
		$search = array();
		$order = array ();
		// 商品父id
		$theId = I ( 'get.id', 0 );
		if (! is_number ( $theId )) {
			$condition ['pid'] = array( 'in', $this->model->returnChildId( $theId ) );
			$pageTitle = $classModel->where(array('id'=>$theId))->getField('title');
		}
		$search ['id'] = $theId;

		// 筛选排序条件
		$search['display'] = I( 'request.display', 'picture' );
		$search['sale_volume'] = 'descsale';
		$search['price'] = 'descprice';
		$search['search'] = I ( 'get.search', '' );
		switch ( $search['search'] ) {
			case 'news': // 新品
				$order ['birth_time'] = 'desc';
				break;
			case 'ascsale': // 销量asc
				$order ['sale_volume'] = 'asc';
				$search['sale_volume'] = 'descsale';
				break;
			case 'descsale': // 销量desc
				$order ['sale_volume'] = 'desc';
				$search['sale_volume'] = 'ascsale';
				break;
			case 'ascprice': // 价格asc
				$order ['member_price'] = 'asc';
				$search['price'] = 'descprice';
				break;
			case 'descprice': // 价格sdesc
				$order ['member_price'] = 'desc';
				$search['price'] = 'ascprice';
				break;
			default:	// 综合排序
				$order ['sale_volume'] = 'desc';
				$order ['member_price'] = 'asc';
				break;
		}

		// 搜索关键字
		$key = I('get.key', '');
		if ($key) {
			$search ['key'] = "/key/$key/";
			$condition ['title'] = array ('like',"%$key%" );
			if(cookie('keyword')){
				$cookie_keyword = cookie('keyword');
				$cookie_keyword[] = $key;
				cookie('keyword',array_unique($cookie_keyword));
			}else{
				$cookie_keyword = array($key);
				cookie('keyword',$cookie_keyword);
			}
		} else {
			$search ['key'] = I('get.key', '');
		}
		// 读取数据
		$page = array();
		$page['pageNum'] = 4;
		if ( IS_AJAX && IS_GET ) {
			$page['page'] = I( 'get.page', 1 );
			$tpl = "ajaxList";
		} else {
			$page['page'] = 1;
			$tpl = "";
			$page['recordTotal'] = $this->model->getListCount( $condition );
		}
		$begin = ( $page['page'] - 1 ) * $page['pageNum'];
		$dataList = $this->model->getList ( $condition, "id,title,picture,member_price,market_price,sale_volume,intro", array( 'begin'=> $begin, 'num' => $page['pageNum'] ),$order );
		$this->assign ( 'dataList', $dataList );
		$this->assign ( 'page', $page );
		$this->assign ( 'search', $search );
		$this->assign ( 'param', I('get.search','') );
		// 栏目名称
		$this->assign ( 'columnTitle', $pageTitle );
		// 渲染模板
		$this->display ( $tpl );
	}

	/**
	 * 商品详情
	 */
	public function show() {
		// 获取参数
		$theId = I ( 'get.id', 0 );
		if (is_number ( $theId )) {
			$this->error ( '请勿非法操作!' );
		}
		// 获取商品信息
		$dataInfo = $this->model->getOne ( $theId );
		if (empty ( $dataInfo )) {
			$this->error ( '很抱歉，没有找到此商品的信息!' );
		}
		// 计算商品的折扣
		$dataInfo['discount'] = number_format( $dataInfo['member_price'] / $dataInfo['market_price'], 2 ) * 10;
		$this->assign ( 'dataInfo', $dataInfo );
		// 增加商品人气
		$this->model->where ( array ('id' => $theId ) )->setInc ( 'popularity' );
		// 获取商品附图
		$figureCondition = array ('pid' => $theId,'is_delete' => 0,'status' => 0 );
		$figureList = D ( 'CommodityFigure' )->getList ( $figureCondition, "title,picture,link" );
		// 把封面图也加入附图列表
		$coverMpa['picture'] = $dataInfo['picture'];
		$coverMpa['title'] = $dataInfo['title'];
		$coverMpa['link'] = '';
		$coverFigure[] = $coverMpa;
		$this->assign ( 'figureList', array_merge($coverFigure,$figureList) );
		//查询是否被收藏
		if($this->member['id']){
			$data['pro_id'] = $theId;
			$data['member_id'] = $this->member['id'];
			$data['is_delete'] = 0;
			$collection = D ( 'MemberCollection' );
			$collect = $collection->where($data)->find();
		}else{
			$collect = array();
		}
		// 统计商品评论条数
		$this->assign( 'commentObj', $this->getCommentCount( $theId ) );
		// 栏目名称
		$this->assign ( 'collect', $collect );
		$this->assign ( 'columnTitle', '商品详情' );
		// 渲染模板
		$this->display ();
	}
	
	
	/**
	 * 获取商品评论条数及好评率
	 * 
	 * @param int $theId 商品ID
	 * @return array 评论条数|好评率
	 */
	private function getCommentCount( $theId ) {
		$model = D( 'CommodityComment' );
		$return = array( 'count' => 0, 'percent' => 100 );
		$map = array();
		$map['status'] = 0;
		$map['is_delete'] = 0;
		$map['pro_id'] = $theId;
		// 评论条数计算
		$return['count'] = $model->getListCount( $map );
		if ( $return['count'] == 0 ) {
			return $return;
		}
		// 好评率计算
		$map['type'] = 3;
		$percent = $model->getListCount( $map );
		if ( $percent == 0 ) {
			$return['percent'] = 0;
		} else {
			$return['percent'] = $percent / $return['count'] * 100;
		}
		return $return;
	}
	
	/**
	 * 热销推荐
	 */
	public function remand(){
		
		// 幻灯
		$slideCondition = array ('status' => 0,'is_delete' => 0 );
		$slideList = D ( 'Link' )->getList ( $slideCondition, 'title,picture,link' );
		$this->assign( 'slideList', $slideList ); 
			
		//首页通图
		$mapss['is_delete'] = 0;
		$mapss['status'] = 0;
		$digList = D('Digraph')->where($mapss)->order('sort desc,create_time desc')->limit(4)->select();
		$this->assign( 'digList', $digList );
		
		$map['is_delete'] = 0;
		$map['status'] = 0;
		$map['shelves'] = 1;
		$map['pid'] = 0;
		$dataList = D('CommodityClass')->where($map)->order('sort desc , create_time desc')->select();
		foreach ($dataList as $key=>$val){
			$ids = D('CommodityClass')->returnChildId($val['id']);
			$map = array();
			$map['is_delete'] = 0;
			$map['status'] = 0;
			$map['shelves'] = 1;
			$map['pid'] = array('in',$ids);
			$map['remand'] = 1;
			$childrenList = D('Commodity')->where($map)->order('sort desc , create_time desc')->select();
			if($childrenList){
				$dataList[$key]['children'] = $childrenList;
			}else{
				unset($dataList[$key]);
			}
		}
		$this->assign( 'dataList', $dataList );
		$this->display();
	}
	/**
	 * 主题精选
	 */
	public function theme(){
		
		// 幻灯
		$slideCondition = array ('status' => 0,'is_delete' => 0 );
		$slideList = D ( 'Link' )->getList ( $slideCondition, 'title,picture,link' );
		$this->assign( 'slideList', $slideList ); 
			
		//首页通图
		$mapss['is_delete'] = 0;
		$mapss['status'] = 0;
		$digList = D('Digraph')->where($mapss)->order('sort desc,create_time desc')->limit(4)->select();
		$this->assign( 'digList', $digList );
		
		$map['is_delete'] = 0;
		$map['status'] = 0;
		$map['shelves'] = 1;
		$map['pid'] = 0;
		$dataList = D('CommodityClass')->where($map)->order('sort desc , create_time desc')->select();
		foreach ($dataList as $key=>$val){
			$ids = D('CommodityClass')->returnChildId($val['id']);
			$map['pid'] = array('in',$ids);
			$childrenList = D('Commodity')->where($map)->order('remand desc, sort desc , create_time desc')->select();
			if($childrenList){
				$dataList[$key]['children'] = $childrenList;
			}else{
				unset($dataList[$key]);
			}
		}
		
		$this->assign( 'dataList', $dataList );
		$this->display();
	}
}