<?php
namespace Admin\Controller;

/**
 * 投诉类别管理
 *
 * @author BoBo
 *        
 */
class ReportClassController extends CommController {


	/**
	 * 添加[前置操作]
	 */
	public function _before_add() {
		$this->setLevel ();
	}
	
	/**
	 * 编辑
	 */
	public function edit() {
		$id = I ( 'get.id' );
		$returnMsg = $this->model->getCommOne ( $id );
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
	public function index() {
		$slect_day=I('post.slect_day');
		$slect_month=I('post.slect_month');
		$m=ceil(date('m',time()));
		$d=ceil(date('d',time()));
		
		
		if (! empty ( $slect_day )) {
			$condition ['day'] = $slect_day;

			//获取当月活跃用户数
		 	$this->assign('m_cont',M('user_log')->where('month='.$m)->count());
			//获取当日活跃用户数
	         $this->assign('d_cont',M('user_log')->where('day='.$slect_day)->count());
	         $this->assign('slect_day',$slect_day);
		}
		else if (! empty ( $slect_month )) {
			$condition ['month'] = $slect_month;
			//获取当月活跃用户数
			 $this->assign('m_cont',M('user_log')->where('month='.$slect_month)->count());
			 //获取当日活跃用户数
	         $this->assign('d_cont',M('user_log')->where('day='.$d)->count());
	         $this->assign('slect_month',$slect_month);
		}
		else{

		$condition['type']=2;
	     //获取当日活跃用户数
         $this->assign('d_cont',M('user_log')->where('day='.$d)->count());
	 	//获取当月活跃用户数
	 	 $this->assign('m_cont',M('user_log')->where('month='.$m)->count());
		}
        
        $dataList=M('user_log')->where($condition)->select();
        foreach ($dataList as $key => $val) {
        	$dataList[$key]['nickname']=M('member')->where("username='".$val['username']."'")->getField('nickname');
        }
        
        //平台总活跃用户数
         $this->assign('cont',M('user_log')->where('type=2')->count());
        //获取当日活跃用户数
         $this->assign('now_d_cont',M('user_log')->where('day='.$d)->count());
	 	//获取当月活跃用户数
	 	 $this->assign('now_m_cont',M('user_log')->where('month='.$m)->count());
		$this->assign ( 'dataList', $dataList);
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
		$dataList = $this->model->getList ( $condition, "id,pid,title,sort,status,picture,recommend", array ( 'begin' => 0, 'num' => 0 ), "sort desc" );
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
		$this->paramter ['level'] = "投诉类别";
		if (! empty ( $this->paramter ['pid'] )) {
			$tempInfo = $this->model->getOne ( $this->paramter ['pid'] );
			if ($tempInfo ['pid'] > 0) {
				$lastInfo = $this->model->getOne ( $tempInfo ['pid'] );
				$this->paramter ['level'] .= "/{$lastInfo['title']}/{$tempInfo['title']}";
			} else {
				$this->paramter ['level'] .= "/{$tempInfo['title']}";
			}
		}
		$this->assign ( 'paramter', $this->paramter );
	}
}