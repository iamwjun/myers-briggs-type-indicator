var data = ListObjJSON;

window.onload = function () {
	initTreeTable(data);
};

function initTreeTable(data) {
	json = eval('(' + data + ')');
	model = {
		store: json,
		childrenAttrs: ['children']
	};
	layout = [
		{name: '类别名称', field: 'title'},
		{name: '排序', field: 'sort'},
		{name: '状态', field: 'status'},
		{name: '操作', field: 'operation'}
	];
	var treeTable = new TreeTable(layout, model, 'TreeTableList');
	treeTable.startup();
//	treeTable.expandAll(false);
}

function testGetName(item) {
	return '<a href="javascript:;">' + item.id + '</a>';
}

function testGetValue(item, column, treeNode) {
	if (treeNode.nodes.length == 0) {
		return '<input type="text" value="' + item.value + '"/>';
	}
	return '';
}

function testGetIcon(item) {
	return jsObj['plugins'] + 'images/page.gif';
}