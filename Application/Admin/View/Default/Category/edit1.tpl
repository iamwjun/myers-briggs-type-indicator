<div class="pageContent">
    <form method="post" action="__URL__/update/" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
        <input type="hidden" name="id" value="{$dataInfo['id']}" />
        <div class="pageFormContent" layoutH="68">
            <div class="unit">
                <label>标　　题：</label>
                <input type="text" name="title" value="{$dataInfo['title']}" class="required" />
            </div>
			<if condition="$dataInfo['pid'] eq 175 || $dataInfo['pid'] eq 1">
			<div class="unit">
                <label>封面图：</label>
                <input type="hidden" name="picture" value="{$dataInfo['picture']}"/>
                <input type="file" name="uploadify" id="picture" class="uploadify" />
                <div class="picture oneImage">
                	<if condition="$dataInfo['picture'] neq ''">
                    <img src="__ROOT__{$dataInfo['picture']}" height="100" />
                    </if>
                </div>
            </div>
			</if>
			<if condition="$dataInfo['pid'] eq 1">
			<div class="unit">
                <label>链接地址：</label>
                <input type="text" name="link" value="{$dataInfo['link']}" />
            </div>
			</if>
            <div class="unit">
                <label>备　　注：</label>
                <textarea name="intro" class="intro intro2" >{$dataInfo['intro']}</textarea>
            </div>
            <div class="unit">
                <label>排　　序：</label>
                <input type="text" name="sort" value="{$dataInfo['sort']}" />
            </div>
        </div>
        <div class="formBar">
            <ul>
                     <li>
                        <div class="buttonSave">
                            <div class="buttonSaveContent">
                                <button type="submit">
                            		<i class="iconfont">&#xe644;</i>保存
                                </button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="buttonCancel">
                            <div class="buttonCancelContent">
                                <button type="button" class="close">
                                	<i class="iconfont">&#xe640;</i>取消
                                </button>
                            </div>
                        </div>
                    </li>
            </ul>
        </div>
    </form>
</div>
