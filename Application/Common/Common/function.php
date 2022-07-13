<?php

/**
 * +-------------------------------------------------
 * + 检测验证码
 * +-------------------------------------------------
 * + @param string $code 验证码
 * + @param number $id 验证码标识
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function checkVerify($code, $id = 1) {
	$verify = new \Think\Verify ();
	$verify->reset = false;
	return $verify->check ( $code, $id );
}

/**
 * +-------------------------------------------------
 * + 分析返回用户操作系统名称
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function getSystem() {
	$sys = $_SERVER ['HTTP_USER_AGENT'];
	if (stripos ( $sys, "NT 10.0" )) {
		$os = "Windows 10";
	} elseif (stripos ( $sys, "NT 6.1" )) {
		$os = "Windows 7";
	} elseif (stripos ( $sys, "NT 6.0" )) {
		$os = "Windows Vista";
	} elseif (stripos ( $sys, "NT 5.1" )) {
		$os = "Windows XP";
	} elseif (stripos ( $sys, "NT 5.2" )) {
		$os = "Windows Server 2003";
	} elseif (stripos ( $sys, "NT 5" )) {
		$os = "Windows 2000";
	} elseif (stripos ( $sys, "NT 4.9" )) {
		$os = "Windows ME";
	} elseif (stripos ( $sys, "NT 4" )) {
		$os = "Windows NT 4.0";
	} elseif (stripos ( $sys, "98" )) {
		$os = "Windows 98";
	} elseif (stripos ( $sys, "95" )) {
		$os = "Windows 95";
	} elseif (stripos ( $sys, "Mac" )) {
		$os = "Mac";
	} elseif (stripos ( $sys, "Linux" )) {
		$os = "Linux";
	} elseif (stripos ( $sys, "Unix" )) {
		$os = "Unix";
	} elseif (stripos ( $sys, "FreeBSD" )) {
		$os = "FreeBSD";
	} elseif (stripos ( $sys, "SunOS" )) {
		$os = "SunOS";
	} elseif (stripos ( $sys, "BeOS" )) {
		$os = "BeOS";
	} elseif (stripos ( $sys, "OS/2" )) {
		$os = "OS/2";
	} elseif (stripos ( $sys, "PC" )) {
		$os = "Macintosh";
	} elseif (stripos ( $sys, "AIX" )) {
		$os = "AIX";
	} else {
		$os = "未知操作系统";
	}
	return $os;
}

/**
 * +-------------------------------------------------
 * + 分析返回用户网页浏览器名称
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function getBrowser() {
	global $_SERVER;
	$agent = $_SERVER ['HTTP_USER_AGENT'];
	$browser = '';
	$browser_ver = '';
	if (preg_match ( '/OmniWeb\/(v*)([^\s|;]+)/i', $agent, $regs )) {
		$browser = 'OmniWeb';
		$browser_ver = $regs [2];
	}
	if (preg_match ( '/Netscape([\d]*)\/([^\s]+)/i', $agent, $regs )) {
		$browser = 'Netscape';
		$browser_ver = $regs [2];
	}
	if (preg_match ( '/safari\/([^\s]+)/i', $agent, $regs )) {
		$browser = 'Safari';
		$browser_ver = $regs [1];
	}
	if (preg_match ( '/MSIE\s([^\s|;]+)/i', $agent, $regs )) {
		$browser = 'Internet Explorer';
		$browser_ver = $regs [1];
	}
	if (preg_match ( '/Opera[\s|\/]([^\s]+)/i', $agent, $regs )) {
		$browser = 'Opera';
		$browser_ver = $regs [1];
	}
	if (preg_match ( '/NetCaptor\s([^\s|;]+)/i', $agent, $regs )) {
		$browser = '(Internet Explorer ' . $browser_ver . ') NetCaptor';
		$browser_ver = $regs [1];
	}
	if (preg_match ( '/Maxthon/i', $agent, $regs )) {
		$browser = '(Internet Explorer ' . $browser_ver . ') Maxthon';
		$browser_ver = '';
	}
	if (preg_match ( '/FireFox\/([^\s]+)/i', $agent, $regs )) {
		$browser = 'FireFox';
		$browser_ver = $regs [1];
	}
	if (preg_match ( '/Lynx\/([^\s]+)/i', $agent, $regs )) {
		$browser = 'Lynx';
		$browser_ver = $regs [1];
	}
	if ($browser != '') {
		return $browser . ' ' . $browser_ver;
	} else {
		return 'Unknow browser';
	}
}

/**
 * +-------------------------------------------------
 * + 生成短信验证码
 * +-------------------------------------------------
 * + @param number $length 短信长度
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function createSMSCode($length = 6, $codeSet = "2345678abcdefhijkmnpqrstuvwxyz") {
	$code = createRandomCode ( $length, $codeSet );
	$tempArray ['code'] = sha1 ( $code );
	$tempArray ['end_time'] = time () + 60 * 30; // 半个小时过期
	session ( 'codeSMS', $tempArray );
	return $code;
}

/**
 * +-------------------------------------------------
 * + 验证是否为数字
 * +-------------------------------------------------
 * + @param number $number 数字
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function is_number($number) {
	return empty ( $number ) || ! is_numeric ( $number );
}

/**
 * +-------------------------------------------------
 * + 创建多位随机码
 * +-------------------------------------------------
 * + @param number $length 长度		默认为6位
 * + @param string $codeSet 数据源		默认为(0123456789)
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function createRandomCode($length = 6, $codeSet = "0123456789") {
	$code = "";
	for($i = 0; $i < $length; $i ++) {
		$code .= $codeSet [mt_rand ( 0, strlen ( $codeSet ) - 1 )];
	}
	return $code;
}

/**
 * +-------------------------------------------------
 * + 云通讯短信接口
 * +-------------------------------------------------
 * + @param string $phone 手机号码
 * + @param array $data $data[0]短信验证码 | data[1]时间限制
 * + @param int $tempId 短信模版编号
 * +-------------------------------------------------
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function YunTongXun_Send_Template_SMS( $phone, $data, $tempId ) {
	// 主帐号,对应开官网发者主账号下的 ACCOUNT SID
	$accountSid= '8a48b5514f2b46d0014f398b4ae41236';

	// 主帐号令牌,对应官网开发者主账号下的 AUTH TOKEN
	$accountToken= '6a453170855d4a58b8a00d78bb1c0958';

	// 应用Id，在官网应用列表中点击应用，对应应用详情中的APP ID
	//在开发调试的时候，可以使用官网自动为您分配的测试Demo的APP ID
	$appId='aaf98f894f4fbec2014f6d49041e1437';

	//请求地址
	//沙盒环境（用于应用开发调试）：sandboxapp.cloopen.com
	//生产环境（用户应用上线使用）：app.cloopen.com
	$serverIP='sandboxapp.cloopen.com';


	//请求端口，生产环境和沙盒环境一致
	$serverPort='8883';

	//REST版本号，在官网文档REST介绍中获得。
	$softVersion='2013-12-26';

	// 加载短信发送类
	vendor( "YunTongXunSMS.CCPRestSmsSDK" );

	// 实例化
	$rest = new REST( $serverIP, $serverPort, $softVersion );
	$rest->setAccount( $accountSid, $accountToken );
	$rest->setAppId( $appId );

	// 发送模板短信
	$result = $rest->sendTemplateSMS( $phone, $data, $tempId );
	if( $result == NULL ) {
		return false;
	}
	if ( $result->statusCode != 0 ) {
		return false;
	} else {
		return true;
	}
}

/**
 * +-------------------------------------------------
 * + 加密解密字符串(encrypt)
 * +-------------------------------------------------
 * + @param string $string 需要加密解密的字符串
 * + @param string $operation 判断是加密还是解密:E:加密 D:解密
 * + @param string $key 加密的钥匙(密匙)
 * +-------------------------------------------------
 * + 使用方法：
 * + 加密 :encrypt( $string, 'E' , 'nowamagic' );
 * + 解密 :encrypt( $string, 'D', 'nowamagic' );
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function encrypt($string, $operation, $key = '') {
	$key = md5 ( $key );
	$key_length = strlen ( $key );
	$string = $operation == 'D' ? base64_decode ( $string ) : substr ( md5 ( $string . $key ), 0, 8 ) . $string;
	$string_length = strlen ( $string );
	$rndkey = $box = array ();
	$result = '';
	for($i = 0; $i <= 255; $i ++) {
		$rndkey [$i] = ord ( $key [$i % $key_length] );
		$box [$i] = $i;
	}
	for($j = $i = 0; $i < 256; $i ++) {
		$j = ($j + $box [$i] + $rndkey [$i]) % 256;
		$tmp = $box [$i];
		$box [$i] = $box [$j];
		$box [$j] = $tmp;
	}
	for($a = $j = $i = 0; $i < $string_length; $i ++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box [$a]) % 256;
		$tmp = $box [$a];
		$box [$a] = $box [$j];
		$box [$j] = $tmp;
		$result .= chr ( ord ( $string [$i] ) ^ ($box [($box [$a] + $box [$j]) % 256]) );
	}
	if ($operation == 'D') {
		if (substr ( $result, 0, 8 ) == substr ( md5 ( substr ( $result, 8 ) . $key ), 0, 8 )) {
			return substr ( $result, 8 );
		} else {
			return '';
		}
	} else {
		return str_replace ( '=', '', base64_encode ( $result ) );
	}
}

/**
 * +-------------------------------------------------
 * + 返回信息提示
 * +-------------------------------------------------
 * + @param array $array status状态 info提示信息
 * +-------------------------------------------------
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function returnMsg($array = array()) {
	$default ['status'] = 0;
	$default ['info'] = '非法操作';
	$default ['url'] = '';
	return array_merge ( $default, $array );
}

/**
 * +-------------------------------------------------
 * + 检测短信验证码
 * +-------------------------------------------------
 * + @param string $code 验证码
 * + @param string $phone 电话号码
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function checkSMSCode($code, $phone) {
	// smsInfo[code验证码 effective_time有效时间 create_time创建时间 phone电话号码]
	$smsInfo = session ( 'smsInfo' );
	if (empty ( $smsInfo )) {
		return false;
	} else {
		// 判断电话号码是否相等
		if ($smsInfo ['phone'] != $phone) {return false;}
		// 判断值是否相等
		if ($smsInfo ['code'] != $code) {return false;}
		// 判断是否过期
		$the_time = (time () - $smsInfo ['create_time']) / 60;
		if ($the_time > $smsInfo ['effective_time']) {return false;}
		return true;
	}
}

/**
 * +-------------------------------------------------
 * + 截取字符串长度
 * +-------------------------------------------------
 * + @param string $sourcestr 要被截取的字符串
 * + @param int $cutlength 截取的长度
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function cutStr($sourcestr, $cutlength) {
	$returnstr = "";
	$i = 0;
	$n = 0;
	$str_length = strlen ( $sourcestr );
	// 字符串的字节数
	while ( ($n < $cutlength) and ($i <= $str_length) ) {
		$temp_str = substr ( $sourcestr, $i, 1 );
		$ascnum = Ord ( $temp_str );
		// 得到字符串中第$i位字符的ascii码
		// 如果ASCII位高与224，
		if ($ascnum >= 224) {
			$returnstr .= substr ( $sourcestr, $i, 3 );
			// 根据UTF-8编码规范，将3个连续的字符计为单个字符
			$i = $i + 3;
			// 实际Byte计为3
			$n ++; // 字串长度计1
				       // 如果ASCII位高与192，
		} elseif ($ascnum >= 192) {
			$returnstr = $returnstr . substr ( $sourcestr, $i, 2 );
			// 根据UTF-8编码规范，将2个连续的字符计为单个字符
			$i = $i + 2;
			// 实际Byte计为2
			$n ++; // 字串长度计1
				       // 如果是大写字母，
		} elseif ($ascnum >= 65 && $ascnum <= 90) {
			$returnstr = $returnstr . substr ( $sourcestr, $i, 1 );
			$i = $i + 1;
			// 实际的Byte数仍计1个
			$n ++; // 但考虑整体美观，大写字母计成一个高位字符
		} else { // 其他情况下，包括小写字母和半角标点符号，
			$returnstr = $returnstr . substr ( $sourcestr, $i, 1 );
			$i = $i + 1;
			// 实际的Byte数计1个
			$n = $n + 0.5; // 小写字母和半角标点等与半个高位字符宽…
		}
	}
	if ($str_length > $i) {
		$returnstr .= "...";
		// 超过长度时在尾处加上省略号
	}
	return $returnstr;
}

/**
 * +-------------------------------------------------
 * + 去除HTML JS CSS
 * +-------------------------------------------------
 * + @param string $string 需要处理的字符串
 * +-------------------------------------------------
 * + @return string 纯文本字符串
 * +-------------------------------------------------
 */
function replaceHtml($string) {
	if (empty ( $string )) {return "";}
	$search = array ("'<script[^>]*?>.*?</script>'si","'<style[^>]*?>.*?</style>'si","'<[/!]*?[^<>]*?>'si","'<!--[/!]*?[^<>]*?>'si" );
	$replace = array ("","","","" );
	$string = preg_replace ( $search, $replace, $string );
	return str_replace ( array ("　"," ","\r","\n","&nbsp;" ), "", $string );
}

/**
 * +-------------------------------------------------
 * + 判断是否是微信端
 * +-------------------------------------------------
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function isWeChat() {
	return strpos ( $_SERVER ['HTTP_USER_AGENT'], 'MicroMessenger' ) !== false ? true : false;
}

/**
 * +-------------------------------------------------
 * + 判断是pc端访问还是移动端访问
 * +-------------------------------------------------
 * + @return boolean true|false
 * +-------------------------------------------------
 */
function isPcOrMobile() {
	// 如果有HTTP_X_WAP_PROFILE则一定是移动设备
	if (isset ( $_SERVER ['HTTP_X_WAP_PROFILE'] )) {return true;}
	// 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
	if (isset ( $_SERVER ['HTTP_VIA'] )) {
		// 找不到为flase,否则为true
		if (stristr ( $_SERVER ['HTTP_VIA'], "wap" )) {return true;}
	}
	// 脑残法，判断手机发送的客户端标志,兼容性有待提高
	if (isset ( $_SERVER ['HTTP_USER_AGENT'] )) {
		$clientkeywords = array (
				'nokia',
				'sony',
				'ericsson',
				'mot',
				'samsung',
				'htc',
				'sgh',
				'lg',
				'sharp',
				'sie-',
				'philips',
				'panasonic',
				'alcatel',
				'lenovo',
				'iphone',
				'ipod',
				'blackberry',
				'meizu',
				'android',
				'netfront',
				'symbian',
				'ucweb',
				'windowsce',
				'palm',
				'operamini',
				'operamobi',
				'openwave',
				'nexusone',
				'cldc',
				'midp',
				'wap',
				'mobile',
				'phone' );
		// 从HTTP_USER_AGENT中查找手机浏览器的关键字
		if (preg_match ( "/(" . implode ( '|', $clientkeywords ) . ")/i", strtolower ( $_SERVER ['HTTP_USER_AGENT'] ) )) {return true;}
	}
	// 协议法，因为有可能不准确，放到最后判断
	if (isset ( $_SERVER ['HTTP_ACCEPT'] )) {
		// 如果只支持wml并且不支持html那一定是移动设备
		// 如果支持wml和html但是wml在html之前则是移动设备
		if ((strpos ( $_SERVER ['HTTP_ACCEPT'], 'vnd.wap.wml' ) !== false) && (strpos ( $_SERVER ['HTTP_ACCEPT'], 'text/html' ) === false || (strpos ( $_SERVER ['HTTP_ACCEPT'], 'vnd.wap.wml' ) < strpos ( $_SERVER ['HTTP_ACCEPT'], 'text/html' )))) {return true;}
	}
	return false;
}

/**
 * +-------------------------------------------------
 * + 登陆或注册时，判断在cookie中是否存在商品，如果存在购物车商品，则将商品加进数据库，同时删除cookie
 * +-------------------------------------------------
 * +
 * +-------------------------------------------------
 */
function setCartCookie() {
	$ShopCart = cookie ( 'ShopCart' );
	$cartModel = D ( 'Cart' );
	$session = session ( 'member_auth' );
	$userCartObj = $cartModel->where ( array ('user_id' => $session ['id'] ) )->find ();
	if ($ShopCart != null) {
		if (empty ( $userCartObj )) {
			$theArray ['user_id'] = $session ['id'];
			$theArray ['cart_json'] = $ShopCart;
			$theArray ['create_time'] = time ();
			$cartModel->add ( $theArray );
		} else {
			$theArray = $userCartObj;
			if (empty ( $userCartObj ['cart_json'] )) {
				$theArray ['cart_json'] = $ShopCart;
			} else {
				// 判断数据库购物车是否为空
				if (empty ( $userCartObj ['cart_json'] )) {
					$theArray ['cart_json'] = json_encode ( $ShopCart );
				} else { // 数据库购物车不为空
				         // 当前购物车中的商品
					$ShopCart = json_decode ( $ShopCart, true );
					$cartList = $ShopCart ['cartList'];
					// 数据库存储的购物车中的商品
					$userCartList = json_decode ( $userCartObj ['cart_json'], true );
					$userCartList = $userCartList ['cartList'];
					// 循环去重
					for($i = 0, $size = count ( $userCartList ); $i < $size; $i ++) {
						for($j = 0, $len = count ( $cartList ); $j < $len; $j ++) {
							if ($cartList [$j] ['id'] == $userCartList [$i] ['id']) {
								unset ( $ShopCart ['cartList'] [$j] );
							}
						}
					}
					// 组合数据库和当前购物车中的商品
					if (count ( $ShopCart ['cartList'] ) == 0) {
						$newCartList = $userCartList;
					} else {
						$newCartList = array_merge ( $userCartList, $ShopCart ['cartList'] );
					}
					$newCartObj = array ();
					$newCartObj ['shopNum'] = 0;
					$newCartObj ['totalMoney'] = 0;
					$newCartObj ['cartList'] = $newCartList;
					// 统计商品总个数和商品总价格
					for($i = 0, $size = count ( $newCartList ); $i < $size; $i ++) {
						$newCartObj ['shopNum'] += $newCartList [$i] ['num'];
						$newCartObj ['totalMoney'] += $newCartList [$i] ['num'] * $newCartList [$i] ['price'];
					}
					$theArray ['cart_json'] = json_encode ( $newCartObj );
				}
			}
			cookie ( 'ShopCart', $theArray ['cart_json'] );
			$cartModel->save ( $theArray );
		}
	} else {
		cookie ( 'ShopCart', $userCartObj ['cart_json'] );
	}
}

/**
 * +-------------------------------------------------
 * + 模版引用函数：判断成长值来源
 * + 
 * +-------------------------------------------------
 * + @param number $level
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function tmpl_upgrade( $type = 0 ) {
	switch ( $type ) {
		case 1 :
			return '个人消费';
			break;
		case 2 :
			return '签到';
			break;
	}
}

/**
 * 模版引用函数：递归循环商品分类
 *
 * @param array $dataList
 */
function tmpl_commodity_sort($dataList = array()) {
	for($i = 0, $size = count ( $dataList ); $i < $size; $i ++) {
		$rows = $dataList [$i];
		$parent_id = empty( $rows['pid'] ) ? "" : $rows['pid'];
		$url = U( 'Commodity/clist', array( 'id' => $rows['id'] ) );
		echo "<tr data-tt-id=\"$rows[id]\" data-tt-parent-id=\"$parent_id\"><td>";
		if (count ( $rows ['children'] ) > 0) {
			echo "<span class=\"folder tree_icon_span\"><a href=\"$url\">$rows[title]</a></span>";
		} else {
			echo "<span class=\"file tree_icon_span\"><a href=\"$url\">$rows[title]</a></span>";
		}
		echo "</td></tr>\r" . chr(9) . chr(9) . chr(9) . chr(9) . chr(9);
		if (count ( $rows ['children'] ) > 0) {
			tmpl_commodity_sort ( $rows ['children'] );
		}
	}
}
/**
 * +-------------------------------------------------
 * + 模版引用函数：判断得到会员的级别
 * + 0|vip 1|初级 2|中级 3|高级 4|特级 5|钻石
 * +-------------------------------------------------
 * + @param number $level
 * +-------------------------------------------------
 * + @return string
 * +-------------------------------------------------
 */
function tmpl_memberLevel( $level = 0 ) {
	$category = D('Category')->where(array('pid'=>1))->order('sort desc,create_time desc')->select();
	return $category[$level]['title'];
}


