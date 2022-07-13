<?php

namespace Home\Controller;

/**
 * 文章业务逻辑层
 *
 * @author Administrator
 *        
 */
class ArticleController extends CommController {
	protected  $pageSize = 10;
	// 列表
    public function index(){
    	// 设置模型
    	$categoryModel = D( 'Category' );
    	$articleModel = D( 'Article' );
    	
    	// 设置查询条件
    	$condition = array();
    	$condition['is_delete'] = 0;
    	$condition['status'] = 0;
    	// 设置搜索参数
    	$search = I( 'get.search', '' );
    	if ( $search != '' ) {
    		$condition['title'] = array( 'like', "%". urldecode( $search ) ."%" );
    	}
    	
    	// 判断并获取当前id的详细信息
    	$thisId = I('get.pid');
    	if ($thisId > 0) {
    		$condition['pid'] = $thisId;
    	}
    	
    	// 获取数据列表
    	$order = array('recommend'=>'desc','sort'=>'desc','create_time'=>'desc');
    	$this->dataList = $this->getPdList( $articleModel, $condition, $this->pageSize,'*',$order);
    	$this->thisSort = D( 'Category' )->where(array('id'=>$thisId))->find();
    	// 注入数据
    	$this->assign( 'thisSort', $this->thisSort );
    	$this->assign( 'dataList', $this->dataList );
    	$this->assign( 'columnTitle', $this->thisSort['title'] );
    	//获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
    	// 渲染模板
    	$this->display();
    }
    
	// 详情显示
    public function show(){
    	// 实例化模型
    	$articleModel = D( 'Article' );
    	
    	// 判断id是否为空或不为数字
    	if ( I('get.id') < 1) {
    		$this->error( '非法操作!' );
    	}else{
    		$this->theId = I('get.id');
    	}
    	// 获取数据
    	$this->dataInfo = $articleModel->getOne( $this->theId );
    	// 判断数据是否存在
    	if ( count( $this->dataInfo ) == 0 || !$this->dataInfo) {
    		$this->error( '数据不存在!' );
    	}   	
    	// 类别信息
    	$this->thisSort = D( 'Category' )->where(array('id'=>$this->dataInfo['pid']))->find();
    	$this->assign( 'thisSort', $this->thisSort );
    	// 设置上一篇和下一篇
    	$nextPre = $articleModel->getPrevNext( $this->dataInfo['id'], $this->dataInfo['pid'] );
    	$this->assign( 'nextPre', $nextPre );
    	// SEO关键字
    	$this->formatKeyword( $this->dataInfo, $this->thisSort );
    	
    	// 注入数据
    	$this->assign( 'dataInfo', $this->dataInfo );
    	$this->assign( 'columnTitle', $this->thisSort['title']);
    	
    	// 渲染模板
    	$this->display();
    }
    //异步加载新闻
    public function  ajaxIndex(){
    	$articleModel = D( 'Article' );
    	// 设置查询条件
    	$condition = array();
    	$condition['is_delete'] = 0;
    	$condition['status'] = 0;
    	// 判断并获取当前id的详细信息
    	$thisId = I('get.pid');
    	$page = I('get.page',1);
    	if ($thisId > 0) {
    		$condition['pid'] = $thisId;
    	}
    	 
    	// 获取数据列表
    	$order = array('recommend'=>'desc','sort'=>'desc','create_time'=>'desc');
    	$this->dataList = $articleModel->where($condition)->order($order)->limit(($page-1)*$this->pageSize.','.$this->pageSize)->select();
    	$this->assign( 'dataList', $this->dataList );
    	$this->display();
    }
    public function about_us()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='关于我们' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
    public function agreement()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='会员须知' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
    public function service_flow()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='服务流程' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
    public function member_notes()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='会员须知' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
    public function privacy()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='隐私说明' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
    public function help()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='使用帮助' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
     public function contact_us()
    {
        if(isset($this->member))
        {
             $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
        }
        $this->assign('focus',M('link')->where('is_delete=0')->select());
        $this->assign('info',M('mation')->where("category='联系我们' and is_delete=0 and status=0")->getField('content'));
        $this->display();
    }
}