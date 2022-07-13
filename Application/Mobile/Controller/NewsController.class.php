<?php
namespace Mobile\Controller;

/**
 * 首页控制器
 *
 * @author 
 *        
 */
class NewsController extends CommController {
	
	/**
	 * 新闻中心
	 */
	public function jtyw()
	{

        $list=M('commodity')->where("is_delete=0 and status=0 and pid=449")->order('sort desc')->select();
        $this->assign('list',$list);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}

	public function jddt()
	{

         $list=M('commodity')->where("is_delete=0 and status=0 and pid=450")->order('sort desc')->select();
         $this->assign('list',$list);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}

	public function cydt()
	{
		 $list=M('commodity')->where("is_delete=0 and status=0 and pid=451")->order('sort desc')->select();
         $this->assign('list',$list);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}

	public function info()
	{
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->assign('info',M('commodity')->where('id='.I('get.id'))->find());
		$this->display();
	}


}