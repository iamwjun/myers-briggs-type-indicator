<?php
namespace Admin\Controller;

/**
 * 订单管理控制器
 *
 * @author BoBo
 *        
 */
class RepairController extends CommController {

	public function _initialize() {
		parent::_initialize ();
		// 模型
		$this->model = D ( 'Repair' );
	}

	/**
	 * 商品订单数据列表
	 */
	public function index() {
		 // 获取参数
		 $this->paramter ['is_pay'] = I ( 'post.is_pay', '' ); // 订单状态
		 $this->paramter ['order_id'] = I ( 'post.order_id', '' ); // 订单号
		 $this->paramter ['start_time'] = I ( 'post.start_time', '' ); // 开始时间
		 $this->paramter ['end_time'] = I ( 'post.end_time', '' ); // 结束时间

		
 
		$sql = "select * from db_repair where is_delete=0";
		// 订单号
		 if ( ! empty ( $this->paramter ['order_id'] ) ) {
		 	$sql .= " and order_number = {$this->paramter['order_id']}";
		 }
		 // 订单状态
		 if ( ! empty ( $this->paramter ['is_pay'] ) ) {
		 	if( $this->paramter ['is_pay']=='-1')
		 	{
                $sql .= " and status = 0";
		 	}
		 	else{
		 		$sql .= " and status = {$this->paramter['is_pay']}";
		 	}
		 	
		 }
		  // 日期范围
		 if ( ! empty ( $this->paramter ['start_time'] ) && ! empty ( $this->paramter ['end_time'] ) ) {
		 	$start_time = strtotime ( $this->paramter ['start_time'] );
		 	$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['end_time'] ) ) - 1;
		 	$sql .= " and create_time between $start_time and $end_time";
		 } else if ( ! empty ( $this->paramter ['start_time'] ) ) {
		 	$start_time = strtotime ( $this->paramter ['start_time'] );
		 	$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['start_time'] ) ) - 1;
		 	$sql .= " and create_time between $start_time and $end_time";
		 } else if ( ! empty ( $this->paramter ['end_time'] ) ) {
		 	$start_time = strtotime ( $this->paramter ['end_time'] );
		 	$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['end_time'] ) ) - 1;
		 	$sql .= " and create_time between $start_time and $end_time";
		 }
 
		$dataList = $this->model->getSQLList ( $sql, array ( 'begin' => 0, 'num' => 0 ), "create_time desc" );
	    foreach ($dataList as $key => $val) {
	    	$dataList[$key]['nickname']=M('member')->where('id='.$val['uid'])->getField('nickname');
	    }
		$this->assign ( "dataList", $dataList );

		// 渲染模板
		$this->display ();
	}

	/**
	 * 个性订单数据列表
	 */
	public function personality() {
		// 获取参数
		$this->paramter ['pay_way'] = I ( 'post.pay_way', '' ); // 付款方式
		$this->paramter ['is_pay'] = I ( 'post.is_pay', '' ); // 订单状态
		$this->paramter ['order_id'] = I ( 'post.order_id', '' ); // 订单号
		$this->paramter ['start_time'] = I ( 'post.start_time', '' ); // 开始时间
		$this->paramter ['end_time'] = I ( 'post.end_time', '' ); // 结束时间
		// 设置查询条件
		$field = "a.id,a.create_time,a.order_id,a.price,a.pay_way,a.custom_price,a.is_pay";
		$field .= ",b.username as member_username";
		$sql = "select $field from db_order as a";
		$sql .= " left join db_member as b on a.uid = b.id";
		$sql .= " where 1=1 and a.is_delete = 0 and a.type = 1";
		// 付款方式
		if ( ! empty ( $this->paramter ['pay_way'] ) ) {
			$sql .= " and a.pay_way = '{$this->paramter['pay_way']}'";
		}
		// 付款方式
		if ( ! empty ( $this->paramter ['is_pay'] ) ) {
			$sql .= " and a.pay_way = '{$this->paramter['pay_way']}'";
		}
		// 订单号
		if ( ! empty ( $this->paramter ['order_id'] ) ) {
			$sql .= " and a.order_id like '%{$this->paramter['order_id']}%'";
		}
		// 日期范围
		if ( ! empty ( $this->paramter ['start_time'] ) && ! empty ( $this->paramter ['end_time'] ) ) {
			$start_time = strtotime ( $this->paramter ['start_time'] );
			$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['end_time'] ) ) - 1;
			$sql .= " and a.create_time between $start_time and $end_time";
		} else if ( ! empty ( $this->paramter ['start_time'] ) ) {
			$start_time = strtotime ( $this->paramter ['start_time'] );
			$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['start_time'] ) ) - 1;
			$sql .= " and a.create_time between $start_time and $end_time";
		} else if ( ! empty ( $this->paramter ['end_time'] ) ) {
			$start_time = strtotime ( $this->paramter ['end_time'] );
			$end_time = strtotime ( '+1 day', strtotime( $this->paramter ['end_time'] ) ) - 1;
			$sql .= " and a.create_time between $start_time and $end_time";
		}
		// 读取数据
		$this->dataList = $this->model->getSQLList ( $sql, array ( 'begin' => 0, 'num' => 0 ), "a.create_time desc" );
		// 注入数据
		$this->assign ( "dataList", $this->dataList );
		$this->assign ( 'paramter', $this->paramter );
		// 渲染模板
		$this->display ();
	}

	/**
	 * 设置数据列表
	 */
	private function setDataList() {
		$OrderInfo = D ( 'OrderInfo' );
		for ( $i = 0 , $size = count ( $this->dataList ); $i < $size; $i ++ ) {
			$rows = $this->dataList [$i];
			$field = "a.num as pro_num,a.is_send";
			$field .= ",b.title as pro_title,b.member_price as pro_price";
			$sql = "select $field from db_order_info as a";
			$sql .= " left join db_commodity as b on a.pro_id = b.id";
			$sql .= " where 1=1 and order_id = '{$rows[order_id]}'";
			$tempList = $OrderInfo->getSQLList ( $sql, array ( 'begin' => 0, 'num' => 0 ), 'a.id desc' );
			foreach ( $tempList as $theRows ) {
				if ( $theRows['is_send'] == 0 ) {
					$this->dataList [$i] ['is_send'] = 1;
					break;
				} else if ( $theRows['is_send'] == 1 ) {
					$this->dataList [$i] ['is_send'] = 2;
				} else if ( $theRows['is_send'] == 2 ) {
					$this->dataList [$i] ['is_send'] = 3;
				}
			}
			$this->dataList [$i] ['list'] = $tempList;
		}
	}

	/**
	 * 订单报价
	 */
	public function price_edit() {
		$theId = I ( 'request.id', 0 );
		if ( is_number ( $theId ) ) {
			die ( '参数错误：id' );
		}
		$tag = I ( 'get.tag', '' );
		if ( $tag == 'update' && IS_AJAX && IS_POST ) {
			$this->HuiMsg ( $this->model->price_edit ( $_POST ) );
		} else {
			$this->assign ( 'dataInfo', $this->model->getOne ( $theId ) );
            
			$this->assign('infomation',M('engin_baojiao')->where('order_id='.$theId)->select());
			
			$this->assign('true_desc',M('repair')->where('id='.$theId)->getField('true_desc'));
			
			$this->display ();
		}
	}
	/**
	 * 后台修改订单报价
	 */
	public function update_baojia()
	{
		$data['info']=I('post.info');
		M('engin_baojiao')->where('id='.I('post.id'))->save($data);

	}
    /**
     * 订单分配
     */
    public function order_fenpei()
    {
    	$theId = I ( 'request.id', 0 );
    	$this->assign ( 'dataInfo', $this->model->getOne ( $theId ) );
    	//获取工程师列表
    	$this->assign('engineer',M('authentication')->where('(type=1 and is_delete=0 and status=1) or (type=4 and is_delete=0 and status=1)')->select());
    	// 渲染模板
	    $this->display ();
    }
    /**
     * 订单完成给工程师提成
     */
    public function ticheng()
    {
    	$theId = I ( 'request.id', 0 );
		if ( is_number ( $theId ) ) {
			die ( '参数错误：id' );
		}
		$tag = I ( 'get.tag', '' );
		if ( $tag == 'update' && IS_AJAX && IS_POST ) {
			$this->HuiMsg ( $this->model->price_edit ( $_POST ) );
		} else {
            
			//获取订单相关信息
			$order=M('repair')->where('id='.$theId)->find();
			$this->assign('info',$order);
			
			$this->display ();
		}
    }
    /**
     * 后台给工程师提成费用
     */
    public function ok_ticheng()
    {
    	$id=I('post.order_id');
    	$data['number']=I('post.num');

    	M('repair')->where('id='.$id)->save($data);
    	echo "处理成功!";
    }
    /**
     * 后台确认 用户已付款
     */
    public function ok_pay()
    {
    	$theId = I ( 'request.id', 0 );

    	$this->assign ( 'dataInfo', $this->model->getOne ( $theId ) );
    	$this->display ();
    	
    }
    public function payment()
    {
		$data['status']=7;

    	M('repair')->where('id='.I('post.oid'))->save($data);
    	echo "处理成功!";

    }
	/**
	 * 确认付款
	 * TODO 还有会员提成、升级等功能未开发
	 */
	/* public function confirmPay() {
		if ( IS_AJAX && IS_POST ) {
			//会员提成
			$id = I('post.id');
			global $config;
			require_once(VENDOR_PATH.'MicroDistribution/config.php');
			$order = D('Order')->where(array('id'=>$id))->find();
			$config['price'] = $order['price'];
			$config['mid'] = $order['uid'];
			$config['order_id'] = $order['order_id'];
			$config['reward_type'] = 25;
			//根据订单计算出利润
			$orderInfo = $this->getProId( $order['order_id'] );
			$profit = 0;
			foreach ($orderInfo as $val){
				$profit += $val['member_price']- $val['cost_price'];
			}
			//当没有商品时，就没有利润，无利润直接按照总价格计算
			$config['profit'] = $profit==0 ? $config['price'] : $profit;
			vendor('MicroDistribution.main');
			$alipaySubmit = new \MicroDistribution($config);
			$alipaySubmit->microDistribution();
			
			$this->HuiMsg ( $this->model->confirmPay ( $_POST ) );
		} else {
			$this->HuiMsg ( returnMsg () );
		}
	} */
	
	/**
	 * 确认付款
	 */
	public function confirmPay() {
		if ( IS_AJAX && IS_POST ) {
			// 获取参数
			$id = I( 'post.id', 0 );
			$return = returnMsg();
			// 判断参数
			if ( is_number( $id ) ) {
				$return['info'] = "参数id错误！";
				$this->HuiMsg( $return );
			}
			// 判断数据是否存在
			$order = $this->model->getOne( $id, 'id', true, "*" );
			if ( empty( $order ) ) {
				$return['info'] = "数据不存在！";
				$this->HuiMsg( $return );
			} else if ( $order['is_pay'] ) {
				$return['info'] = "订单已付款，请勿再次支付！";
				$this->HuiMsg( $return );
			}
			// 配置参数
			$config = array();
			$config['order_id'] = $id;
			// 处理订单提成
			vendor('MicroDistribution.main');
			$handle = new \MicroDistribution($config);
			$return = $handle->microDistribution();
			$this->HuiMsg( $return );
		} else {
			$this->HuiMsg ( returnMsg () );
		}
	}
	
	/**
	 * 根据订单编号 获得所属订单商品的属性
	 * @param string $order_id
	 * @return array
	 */
	public function getProId( $order_id ) {
		$listArray = D('OrderInfo')->where( array( 'order_id' => $order_id ) )->field( 'pro_id,num' )->select();
		$newArray = array();
		$productModel = D( 'Commodity' );
		for ( $i = 0, $size = count( $listArray ); $i < $size; $i ++ ) {
			$theArray = $productModel->where( array( 'id' => $listArray[$i]['pro_id'] ) )->field( 'id,uid,member_price,cost_price' )->find();
				$newArray[] = array(
					'id' => $theArray['id'],
					'uid' => $theArray['uid'],
					'hit' => $theArray['hit'],
					'num' => $listArray[$i]['num'],
					'member_price' => $theArray['member_price'],
					'cost_price' => $theArray['cost_price'],
				);
		}
		return $newArray;
	}
	/**
	 * 获取订单信息表的所有id
	 */
	public function getOrderInfoIdList() {
		if ( IS_AJAX && IS_POST ) {
			$order_id = $this->model->getOne( I( 'post.id', 0 ), 'id', false, 'order_id' );
			$this->HuiMsg ( D( 'OrderInfo' )->getOrderInfoIdList( $order_id ) );
		} else {
			$this->error( '没有数据' );
		}
	}

	/**
	 * 订单详情
	 */
	public function show() {
		$theId = I ( 'get.id', 0 );
		if ( is_number ( $theId ) ) {
			$this->error ( '参数错误：id' );
		}
		// 获取订单信息
		$dataInfo = D('Repair')->getOne ( $theId );
		if ( empty ( $dataInfo ) ) {
			die ( '数据未找到!' );
		}
		$dataInfo=M('repair')->where('id='.$theId)->find();
		$this->assign ( 'dataInfo', $dataInfo );
		$this->assign ('role',M('member')->where('id='.$dataInfo['uid'])->getField('unit'));
		$this->assign ('username',M('member')->where('id='.$dataInfo['uid'])->getField('username'));
		// 渲染模板
		$this->display ();
	}

	/**
	 * 发货
	 */
	public function deliver_goods() {
		$orderInfoModel = D ( 'OrderInfo' );
		// 判断是更新还是显示
		if ( I ( 'get.tag', '' ) == 'update' ) {
			$this->HuiMsg ( $orderInfoModel->deliver_goods ( $_POST ) );
		} else {
			// 获取参数
			$theId = I ( 'get.id', 0 );
			if ( empty ( $theId ) ) {
				die ( '参数错误：id' );
			}
			$infoList = $orderInfoModel->getProList ( $theId );
			if ( count ( $infoList ) > 0 ) {
				// 注入数据
				$this->assign ( 'theId', $theId );
				$this->assign ( 'infoList', $infoList );
				// 渲染视图
				$this->display ();
			} else {
				die ( '没有需要发货的商品' );
			}
		}
	}
	/**
	 * 审核报价
	 */
	public function check_baojia()
	{
		$data['status']=1;
		M('engin_baojiao')->where('order_id='.I('post.id'))->save($data);
		echo "报价通过审核";
	}
	/**
	 * 分配订单
	 */
	public function fenpei_order()
	{
		$data['status']=1;
		$data['do_id']=I('post.do_id');
		$data['checks']=1;
		M('repair')->where('id='.I('post.oid'))->save($data);
		echo "订单分配成功";
	}

	/**
	 * 物流跟踪/查看物流
	 */
	public function logistics() {
		// 模型
		$logisticsModel = D ( 'OrderLogistics' );
		// 判断是新增物流还是查看物流
		if ( I ( 'get.tag', '' ) == 'create' ) {
			// 新增物流信息
			$this->HuiMsg ( $logisticsModel->insert ( $_POST ) );
		} else {
			// 查看物流
			$condition ['order_info_id'] = I ( 'get.order_info_id', 0 );
			if ( empty ( $condition ['order_info_id'] ) ) {
				die ( "参数传递有误：order_info_id" );
			}
			// 获取当前订单商品详情
			$orderInfo = D ( 'OrderInfo' )->getOne ( $condition ['order_info_id'] );
			$this->assign ( 'orderInfo', $orderInfo );
			// 获取当前订单商品的物流信息
			$condition ['status'] = 0;
			$condition ['is_delete'] = 0;
			$logisticsList = $logisticsModel->getList ( $condition, "create_time,intro", array ( 'begin' => 0, 'num' => 0 ), "create_time desc" );
			$this->assign ( 'logisticsList', $logisticsList );
			// 渲染视图
			$this->display ();
		}
	}
	/**
	 * 管理员删除订单
	 */
	public function del_order()
	{
		$data['is_delete']=1;
		M('repair')->where('id='.I('post.id'))->save($data);
		echo "操作成功!";
	}
	/**
	 * 管理员拆分订单然后 新增订单
	 */
	public function add()
	{
		//获取工程师列表
    	$this->assign('engineer',M('authentication')->where('(type=1 and is_delete=0 and status=1) or (type=4 and is_delete=0 and status=1)')->select());
		//获取所有的批量订单信息
		$this->assign('pl_list',M('repair')->where("name='' and is_delete=0")->select());

		$this->assign('maxid',M('repair')->where('id>0')->Max('id'));
		$this->display();
	}

   /**
    * 后台发布订单
    */
   public function publish()
   {
   	 $data['checks']=1;
   	 M('repair')->where('id='.I('post.oid'))->save($data);
   }
   /**
    * 后台驳回订单
    */
   public function reject()
   {
   	 $data['status']=9;
   	 $data['reject']=I('post.reject_tex');
   	 M('repair')->where('id='.I('post.oid'))->save($data);
   }

   //设置前端不显示客户单位地址
   public function hidd_company()
   {
     $ck=M('repair')->where('id='.I('post.oid'))->getField('show_company');
     if($ck==0)
     {
       $data['show_company']=1;
       M('repair')->where('id='.I('post.oid'))->save($data);
     }
     else{
       $data['show_company']=0;
       M('repair')->where('id='.I('post.oid'))->save($data);
     }
   }
   //设置前端不显示客户单位名称
   public function hidd_address()
   {
   	 $ck=M('repair')->where('id='.I('post.oid'))->getField('show_comp_addr');
   	  if($ck==0)
      {
       $data['show_comp_addr']=1;
       M('repair')->where('id='.I('post.oid'))->save($data);
      }
     else{
       $data['show_comp_addr']=0;
       M('repair')->where('id='.I('post.oid'))->save($data);
      }
   }
   //设置前端不显示客户联系人名
   public function hidd_contact()
   {
   	 $ck=M('repair')->where('id='.I('post.oid'))->getField('show_contact');
   	  if($ck==0)
      {
       $data['show_contact']=1;
       M('repair')->where('id='.I('post.oid'))->save($data);
      }
     else{
       $data['show_contact']=0;
       M('repair')->where('id='.I('post.oid'))->save($data);
      }
   }

   //后台管理员手动更改提成比例
   public function update_tcheng_bl()
   {
   	 $gcs_type=I('post.gcs_type');
   	 if($gcs_type=='工程师类别：兼职工程师')
   	 {
   	 	$data['tcbl']=I('post.tcbl');
   	 	M('ticheng_set')->where("type='兼职工程师'")->save($data);
   	 }
   	 else{
   	 	$data['tcbl']=I('post.tcbl');
   	 	M('ticheng_set')->where("type='全职工程师'")->save($data);
   	 }
   }
}