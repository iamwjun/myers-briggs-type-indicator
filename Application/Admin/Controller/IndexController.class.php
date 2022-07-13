<?php
namespace Admin\Controller;

/**
 * 后台首页
 *
 * @author Administrator
 *        
 */
class IndexController extends CommController {

	/**
	 * 首页显示
	 */
	public function index() {
		// 获取菜单
		$menuList = D ( 'UserGroup' )->menuList ( $this->user ['authString'] );
		$this->assign ( 'menuList', $menuList );
		// 基本配置
		$this->assign ( 'config', D ( 'Config' )->getOne ( 1 ) );
		
		// 渲染视图
		$this->display ();
	}

	/**
	 * 我的桌面
	 */
	public function welcome() {
		ob_start ();
		$valInt = (false == empty ( $_POST ['pInt'] )) ? $_POST ['pInt'] : "未测试";
		$valFloat = (false == empty ( $_POST ['pFloat'] )) ? $_POST ['pFloat'] : "未测试";
		$valIo = (false == empty ( $_POST ['pIo'] )) ? $_POST ['pIo'] : "未测试";
		$mysqlReShow = "none";
		$mailReShow = "none";
		$funReShow = "none";
		$opReShow = "none";
		$sysReShow = "none";
		
		define ( "YES", "<span class='resYes'>YES</span>" );
		define ( "NO", "<span class='resNo'>NO</span>" );
		define ( "ICON", "<span class='icon'>2</span>&nbsp;" );
		
		$phpSelf = null;
		if (array_key_exists ( 'PHP_SELF', $_SERVER )) {
			$phpSelf = $_SERVER ['PHP_SELF'];
		} else {
			$phpSelf = $_SERVER ['SCRIPT_NAME'];
		}
		
		define ( "PHPSELF", preg_replace ( '/(.{0,}?\/+)/', "", $phpSelf ) );
		
		
		// 系统参数
		switch (PHP_OS) {
			case "Linux" :
				$sysReShow = (false !== ($sysInfo = $this->sys_linux ())) ? "show" : "none";
				break;
			case "FreeBSD" :
				$sysReShow = (false !== ($sysInfo = $this->sys_freebsd ())) ? "show" : "none";
				break;
			default :
				break;
		}
		$os = explode ( " ", php_uname () );
		
		$server = array();
		
		// 服务器特征
		$server['time'] = time(); // 服务器时间
		$server['host_ip'] = $_SERVER ['SERVER_NAME'].'('.@gethostbyname ( $_SERVER ['SERVER_NAME'] ).')'; // 服务器域名/IP地址
		$server['system'] = $os [0].'&nbsp;内核版本：'.$os [2]; // 操作系统
		$server['host_name'] = $os [1]; // 主机名称
		$server['server_software'] = $_SERVER ['SERVER_SOFTWARE']; // 服务器解译引擎
		$server['server_port'] = $_SERVER ['SERVER_PORT']; // Web服务端口
		$server['server_admin'] = $_SERVER ['SERVER_ADMIN']; // 服务器管理员
		$server['mysql_version'] = $this->mysql_version(); // mysql版本
		
		// PHP基本特征
		$server['php_sapi_name'] = strtoupper ( php_sapi_name () ); // php运行方式
		$server['php_version'] = PHP_VERSION; // php版本
		$server['safe'] = $this->getcon ( 'safe_mode' ); // 运行于安全模式
		$server['zend'] = (get_cfg_var ( 'zend_optimizer.optimization_level' ) || get_cfg_var ( "zend_extension_manager.optimizer_ts" ) || get_cfg_var ( "zend_extension_ts" )) ? 'YES' : 'NO';// 支持ZEND编译运行
		$server['display_errors'] = $this->getcon ( 'display_errors' ); // 显示错误信息 display_errors
		$server['register_globals'] = $this->getcon( 'register_globals' ); // 自动定义全局变量 register_globals
		$server['memory_limit'] = $this->getcon( 'memory_limit' ); // 程序最多允许使用内存量 memory_limit
		$server['upload_max_filesize'] = $this->getcon( 'upload_max_filesize' ); // 允许最大上传文件 upload_max_filesize
		$server['max_execution_time'] = $this->getcon( 'max_execution_time' ); // 程序最长运行时间 max_execution_time
		$server['magic_quotes_gpc'] = (1 === get_magic_quotes_gpc ()) ? 'YES' : 'NO'; // magic_quotes_gpc
		$server['magic_quotes_runtime'] = (1 === get_magic_quotes_runtime ()) ? 'YES' : 'NO'; // magic_quotes_runtime
		$server['disable_functions'] = ("" == ($disFuns = get_cfg_var ( "disable_functions" ))) ? "无" : str_replace ( ",", "<br />", $disFuns ); // 被禁用的函数 disable_functions
		
		// 组件支持状况
		$server['aspell_library'] = $this->isfun ( "aspell_check_raw" ); // 拼写检查 ASpell Library
		$server['bcmath'] = $this->isfun ( "bcadd" ); // 高精度数学运算 BCMath
		$server['calendar'] = $this->isfun ( "cal_days_in_month" ); // 历法运算 Calendar
		$server['dba'] = $this->isfun ( "dba_close" ); // DBA数据库
		$server['dbase'] = $this->isfun ( "dbase_close" ); // dBase数据库
		$server['dbm'] = $this->isfun ( "dbmclose" ); // DBM数据库
		$server['fdf'] = $this->isfun ( "fdf_get_ap" ); // FDF表单资料格式
		$server['filepro'] = $this->isfun ( "filepro_fieldcount" ); // FilePro数据库
		$server['hyperwave'] = $this->isfun ( "hw_close" ); // Hyperwave数据库
		$server['gd_library'] = $this->isfun ( "gd_info" ); // 图形处理 GD Library
		$server['imap'] = $this->isfun ( "imap_close" ); // IMAP电子邮件系统
		$server['informix'] = $this->isfun ( "ifx_close" ); // Informix数据库
		$server['ldap'] = $this->isfun ( "ldap_close" ); // LDAP目录协议
		$server['mcrypt'] = $this->isfun ( "mcrypt_cbc" ); // MCrypt加密处理
		$server['mhash'] = $this->isfun ( "mhash_count" ); // 哈稀计算 MHash
		$server['msql'] = $this->isfun ( "msql_close" ); // mSQL数据库
		$server['sql_server'] = $this->isfun ( "mssql_close" ); // SQL Server数据库
		$server['mysql'] = $this->isfun ( "mysql_close" ); // MySQL数据库
		$server['sybase'] = $this->isfun ( "sybase_close" ); // SyBase数据库
		$server['yellow_page'] = $this->isfun ( "yp_match" ); // Yellow Page系统
		$server['oracle'] = $this->isfun ( "ora_close" ); // Oracle数据库
		$server['oracle8'] = $this->isfun ( "OCILogOff" ); // Oracle 8 数据库
		$server['prel_pcer'] = $this->isfun ( "preg_match" ); // PREL相容语法 PCRE
		$server['pdf'] = $this->isfun ( "pdf_close" ); // PDF文档支持
		$server['postgre_sql'] = $this->isfun ( "pg_close" ); // Postgre SQL数据库
		$server['snmp'] = $this->isfun ( "snmpget" ); // SNMP网络管理协议
		$server['vmailmgr'] = $this->isfun ( "vm_adduser" ); // VMailMgr邮件处理
		$server['wddx'] = $this->isfun ( "wddx_add_vars" ); // WDDX支持
		$server['zlib'] = $this->isfun ( "gzclose" ); // 压缩文件支持(Zlib)
		$server['xml'] = $this->isfun ( "xml_set_object" ); // XML解析
		$server['ftp'] = $this->isfun ( "ftp_login" ); // FTP
		$server['odbc'] = $this->isfun ( "odbc_close" ); // ODBC数据库连接
		$server['session'] = $this->isfun ( "session_start" ); // Session支持
		$server['socket'] = $this->isfun ( "fsockopen" ); // Socket支持
		
		$this->assign( 'server', $server );
		// 渲染视图
		$this->display ();
	}
	
	/**
	 * 获取mysql版本
	 */
	private function mysql_version(){
		$Model = M();
		$version = $Model->query("select version() as ver");
		return $version[0]['ver'];
	}
	
	/**
	 * 系统参数探测 LINUX
	 * 
	 * @return boolean|string
	 */
	private function sys_linux() {
		// CPU
		if (false === ($str = @file ( "/proc/cpuinfo" )))
			return false;
		$str = implode ( "", $str );
		@preg_match_all ( '/model\s+name\s{0,}\:+\s{0,}([\w\s\)\(.]+)[\r\n]+/', $str, $model );
		@preg_match_all ( '/cache\s+size\s{0,}\:+\s{0,}([\d\.]+\s{0,}[A-Z]+[\r\n]+)/', $str, $cache );
		if (false !== is_array ( $model [1] )) {
			$res ['cpu'] ['num'] = sizeof ( $model [1] );
			for($i = 0; $i < $res ['cpu'] ['num']; $i ++) {
				$res ['cpu'] ['detail'] [] = "类型：" . $model [1] [$i] . " 缓存：" . $cache [1] [$i];
			}
			if (false !== is_array ( $res ['cpu'] ['detail'] ))
				$res ['cpu'] ['detail'] = implode ( "<br />", $res ['cpu'] ['detail'] );
		}
	
		// UPTIME
		if (false === ($str = @file ( "/proc/uptime" )))
			return false;
		$str = explode ( " ", implode ( "", $str ) );
		$str = trim ( $str [0] );
		$min = $str / 60;
		$hours = $min / 60;
		$days = floor ( $hours / 24 );
		$hours = floor ( $hours - ($days * 24) );
		$min = floor ( $min - ($days * 60 * 24) - ($hours * 60) );
		if ($days !== 0)
			$res ['uptime'] = $days . "天";
		if ($hours !== 0)
			$res ['uptime'] .= $hours . "小时";
		$res ['uptime'] .= $min . "分钟";
	
		// MEMORY
		if (false === ($str = @file ( "/proc/meminfo" )))
			return false;
		$str = implode ( "", $str );
		preg_match_all ( '/MemTotal\s{0,}\:+\s{0,}([\d\.]+).+?MemFree\s{0,}\:+\s{0,}([\d\.]+).+?SwapTotal\s{0,}\:+\s{0,}([\d\.]+).+?SwapFree\s{0,}\:+\s{0,}([\d\.]+)/s', $str, $buf );
	
		$res ['memTotal'] = round ( $buf [1] [0] / 1024, 2 );
		$res ['memFree'] = round ( $buf [2] [0] / 1024, 2 );
		$res ['memUsed'] = ($res ['memTotal'] - $res ['memFree']);
		$res ['memPercent'] = (floatval ( $res ['memTotal'] ) != 0) ? round ( $res ['memUsed'] / $res ['memTotal'] * 100, 2 ) : 0;
	
		$res ['swapTotal'] = round ( $buf [3] [0] / 1024, 2 );
		$res ['swapFree'] = round ( $buf [4] [0] / 1024, 2 );
		$res ['swapUsed'] = ($res ['swapTotal'] - $res ['swapFree']);
		$res ['swapPercent'] = (floatval ( $res ['swapTotal'] ) != 0) ? round ( $res ['swapUsed'] / $res ['swapTotal'] * 100, 2 ) : 0;
	
		// LOAD AVG
		if (false === ($str = @file ( "/proc/loadavg" )))
			return false;
		$str = explode ( " ", implode ( "", $str ) );
		$str = array_chunk ( $str, 3 );
		$res ['loadAvg'] = implode ( " ", $str [0] );
	
		return $res;
	}
	
	//系统参数探测 FreeBSD
	private function sys_freebsd() {
		//CPU
		if (false === ($res ['cpu'] ['num'] = $this->get_key ( "hw.ncpu" )))
			return false;
		$res ['cpu'] ['detail'] = $this->get_key ( "hw.model" );
	
		//LOAD AVG
		if (false === ($res ['loadAvg'] = $this->get_key ( "vm.loadavg" )))
			return false;
		$res ['loadAvg'] = str_replace ( "{", "", $res ['loadAvg'] );
		$res ['loadAvg'] = str_replace ( "}", "", $res ['loadAvg'] );
	
		//UPTIME
		if (false === ($buf = $this->get_key ( "kern.boottime" )))
			return false;
		$buf = explode ( ' ', $buf );
		$sys_ticks = time () - intval ( $buf [3] );
		$min = $sys_ticks / 60;
		$hours = $min / 60;
		$days = floor ( $hours / 24 );
		$hours = floor ( $hours - ($days * 24) );
		$min = floor ( $min - ($days * 60 * 24) - ($hours * 60) );
		if ($days !== 0)
			$res ['uptime'] = $days . "天";
		if ($hours !== 0)
			$res ['uptime'] .= $hours . "小时";
		$res ['uptime'] .= $min . "分钟";
	
		//MEMORY
		if (false === ($buf = $this->get_key ( "hw.physmem" )))
			return false;
		$res ['memTotal'] = round ( $buf / 1024 / 1024, 2 );
		$buf = explode ( "\n", $this->do_command ( "vmstat", "" ) );
		$buf = explode ( " ", trim ( $buf [2] ) );
	
		$res ['memFree'] = round ( $buf [5] / 1024, 2 );
		$res ['memUsed'] = ($res ['memTotal'] - $res ['memFree']);
		$res ['memPercent'] = (floatval ( $res ['memTotal'] ) != 0) ? round ( $res ['memUsed'] / $res ['memTotal'] * 100, 2 ) : 0;
	
		$buf = explode ( "\n", $this->do_command ( "swapinfo", "-k" ) );
		$buf = $buf [1];
		preg_match_all ( '/([0-9]+)\s+([0-9]+)\s+([0-9]+)/', $buf, $bufArr );
		$res ['swapTotal'] = round ( $bufArr [1] [0] / 1024, 2 );
		$res ['swapUsed'] = round ( $bufArr [2] [0] / 1024, 2 );
		$res ['swapFree'] = round ( $bufArr [3] [0] / 1024, 2 );
		$res ['swapPercent'] = (floatval ( $res ['swapTotal'] ) != 0) ? round ( $res ['swapUsed'] / $res ['swapTotal'] * 100, 2 ) : 0;
	
		return $res;
	}
	
	/**
	 * 取得参数值 FreeBSD
	 * 
	 * @param unknown $keyName
	 */
	private function get_key($keyName) {
		return $this->do_command ( 'sysctl', "-n $keyName" );
	}
	
	/**
	 * 确定执行文件位置 FreeBSD
	 * 
	 * @param unknown $commandName
	 * @return string|boolean
	 */
	private function find_command($commandName) {
		$path = array ('/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin' );
		foreach ( $path as $p ) {
			if (@is_executable ( "$p/$commandName" ))
				return "$p/$commandName";
		}
		return false;
	}
	
	/**
	 * 执行系统命令 FreeBSD
	 * 
	 * @param unknown $commandName
	 * @param unknown $args
	 * @return boolean|string
	 */
	private function do_command($commandName, $args) {
		$buffer = "";
		if (false === ($command = $this->find_command ( $commandName )))
			return false;
		if (($fp = @popen ( "$command $args", 'r' ))==true) {
			while ( ! @feof ( $fp ) ) {
				$buffer .= @fgets ( $fp, 4096 );
			}
			return trim ( $buffer );
		}
		return false;
	}
	
	/**
	 * 检测PHP设置参数
	 * 
	 * @param unknown $varName
	 * @return string
	 */
	private function getcon($varName) {
		switch ($res = get_cfg_var ( $varName )) {
			case 0 :
				return 'NO';
				break;
			case 1 :
				return 'YES';
				break;
			default :
				return $res;
				break;
		}
	}
	
	/**
	 * 检测函数支持
	 * 
	 * @param unknown $funName
	 * @return string
	 */
	private function isfun($funName){
		return (false !== function_exists($funName))?'YES':'NO';
	}
	
	/**
	 * 数据IO能力测试
	 * 
	 * @return string
	 */
	private function test_io() {
		$fp = fopen ( PHPSELF, "r" );
		$timeStart = gettimeofday ();
		for($i = 0; $i < 10000; $i ++) {
			fread ( $fp, 10240 );
			rewind ( $fp );
		}
		$timeEnd = gettimeofday ();
		fclose ( $fp );
		$time = ($timeEnd ["usec"] - $timeStart ["usec"]) / 1000000 + $timeEnd ["sec"] - $timeStart ["sec"];
		$time = round ( $time, 3 ) . "秒";
		return ($time);
	}
	
	/**
	 * 比例条
	 * 
	 * @param unknown $percent
	 */
	private function bar($percent) {
		echo '<ul class=\"bar\">';
		echo "<li style=\"width:$percent%\">&nbsp;</li>";
		echo '</ul>';
	}
}