<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ��Ƶ - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name="Keywords" content="����ѧϰ��Ƶ ${WEB_KEYWORD }" />
	<META name="Description" content="����ѧϰ��Ƶ ${WEB_DESCRIPTION }" />
	
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
		function M_L_Move(id,pn,m){  //��ʾ�б����ҹ���
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
	  
	  	function fun_top_tj(){  //�����Ƽ�����
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
	  
		function showzjlist(id,isshow){ //ר���Ƽ���Ƶ�б�
	    	var obj = $('#zjlist_'+id);
	    	if(isshow){
	      	obj.fadeIn('fast');
	    	} else {
	      	obj.fadeOut('fast');
	    	}
		}
	  
	  function showDq(){ //���Ӵ�ȫ��ʾ����
	    showTag(0);
	    $('#dsjmdq').toggle();
	  }
	  
	  function showTag(id){ //��̬��ȡ���Ӵ�ȫ���ݲ���ʾ
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
	  
	  function fun_swf_tag(pn){ //�����ȵ��ǩ�л�
	  	alert(pn);
	    var p = parseInt(_swftag.attr('pn')|0);
	    if(pn==p)return;
	    var tmp = $('li',_swftag);
	    tmp[p].className='hand c_black b f14';
	    tmp[pn].className='hand expli c_white b f14';
	    _swftag.attr('pn',pn);
	    var sid = 'M_L_'+pn;
	    var typeid = pn;
	    if(pn==0) typeid= 1;
	    if(pn==1) typeid= 1;
	    if(pn==2) typeid= 5;
	    if(pn==3) typeid= 8;
	    if(pn==4) typeid= 12;
	    if(pn==5) typeid= 1;
	    if(pn==6) typeid= 1;
	    if(pn==7) typeid= 1;
	    
	    tmp = $('#'+sid);   
	    var msg = $('#M_L_MSG');
	   
	    if(tmp.length<1){
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
			       $('M_L_MSG').hide();
			       chBord();
			      },'html');
	      msg.hide();
	    } else {
	      //_con.children('div').each(function(){
	       //$(this).hide();
	      //});
	      //tmp.show();
	 		$('#M_L_1').hide();
			$('#M_L_0').show();
			$('M_L_MSG').hide();
	      			
	    }
	    playComm("PAUSE");
	  }
	  
	  function getPlaycount(){  //��ȡ������
	    $("span[name='playcount']").each(function(){
	     var $_ = $(this);
	     var pid = $_.attr('pid');
	     if(pid)
	     //$.getJSON('http://www.openv.com/fun/playcount.php?pid='+pid+'&callback=?',function(data){
	     $.getJSON('fun/playcount.php?pid='+pid+'&callback=?',function(data){
	       $_.text(data.msg.replace(',',''));
	     });
	    });
	  }
	  
	  function videoStatus(id,ty,cs){ //������״̬
	    if(ty!='ad' && cs == 'playOverAll'){
	      p_END();
	    }
	  }
	  
	  function flvPlayEndCall(){
	  }
	  
	  function chBord(){ //�ȵ���Ƶ���Ч��
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
	  
	  function playerInner(pid,title){ //Ԥ������
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
	  function b_imgchange(id){ //����ͼ�л�
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
	  
	  function b_imgchangeauto(){ //����ͼ�л���ʱ����
	    if(typeof(divF)=='undefined')divF=$('div:first','#play_swf');
	    var id = parseInt(divF.attr('pn')|0); 
	    if(divF.css('display') != 'none') b_imgchange(id+1);
	    setTimeout('b_imgchangeauto()',9000);
	  }
	  
	  function listVideos(type, divid){
							$.ajax({
							url: 'VideoSearch.do',
							type: 'post',
							dataType: 'html',
							data:"act=type&typeid=" + type,
							timeout: 10000,
							error: function(){
								//alert('System error');
							},
							success: function(rsHtml){
								//alert("#" + divid);
								$("#" + divid +"").html(rsHtml);
							}
							});
					}
		function listComps(){
							$.ajax({
							url: 'VideoTopList.do',
							type: 'post',
							dataType: 'html',
							data:"act=comp",
							timeout: 10000,
							error: function(){
								//alert('System error');
							},
							success: function(rsHtml){
								//alert(rsHtml);
								$("#sider_box").html(rsHtml);
							}
							});
					}
		
		
		function listHots(){
							$.ajax({
							url: 'VideoSearch.do',
							type: 'post',
							dataType: 'html',
							data:"act=hot",
							timeout: 10000,
							error: function(){
								//alert('System error');
							},
							success: function(rsHtml){
								//alert(rsHtml);
								$("#M_L_0").html(rsHtml);
							}
							});
					}
								
	  $(window).bind("load",function(){
	  		$("#market_manage").load("VideoSearch.do?act=type&typeid=7");
	  		$("#carve_encourage").load("VideoSearch.do?act=type&typeid=7");
	  		$("#fortune_life").load("VideoSearch.do?act=type&typeid=7");
	  		$("#economy_finance").load("VideoSearch.do?act=type&typeid=7");
	  		
			//listVideos(7, "market_manage");
			//listVideos(7, "carve_encourage");
			//listVideos(7, "fortune_life");
			//listVideos(7, "economy_finance");
			listComps();
	        }
		);
	</SCRIPT>

</HEAD>
<BODY>

<DIV id=wrapper>

	<!-- ͷ���� ��ʼ -->

	<%@ include file="include/header.jsp"%>

	<!-- ͷ���� ���� -->
	
	<DIV class=clear></DIV>
	
	<!-- ���� ��ʼ --> 
	
	<!-- ���� ���� -->
	
	<DIV class=clear></DIV>
	
	<!-- ��� ��ʼ -->
	<!--
	<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
	-->
	<DIV class=clear></DIV>
	<!-- ��� ���� -->
	
	<!-- �������� ��ʼ --><!--script src="http://t.openv.com/zt/inc/openv_sub_nvg.js"></script--><!-- �������� ���� -->
	
	<DIV class=clear></DIV>
	
	<DIV class=tj><!-- �����Ƽ� -->
		<DIV class="title c_grey2 b">���������� 
			<SPAN id=top_tj>
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/pro_play-hdprog_20081022_6819657.html">&nbsp;ӡ�����ǲ��������������й�&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://www.openv.com/play/CCTVNEWSnews_20081021_6810868_0.html">&nbsp;΢���������ж��ⷴ������&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/tv_play-hdteleplay_20081019_6804247.html">&nbsp;��Ů�޵�������&nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822371.html">&nbsp;�������ɼλۡ����ͬ�С��������� &nbsp;</A> 
				<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://www.openv.com/play/dvdprogramme_20081022_6816299_0.html">&nbsp;���˺��������˳�����Ȧ&nbsp;</A> 
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
		
		<!-- ���� ��ʼ  -->
		<DIV class=content>
			
			<!-- Loadding ��ʼ -->
			<DIV style="Z-INDEX: 99; POSITION: absolute; MARGIN: 265px 0px 0px 875px; DISPLAY: none" id=M_L_MSG>
				<IMG src="images/loading.gif" width=50 height=50> 
			</DIV>
			<!-- Loadding ���� -->
			
			<DIV id=M_L_0>
				<DIV class=left></DIV>
				<DIV class=mid>
				
					<!-- ������ ��ʼ -->
					<DIV id=play_swf class=swf>
						<DIV pn="-1"><!-- ��ͼ --></DIV>
						<DIV style="DISPLAY: none"><!-- ������ --></DIV>
					</DIV>
					<!-- ������ ���� -->
					
					<DIV class=js>
						<DIV class=js_top></DIV>
						<DIV class=js_mid>
							<DIV class=title1>
								<A class="f14 b c_white" href="http://www.openv.com/">�����Ƽ�</A> 
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
	  										<A title="${video.shorttitle }" target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html" 
	  											content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl }','${video.shorttitle }')" 
	  											b_pic="../${video.litpic }">
	  											<IMG alt=${video.shorttitle } src="../${video.litpic }" width=124 height=97>
	  										</A>
	  										<DIV class=bg><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="images/gif.gif"></A></DIV>
	  										<DIV class=bf><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="images/ico_4.gif" width=10 height=19></A></DIV>
	  									</DIV>
	  									
	  									<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">${video.shorttitle }&nbsp;</A></DIV>
	  									
	  									<DIV class=height1><SPAN class=c_grey>������</SPAN><A class=c_green target=_blank href="http://t.openv.com/zj/show.php?pid=finance_2008_1906">${video.writer }</A></DIV>
	  									<DIV><SPAN class=c_grey></SPAN> </DIV>
	  									<DIV>
	  										<A class=c_grey href="javascript:playerInner('dvdprogramme_20081024_6826943','${video.shorttitle }')">
	  											<IMG align=absMiddle src="images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;Ԥ�� 
	  										</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  										<A class=c_grey title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">��������</A>
	  									</DIV>
	  									<DIV class=line></DIV>
	  							
	  								</LI>
	  								
	  								
	  								
	  								<c:set var="count" value="${count + 1}"></c:set>
	  								</c:forEach>
								</UL>
							
								<SCRIPT>
						       		getPlaycount(); //��ȡ������
						       		chBord();       //�߿��ɫ
						       		b_imgchangeauto(); //��ͼ�л�
					     		</SCRIPT>
							</DIV>
							
							<DIV class=list_font>
								<UL>
									<LI><A class=c_grey target=_play href="#">[�ȵ�]���Ӿ���Ƶ���ذ��İ�</A> 
								  	<LI><A class=c_grey target=_play href="#">[ʵ��]͵������Χ���߱���</A> 
								  	<LI><A class=c_grey target=_play href="#">[�ȵ�]08�¾���龫̽��1��</A> 
								  	<LI><A class=c_grey target=_play href="#">[�Ƽ�]CCTV-2ֱ�������ֽ��ڷ籩</A> 
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
		<!-- ���ݽ���  -->
		
		<DIV class=clear></DIV>
		
		<DIV class=swf_menu>
			<DIV class=left></DIV>
			<DIV class=mid>
			<UL id=swf_tag>
			  	<LI class="hand expli c_white b f14">�ȵ�
			  	<LI class="hand c_black b f14">��ҵ����
			  	<LI class="hand c_black b f14">��־�ɹ�
			  	<LI class="hand c_black b f14">Ӫ������
			  	<LI class="hand c_black b f14">���ý���
			  	<LI class="hand c_black b f14">Ͷ�����
			  	<LI class="hand c_black b f14">�Ƹ�����
			  	<LI class="hand c_black b f14">��ʦ���� </LI>
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
<!-- ��� ��ʼ -->
<!--
<SCRIPT language=JavaScript1.1 src="images/page=1&amp;pindao=homepage&amp;position=bottom_1"></SCRIPT>
-->
<!-- ��� ���� -->

<!-- �Ƽ�ר�� -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="#">��ҵ��־</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="#">&nbsp;��ҵ&nbsp;</A> 
  					<LI><A class=c_grey2 target=_play href="#">&nbsp;��־&nbsp;</A> 
					</LI>
				</UL>
			</DIV>
			<DIV id=L_1_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_1_UL',0)" border=0 align=absMiddle src="images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
				<IMG class=M_L onclick="M_L_Move('L_1_UL',1)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
				<IMG class=M_L onclick="M_L_Move('L_1_UL',2)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
				<IMG class=hand onClick="M_L_Move('L_1_UL',0,-1)" border=0 align=absMiddle src="images/ico_8.jpg" width=30 height=21>
				<IMG class=hand onClick="M_L_Move('L_1_UL',0,1)" border=0 align=absMiddle src="images/ico_9.jpg" width=30 height=21> 
			</DIV>
		</DIV>
		<DIV class=right></DIV>
	</DIV>
	<DIV class=clear></DIV>

<DIV class="content border">
	<UL id=L_1_UL class=four px="648">
		<DIV id="carve_encourage">
  			<img src="images/loading.gif" />
  		</DIV>
	</UL>
	
	<DIV class="tright more"><A class="b c_grey2" target=_blank href="#">����&gt;&gt;</A></DIV>
	<DIV class=clear></DIV>
</DIV>

<DIV class=bot></DIV>

<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- ��� ��ʼ -->
<!--
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
-->
<!-- ��� ���� -->

<!-- �����Ŀ -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="http://hd.openv.com/index_list.php?t=1">Ӫ������</A></SPAN> 
			<DIV class=bb>
			<UL>
  				<LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_293.html">&nbsp;����&nbsp;</A> 
  				<LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_231.html">&nbsp;Ӫ��&nbsp;</A> 
  				</LI>
  			</UL>
  		</DIV>
		<DIV id=L_2_UL_C class=fy>
			<IMG class=M_L onClick="M_L_Move('L_2_UL',0)" border=0 align=absMiddle src="images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
			<IMG class=M_L onclick="M_L_Move('L_2_UL',1)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
			<IMG class=M_L onclick="M_L_Move('L_2_UL',2)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
			<IMG class=hand onClick="M_L_Move('L_2_UL',0,-1)" border=0 align=absMiddle src="images/ico_8.jpg" width=30 height=21>
			<IMG class=hand onClick="M_L_Move('L_2_UL',0,1)" border=0 align=absMiddle src="images/ico_9.jpg" width=30 height=21> 
		</DIV>
	</DIV>
	<DIV class=right></DIV>
</DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_2_UL class=four px="636">
  
	<DIV id="market_manage">
  			<img src="images/loading.gif" />
  	
  	</DIV>
</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://hd.openv.com/index_list.php?t=1">����&gt;&gt;</A></DIV>

<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- ��� ��ʼ -->
<!--
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
-->
<!-- ��� ���� -->

<!-- ���ս�Ŀ -->

<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" href="#">�Ƹ�����</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="#">&nbsp;�Ƹ�&nbsp;</A> 
					<LI><A class=c_grey2 target=_play href="#">&nbsp;����&nbsp;</A> 
  					</LI>
  				</UL>
  			</DIV>
  			
  			<DIV id=L_3_UL_C class=fy>
  				<IMG class=M_L onClick="M_L_Move('L_3_UL',0)" border=0 align=absMiddle src="images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
  				<IMG class=M_L onclick="M_L_Move('L_3_UL',1)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
  				<IMG class=M_L onclick="M_L_Move('L_3_UL',2)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
  				<IMG class=hand onClick="M_L_Move('L_3_UL',0,-1)" border=0 align=absMiddle src="images/ico_8.jpg" width=30 height=21>
  				<IMG class=hand onClick="M_L_Move('L_3_UL',0,1)" border=0 align=absMiddle src="images/ico_9.jpg" width=30 height=21> 
  			</DIV>
  		</DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_3_UL class=four px="636">
	<DIV id="fortune_life">
  			<img src="images/loading.gif" />
  	
  	</DIV>
</UL>

<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="#">����&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>

<!-- �������� -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" href="#">���ý���</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play href="#">&nbsp;����&nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="#">&nbsp;����&nbsp;</A> 
  </LI>
</UL>
</DIV>
<DIV id=L_4_UL_C class=fy>
<IMG class=M_L onClick="M_L_Move('L_4_UL',0)" border=0 align=absMiddle src="images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
<IMG class=M_L onclick="M_L_Move('L_4_UL',1)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
<IMG class=M_L onclick="M_L_Move('L_4_UL',2)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
<IMG class=hand onClick="M_L_Move('L_4_UL',0,-1)" border=0 align=absMiddle src="images/ico_8.jpg" width=30 height=21>
<IMG class=hand onClick="M_L_Move('L_4_UL',0,1)" border=0 align=absMiddle src="images/ico_9.jpg" width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_4_UL class=four px="636">
  
	<DIV id="economy_finance">
  			<img src="images/loading.gif" />  	
  	</DIV>

</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://sports.openv.com/">����&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- ����Ӱ�Ӿ� -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" href="http://hd.openv.com/index.shtml">�ɹ�����</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play href="#">&nbsp;�����̵ĳ��� &nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="#">&nbsp;Ļ��ŮӢ��&nbsp;</A> 


  </LI></UL></DIV>
<DIV id=L_5_UL_C class=fy>
	<IMG class=M_L onClick="M_L_Move('L_5_UL',0)" border=0 align=absMiddle src="images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
	<IMG class=M_L onclick="M_L_Move('L_5_UL',1)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
	<IMG class=M_L onclick="M_L_Move('L_5_UL',2)" border=0 align=absMiddle src="images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
	<IMG class=hand onClick="M_L_Move('L_5_UL',0,-1)" border=0 align=absMiddle src="images/ico_8.jpg" width=30 height=21>
	<IMG class=hand onClick="M_L_Move('L_5_UL',0,1)" border=0 align=absMiddle src="images/ico_9.jpg" width=30 height=21> </DIV></DIV>
	<DIV class=right></DIV>
</DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_5_UL class=four px="636">
	<DIV id="xxxxxx">
  			<img src="images/loading.gif" />  	
  	</DIV>
</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://hd.openv.com/index.shtml">����&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- ��ǧ���� -->
<!-- �������� -->

</DIV>

<!-- ���а� -->
<DIV id=sider_box>
	<img src="images/loading.gif" />
</DIV>
<!-- ���ӽ�Ŀ��ȫ -->
<DIV class=clear></DIV>

<DIV style="DISPLAY: none" id=dsjmdq class=dq_content><!-- -->


<!-- -->
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>


<DIV style="PADDING-TOP: 2px"></DIV></DIV>
<DIV class=clear></DIV></DIV>

<!-- ͳ�� ��ʼ-->

<!-- ͳ�� ����--><!--usetime:0.180598974228--></BODY></HTML>
