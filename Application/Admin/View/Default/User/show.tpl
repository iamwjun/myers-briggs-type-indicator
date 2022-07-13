<extend name="Base/common" />

{// css区域}
<block name="link"></block>

{// js区域}
<block name="jscript"></block>

<block name="main">
    <div class="cl pd-20" style=" background-color:#5bacb6">
		<if condition="$userAuth['face'] eq ''">
    		<if condition="$userAuth['sex'] eq 0">
				<img class="avatar size-XL l" src="__IMAGES__/default_male_face.png" alt="管理员头像">
			<else />
				<img class="avatar size-XL l" src="__IMAGES__/default_female_face.png" alt="管理员头像">
			</if>
		<else />
			<img src="__ROOT__/{$userAuth['face']}" class="avatar size-XL l" alt="管理员头像">
		</if>
        <dl style="margin-left:80px; color:#fff">
            <dt>
                <span class="f-18">{$userAuth['nickname']}</span>
                <span class="pl-10 f-12">{$userAuth['authName']}</span>
            </dt>
            <dd class="pt-10 f-12" style="margin-left:0">{$userAuth['intro']}</dd>
        </dl>
    </div>
    <div>
        <table class="table">
            <tbody>
                <tr>
                    <th class="text-r" width="30%">用户名：</th>
                    <td>{$userAuth['username']}</td>
                </tr>
                <tr>
                    <th class="text-r" width="80">性别：</th>
                    <td>{$userAuth['sex']?'女':'男'}</td>
                </tr>
                <tr>
                    <th class="text-r">手机：</th>
                    <td>{$userAuth['phone']}</td>
                </tr>
                <tr>
                    <th class="text-r">邮箱：</th>
                    <td>{$userAuth['email']}</td>
                </tr>
                <tr>
                    <th class="text-r">地址：</th>
                    <td>{$userAuth['address']}</td>
                </tr>
                <tr>
                    <th class="text-r">注册时间：</th>
                    <td>{$userAuth['create_time']|date='Y-m-d H:i:s',###}</td>
                </tr>
                <tr>
                    <th class="text-r">最后登录时间：</th>
                    <td>{$userAuth['last_login_time']|date='Y-m-d H:i:s',###}</td>
                </tr>
                <tr>
                    <th class="text-r">最后登录IP：</th>
                    <td>{$userAuth['last_login_ip']?long2ip($userAuth['last_login_ip']):'暂无'}</td>
                </tr>
            </tbody>
        </table>
    </div>
</block>
