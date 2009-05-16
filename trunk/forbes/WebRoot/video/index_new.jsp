<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 学习视频 - 全力打造创业者学习和交流平台</TITLE>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	
	<LINK rel=stylesheet type=text/css href="css/generl200809.css">
	<LINK rel=stylesheet type=text/css href="css/index200809.css">
	<LINK rel=stylesheet type=text/css href="supev.css">

	<STYLE>
		.M_L {
			CURSOR: pointer
		}
		.hand {
			CURSOR: pointer
		}
	</STYLE>

	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>


	<SCRIPT>
		function M_L_Move(id,pn,m){  //显示列表左右滚动
	    	var obj = $('#'+id);
	    	var p   = parseInt(obj.attr('pn')|0);
	    	if(typeof(m)=='number'){
	      		pn = p + m;
	    	}
			if( pn < 0 || pn > 2 )return;
	    	var px = parseInt(obj.attr('px')) * pn * -1;
	    	obj.animate({ marginLeft:px},'slow');
	    	var objc = '#'+ id +'_C';
	    	objc = $('.M_L',objc);
	    	var tmp = $(objc[pn]).attr('src');
	    	$(objc[pn]).attr('src',$(objc[p]).attr('src'));
	    	$(objc[p]).attr('src',tmp);
	    	obj.attr('pn',pn);
		}
	  
	  	function fun_top_tj(){  //顶部推荐滚动
	    	obj  = $('#top_tj');
	    	obja = $('a',obj);
			var pn = parseInt(obj.attr('pn')|0);
	    	if(pn>=obja.length)pn=0;
	    
	    	if(obj.attr('isMOver') != 1){
	      		obj.fadeOut("fast",function(){
	        	var i=0;
	        	obja.each(function(){
	          		if(i==pn){
	            		$(this).show();
	          		} else {
	            		$(this).hide();
	          		}
	          		i++;
	        	});
	        	obj.fadeIn("fast");
	      	});
	      	obj.attr('pn',pn+1);
	    	}
		}
	  
		function showzjlist(id,isshow){ //专辑推荐视频列表
	    	var obj = $('#zjlist_'+id);
	    	if(isshow){
	      	obj.fadeIn('fast');
	    	} else {
	      	obj.fadeOut('fast');
	    	}
		}
	  
	  function showDq(){ //电视大全显示控制
	    showTag(0);
	    $('#dsjmdq').toggle();
	  }
	  
	  function showTag(id){ //动态获取电视大全数据并显示
	    var tmp = $('#dsjmdq .tab').eq(id);
	    var obj = $('#dsjmdq');
	    if(tmp.html().length < 100){
	      if(obj.attr('sh')==id)return;
	      $.get('inc/dsjmdq_'+ id +'.html?&usecache=1',function(data){
	        if(data.indexOf('table')>0){
	          tmp.html(data);
	        }
	        obj.attr('sh',id);
	        showTag(id);
	      },'html');
	    } else {
	      switch (id){
	        case 0:
	          $('#dsjmdq li').eq(0).addClass('expli');
	          $('#dsjmdq li').eq(1).removeClass('expli');
	          $('#dsjmdq .tab').eq(0).show();
	          $('#dsjmdq .tab').eq(1).hide();
	          break;
	        case 1:
	          $('#dsjmdq li').eq(1).addClass('expli');
	          $('#dsjmdq li').eq(0).removeClass('expli');
	          $('#dsjmdq .tab').eq(1).show();
	          $('#dsjmdq .tab').eq(0).hide();
	          break;
	      }
	    }
	  }
	  
	  function fun_swf_tag(pn){ //首屏热点标签切换
	  	
	    var p = parseInt(_swftag.attr('pn')|0);
	    if(pn==p)return;
	    var tmp = $('li',_swftag);
	    tmp[p].className='hand c_black b f14';
	    tmp[pn].className='hand expli c_white b f14';
	    _swftag.attr('pn',pn);
	    var sid = 'M_L_'+pn;
	    var typeid = pn;
	    if(pn==0) {
	    	$('#M_L_0').show();
			$('#M_L_1').hide();
			$('M_L_MSG').hide();
	    }
	    else {
	    	if(pn==1) typeid= 1;
		    if(pn==2) typeid= 5;
		    if(pn==3) typeid= 8;
		    if(pn==4) typeid= 12;
		    if(pn==5) typeid= 16;
		 
		    
		    tmp = $('#'+sid);   
		    var msg = $('#M_L_MSG');
		   
		      msg.show();
				      $.get('VideoSearch.do?act=indextop&type='+typeid,function(data){
				      	//alert(data);
				       	//_con.append(data);
				       	//if(pn==_swftag.attr('pn')){
				      		//_con.children('div').each(function(){
				   			//$(this).hide();
				 		//});
				     	//$('#'+sid).show();
				       //}
				       $('#M_L_0').hide();
				       $('#M_L_1').show();
				       $('#M_L_1').html(data);
				       $('#M_L_MSG').hide();
				       chBord();
				      },'html');
		      msg.hide();
	    }
	    
	   
	    playComm("PAUSE");
	  }
	  
	  function getPlaycount(){  //获取播放数
	    $("span[name='playcount']").each(function(){
	     var $_ = $(this);
	     var pid = $_.attr('pid');
	     if(pid)
	     //$.getJSON('http://www.CHI-JIAO.com/fun/playcount.php?pid='+pid+'&callback=?',function(data){
	     $.getJSON('fun/playcount.php?pid='+pid+'&callback=?',function(data){
	       $_.text(data.msg.replace(',',''));
	     });
	    });
	  }
	  
	  function videoStatus(id,ty,cs){ //播放器状态
	    if(ty!='ad' && cs == 'playOverAll'){
	      p_END();
	    }
	  }
	  
	  function flvPlayEndCall(){
	  }
	  
	  function chBord(){ //热点视频鼠标效果
	    $(".img[name='chborder']").each(function(){
	      var $_ = $(this);
	      $_.mouseover(function(){
	        $_.css('border','4px solid #54AD26');
	      }).mouseout(function(){
	        $_.css('border','4px solid #E9E9E9');
	      });
	    });
	  }
	
	  function p_END(){
	    playComm("STOP");
	    $('div:first','#play_swf').show();
	    $('div:last','#play_swf').hide();
	  }
	  
	  function playComm(comm){
	    var ob = document.getElementById("videoplayer");
	    if(!ob)return;
	    if(!$.browser.msie){
	      ob = $("embed",ob)[0];
	    }
	    ob.SetVariable("Command", comm);
	  }
	  
	  function playerInner(pid,title){ //预览控制
	  	
	    var sFV      = '';
	    var swf_path = pid;
	    _qval        = 'tv=0';
	    _qval       += ',ref='+ encodeURIComponent(document.referrer) + ',channel=' + encodeURIComponent(location.href);
	    sFV         += '&pid='+ pid +'&playNowTitle='+ encodeURIComponent(title) +'&q='+ _qval +'&autostart=true&showOverEvent=1&culatePlayerTimer=true&playADstatu=false';  
	
	    s_htm = '<object id="videoplayer" width="422" height="312" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">\
	            <param name="movie" value="'+ swf_path +'"/>\
	            <param name="allowScriptAccess" value="always"/>\
	            <param name="allowfullscreen" value="true"/>\
	            <param name="FlashVars" value="'+ sFV +'"/>\
	            <embed width="422" height="312"\
	              allowscriptaccess="always"\
	              type="application/x-shockwave-flash"\
	              src="'+ swf_path +'?'+ sFV +'"\
	              allowfullscreen="true" quality="high"/>\
	            </object>';
	    $('div:first','#play_swf').hide();
	    $('div:last','#play_swf').html(s_htm).show();
	  }
	  
	  var b_imgval = [],imgS,divF;
	  function b_imgchange(id){ //焦点图切换
	    if(typeof(imgS)=='undefined'){
	      imgS = $("#M_L_0_UL .img[name='chborder']");
	    }
	    if(id >= imgS.length)id=0;
	    if(typeof(b_imgval[id])=='undefined'){
	      imgA       = imgS.eq(id);
	      imgA       = $('a:first',imgA);
	      var src    = imgA.attr('b_pic');
	      var con    = imgA.attr('content'); 
	      con        = decodeURIComponent(con);
	      var href   = imgA.attr('view');
	      var target = imgA.attr('target');
	      var title  = imgA.attr('title');
	      
	      var link   = 'href="'+ href +'"';
	      
	      var htm    = $('<div>\
	                    <a '+ link +'><img src="'+ src +'" width="422" height="311" /></a>\
	                    <div class="mm"></div>\
	                    <dl>\
	            	        <dt><span><a '+ link +' class="c_white">'+ title +'</span></a></dt>\
	            		      <dd>'+ con +'</dd>\
	            	      </dl>\
	                    </div>');
	      b_imgval[id]=htm;
	    }
	    divF.empty();
	    divF.html(b_imgval[id]);
	    divF.attr('pn',id);
	  }
	  
	  function b_imgchangeauto(){ //焦点图切换定时调用
	    if(typeof(divF)=='undefined')divF=$('div:first','#play_swf');
	    var id = parseInt(divF.attr('pn')|0); 
	    if(divF.css('display') != 'none') b_imgchange(id+1);
	    setTimeout('b_imgchangeauto()',9000);
	  }
								
	 
	</SCRIPT>

</HEAD>
<BODY>

<DIV id=wrapper>

	<!-- 头引用 开始 -->

	<%@ include file="include/header.jsp"%>

	<!-- 头引用 结束 -->
	
	<DIV class=clear></DIV>
	
	<!-- 导航 开始 --> 
	
	<!-- 导航 结束 -->
	
	<DIV class=clear></DIV>
	
	<!-- 广告 开始 -->
	<!--
	<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
	-->
	<DIV class=clear></DIV>
	<!-- 广告 结束 -->
	
	<!-- 二级导航 开始 --><!--script src=""></script--><!-- 二级导航 结束 -->
	
	<DIV class=clear></DIV>
	
	<DIV class=tj><!-- 滚动推荐 -->
		<DIV class="title c_grey2 b">火辣播报： 
			<SPAN id=top_tj>
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="VideoShow.do?id=5">&nbsp;赢在中国第一赛季&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="VideoShow.do?id=6">&nbsp;赢在中国第二赛季&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="VideoShow.do?id=7">&nbsp;赢在中国第三赛季&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="VideoShow.do?id=1">&nbsp;余世维 成功经理人&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="VideoShow.do?id=8">&nbsp;余世维 如何塑造管理者的性格魅力&nbsp;</A> 
			</SPAN>
		</DIV>
		<SCRIPT>
	  		$('#top_tj').mouseover(function(){
	   		$(this).attr('isMOver',1);
	  		}).mouseout(function(){
	   			$(this).attr('isMOver',0);
	  		});
	  		fun_top_tj();
	 		setInterval('fun_top_tj()',7000); 
	  	</SCRIPT>

		<DIV class=clear></DIV>
		
		<!-- 内容 开始  -->
		<DIV class=content>
			
			<!-- Loadding 开始 -->
			<DIV style="Z-INDEX: 99; POSITION: absolute; MARGIN: 265px 0px 0px 875px; DISPLAY: none" id=M_L_MSG>
				<IMG src="images/loading.gif" width=50 height=50> 
			</DIV>
			<!-- Loadding 结束 -->
			
			<DIV id=M_L_0>
				<DIV class=left></DIV>
				<DIV class=mid>
				
					<!-- 播放器 开始 -->
					<DIV id=play_swf class=swf>
						<DIV pn="-1"><!-- 大图 --></DIV>
						<DIV style="DISPLAY: none"><!-- 播放器 --></DIV>
					</DIV>
					<!-- 播放器 结束 -->
					
					<DIV class=js>
						<DIV class=js_top></DIV>
						<DIV class=js_mid>
							<DIV class=title1>
								<A class="f14 b c_white" href="VideoSearch.do?act=search&orderby=iscommend Desc">精彩推荐</A> 
								<DIV id=M_L_0_UL_C class=fy>
									<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,-1)" align=absMiddle src="images/js_jian1.jpg" width=8 height=16> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',0)" align=absMiddle src="images/ico_2.jpg" width=8 height=8> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',1)" align=absMiddle src="images/ico_3.jpg" width=8 height=8> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',2)" align=absMiddle src="images/ico_3.jpg" width=8 height=8> 
									<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,1)" align=absMiddle src="images/js_jian2.jpg" width=8 height=16> 
								</DIV>
							</DIV>
							<DIV class=list_img>
								<UL id=M_L_0_UL px="492">
									<c:set var="count" value="1"></c:set>
									<c:forEach items="${VIDEO_LIST}" var="video">
									
	  								<LI>
	  									<DIV class=img name="chborder">
	  										<A title="${video.shorttitle }" target=_play href="VideoShow.do?id=${video.id }" content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl.url }','${video.shorttitle }')" 
	  											b_pic="../${video.litpic }">
	  											<IMG alt=${video.shorttitle } src="../${video.litpic }" width=124 height=97>
	  										</A>
	  										<DIV class=bg><A title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }"><IMG src="images/gif.gif"></A></DIV>
	  										<DIV class=bf><A title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }"><IMG src="images/ico_4.gif" width=10 height=19></A></DIV>
	  									</DIV>
	  									
	  									<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }">${video.shorttitle }&nbsp;</A></DIV>
	  									
	  									<DIV class=height1><SPAN class=c_grey>主讲：</SPAN><A class=c_green target=_blank href="VideoSearch.do?act=search&keyword=${video.writer }">${video.writer }</A></DIV>
	  									<DIV><SPAN class=c_grey></SPAN> </DIV>
	  									<DIV>
	  										<A class=c_grey href="javascript:playerInner('${video.firstVideoUrl.url }','${video.shorttitle }')">
	  											<IMG align=absMiddle src="images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;预览 
	  										</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  										<A class=c_grey title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }">完整播放</A>
	  									</DIV>
	  									<DIV class=line></DIV>
	  							
	  								</LI>
	  								
	  								
	  								
	  								<c:set var="count" value="${count + 1}"></c:set>
	  								</c:forEach>
								</UL>
							
								<SCRIPT>
						       		getPlaycount(); //获取播放数
						       		chBord();       //边框变色
						       		b_imgchangeauto(); //大图切换
					     		</SCRIPT>
							</DIV>
							
							<DIV class=list_font>
								<UL>
									<c:forEach items="${COMMEND_VIDEO_LIST}" var="video">
									<LI><A class=c_grey target=_play href="VideoShow.do?id=${video.id }">[推荐]${video.title }</A> 
								  	</c:forEach>
								  	</LI>
								</UL>
							</DIV>
							
							<DIV class=clear></DIV>
						</DIV>
						
						<DIV class=js_bot></DIV>
					</DIV>
				</DIV>
				
				<DIV class=right></DIV>
				
			</DIV>
			
			<DIV id=M_L_1>
			</DIV>
		</DIV>
		<!-- 内容结束  -->
		
		<DIV class=clear></DIV>
		
		<DIV class=swf_menu>
			<DIV class=left></DIV>
			<DIV class=mid>
			<UL id=swf_tag>
			  	<LI class="hand expli c_white b f14">热点
			  	<LI class="hand c_black b f14">创业成功学
			  	<LI class="hand c_black b f14">企业商学院
			  	<LI class="hand c_black b f14">投资理财
			  	<LI class="hand c_black b f14">职场人生
			  	<LI class="hand c_black b f14">健康养生</LI>
			</UL>
			<SCRIPT>
     			var _con = $('.content:first','.tj');
		     	var _swftag = $('#swf_tag');
		     	var _con_i = 0;
		     
		     	$('li',_swftag).each(function(){
		       		var tmp = _con_i;
		       		$(this).click(function(){
		         		fun_swf_tag(tmp);
		       		});
		       		_con_i++;
		     	});
   			</SCRIPT>
		</DIV>
		
		<DIV class=right></DIV>
		<DIV class=clear></DIV>
	</DIV>
	
	<DIV class=clear></DIV>
	
</DIV>

<DIV class=clear></DIV>

<DIV id=contain>


<DIV class=siderA_box>
<!-- 广告 开始 -->
<!--

<SCRIPT language=JavaScript1.1 src="#"></SCRIPT>
-->
<!-- 广告 结束 -->


<!-- 推荐专辑 -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="VideoSearch.do?act=search&typeid=1">创业成功学</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=2">&nbsp;励志创业&nbsp;</A>
  					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=3">&nbsp;演讲口才&nbsp;</A>
  					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=21">&nbsp;人际沟通&nbsp;</A>
  					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=23">&nbsp;潜能开发&nbsp;</A>
					</LI>
				</UL>
			</DIV>
			
		</DIV>
		<DIV class=right></DIV>
	</DIV>
	<DIV class=clear></DIV>

<DIV class="content border">
	<UL id=L_1_UL class=four px="648">
		<DIV id="type_1">
  				      <c:forEach items="${COMMEND_VIDEO_LIST_TYPE_1}" var="video" varStatus="status"> 
						<c:if test="${status.index % 2 == 0}">	
							<LI>
					  			<DIV class="t mab">
					  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
					  					<DIV class=tc></DIV>
					  					<DIV class=tcc>
					  						<DIV class=title>
					  							<SPAN class="b c_blue">专辑推荐</SPAN>
					  							<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  						</DIV>
					  						<DIV class=content1>
					  							<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  							</c:forEach>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
								
								<DIV class=img>
									<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
										<IMG src="../${video.litpic}" width=180 height=90>
									</A>
								</DIV>
					  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
					  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  			<DIV class=sm>
					  				<A class=c_black title="${video.title}" target=_play href="#">
					  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  				</A> 
					  			</DIV>
					  		<LI>
					  	</c:if>
					  	
					  	<c:if test="${status.index % 2 == 1}">	
					  		<DIV class="t mab">
					  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
					  				<DIV class=tc></DIV>
					  				<DIV class=tcc>
					  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
					  						<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  					</DIV>
					  					<DIV class=content1>
					  						<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  						</c:forEach>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
					  		<DIV class=img>
					  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG src="../${video.litpic}" width=180 height=90>
					  			</A>
					  		</DIV>
					  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
					  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  		<DIV class=sm>
					  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  			</A>
					  		</DIV>
					  	</c:if>						
						
					</c:forEach>
  		</DIV>
	</UL>
	
	<DIV class="tright more"><A class="b c_grey2" target=_blank href="VideoSearch.do?act=search&typeid=1">更多&gt;&gt;</A></DIV>
	<DIV class=clear></DIV>
</DIV>

<DIV class=bot></DIV>

<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 广告 开始 -->
<!--
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
-->
<!-- 广告 结束 -->

<!-- 高清节目 -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="VideoSearch.do?act=search&typeid=5">企业商学院</A></SPAN> 
			<DIV class=bb>
			<UL>
  				<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=6">&nbsp;市场营销&nbsp;</A> 
  				<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=7">&nbsp;经营管理&nbsp;</A>
  				<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=17">&nbsp;领导艺术&nbsp;</A> 
  				<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=19">&nbsp;财务管理&nbsp;</A> 
  				</LI>
  			</UL>
  		</DIV>
		
	</DIV>
	<DIV class=right></DIV>
</DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_2_UL class=four px="636">
  
	<DIV id="type_5">
  			      <c:forEach items="${COMMEND_VIDEO_LIST_TYPE_5}" var="video" varStatus="status"> 
						<c:if test="${status.index % 2 == 0}">	
							<LI>
					  			<DIV class="t mab">
					  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
					  					<DIV class=tc></DIV>
					  					<DIV class=tcc>
					  						<DIV class=title>
					  							<SPAN class="b c_blue">专辑推荐</SPAN>
					  							<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  						</DIV>
					  						<DIV class=content1>
					  							<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  							</c:forEach>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
								
								<DIV class=img>
									<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
										<IMG src="../${video.litpic}" width=180 height=90>
									</A>
								</DIV>
					  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
					  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  			<DIV class=sm>
					  				<A class=c_black title="${video.title}" target=_play href="#">
					  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  				</A> 
					  			</DIV>
					  		<LI>
					  	</c:if>
					  	
					  	<c:if test="${status.index % 2 == 1}">	
					  		<DIV class="t mab">
					  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
					  				<DIV class=tc></DIV>
					  				<DIV class=tcc>
					  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
					  						<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  					</DIV>
					  					<DIV class=content1>
					  						<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  						</c:forEach>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
					  		<DIV class=img>
					  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG src="../${video.litpic}" width=180 height=90>
					  			</A>
					  		</DIV>
					  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
					  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  		<DIV class=sm>
					  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  			</A>
					  		</DIV>
					  	</c:if>						
						
					</c:forEach>
  	
  	</DIV>
</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="VideoSearch.do?act=search&typeid=5">更多&gt;&gt;</A></DIV>

<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 广告 开始 -->
<!--
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
-->
<!-- 广告 结束 -->

<!-- 综艺节目 -->

<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" href="VideoSearch.do?act=search&typeid=8">投资理财</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=9">&nbsp;经济金融&nbsp;</A> 
					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=10">&nbsp;证券投资&nbsp;</A> 
					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=11">&nbsp;基金投资&nbsp;</A>
					<LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=15">&nbsp;个人理财&nbsp;</A>
  					</LI>
  				</UL>
  			</DIV>
  			
  			
  		</DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_3_UL class=four px="636">
	<DIV id="type_8">
  			      <c:forEach items="${COMMEND_VIDEO_LIST_TYPE_8}" var="video" varStatus="status"> 
						<c:if test="${status.index % 2 == 0}">	
							<LI>
					  			<DIV class="t mab">
					  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
					  					<DIV class=tc></DIV>
					  					<DIV class=tcc>
					  						<DIV class=title>
					  							<SPAN class="b c_blue">专辑推荐</SPAN>
					  							<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  						</DIV>
					  						<DIV class=content1>
					  							<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  							</c:forEach>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
								
								<DIV class=img>
									<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
										<IMG src="../${video.litpic}" width=180 height=90>
									</A>
								</DIV>
					  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
					  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  			<DIV class=sm>
					  				<A class=c_black title="${video.title}" target=_play href="#">
					  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  				</A> 
					  			</DIV>
					  		<LI>
					  	</c:if>
					  	
					  	<c:if test="${status.index % 2 == 1}">	
					  		<DIV class="t mab">
					  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
					  				<DIV class=tc></DIV>
					  				<DIV class=tcc>
					  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
					  						<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  					</DIV>
					  					<DIV class=content1>
					  						<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  						</c:forEach>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
					  		<DIV class=img>
					  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG src="../${video.litpic}" width=180 height=90>
					  			</A>
					  		</DIV>
					  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
					  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  		<DIV class=sm>
					  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  			</A>
					  		</DIV>
					  	</c:if>						
						
					</c:forEach>
  	
  	</DIV>
</UL>

<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="VideoSearch.do?act=search&typeid=8">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>

<!-- 体育赛事 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" href="VideoSearch.do?act=search&typeid=12">职场人生</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=13">&nbsp;职业规划&nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=14">&nbsp;职场指南&nbsp;</A> 
  </LI>
</UL>
</DIV>
</DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_4_UL class=four px="636">
  
	<DIV id="type_12">
  			      <c:forEach items="${COMMEND_VIDEO_LIST_TYPE_12}" var="video" varStatus="status"> 
						<c:if test="${status.index % 2 == 0}">	
							<LI>
					  			<DIV class="t mab">
					  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
					  					<DIV class=tc></DIV>
					  					<DIV class=tcc>
					  						<DIV class=title>
					  							<SPAN class="b c_blue">专辑推荐</SPAN>
					  							<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  						</DIV>
					  						<DIV class=content1>
					  							<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  							</c:forEach>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
								
								<DIV class=img>
									<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
										<IMG src="../${video.litpic}" width=180 height=90>
									</A>
								</DIV>
					  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
					  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  			<DIV class=sm>
					  				<A class=c_black title="${video.title}" target=_play href="#">
					  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  				</A> 
					  			</DIV>
					  		<LI>
					  	</c:if>
					  	
					  	<c:if test="${status.index % 2 == 1}">	
					  		<DIV class="t mab">
					  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
					  				<DIV class=tc></DIV>
					  				<DIV class=tcc>
					  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
					  						<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  					</DIV>
					  					<DIV class=content1>
					  						<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  						</c:forEach>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
					  		<DIV class=img>
					  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG src="../${video.litpic}" width=180 height=90>
					  			</A>
					  		</DIV>
					  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
					  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  		<DIV class=sm>
					  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  			</A>
					  		</DIV>
					  	</c:if>						
						
					</c:forEach>
  	</DIV>

</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="VideoSearch.do?act=search&typeid=12">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 高清影视剧 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" href="VideoSearch.do?act=search&typeid=16">健康养生</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=24">&nbsp;养生常识 &nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=25">&nbsp;运动健身&nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="VideoSearch.do?act=search&typeid=26">&nbsp;食疗药膳&nbsp;</A> 
  </LI></UL></DIV>
</DIV>
	<DIV class=right></DIV>
</DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_5_UL class=four px="636">
	<DIV id="type_16">
  			      <c:forEach items="${COMMEND_VIDEO_LIST_TYPE_16}" var="video" varStatus="status"> 
						<c:if test="${status.index % 2 == 0}">	
							<LI>
					  			<DIV class="t mab">
					  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
					  					<DIV class=tc></DIV>
					  					<DIV class=tcc>
					  						<DIV class=title>
					  							<SPAN class="b c_blue">专辑推荐</SPAN>
					  							<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  						</DIV>
					  						<DIV class=content1>
					  							<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  							</c:forEach>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
								
								<DIV class=img>
									<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
										<IMG src="../${video.litpic}" width=180 height=90>
									</A>
								</DIV>
					  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
					  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  			<DIV class=sm>
					  				<A class=c_black title="${video.title}" target=_play href="#">
					  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  				</A> 
					  			</DIV>
					  		<LI>
					  	</c:if>
					  	
					  	<c:if test="${status.index % 2 == 1}">	
					  		<DIV class="t mab">
					  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
					  				<DIV class=tc></DIV>
					  				<DIV class=tcc>
					  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
					  						<DIV class="close c_orange hand" onclick=showzjlist(${status.index},false);>[&nbsp;关闭&nbsp;]</DIV>
					  					</DIV>
					  					<DIV class=content1>
					  						<c:set var="urlcount" value="0"></c:set>
					  							<c:forEach items="${video.videoUrls}" var="url">
					  								<c:if test="${urlcount <= 4}">	
					  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
					  								</c:if>
					  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
					  						</c:forEach>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
					  		<DIV class=img>
					  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG src="../${video.litpic}" width=180 height=90>
					  			</A>
					  		</DIV>
					  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
					  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
					  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
					  		<DIV class=sm>
					  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
					  			</A>
					  		</DIV>
					  	</c:if>						
						
					</c:forEach>
  	</DIV>
</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="VideoSearch.do?act=search&typeid=16">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 大千世界 -->
<!-- 网友热搜 -->

</DIV>

<!-- 排行榜 -->
<DIV id=sider_box>
	<DIV class=siderB_box>
		<DIV class=siderI_box>
			<DIV id=right_1 class=sider_right><!-- 右侧1 -->
				<DIV class=top></DIV>
				<DIV class=mid>
					<DIV class=title><SPAN class="c_grey2 f14 b">热门排行</SPAN></DIV>
					<UL>
						<c:forEach items="${HOT_VIDEO_LIST}" var="video" varStatus="is">
	  					<LI>
	  						<DIV class=numb><IMG src="images/num${is.index+1 }.jpg" width=14 height=11></DIV>
	  						<DIV class=bt><A title="" target=_blank href="VideoShow.do?id=${video.id }">${video.shorttitle }</A></DIV>
	  						<DIV class=tjl><DIV align=right><SPAN class=c_grey2><IMG alt=上升 src="images/ico_up.gif" width=9 height=9></SPAN></DIV></DIV>
	  					</c:forEach>
	  					</LI>
	  				</UL>
					<DIV class=clear></DIV>
				</DIV>
				<DIV class=bot1></DIV>
			</DIV>
		</DIV>
		<DIV class=clear></DIV>
		<DIV style="HEIGHT: 10px"></DIV>
		
		
		<a href="http://www.vancl.com/websource/websource.aspx?url=http://www.vancl.com/&source=xushaomin" target="_blank"><img src="http://union.vancl.com/adpic.aspx?w=300&h=80" border="0" width=270/></a>
		
		<DIV class=siderI_box>
			<DIV id=right_2 class=sider_right><!-- 右侧2 -->
				<DIV class=top></DIV>
				<DIV class=mid>
					<DIV class=title><SPAN class="c_grey2 f14 b">推荐排行</SPAN></DIV>
					<UL>
						<c:forEach items="${COMP_VIDEO_LIST}" var="video" varStatus="is">
	  					<LI>
	  						<DIV class=numb><IMG src="images/num${is.index + 1 }.jpg" width=14 height=11></DIV>
	  						<DIV class=bt><A title="" target=_blank href="VideoShow.do?id=${video.id }">${video.shorttitle }</A></DIV>
	  						<DIV class=tjl><DIV align=right><SPAN class=c_grey2><IMG alt=上升 src="images/ico_up.gif" width=9 height=9></SPAN></DIV></DIV>
	  					</c:forEach>
	  					</LI>
	  				</UL>
					<DIV class=clear></DIV>
				</DIV>
				<DIV class=bot1></DIV>
			</DIV>
		</DIV>
		<DIV class=clear></DIV>
		<DIV id=right_3>
			<!-- 右侧3 -->
			<!-- 广告 开始 -->
			<DIV class=siderK_box><SCRIPT language=JavaScript1.1 src=""></SCRIPT></DIV>
			<DIV class=clear></DIV>
			<DIV class=siderK_box><SCRIPT language=JavaScript1.1 src=""></SCRIPT></DIV>
			<!-- 广告 结束 -->
		</DIV>
	</DIV>
</DIV>
<!-- 电视节目大全 -->
<DIV class=clear></DIV>

<DIV style="DISPLAY: none" id=dsjmdq class=dq_content><!-- -->


<!-- -->
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>


<script src="js/zt_foot.js" charset="gb2312"></script>

<DIV style="PADDING-TOP: 2px"></DIV>

</DIV>
<DIV class=clear></DIV></DIV>


<!-- 统计 开始-->

<!-- 统计 结束-->
</BODY></HTML>
