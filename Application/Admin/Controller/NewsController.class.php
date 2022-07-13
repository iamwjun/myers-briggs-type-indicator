<?php
namespace Admin\Controller;

/*
 * 新闻动态
 */
class NewsController extends CommController {
    /*
     * 帮助指南
     */
    public function guide() {
    	// 设置模型
        $article = D( 'News' );
        $search = array();
        $condition['is_delete'] = 0;
        if(I('post.title')){
        	$search['title'] = I('post.title');
        	$condition['title'] = array('like','%'.$search['title'].'%');
        }
        // 获取数据
        $dataList = $article->format( $this->getPageList( $article, $condition, 20 ) );
        
        // 注入变量
        $this->assign( 'search', $search );
        $this->assign( 'dataList', $dataList );

        // 渲染模版
        $this->display();
    }
    public function add()
    {
        $this->assign('category',M('news_class')->where('is_delete=0 and status=0')->select());
        $this->display();
    }
    /*
     * 温馨提示
     */
    public function main() {
    	// 设置模型
        $article = D( 'News' );
        $search = array();
        $condition['is_delete'] = 0;
        if(I('post.title')){
        	$search['title'] = I('post.title');
        	$condition['title'] = array('like','%'.$search['title'].'%');
        }
        // 获取数据
        $dataList = $article->format( $this->getPageList( $article, $condition, 20 ) );
        
        //得到每条信息的上级分类，拥有权限操作的会员
        foreach ($dataList as $ke=>$val){
            $dataList[$ke]['type'] = D('Category')->where(array('id'=>$val['pid']))->getField('title');
        }
        // 注入变量
        $this->assign( 'search', $search );
        $this->assign( 'dataList', $dataList );

        // 渲染模版
        $this->display();
    }
    /**
    * 显示编辑页面
    */
    public function edit() {
           $id = I ( 'get.id' );
           $model = D ('News');
           $return = $model->getCommOne ( $id );
           //获取顶级权限名称
           $condtion['is_delete'] = 0;
           $condtion['status'] = 0;
           //无限查询出他的父级，直到父级为0
           $this->getLastList($return['info']['auth']);
           $dataList = $this->authArr;
           $firstList = D('MemberRole')->where($condtion)->select();
           if ($return ['status']) {
                   $this->assign ( 'dataInfo', $return ['info'] );
           } else {
                   die ( $return ['info'] );
           }
           krsort($dataList);//将得到的数组倒序排列
           $this->assign( 'role', D('MemberRole')->getMultiSelect(0,0,$return['info']['auth']) );
           $this->assign('dataList',$dataList);
           $this->assign ( 'firstList', $firstList );

           //获取资讯分类
           $this->assign('nav',M('news_class')->where('is_delete=0 and status=0')->select());
           $this->display ();
    }
    /*
     * 添加
     */
    public function _before_create(){
		$_POST['create_time'] = time();
    }
    /*
     * 编辑前
     */
    public function _before_update(){
        if($_POST['role']){
            $auth = '|';
            foreach ($_POST['role'] as $v){
                $auth .= $v.'|';
            }
            $_POST['auth'] = $auth;
        }
        
    }

    // public function update()
    // {
    //     $id=I('post.id');
    //     $category=I('post.category');
    //     $cid=M('news_class')->where("title='".$category."'")->getField('id');

    //     $data['cid']=$cid;
    //     $data['category']=I('post.category');
    //     $data['title']=I('post.title');
    //     $data['content']=I('post.content');
    //     $data['sort']=I('post.sort');
    //     M('news')->where('id='.$id)->save($data);
    // }
    /*
     * 无限级分类查询。直到为最低级
     */
    public $ids = array();
    public function getLowEst($id){
        $is_exits = D('Category')->where(array('pid'=>$id,'is_delete'=>0,'status'=>0))->select();
        if($is_exits){
            foreach ($is_exits as $val){
                $this->getLowEst($val['id']);
            }    
        }else{
            $this->ids[] = $id;
        }
    }
    /*
     * 根据ID获取会员下级信息
     */
    public function getNextList(){
        if($pid){
        $condtion['is_delete'] = 0;
        $condtion['status'] = 0;
        $dataList = D('MemberRole')->where($condtion)->select();
        if(!$dataList){
            $dataList = 0 ;
        }
        echo json_encode($dataList);
        }else{
            echo json_encode('0');
        }
    }
    /*
     * 无限查询出所有父级
     */
    public $authArr = array();
    protected function getLastList($auth){
        $condtion['is_delete'] = 0;
        $condtion['status'] = 0;
        $condtion['id'] = $auth;
        $dataInfo = D('MemberRole')->where($condtion)->find();
        if($dataInfo){
            $newCondition['is_delete'] = 0;
            $newCondition['status'] = 0;
            $newCondition['pid'] = $dataInfo['pid'];
            $dataList = D('MemberRole')->where($newCondition)->select();//得到他的同级信息
            foreach ($dataList as $key=>$val){
                $dataList[$key]['this'] = $dataInfo['id'];
            }
            $this->authArr[] = $dataList;
            $this->getLastList($dataInfo['pid']);
        }
    }

    /*************以下是新闻分类信息操作***************/

    /*************以下是新闻分类信息操作***************/
    /**
     * 编辑
     */
    public function edit_class() {
        $id = I ( 'get.id' );
        $returnMsg = D('NewsClass')->getCommOne ( $id );
        if ($returnMsg ['status']) {
            $dataInfo = $returnMsg ['info'];
            $this->setLevel ( $dataInfo['pid'] );
            $this->assign ( 'dataInfo', $returnMsg ['info'] );
        } else {
            die ( $returnMsg ['info'] );
        }
        $this->display ();
    }

    /**
     * 数据列表
     */
    public function newsclass() {
        // 获取参数
        $this->paramter ['title'] = I ( 'post.title', '' );
        
        // 默认查询条件
        $condition = array (
                'is_delete' => 0,
                'pid' => 0 
        );
        
        // 标题
        if (! empty ( $this->paramter ['title'] )) {
            $condition ['title'] = array ( 'like', "%{$this->paramter['title']}%" );
        }
        
        $this->assign ( 'dataList', $this->formatDataList ( $condition ) );
        // 渲染模板
        $this->display ();
    }

    /**
     * 格式化数据列表
     *
     * @param array $condition 查询条件
     * @param number $level 层数
     * @return array
     */
    private function formatDataList($condition, $level = 1) {
        $dataList = D('NewsClass')->getList ( $condition, "id,pid,title,sort,status,picture,recommend", array ( 'begin' => 0, 'num' => 0 ), "sort desc" );
        for($i = 0, $size = count ( $dataList ); $i < $size; $i ++) {
            $dataList [$i] ['operation'] = $level;
            $condition ['pid'] = $dataList [$i] ['id'];
            $dataList [$i] ['children'] = $this->formatDataList ( $condition );
        }
        return count ( $dataList ) > 0 ? $dataList : array ();
    }

    /**
     * 设置分类层级
     *
     * @param number $pid 父id
     */
    private function setLevel($pid = 0) {
        $this->paramter ['pid'] = empty ( $pid ) ? I ( 'get.pid' ) : $pid;
        $this->paramter ['level'] = "商品分类";
        if (! empty ( $this->paramter ['pid'] )) {
            $tempInfo = $this->model->getOne ( $this->paramter ['pid'] );
            if ($tempInfo ['pid'] > 0) {
                $lastInfo = D('NewsClass')->getOne ( $tempInfo ['pid'] );
                $this->paramter ['level'] .= "/{$lastInfo['title']}/{$tempInfo['title']}";
            } else {
                $this->paramter ['level'] .= "/{$tempInfo['title']}";
            }
        }
        $this->assign ( 'paramter', $this->paramter );
    }
}