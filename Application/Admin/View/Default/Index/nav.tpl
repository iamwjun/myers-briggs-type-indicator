<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		{// 左侧菜单开始}
		<volist name="menuList" id="volist">
			<dl id="menu-article">
				<dt>
					<i class="Hui-iconfont">&{$volist['icon']}</i>
					{$volist['title']}
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
                    	<volist name="volist['child']" id="child">
							<li>
								<a _href="{:U($child['url'])}" data-title="{$child['title']}" href="javascript:void(0)">{$child['title']}</a>
							</li>
						</volist>
					</ul>
				</dd>
			</dl>
		</volist>
		{// 左侧菜单结束}
	</div>
</aside>