<?php
namespace Admin\Controller;

/**
 * 会员控制器
 * 
 * @author BoBo
 *
 */
class MemberController extends CommController {
    
    /**
     * 构造函数
     */
    public function _initialize() {
        parent::_initialize();
        // 模型
        $this->model = D( 'Member' );
    }

    /**
     * 普通会员信息列表
     */
    public function index() {
        // 获取参数
        $this->paramter['username'] = I( 'post.username', '' );
        $this->paramter['nickname'] = I( 'post.nickname', '' );
        $this->paramter['type'] = I( 'post.type', '' );
        $this->paramter['start_time'] = I( 'post.start_time', '' );
        $this->paramter['end_time'] = I( 'post.end_time', '' );

        // 姓名
        if ( !empty( $this->paramter['nickname'] ) ) {
            $condition['nickname'] = array( 'like', "%{$this->paramter['nickname']}%" );
        }
        // 按时间段查询
        if(!empty($this->paramter['start_time']))
        {
            $start=strtotime($this->paramter['start_time']);
            $end=strtotime($this->paramter['end_time']);
            $condition['create_time']=array(array('egt',$start),array('elt',$end),'and');
        }
        // 会员类型
        if ( !empty( $this->paramter['type'] ) ) {
            if($this->paramter['type']==-1)
            {
              $condition['unit'] = array( 'neq', "1" );
            }
            else
            {
              $condition['unit'] = array( 'eq', "{$this->paramter['type']}" );
            }
        }

        // 设置查询条件
        $condition['is_delete'] = 0;
        $condition['unit']=0;
        // 设置数据列表
        $dataList = $this->model->getList( $condition, '*' );
        $category = D( 'Category' );
        foreach ($dataList as $key=>$val){
        	$maps['is_delete']=0;
        	$maps['status'] = 0;
        	$maps['recommended_code'] = $val['referral_code'];
        	//直接粉丝数
        	$dataList[$key]['referral_count'] =$this->model->getFansCount($val['referral_code'],'direct');
        	$dataList[$key]['recommended_count'] = $this->model->getFansCount($val['referral_code']);
        	// 获取等级
        	$dataList[$key]['level_title'] = $category->getOne( $val['level'], 'id', false, 'title' );
            //如果工程师认证已通过审核 则更改用户身份为工程师
            /*
            $ck_engin=M('authentication')->where('uid='.$val['id'].' and status=1')->count();
            if($ck_engin!=0)
            {
                $data['unit']=1;
                M('member')->where('id='.$val['id'])->save($data);
            }
            */
        }
        //获取直推和朋友圈人数
        $this->assign( "dataList", $dataList );
        $this->assign( 'paramter', $this->paramter );
        // 渲染模板
        $this->display();
    }
    /**
     * 工程师信息列表
     */
    public function enginer() {
        // 获取参数
        $this->paramter['username'] = I( 'post.username', '' );
        $this->paramter['nickname'] = I( 'post.nickname', '' );
        $this->paramter['type'] = I( 'post.type', '' );
        $this->paramter['start_time'] = I( 'post.start_time', '' );
        $this->paramter['end_time'] = I( 'post.end_time', '' );

        // 姓名
        if ( !empty( $this->paramter['nickname'] ) ) {
            $condition['nickname'] = array( 'like', "%{$this->paramter['nickname']}%" );
        }
        // 按时间段查询
        if(!empty($this->paramter['start_time']))
        {
            $start=strtotime($this->paramter['start_time']);
            $end=strtotime($this->paramter['end_time']);
            $condition['create_time']=array(array('egt',$start),array('elt',$end),'and');
        }
        // 会员类型
        if ( !empty( $this->paramter['type'] ) ) {
            if($this->paramter['type']==-1)
            {
              $condition['unit'] = array( 'neq', "1" );
            }
            else
            {
              $condition['unit'] = array( 'eq', "{$this->paramter['type']}" );
            }
        }

        // 设置查询条件
        $condition['is_delete'] = 0;
        // 设置数据列表
        $dataList = $this->model->getList( $condition, '*' );
       
        //获取直推和朋友圈人数
        $this->assign( "dataList", $dataList );
        $this->assign( 'paramter', $this->paramter );
        // 渲染模板
        $this->display();
    }
    /**
     * 经销商息列表
     */
    public function distributor() {
        // 获取参数
        $this->paramter['username'] = I( 'post.username', '' );
        $this->paramter['nickname'] = I( 'post.nickname', '' );
        $this->paramter['type'] = I( 'post.type', '' );
        $this->paramter['start_time'] = I( 'post.start_time', '' );
        $this->paramter['end_time'] = I( 'post.end_time', '' );

        // 姓名
        if ( !empty( $this->paramter['nickname'] ) ) {
            $condition['nickname'] = array( 'like', "%{$this->paramter['nickname']}%" );
        }
        // 按时间段查询
        if(!empty($this->paramter['start_time']))
        {
            $start=strtotime($this->paramter['start_time']);
            $end=strtotime($this->paramter['end_time']);
            $condition['create_time']=array(array('egt',$start),array('elt',$end),'and');
        }
        // 会员类型
        if ( !empty( $this->paramter['type'] ) ) {
            if($this->paramter['type']==-1)
            {
              $condition['unit'] = array( 'neq', "1" );
            }
            else
            {
              $condition['unit'] = array( 'eq', "{$this->paramter['type']}" );
            }
        }

        // 设置查询条件
        $condition['is_delete'] = 0;
        $condition['unit']=2;
        // 设置数据列表
        $dataList = $this->model->getList( $condition, '*' );
        $category = D( 'Category' );
        foreach ($dataList as $key=>$val){
            $maps['is_delete']=0;
            $maps['status'] = 0;
            $maps['recommended_code'] = $val['referral_code'];
            //直接粉丝数
            $dataList[$key]['referral_count'] =$this->model->getFansCount($val['referral_code'],'direct');
            $dataList[$key]['recommended_count'] = $this->model->getFansCount($val['referral_code']);
            // 获取等级
            $dataList[$key]['level_title'] = $category->getOne( $val['level'], 'id', false, 'title' );

        }
        //获取直推和朋友圈人数
        $this->assign( "dataList", $dataList );
        $this->assign( 'paramter', $this->paramter );
        // 渲染模板
        $this->display();
    }
     /**
     * 供应商息列表
     */
    public function supplier() {
        // 获取参数
        $this->paramter['username'] = I( 'post.username', '' );
        $this->paramter['nickname'] = I( 'post.nickname', '' );
        $this->paramter['type'] = I( 'post.type', '' );
        $this->paramter['start_time'] = I( 'post.start_time', '' );
        $this->paramter['end_time'] = I( 'post.end_time', '' );

        // 姓名
        if ( !empty( $this->paramter['nickname'] ) ) {
            $condition['nickname'] = array( 'like', "%{$this->paramter['nickname']}%" );
        }
        // 按时间段查询
        if(!empty($this->paramter['start_time']))
        {
            $start=strtotime($this->paramter['start_time']);
            $end=strtotime($this->paramter['end_time']);
            $condition['create_time']=array(array('egt',$start),array('elt',$end),'and');
        }
        // 会员类型
        if ( !empty( $this->paramter['type'] ) ) {
            if($this->paramter['type']==-1)
            {
              $condition['unit'] = array( 'neq', "1" );
            }
            else
            {
              $condition['unit'] = array( 'eq', "{$this->paramter['type']}" );
            }
        }

        // 设置查询条件
        $condition['is_delete'] = 0;
        $condition['unit']=3;
        // 设置数据列表
        $dataList = $this->model->getList( $condition, '*' );
        $category = D( 'Category' );
        foreach ($dataList as $key=>$val){
            $maps['is_delete']=0;
            $maps['status'] = 0;
            $maps['recommended_code'] = $val['referral_code'];
            //直接粉丝数
            $dataList[$key]['referral_count'] =$this->model->getFansCount($val['referral_code'],'direct');
            $dataList[$key]['recommended_count'] = $this->model->getFansCount($val['referral_code']);
            // 获取等级
            $dataList[$key]['level_title'] = $category->getOne( $val['level'], 'id', false, 'title' );

        }
        //获取直推和朋友圈人数
        $this->assign( "dataList", $dataList );
        $this->assign( 'paramter', $this->paramter );
        // 渲染模板
        $this->display();
    }
    /**
     * 计量检测单位息列表
     */
    public function uniter() {
        // 获取参数
        $this->paramter['username'] = I( 'post.username', '' );
        $this->paramter['nickname'] = I( 'post.nickname', '' );
        $this->paramter['type'] = I( 'post.type', '' );
        $this->paramter['start_time'] = I( 'post.start_time', '' );
        $this->paramter['end_time'] = I( 'post.end_time', '' );

        // 姓名
        if ( !empty( $this->paramter['nickname'] ) ) {
            $condition['nickname'] = array( 'like', "%{$this->paramter['nickname']}%" );
        }
        // 按时间段查询
        if(!empty($this->paramter['start_time']))
        {
            $start=strtotime($this->paramter['start_time']);
            $end=strtotime($this->paramter['end_time']);
            $condition['create_time']=array(array('egt',$start),array('elt',$end),'and');
        }
        // 会员类型
        if ( !empty( $this->paramter['type'] ) ) {
            if($this->paramter['type']==-1)
            {
              $condition['unit'] = array( 'neq', "1" );
            }
            else
            {
              $condition['unit'] = array( 'eq', "{$this->paramter['type']}" );
            }
        }

        // 设置查询条件
        $condition['is_delete'] = 0;
        $condition['unit']=4;
        // 设置数据列表
        $dataList = $this->model->getList( $condition, '*' );
        $category = D( 'Category' );
        foreach ($dataList as $key=>$val){
            $maps['is_delete']=0;
            $maps['status'] = 0;
            $maps['recommended_code'] = $val['referral_code'];
            //直接粉丝数
            $dataList[$key]['referral_count'] =$this->model->getFansCount($val['referral_code'],'direct');
            $dataList[$key]['recommended_count'] = $this->model->getFansCount($val['referral_code']);
            // 获取等级
            $dataList[$key]['level_title'] = $category->getOne( $val['level'], 'id', false, 'title' );

        }
        //获取直推和朋友圈人数
        $this->assign( "dataList", $dataList );
        $this->assign( 'paramter', $this->paramter );
        // 渲染模板
        $this->display();
    }

    /**
     * 会员信息查看
     */
    public function details() {
        // 获取参数
        $theId = I( 'get.id', 0 );
        if ( is_number( $theId ) ) {
            die( '参数错误：id' );
        }
        $dataInfo = $this->model->getOne( $theId );
		
		// 获取等级
		$dataInfo['level_title'] = D('Category')->getOne( $dataInfo['level'], 'id', false, 'title' );
		
        //获取默认的收货信息
        $map['is_delete'] = 0;
        $map['uid'] = $dataInfo['id'];
        $map['is_default'] = 1;
        $address = D('Address')->where($map)->find();
        
        $dataInfo['address_nickname'] = $address['nickname'];
        $dataInfo['address_tel'] = $address['tel'];
        $province = D('HatProvince')->where(array('province_id'=>$address['province']))->getField('province');
        $this->assign( 'dataInfo', $dataInfo );
        
        // 数据统计[未统计完]
        // 直接粉丝人数
        $this->assign( 'direct_fans', $this->model->getFansCount( $dataInfo['referral_code'], 'direct' ) );
        // 直接粉丝人数
        $this->assign( 'indirect_fans', $this->model->getFansCount( $dataInfo['referral_code'], 'indirect' ) );
        // 渲染模板
        $this->display();
    }
    /**
     * 团推人数获取
     * @param number $recommend 推销号
     */
    protected $countList = 0;
    function getSubList( $recommend) {
    	$map['recommended_code'] = $recommend;
    	$map['is_delete'] = 0;
    	$map['status'] = 0;
    	$newArray = D('Member')->where( $map )->select();
    	for ( $i = 0, $size = count( $newArray ); $i < $size; $i ++ ) {
    		$this->countList ++;
    		$this->getSubList( $newArray[$i]['referral_code']);
    	}
    }
    
    /**
     * 会员钱包充值
     */
    public function walletRecharge() {
    	$id = I( 'get.id', 0 );
    	if ( empty( $id ) ) {
    		die('id不能为空！');
    	}
    	$this->assign( 'id', $id );
    	// 渲染模板
    	$this->display();
    }
    
    /**
     * 添加会员钱包充值记录
     */
    public function addWalletRecharge() {
    	$return = returnMsg();
    	$data = array();
    	$idlist = I( 'post.id', 0 );
    	$price = I( 'post.price', 0 );
    	if ( empty( $idlist ) ) {
    		$return['info'] = '没有选择需要充值的会员！';
    		$this->HuiMsg( $return );
    	}
    	if ( empty( $price ) ) {
    		$return['info'] = '充值金额填写有误！';
    		$this->HuiMsg( $return );
    	}
    	$memberModel = D('Member');
    	$moneyModel = D( 'MemberMoneyRecord' );
    	$idlist = array_merge( array_filter( explode( ",", $idlist ) ) );
    	$flag = true;
    	foreach ( $idlist as $key ) {
    		$balance = $memberModel->getOne( $key, 'id', false, 'money' );
    		$rows = array();
    		$rows['uid'] = $key;
	    	$rows['price'] = $price;
	    	$rows['balance'] = $balance + $price;
	    	$rows['type'] = 40;
	    	$rows['create_time'] = time();
    		$isMoney = $moneyModel->add( $rows );
    		// 更新会员钱包金额
    		$member = array();
    		$member['id'] = $key;
    		$member['money'] = $rows['balance'];
    		$isMember = $memberModel->save( $member );
    		if ( !$isMoney || !$isMember ) {
    			$flag = false;
    			$return['info'] = "id({$key})钱包明细或更新钱包余额失败!";
    			break;
    		}
    	}
    	
    	if ( $flag ) {
    		$return['status'] = 1;
			$return['info'] = "充值成功!";
    	}
    	$this->HuiMsg( $return );
    }
    //真删除用户
    public function del_user()
    {
        M('member')->where('id='.I('post.uid'))->delete();
    }
    

}