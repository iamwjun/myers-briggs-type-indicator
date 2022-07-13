<?php
namespace Mobile\Controller;

use Think\Controller;

class HealthbaseController extends Controller {

	public function information()
	{
		$this->assign('info',M('news')->where("title ='".I('get.sign')."'")->find());
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
        $this->display();
	}
}