$(document).ready(function(){
			VList(1,0,'zx');
	    innerPlay(0);

			$('.combo_box').mouseover(function(){
					$(this).addClass('on').find('ul').show();
			}).mouseout(function(){
					$(this).removeClass('on').find('ul').hide();
			});
		$(".siderG_box_top li").each(function(){
				$(this).css("cursor","pointer").click(function(){
							var liObj = $(this);
							var ulObj = liObj.parent();
							var divObj = $('.siderG_box_mid');
							var len = ulObj.children('li').length;
							for(var i=0;i<len;i++)
							{
									ulObj.children('li').eq(i).removeClass();
								  divObj.children('ul').eq(i).hide();
							}
							liObj.addClass("expli");
							divObj.children('ul').eq(liObj.attr('tag')).show();
				})
		})

})


var totalPage,offset,aorderType;
function sortList(viewType,orderType){
	if( viewType == 'VList'){
	   VList(1,0,orderType);  /* 列表格式  */
	}else{
	 	 HList(1,0,orderType);  /* 简介格式 */
	 }
}
function VList(curPage,tagNum,orderType){
	aorderType=orderType;
	offset=16;
	totalPage = Math.ceil(totalnum/offset);

	VTurnPage(curPage);
	var sortListHtml='<LI onclick=sortList("VList","zx")>正序</LI>\
										<LI onclick=sortList("VList","dx")>倒序</LI>';
	$("#sort").html(sortListHtml);
	$(".nn img").eq(0).attr("src","images/ico_181.jpg");
	$(".nn img").eq(1).attr("src","images/ico_191.jpg");
}
function HList(curPage,tagNum,orderType){
		aorderType=orderType;
		offset=5;
		totalPage = Math.ceil(totalnum/offset);
		HTurnPage(curPage);
		var sortListHtml='<LI onclick=sortList("HList","zx")>正序</LI>\
								  		<LI onclick=sortList("HList","dx")>倒序</LI>';
	  $("#sort").html(sortListHtml);
	 	$(".nn img").eq(0).attr("src","images/ico_18.jpg");
		$(".nn img").eq(1).attr("src","images/ico_19.jpg");
}
function VTurnPage(curPage)
{
	 scroll(0,$(".siderA_box").offset().top-10);
	var listHtml='<ul>';
	if(aorderType=='zx'){
			snum=offset*curPage;
		  var startnum=(curPage-1)*offset;
		  var title,tmp;
		 	for(var j=0,i=startnum;i<snum&&i<totalnum;i++,j++)
		 	{
		 			//alert(i + "=" + v[i]);
		 			
		 			if(v[i] != undefined ) {
		 				tmp = v[i].split('||');
		 				title = wordCut(tmp[0]);
		    			listHtml+='<li>\
							   <div class="img"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" ><img src="'+tmp[2]+'" width="118" height="89" /></a></div>\
							   <div class="des"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" class="c_color1" title="'+ tmp[0] +'">'+title+'</a></div>\
							  </li>\
								';
		 			}
		 			
		 }
	}else{
			snum = totalnum-curPage*offset ;
  		var startnum=totalnum-(curPage-1)*offset;
  		var title,tmp;
 			for(var i=startnum-1;i>snum-1&&i>=0;i--)
		 	{
		 		
		 			 tmp = v[i].split('||');
			 		 title = wordCut(tmp[0]);
			     listHtml+='<li>\
							   <div class="img"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" ><img src="'+tmp[2]+'" width="118" height="89" /></a></div>\
							   <div class="des"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" class="c_color1" title="'+ tmp[0] +'" >'+title+'</a></div>\
							  </li>\
								';
		 }
	}
  listHtml+=' </ul>';
  //$('#pagelist').empty().html(listHtml);
  $('#pagelist').empty().html(listHtml);
  createPageHtml(curPage,'V');
}
function HTurnPage(curPage)
{
  scroll(0,$(".siderA_box").offset().top-10);
	var listHtml='<ul>';
  if(aorderType=='zx'){
  		snum = offset*curPage;
		  var startnum = (curPage-1)*offset;
		  var tmp;
		 	for(var j=0,i=startnum;i<snum&&i<totalnum;i++,j++)
		 	{
		 			tmp = v[i].split('||');
		 			listHtml+='<li class="horizon">\
					   <div class="img"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" ><img src="'+tmp[2]+'" width="118" height="89" /></a></div>\
					   <dl>\
					    <dt><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" class="c_color1">'+tmp[0]+'</a></dt>\
							<dd class="c_grey">'+tmp[4].substr(0,100)+'</dd>\
							<dd><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" ><img src="images/anniu_dj.jpg" width="88" height="24" align="absmiddle" /></a></dd>\
					   </dl>\
				  </li>\
				  ';
		  }
	}else{
			snum=totalnum-curPage*offset ;
  		var startnum=totalnum-(curPage-1)*offset;
  		var tmp;
 			for(var i=startnum-1;i>snum-1&&i>=0;i--)
		 	{
		 			tmp = v[i].split('||');
		 			listHtml+='<li class="horizon">\
					   <div class="img"><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;"><img src="'+tmp[2]+'" width="118" height="89" /></a></div>\
					   <dl>\
					    <dt><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" class="c_color1">'+tmp[0]+'</a></dt>\
							<dd class="c_grey">'+tmp[4].substr(0,100)+'</dd>\
							<dd><a href="'+tmp[3]+'" onclick="innerPlay('+i+');return false;" ><img src="images/anniu_dj.jpg" width="88" height="24" align="absmiddle" /></a></dd>\
					   </dl>\
				  </li>\
				  ';
		  }
	}
  listHtml+=' </ul>';
 	$('#pagelist').empty().html(listHtml);
 	createPageHtml(curPage,'H');
}
function createPageHtml(curPage,type){
	  var pageHtml='';
  	if(totalPage != 1)
 		{
				if(curPage != 1)
				{
					pageHtml += '<a href="javascript:fGoto()" onclick='+type+'TurnPage('+(curPage-1)+') class="c_color1 b" >上一页</a>';
				}else{
					pageHtml += ' <a class="c_color5 b" >上一页</a>';
				}
				for(var i=1;i<=totalPage;i++)
				{
					if(i==curPage)
					{
						 pageHtml += '<a class="c_color5">[&nbsp;'+ i +'&nbsp;]</a>';
					}else{
						  pageHtml += '<a class="c_color1" href="javascript:fGoto()" onclick='+type+'TurnPage('+i+') >'+ i +'</a>';
					  }
				}
				if(curPage!=totalPage)
				{
					pageHtml += '<a class="c_color1 b" href="javascript:fGoto()" onclick='+type+'TurnPage('+(curPage+1)+')>下一页</a>';
				}else{
					pageHtml += '<a class="c_color5 b" >下一页</a>';
				}
		}
	  $(".page").html(pageHtml);
}



function addNum(obj,tid)
{
		if(obj.id=='col')
		{
			 if (window.sidebar) {       /*FireFox*/
						window.sidebar.addPanel(document.title, location.href,"");
				} else if( document.all ) {  /*IE*/
						window.external.AddFavorite( location.href, document.title);
								} else if( window.opera && window.print ) {
													return true;
												}
		}
		 $.ajax({
     type: "POST",
     url: "zj_info_maker.php",
     data: "type="+obj.id+"&sid="+tid,
     success: function(msg){
	     	try{
	     		if( trim(msg) != '' && trim(msg) != 'false') $('#'+obj.name+'num').html(trim(msg));
	     	}catch(e){alert('抱歉,数据路链接出错!');}
     }
		});
}
function trim(str){
	return (str + '').replace(/(\s+)$/g, '').replace(/^\s+/g, '');
}
function wordCut(str){
	return  (str.length > 19)? str.substr(0,19)+'...' : str ;
}
function fGoto(){

}