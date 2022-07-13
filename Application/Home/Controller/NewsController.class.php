<?php
namespace Home\Controller;

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
	public function index() {
		
		//获取后台填写的联系电话
		$this->assign('config',M('config')->where('id>0')->find());
		$this->assign('list_gs',M('news')->where("category='公司动态' and is_delete=0 and status=0")->order('sort desc')->select());
		$this->assign('list_zx',M('news')->where("category='行业资讯' and is_delete=0 and status=0")->order('sort desc')->select());
		$this->assign('list_gg',M('news')->where("category='通知公告' and is_delete=0 and status=0")->order('sort desc')->select());
		if(isset($this->member))
        {
		  $this->assign('check_user',M('authentication')->where('uid='.$this->member['id'].' and status=1')->count());
	    } 
	    $this->assign('category',M('news_class')->where('is_delete=0 and status=0')->order('sort desc')->select());
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
	//详情
	public function info()
	{
	   $info=M('news')->where('id='.I('get.id'))->find();
	   $data['visit']=$info['visit']+1;
	   M('news')->where('id='.I('get.id'))->save($data);
	   //获取后台填写的联系电话
	   $this->assign('config',M('config')->where('id>0')->find());
	   $this->assign('info',$info);
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


}