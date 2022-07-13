function groupedit(){
	var row = $("input[name='checkbox[]']:checked");
	if (row.length) {
    	var ids ="-1" ;
    	row.each(function(){
            ids += "," + $(this).val() ;    
        });
    	//alert(ids);
		//self.location=APP+'/Client/groupchangeower/id/'+ids;
    	window.open(APP+'/Client/groupchangeower/id/'+ids,'navTab');
			
    } else {
        alert("请选择至少一条记录");    	
    }
}
function groupdelete(){
	var row = $("#dataTable .selected");
    if (row.length) {
    	var id ="-1" ;
		row.each(function (i) {                
		   //alert($(this).children('td').eq(1).html());
		   //如果选中多条，则只编辑第一条
		   id = id+','+$(this).children('td').eq(1).html();            
		}); 
		self.location=APP+'/foreverdelete/id/'+id;
			
    } else {
        alert("请选择要删除记录");    	
    }
}