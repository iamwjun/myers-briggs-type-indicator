<?php
namespace Mobile\Controller;

/**
 * 首页控制器
 *
 * @author 
 *        
 */
class ServiceController extends CommController {
	
	/**
	 * 服务项目
	 */
	public function index() {
		//获取后台填写的联系电话
		$this->assign('config',M('config')->where('id>0')->find());
	
		$this->assign('list',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->assign('unit',$this->member['unit']);
	     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
		 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
		 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
		 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
		 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
		 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
		 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));

		 //获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}
	//详情
	public function info()
	{
	   //获取后台填写的联系电话
	   $this->assign('config',M('config')->where('id>0')->find());

	   $this->assign('info',M('object')->where('id='.I('get.id'))->find());
	   $this->assign('unit',$this->member['unit']);
	     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
		 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
		 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
		 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
		 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
		 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
		 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));
       $this->display();
	}
	//客服中心
	public function customer()
	{
		//获取后台填写的联系电话
		$this->assign('config',M('config')->where('id>0')->find());

		
		$this->assign('list',M('article')->where('is_delete=0 and status=0')->order('sort desc')->select());
		 $this->assign('unit',$this->member['unit']);
	     $this->assign('gywm',M('mation')->where("category='关于我们'")->getField('auth'));
		 $this->assign('fwxy',M('mation')->where("category='服务协议'")->getField('auth'));
		 $this->assign('fwlc',M('mation')->where("category='服务流程'")->getField('auth'));
		 $this->assign('hyxz',M('mation')->where("category='会员须知'")->getField('auth'));
		 $this->assign('yssm',M('mation')->where("category='隐私说明'")->getField('auth'));
		 $this->assign('sybz',M('mation')->where("category='使用帮助'")->getField('auth'));
		 $this->assign('lxwm',M('mation')->where("category='联系我们'")->getField('auth'));
		
        //获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}
}