<?php
namespace Admin\Controller;

/*
 * 新闻动态
 */
class FeedbackController extends CommController {
    /*
     * 帮助指南
     */
    public function index() {
    	// 设置模型
        $sug = M( 'feedback' );
        $dataList=$sug->where('is_delete=0')->order('create_time desc')->select();
        $this->assign( 'dataList', $dataList );

        // 渲染模版
        $this->display();
    }
}