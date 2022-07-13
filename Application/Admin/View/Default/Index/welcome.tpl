<extend name="Base/common" />

<block name="main">
	<div class="pd-20">
		<!--table class="table table-border table-bordered table-bg">
		    <thead>
		        <tr>
		            <th colspan="7" scope="col">信息统计</th>
		        </tr>
		        <tr class="text-c">
		            <th>统计</th>
		            <th>资讯库</th>
		            <th>图片库</th>
		            <th>产品库</th>
		            <th>用户</th>
		            <th>管理员</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr class="text-c">
		            <td>总数</td>
		            <td>92</td>
		            <td>9</td>
		            <td>0</td>
		            <td>8</td>
		            <td>20</td>
		        </tr>
		        <tr class="text-c">
		            <td>今日</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		        </tr>
		        <tr class="text-c">
		            <td>昨日</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		        </tr>
		        <tr class="text-c">
		            <td>本周</td>
		            <td>2</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		        </tr>
		        <tr class="text-c">
		            <td>本月</td>
		            <td>2</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		            <td>0</td>
		        </tr>
		    </tbody>
		</table-->
		
		<!-- 服务器信息 -->
		<table class="table table-border table-bordered table-bg table-hover mt-20">
		    <thead>
		        <tr>
		            <th colspan="2" scope="col">服务器信息</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td width="20%">服务器时间</td>
		            <td width="80%">
		            	北京时间{$server['time']|date='Y年m月d日H时i分s秒',###}
					</td>
		        </tr>
		        <tr>
		            <td>服务器域名/IP地址</td>
		            <td>{$server['host_ip']}</td>
		        </tr>
		        <tr>
		            <td>服务器操作系统</td>
		            <td>{$server['system']}</td>
		        </tr>
		        <tr>
		            <td>主机名称</td>
		            <td>{$server['host_name']}</td>
		        </tr>
		        <tr>
		            <td>服务器解译引擎</td>
		            <td>{$server['server_software']}</td>
		        </tr>
		        <tr>
		            <td>Web服务端口</td>
		            <td>{$server['server_port']}</td>
		        </tr>
		        <tr>
		            <td>服务器管理员</td>
		            <td>{$server['server_admin']}</td>
		        </tr>
		    </tbody>
		</table>
		
		<!-- PHP基本特征 -->
		<table class="table table-border table-bordered table-bg table-hover mt-20">
		    <thead>
		        <tr>
		            <th colspan="2" scope="col">PHP基本特征</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td width="20%">PHP运行方式</td>
		            <td width="80%">{$server['php_sapi_name']}</td>
		        </tr>
		        <tr>
		            <td>PHP版本</td>
		            <td>{$server['php_version']}</td>
		        </tr>
		        <tr>
		            <td>MySql版本</td>
		            <td>{$server['mysql_version']}</td>
		        </tr>
		        <tr>
		            <td>运行于安全模式</td>
		            <td class="{$server['safe']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['safe']}
					</td>
		        </tr>
				<tr>
					<td>支持ZEND编译运行</td>
					<td class="{$server['zend']=='NO'?'fontColorRed':'fontColorGreen'}">
						{$server['zend']}
					</td>
				</tr>
				<tr>
					<td>显示错误信息 display_errors</td>
					<td class="{$server['display_errors']=='NO'?'fontColorRed':'fontColorGreen'}">
						{$server['display_errors']}
					</td>
				</tr>
				<tr>
					<td>自动定义全局变量 register_globals</td>
					<td class="{$server['register_globals']=='NO'?'fontColorRed':'fontColorGreen'}">
						{$server['register_globals']}
					</td>
				</tr>
				<tr>
					<td>程序最多允许使用内存量 memory_limit</td>
					<td>{$server['memory_limit']}</td>
				</tr>
				<tr>
					<td>允许最大上传文件 upload_max_filesize</td>
					<td>{$server['upload_max_filesize']}</td>
				</tr>
				<tr>
					<td>程序最长运行时间 max_execution_time</td>
					<td>{$server['max_execution_time']}</td>
				</tr>
				<tr>
					<td>magic_quotes_gpc</td>
					<td class="{$server['magic_quotes_gpc']=='NO'?'fontColorRed':'fontColorGreen'}">
						{$server['magic_quotes_gpc']}
					</td>
				</tr>
				<tr>
					<td>magic_quotes_runtime</td>
					<td class="{$server['magic_quotes_runtime']=='NO'?'fontColorRed':'fontColorGreen'}">
						{$server['magic_quotes_runtime']}
					</td>
				</tr>
				<tr>
					<td>被禁用的函数 disable_functions</td>
					<td>{$server['disable_functions']}</td>
				</tr>
		    </tbody>
		</table>
		
		<!-- 组件支持状况 -->
		<table class="table table-border table-bordered table-bg table-hover mt-20">
		    <thead>
		        <tr>
		            <th colspan="4" scope="col">组件支持状况</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td width="20%">拼写检查 ASpell Library</td>
		            <td width="30%" class="{$server['aspell_library']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['aspell_library']}
					</td>
		            <td width="20%">高精度数学运算 BCMath</td>
		            <td width="30%" class="{$server['bcmath']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['bcmath']}
					</td>
		        </tr>
		        <tr>
		            <td>历法运算 Calendar</td>
		            <td class="{$server['calendar']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['calendar']}
					</td>
		            <td>DBA数据库</td>
		            <td class="{$server['dba']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['dba']}
					</td>
		        </tr>
		        <tr>
		            <td>dBase数据库</td>
		            <td class="{$server['dbase']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['dbase']}
					</td>
		            <td>DBM数据库</td>
		            <td class="{$server['dbm']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['dbm']}
					</td>
		        </tr>
		        <tr>
		            <td>FDF表单资料格式</td>
		            <td class="{$server['fdf']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['fdf']}
					</td>
		            <td>FilePro数据库</td>
		            <td class="{$server['filepro']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['filepro']}
					</td>
		        </tr>
		        <tr>
		            <td>Hyperwave数据库</td>
		            <td class="{$server['hyperwave']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['hyperwave']}
					</td>
		            <td>图形处理 GD Library</td>
		            <td class="{$server['gd_library']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['gd_library']}
					</td>
		        </tr>
		        <tr>
		            <td>IMAP电子邮件系统</td>
		            <td class="{$server['imap']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['imap']}
					</td>
		            <td>Informix数据库</td>
		            <td class="{$server['informix']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['informix']}
					</td>
		        </tr>
		        <tr>
		            <td>LDAP目录协议</td>
		            <td class="{$server['ldap']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['ldap']}
					</td>
		            <td>MCrypt加密处理</td>
		            <td class="{$server['mcrypt']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['mcrypt']}
					</td>
		        </tr>
		        <tr>
		            <td>哈稀计算 MHash</td>
		            <td class="{$server['mhash']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['mhash']}
					</td>
		            <td>mSQL数据库</td>
		            <td class="{$server['msql']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['msql']}
					</td>
		        </tr>
		        <tr>
		            <td>SQL Server数据库</td>
		            <td class="{$server['sql_server']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['sql_server']}
					</td>
		            <td>MySQL数据库</td>
		            <td class="{$server['mysql']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['mysql']}
					</td>
		        </tr>
		        <tr>
		            <td>SyBase数据库</td>
		            <td class="{$server['sybase']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['sybase']}
					</td>
		            <td>Yellow Page系统</td>
		            <td class="{$server['yellow_page']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['yellow_page']}
					</td>
		        </tr>
		        <tr>
		            <td>Oracle数据库</td>
		            <td class="{$server['oracle']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['oracle']}
					</td>
		            <td>Oracle 8 数据库</td>
		            <td class="{$server['oracle8']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['oracle8']}
					</td>
		        </tr>
		        <tr>
		            <td>PREL相容语法 PCRE</td>
		            <td class="{$server['prel_pcer']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['prel_pcer']}
					</td>
		            <td>PDF文档支持</td>
		            <td class="{$server['pdf']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['pdf']}
					</td>
		        </tr>
		        <tr>
		            <td>Postgre SQL数据库</td>
		            <td class="{$server['postgre_sql']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['postgre_sql']}
					</td>
		            <td>SNMP网络管理协议</td>
		            <td class="{$server['snmp']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['snmp']}
					</td>
		        </tr>
		        <tr>
		            <td>VMailMgr邮件处理</td>
		            <td class="{$server['vmailmgr']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['vmailmgr']}
					</td>
		            <td>WDDX支持</td>
		            <td class="{$server['wddx']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['wddx']}
					</td>
		        </tr>
		        <tr>
		            <td>压缩文件支持(Zlib)</td>
		            <td class="{$server['zlib']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['zlib']}
					</td>
		            <td>XML解析</td>
		            <td class="{$server['xml']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['xml']}
					</td>
		        </tr>
		        <tr>
		            <td>FTP</td>
		            <td class="{$server['ftp']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['ftp']}
					</td>
		            <td>ODBC数据库连接</td>
		            <td class="{$server['odbc']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['odbc']}
					</td>
		        </tr>
		        <tr>
		            <td>Session支持</td>
		            <td class="{$server['session']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['session']}
					</td>
		            <td>Socket支持</td>
		            <td class="{$server['socket']=='NO'?'fontColorRed':'fontColorGreen'}">
		            	{$server['socket']}
					</td>
		        </tr>
			</tbody>
		</table>
	</div>
</block>