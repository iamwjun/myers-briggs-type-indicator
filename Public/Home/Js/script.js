// JavaScript Document
;(function($){	
	//focus
	focus_width = $('#focus').width();
	li_num = $('#focus li').length;
	ul_width = focus_width * li_num;
	$('#focus ul').css('width', ul_width + 'px');
	$('#focus ul li').css('width', focus_width + 'px');	
	$('#focus ul').append($('#focus ul').html());
	$('#focus ul').css('width', (ul_width * 2) + 'px');
	setInterval('f()',5000);	
})(Zepto)

function f(){
	ml = parseInt($('#focus ul').css('margin-left'));
	$('#focus ul').animate({'margin-left':(ml - focus_width) + 'px'},'slow','swing',function(){
		ml = parseInt($('#focus ul').css('margin-left'));		
		if(ml + ul_width == 0){
			$('#focus ul').css('margin-left', '0px');
		}
	});
}
