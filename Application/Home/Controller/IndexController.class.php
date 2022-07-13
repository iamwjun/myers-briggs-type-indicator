<?php
namespace Home\Controller;

/**
 * 首页控制器
 *
 * @author 
 *        
 */
class IndexController extends CommController {
	
	/**
	 * 首页显示
	 */
	public function index() {
	    
        $tp=1;
		$page=1;
		$star=$page-1;
		$end=1;
		
		if($tp==1)
		{
			//获取完整题目总数
            $this->assign('jg_cont',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit('0,95')->count());
		}
		if($tp==2)
		{
			//获取速测题目总数
            $this->assign('jg_cont',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit('0,48')->count());
		}


         //获取情感测试题目列表
        $this->assign('jg_list',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        
        $this->display();
	}

	public function jtyw()
	{
		$onepage=8;
        $page=I('get.page');
		$start=$page*$onepage-$onepage;
		$end=$onepage;
		$all=M('commodity')->where("is_delete=0 and status=0 and pid=449")->count();
		$page_cont=ceil($all/$onepage);

		$list=M('commodity')->where("is_delete=0 and status=0 and pid=449")->limit($start,$end)->order('sort desc')->select();
		$this->assign('list',$list);
		$this->assign('page_cont',$page_cont);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}

	public function jddt()
	{
		$onepage=8;
        $page=I('get.page');
		$start=$page*$onepage-$onepage;
		$end=$onepage;
		$all=M('commodity')->where("is_delete=0 and status=0 and pid=450")->count();
		$page_cont=ceil($all/$onepage);

		$list=M('commodity')->where("is_delete=0 and status=0 and pid=450")->limit($start,$end)->order('sort desc')->select();
		$this->assign('list',$list);
		$this->assign('page_cont',$page_cont);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}

	public function cydt()
	{
		$onepage=8;
        $page=I('get.page');
		$start=$page*$onepage-$onepage;
		$end=$onepage;
		$all=M('commodity')->where("is_delete=0 and status=0 and pid=451")->count();
		$page_cont=ceil($all/$onepage);

		$list=M('commodity')->where("is_delete=0 and status=0 and pid=451")->limit($start,$end)->order('sort desc')->select();
		$this->assign('list',$list);
		$this->assign('page_cont',$page_cont);
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}


	//跟我学金融
	public function fallowmejr()
	{
		//获取分类栏目
        $this->assign('nav',M('news_class')->where('is_delete=0 and status=0')->select());
        //获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}
	//跟我学炒股
	public function fallowmecg()
	{
		$type_id=I('get.typeid');
		//获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
        if($type_id==1)
        {
        	$this->display('Index/fallowmecg_moni');
        }
        else if($type_id==2)
        {
        	$this->display('Index/fallowmecg_zhanji');
        }
        else{
			$this->display();
		}
	}


	//栏目列表
	public function repair()
	{
		$id=I('get.cid');
		if(isset($this->member))
		{
			//获取栏目标题
				$this->assign('title',M('news_class')->where('id='.$id)->getField('title'));
			if($id!=0)
			{
				//获取内容列表
				$this->assign('datalist',M('news')->where('cid='.$id.' and is_delete=0 and status=0')->select());
			}
			else{
				//获取内容列表
				$this->assign('datalist',M('news')->where('is_delete=0 and status=0')->select());
			}
		    //获取底部菜单
            $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
			$this->display();
	    }
	    else{
	    	$this->redirect('Login/login');
	    }
	}

    //栏目详情
    public function info()
    {
    	$id=I('get.id');
    	$mation=M('news')->where('id='.$id)->find();
    	$data['visit']=$mation['visit']+1;

    	M('news')->where('id='.$id)->save($data);
    	$this->assign('info',$mation);
    	//获取底部菜单
        $this->assign('menu',M('object')->where('is_delete=0 and status=0')->order('sort desc')->select());
    	$this->display();
    }


	//图片文件上传
	public function upload_imginfo()
	{
		$m=M('member')->where('id='.$this->member['id'])->find();
		if(isset($_POST['tj_img']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file1']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file1']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file1']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件1]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
		if(isset($_POST['tj_img_1']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file2']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file1']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file2']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件1]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
		if(isset($_POST['tj_img_2']))
		{
			$path=date('Ymd',time());//生成一个时间文件夹
			if(!is_dir("Uploads/".$path))
			   {
					$dir="Uploads/".$path;
					 mkdir($dir,0700);
			   }

			//设置编码为UTF-8，以避免中文乱码
				header('Content-Type:text/html;charset=utf-8');
				$wenjian1=explode('.',$_FILES['file3']['name']);
				$first_file = time().rand(100000,999999).'.'.$wenjian1[1];  //获取文件的信息

				$upload_dir = "Uploads/".$path."/"; //保存上传文件的目录

				if ($_FILES['file1']['error'] == UPLOAD_ERR_OK){
				$temp_name = $_FILES['file3']['tmp_name'];
				move_uploaded_file($temp_name, $upload_dir.$first_file);

				}else{
					echo "<script>alert('[文件1]上传失败!')</script>";
				}
			$data['picture']='/Uploads/'.$path.'/'.$first_file;
			$data['type_id']=I('post.types');
			$data['uid']=$m['id'];

			M('task_picture_save')->add($data);
		}
	}
	//获取保修的小图片
	public function show_repair()
	{
		$m=M('member')->where('id='.$this->member['id'])->find();
		$cover=M('task_picture_save')->where('type_id='.$_GET['type'].' and uid='.$m['id'])->select();
		if($cover)
		{
			echo json_encode($cover);
		}
	}
	//删除选择的图片
	public function del_img()
	{
		M('task_picture_save')->where('id='.I('post.id'))->delete();
	}

	public function news_info()
	{
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->assign('info',M('commodity')->where('id='.I('get.id'))->find());
		$this->display();
	}

	public function mation()
	{
		$this->assign('info',M('mation')->where("category='".I('sign')."'")->find());
		//获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
		$this->display();
	}
}