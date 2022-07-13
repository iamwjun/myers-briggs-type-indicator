<?php
namespace Mobile\Controller;

use Think\Log;
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
    public function index()
    {
        session('adid', I('get.adid'));
        session('clickid', I('get.clickid'));
        session('creativeid', I('get.creativeid'));
        session('creativetype', I('get.creativetype'));

        $this->display ();
    }

    //问答题目
    public function question()
    {
        $ss=I('get.sex');
        $page=I('get.page');
        $score=I('get.score');
        $ua = $_SERVER['HTTP_USER_AGENT'];//判断浏览器的参数
        
        $star=$page-1;
        $end=1;
        if($ss==2)
        {
            $sex="女生";
        }
        if($ss==1)
        {
            $sex="男生";
        }
        if($score=='')
        {
            $fenshu=0;
        }
        if($score!='')
        {
            $fenshu=I('get.score');
        }

        // $callback=session('clickid');
        
        // $this->douyin_api('active_pay', $callback);

        if (strpos($ua, 'MicroMessenger') == false && strpos($ua, 'Windows Phone') == false) {
        } 
        else 
        {
        //这是在微信浏览器中的处理
         if($page<2)
                    {
              if (!isset($_GET['code'])){
                if($ss==1)
                {
                    $path="http://www.zug365.cn/Mobile/Index/question.html?sex=1&page=".$page."&score=".$fenshu;
                }
                else{
                    $path="http://www.zug365.cn/Mobile/Index/question.html?sex=2&page=".$page."&score=".$fenshu;
                }
                $baseUrl = urlencode($path);
                $url = $this->__CreateOauthUrlForCode($baseUrl);
                Header("Location: $url");
                exit();
                }
                if($_GET['code'])
                {
                   
                     $open_id=$this->GetOpenidFromMp($_GET['code']);
                   
                }
                    }
                    else{
                        $open_id=I('get.open_id');
                    }
        
        }
        
        
        


         //获取情感测试题目列表
        $this->assign('jg_list',M('commodity')->where("pid_val='".$sex."' and pid=450 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        //获取情感测试题目总数
        $this->assign('jg_cont',M('commodity')->where("pid_val='".$sex."' and pid=450 and is_delete=0")->order('create_time desc')->count());
        $this->assign('open_id',$open_id);
        $this->display();
    }
    
    

    //性格测试问答题目
    public function question_xgcs()
    {
        
        $tp=I('get.type');
        $score=I('get.score');
        $page=I('get.page');
        
        $star=$page-1;
        $end=1;
        if($score=='')
        {
            $fenshu=0;
        }
        if($score!='')
        {
            $fenshu=I('get.score');
        }
        
        if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
        //这是在微信浏览器中的处理
         if($page<2)
        {
              if (!isset($_GET['code']))
              {
                if($ss==1)
                {
                    $path="http://www.zug365.cn/Mobile/Index/question_xgcs.html?type=".$tp."&page=".$page."&score=".$fenshu;
                }
                else{
                    $path="http://www.zug365.cn/Mobile/Index/question_xgcs.html?type=".$tp."&page=".$page."&score=".$fenshu;
                }
                $baseUrl = urlencode($path);
                $url = $this->__CreateOauthUrlForCode($baseUrl);
                Header("Location: $url");
                exit();
                }
                if($_GET['code'])
                {
                    $open_id=$this->GetOpenidFromMp($_GET['code']);
                }
             } 
             else{
                $open_id=I('get.open_id');
            }
        }
        if($tp==1)
        {
            //获取完整题目总数
            $this->assign('jg_cont',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit('0,93')->count());
        }
        if($tp==2)
        {
            //获取速测题目总数
            $this->assign('jg_cont',48);
        }
        


         //获取情感测试题目列表
        $this->assign('jg_list',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        
        $this->assign('open_id',$open_id);
        $this->display();
    }
    
    //智商测试问答题目
    public function question_zscs()
    {
       $tp=I('get.type');
       $page=I('get.page');
       $score=I('get.score');
        
        $star=$page-1;
        $end=1;
        
        if($score=='')
        {
            $fenshu=0;
        }
        if($score!='')
        {
            $fenshu=I('get.score');
        }
        if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
            //这是在微信浏览器中的处理
           if (!isset($_GET['code'])){
                if($ss==1)
                {
                    $path="http://www.zug365.cn/Mobile/Index/question_zscs.html?type=".$tp."&page=".$page."&score=".$fenshu;
                }
                else{
                    $path="http://www.zug365.cn/Mobile/Index/question_zscs.html?type=".$tp."&page=".$page."&score=".$fenshu;
                }
                $baseUrl = urlencode($path);
                $url = $this->__CreateOauthUrlForCode($baseUrl);
                Header("Location: $url");
                exit();
            }
            if($_GET['code'])
            {
                $open_id=$this->GetOpenidFromMp($_GET['code']);
            }
        }
        
        
        
        if($tp==1)
        {
            //获取完整题目总数
            $this->assign('jg_cont',M('commodity')->where("pid_val='请选择性别' and pid=452 and is_delete=0")->limit('0,93')->count());
        }
        if($tp==2)
        {
            //获取速测题目总数
            $this->assign('jg_cont',M('commodity')->where("pid_val='请选择性别' and pid=452 and is_delete=0")->limit('0,48')->count());
        }
        


         //获取情感测试题目列表
        $this->assign('jg_list',M('commodity')->where("pid_val='请选择性别' and pid=452 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        
        
        $this->assign('open_id',$open_id);
        $this->display();
    }

    public function xgtest()
    {
        session('adid', I('get.adid'));
        session('clickid', I('get.clickid'));
        session('creativeid', I('get.creativeid'));
        session('creativetype', I('get.creativetype'));

        //获取性格测试题目列表
        $this->assign('xg_list',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        //获取性格测试题目总数
        $this->assign('xg_cont',M('commodity')->where("pid_val='请选择性别' and pid=449 and is_delete=0")->order('create_time desc')->count());

        // $this->douyin_api();
        // $this->douyin_api();
        $this->display();
    }
   
   //智商测试
   public function zstest()
    {
        session('adid', I('get.adid'));
        session('clickid', I('get.clickid'));
        session('creativeid', I('get.creativeid'));
        session('creativetype', I('get.creativetype'));

       //获取性格测试题目列表
        $this->assign('xg_list',M('commodity')->where("pid_val='请选择性别' and pid=452 and is_delete=0")->limit($star,$end)->order('create_time desc')->select());
        //获取性格测试题目总数
        $this->assign('xg_cont',M('commodity')->where("pid_val='请选择性别' and pid=452 and is_delete=0")->order('create_time desc')->count());

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

    public function mation()
    {
        $this->assign('info',M('mation')->where("category='".I('sign')."'")->find());
        //获取焦点图
        $this->assign('focus',M('link')->where('is_delete=0 and status=0')->order('sort desc')->select());
        $this->display();
    }
    
    
    //获取性格测试结果
    public function search_xg_res()
    {
        $score=I('post.score');
        if($score>65 && $score<85)
        {
            $fen="65-85";
        }
        else if($score>85 && $score<100)
        {
            $fen="85-100";
        }
        else{
            $fen="50-65";
        }
        $res=M("mation")->where("category='性格测试' and title='".$fen."' and is_delete=0")->getField('content');
        
        $this->assign('res',$res);
        $this->display();
    }
    
    //这里是微信支付回调处理
    public function notify_pay(){
        $sex=I('get.sex');
        $score=I('get.score');
        echo "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";

        $callback=I('get.callback');

        $this->douyin_api('active_pay', $callback);
        
        $path="http://www.zug365.cn/Mobile/Index/search_jg_res?sex=".$sex."&score=".$score;
        Header("Location: $path");
        //exit();

     }
     
     //这里是微信支付回调处理
    public function notify_pay_zs(){
        $type=I('get.type');
        $score=I('get.score');
        echo "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";

        $callback=I('get.callback');

        $this->douyin_api('active_pay', $callback);
        
        $path="http://www.zug365.cn/Mobile/Index/search_zs_res?type=".$type."&score=".$score;
        Header("Location: $path");
        //exit();

     }
     
     public function search_jg_res()
     {
         $sex=I('get.sex');
        $score=I('get.score');
        if($sex==1)
        {
            $ss="男生";
        }
        if($sex==2){
            $ss="女生";
        }
        if($score>65 && $score<85)
        {
            $fen="65-85";
        }
        else if($score>85 && $score<100)
        {
            $fen="85-100";
        }
        else{
            $fen="50-65";
        }
        $res=M("mation")->where("auth='".$ss."' and title='".$fen."' and is_delete=0")->getField('content');
         $this->assign('res',$res);
         $this->display();
     }
     
     public function search_zs_res()
     {
        $type=I('get.type');
        $score=I('get.score');
        if($score>65 && $score<85)
        {
            $fen="65-85";
        }
        else if($score>85 && $score<100)
        {
            $fen="85-100";
        }
        else{
            $fen="50-65";
        }
        $res=M("mation")->where("category='智商测试' and title='".$fen."' and is_delete=0")->getField('content');
         $this->assign('res',$res);
         $this->display();
     }
     
     
     function createNoncestr($length = 32){
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str ="";
        for ( $i = 0; $i < $length; $i++ ) {
            $str.= substr($chars, mt_rand(0, strlen($chars)-1), 1);
        }
        return $str;
    }
    
    function makeWxPaySign($data, $key){
        ksort($data);
        $preData = array();
        foreach($data as $dk=>$dv){
            if(is_array($dv) && !empty($dv)){
                $preData[] = $dk."=".json_encode($dv);
            }elseif (is_array($dv) && empty($dv)){
                continue;
            }else{
                if($dv!=''){
                    $preData[] = $dk."=".$dv;
                }
            }
        }
        $preData[] = "key=".$key;
        $preStr = implode('&',$preData);
        return strtoupper(md5($preStr));
    }
    
    function arrayToXml($arr) {
        $xml = "<xml>";
        foreach ($arr as $key=>$val){
            if (is_numeric($val)){
                $xml.="<".$key.">".$val."</".$key.">";
            }else{
                $xml.="<".$key."><![CDATA[".$val."]]></".$key.">";
            }
        }
        $xml.="</xml>";
        return $xml;
    }
    
    function xmlToArray($xml) {
        $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $array_data;
    }

     
    public static function post($url, $keysArr, $flag = 0){
        $ch = curl_init();
        if(! $flag) curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $keysArr);
        curl_setopt($ch, CURLOPT_URL, $url);
        $ret = curl_exec($ch);
        curl_close($ch);
        return $ret;
    }
    
    public function payOrder(){
        $openid=I('post.openid');
        $pay_money=I('post.money');
        $sex=I('post.sex');
        $score=I('post.score');
        
        $nonceStr = $this->createNoncestr();
        $signType = 'MD5';
        $paymoney =$pay_money*100;//这是需要支付的金额

        $callback = session('clickid');
      
        $data = array(
            'appid' => 'wxd0db865bdf829c3a',
            'mch_id' => '1626459149',
            'nonce_str' => $nonceStr,
            'sign_type' => $signType,
            'body' => '支付',
            'attach' => "orderPay-支付",
            'out_trade_no' => time(),
            'total_fee' => $paymoney,
            'spbill_create_ip' => '127.0.0.1',
            'notify_url' => 'http://www.zug365.cn/mobile/Index/notify_pay/money/'.$pay_money."/sex/".$sex."/score/".$score."/callback/".$callback,
            'trade_type' => 'JSAPI',
            'openid' => $openid
        );
        $paySign = $this->makeWxPaySign($data, 'kjag293sakgsa089346a932jas6kja93');
        $data['sign'] = $paySign;
        //$wxRes = $this->xmlToArray('https://api.mch.weixin.qq.com/pay/unifiedorder',$this->arrayToXml($data));
        $wxRes = $this->xmlToArray($this->post('https://api.mch.weixin.qq.com/pay/unifiedorder',$this->arrayToXml($data)));
        $wxSign = $wxRes['sign'];
        unset($wxRes['sign']);
        $mySign = $this->makeWxPaySign($wxRes, 'kjag293sakgsa089346a932jas6kja93');
        
            
            $params = [
                'appId' => 'wxd0db865bdf829c3a',
                'timeStamp' => strval(time()),
                'nonceStr' => uniqid(),
                'package' => "prepay_id=".$wxRes['prepay_id'],
                'signType' => 'MD5',
            ];
            $params['paySign'] = $this->makeWxPaySign($params, 'kjag293sakgsa089346a932jas6kja93');
            exit(json_encode($params));

    }
    
    public function payOrder_zs(){
        $openid=I('post.openid');
        $pay_money=I('post.money');
        $type=I('post.type');
        $score=I('post.score');
        
        $nonceStr = $this->createNoncestr();
        $signType = 'MD5';
        $paymoney =$pay_money*100;//这是需要支付的金额

        $callback = session('clickid');
      
        $data = array(
            'appid' => 'wxd0db865bdf829c3a',
            'mch_id' => '1626459149',
            'nonce_str' => $nonceStr,
            'sign_type' => $signType,
            'body' => '支付',
            'attach' => "orderPay-支付",
            'out_trade_no' => time(),
            'total_fee' => 1,
            'spbill_create_ip' => '127.0.0.1',
            'notify_url' => 'http://www.zug365.cn/Mobile/Index/notify_pay_zs/money/'.$pay_money."/type/".$type."/score/".$score."/callback/".$callback,
            'trade_type' => 'JSAPI',
            'openid' => $openid
        );
        $paySign = $this->makeWxPaySign($data, 'kjag293sakgsa089346a932jas6kja93');
        $data['sign'] = $paySign;
        //$wxRes = $this->xmlToArray('https://api.mch.weixin.qq.com/pay/unifiedorder',$this->arrayToXml($data));
        $wxRes = $this->xmlToArray($this->post('https://api.mch.weixin.qq.com/pay/unifiedorder',$this->arrayToXml($data)));
        $wxSign = $wxRes['sign'];
        unset($wxRes['sign']);
        $mySign = $this->makeWxPaySign($wxRes, 'kjag293sakgsa089346a932jas6kja93');
        
            
            $params = [
                'appId' => 'wxd0db865bdf829c3a',
                'timeStamp' => strval(time()),
                'nonceStr' => uniqid(),
                'package' => "prepay_id=".$wxRes['prepay_id'],
                'signType' => 'MD5',
            ];
            $params['paySign'] = $this->makeWxPaySign($params, 'kjag293sakgsa089346a932jas6kja93');
            exit(json_encode($params));

    }
    
 
    
     
    //这里是H5支付回调处理
    public function notify_h5pay(){
        $category=I('get.category');
        $sex=I('get.sex');
        $score=I('get.score');
        $callback=I('get.callback');

        $this->douyin_api('active_pay', $callback);
        
        if($category==1)
        {
            $path="http://www.zug365.cn/Mobile/Index/search_jg_res?sex/".$sex."/score/".$score;
            Header("Location: $path");
        }
        else if($category==2)
        {
            $path="http://www.zug365.cn/Mobile/Index/search_xg_res/type/1/score/".$score;
            Header("Location: $path");
        }
        else{
            $path="http://www.zug365.cn/Mobile/Index/search_zs_res/type/1/score/".$score;
            Header("Location: $path");
        }
        echo "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
        

     }
    
    public function h5_payOrder(){
        $category=I('post.category');//这是获取测试题目类型 1:情感测试  2:性格测试 3:智商测试
        $pay_money=I('post.money');
        $sex=I('post.sex');
        $score=I('post.score');
        $page=I('post.page');
        
        $nonceStr = $this->createNoncestr();
        $signType = 'MD5';
        $paymoney =$pay_money*100;//这是需要支付的金额
        $out_trade_no=time();

        $callback = session('clickid');
       
         if($category==1)
         {
           //$path="&redirect_url=http://www.zug365.cn/Mobile/Index/search_jg_res/sex/".$sex."/score/".$score;
          $path="&redirect_url=https://www.zug365.cn/Mobile/Index/question/sex/".$sex."/page/".$page."/score/".$score."/out_trade_no/".$out_trade_no."/category/1/callback/".$callback;
         }
         if($category==2)
         {
           //$path="&redirect_url=http://www.zug365.cn/Mobile/Index/search_xg_res/type/1/score/".$score;
          $path="&redirect_url=http://www.zug365.cn/Mobile/Index/question_xgcs/type/1/page/".$page."/score/".$score."/out_trade_no/".$out_trade_no."/category/2/callback/".$callback;
         }
         if($category==3)
         {
           //$path="&redirect_url=http://www.zug365.cn/Mobile/Index/search_zs_res/type/1/score/".$score;
          $path="&redirect_url=http://www.zug365.cn/Mobile/Index/question_zscs/type/1/page/".$page."/score/".$score."/out_trade_no/".$out_trade_no."/category/3/callback/".$callback;
         }
        
      
        $data = array(
            'appid' => 'wxd0db865bdf829c3a',
            'mch_id' => '1626459149',
            'nonce_str' => $nonceStr,
            'sign_type' => $signType,
            'body' => '坤芝林商务服务',
            'out_trade_no' => $out_trade_no,
            'total_fee' => $paymoney,
            'spbill_create_ip' => '39.103.186.14',
            'notify_url' => "http://www.zug365.cn/Mobile/Index/notify_h5pay/category/".$category."/score/".$score."/sex/".$sex."/callback/".$callback,
            'trade_type' => 'MWEB',
            'scene_info' => '{"h5_info": {"type":"Wap","wap_url": "http://www.zug365.cn","wap_name": "支付获取测试答案"}}'
        );
        $paySign = $this->makeWxPaySign($data, 'kjag293sakgsa089346a932jas6kja93');
        $data['sign'] = $paySign;
        $wxRes = $this->xmlToArray($this->post('https://api.mch.weixin.qq.com/pay/unifiedorder',$this->arrayToXml($data)));
        
        $pay_url=$wxRes['mweb_url'].$path;
        
        /*
        $get_path="&redirect_url=http://www.zug365.cn/mobile/Index/get_pay_status/out_trade_no/".$out_trade_no."/category/".$category."/sex/".$sex."/score/".$score;
        $pay_url=$wxRes['mweb_url'].$get_path;
        */
        
        exit($pay_url);
        

    }
    
    //获取支付状态
    public function get_pay_status()
    {
        $nonceStr = $this->createNoncestr();
        $out_trade_no=I('post.trade');
        $category=I('post.category');
        $sex=I('post.sex');
        $score=I('post.score');
      
        $data = array(
            'appid' => 'wxd0db865bdf829c3a',
            'mch_id' => '1626459149',
            'out_trade_no' => $out_trade_no,
            'nonce_str' => $nonceStr
        );
        $paySign = $this->makeWxPaySign($data, 'kjag293sakgsa089346a932jas6kja93');
        $data['sign'] = $paySign;
        $wxRes = $this->xmlToArray($this->post('https://api.mch.weixin.qq.com/pay/orderquery',$this->arrayToXml($data)));
        
        $pay_status=$wxRes['trade_state'];
        exit($pay_status);
    }
    
    //抖音API回传
    public function douyin_api($event_type, $callback = '')
    {
        $data = [
            'event_type' => $event_type,
            'context' => [
                'ad' => [
                    'callback' => $callback
                ]
            ],
            'timestamp' => time()
        ];
        $wxRes =$this->curl_post('https://analytics.oceanengine.com/api/v2/conversion',json_encode($data));

        if ($wxRes['code'] != 0) {
            Log::write($wxRes['message']);
        }

        return $wxRes;
    }

    public function curl_post($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //不验证证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); //不验证证书
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Content-Length: ' . strlen($data)));
        $res = curl_exec($ch);
        curl_close($ch);
        return json_decode($res, true);
    }
}