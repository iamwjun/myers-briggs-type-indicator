$(function(){
	$('.table-sort').dataTable({
		"bSort": false,
		"bStateSave": true,
		"aLengthMenu": [5,10,20,30,40,50,60,70,80,90,100],
		"iDisplayLength":10
	});
	// 排序
	plugins.BatchSequence();
	// 删除单条数据
	plugins.singleRemove();
	// 更新数据状态
	plugins.updateStatus();
	// 批量删除
	plugins.BatchRemove();
});