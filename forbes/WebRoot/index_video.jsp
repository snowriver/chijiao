<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>赤脚网 - 学习视频 - 全力打造创业者学习和交流平台</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=Keywords content="OpenV,天线视频,电视节目,视频,栏目,点播,视频搜索">
<META name=Description 
content=在线点播、观看和订阅电视节目与视频，搜索互联网海量的视频内容，享受高清晰视频、电视节目、电影、电视剧的完美体验。汇集中央电视台、凤凰卫视、湖南卫视、上海文广、华娱，以及全国各省市电视台的所有电视节目和港台综艺节目，覆盖新闻、娱乐、体育、奥运、财经、时尚、汽车等栏目。>

<LINK rel=stylesheet type=text/css href="css/generl200809.css">
<LINK rel=stylesheet type=text/css href="css/index200809.css">
<LINK rel=stylesheet type=text/css href="css/supev.css">

<STYLE>.M_L {
	CURSOR: pointer
}
.hand {
	CURSOR: pointer
}
</STYLE>

<SCRIPT src="js/jquery/jquery.js"></SCRIPT>


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
    tmp = $('#'+sid);
    var msg = $('#M_L_MSG');
    if(tmp.length<1){
      msg.show();
      $.get('MyJsp.jsp',{id:sid},function(data){
       _con.append(data);
       if(pn==_swftag.attr('pn')){
         _con.children('div').each(function(){
           $(this).hide();
         });
         $('#'+sid).show();
       }
       chBord();
      },'html');
    } else {
      _con.children('div').each(function(){
       $(this).hide();
      });
      tmp.show();
    }
    playComm("PAUSE");
  }
  
  function getPlaycount(){  //获取播放数
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
  
  function listVideos(type, divid){
						$.ajax({
						url: 'VideoIndex.do',
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
						url: 'video/TopVideoList.do',
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
				
  $(window).bind("load",function(){
		listVideos(7, "market_manage");
		listVideos(7, "carve_encourage");
		listVideos(7, "fortune_life");
		listVideos(7, "economy_finance");
		listComps();
        }
	);
</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="index" value="video"></c:set>

<DIV id=wrapper><!-- 头引用 开始 -->
	<%@ include file="include/header.jsp"%>

	<!-- 头引用 结束 -->
	<DIV class=clear></DIV><!-- 导航 开始 -->


	<!-- 导航 结束 -->
	<DIV class=clear></DIV><!-- 广告 开始 -->
	<SCRIPT language=JavaScript1.1 src=""></SCRIPT>

	<DIV class=clear></DIV><!-- 广告 结束 --><!-- 二级导航 开始 --><!--script src="http://t.openv.com/zt/inc/openv_sub_nvg.js"></script--><!-- 二级导航 结束 -->
	<DIV class=clear></DIV>
	<DIV class=tj><!-- 滚动推荐 -->
		<DIV class="title c_grey2 b">火辣播报： 
		<SPAN id=top_tj>
			<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/pro_play-hdprog_20081022_6819657.html">&nbsp;印度卫星插国旗上月球紧逼中国&nbsp;</A> 
			<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://www.openv.com/play/CCTVNEWSnews_20081021_6810868_0.html">&nbsp;微软“黑屏”行动遭反对声浪&nbsp;</A> 
			<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/tv_play-hdteleplay_20081019_6804247.html">&nbsp;丑女无敌完整版&nbsp;</A> 
			<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822371.html">&nbsp;郭晋安蒙嘉慧《与敌同行》精彩欣赏 &nbsp;</A> 
			<A style="DISPLAY: none" class="c_green nob" target=_blank href="http://www.openv.com/play/dvdprogramme_20081022_6816299_0.html">&nbsp;黎姿含泪宣布退出娱乐圈&nbsp;</A> 
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

	<DIV class=clear></DIV><!-- 内容 开始  -->
	<DIV class=content><!-- Loadding 开始 -->
		<DIV style="Z-INDEX: 99; POSITION: absolute; MARGIN: 265px 0px 0px 875px; DISPLAY: none" id=M_L_MSG>
			<IMG src="video/images/loading.gif" width=50 height=50> 
		</DIV><!-- Loadding 结束 -->
		<DIV id=M_L_0>
			<DIV class=left></DIV>
			<DIV class=mid><!-- 播放器 开始 -->
				<DIV id=play_swf class=swf>
					<DIV pn="-1"><!-- 大图 --></DIV>
					<DIV style="DISPLAY: none"><!-- 播放器 --></DIV>
				</DIV><!-- 播放器 结束 -->
				<DIV class=js>
					<DIV class=js_top></DIV>
					<DIV class=js_mid>
						<DIV class=title1>
							<A class="f14 b c_white" href="http://www.openv.com/">精彩推荐</A> 
							<DIV id=M_L_0_UL_C class=fy>
								<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,-1)" align=absMiddle src="video/images/js_jian1.jpg" width=8 height=16> 
								<IMG class=M_L onClick="M_L_Move('M_L_0_UL',0)" align=absMiddle src="video/images/ico_2.jpg" width=8 height=8> 
								<IMG class=M_L onClick="M_L_Move('M_L_0_UL',1)" align=absMiddle src="video/images/ico_3.jpg" width=8 height=8> 
								<IMG class=M_L onClick="M_L_Move('M_L_0_UL',2)" align=absMiddle src="video/images/ico_3.jpg" width=8 height=8> 
								<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,1)" align=absMiddle src="video/images/js_jian2.jpg" width=8 height=16> 
							</DIV>
						</DIV>
						<DIV class=list_img>
							<UL id=M_L_0_UL px="492">
								<c:set var="count" value="1"></c:set>
								<c:forEach items="${VIDEO_LIST}" var="video">
								<c:if test="${count % 2 == 1}">	
  								<LI>
  									<DIV class=img name="chborder">
  										<A title="${video.shorttitle }" target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html" 
  											content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl }','${video.shorttitle }')" 
  											b_pic="${video.litpic }">
  											<IMG alt=${video.shorttitle } src="${video.litpic }" width=124 height=97>
  										</A>
  										<DIV class=bg><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="video/images/gif.gif"></A></DIV>
  										<DIV class=bf><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="video/images/ico_4.gif" width=10 height=19></A></DIV>
  									</DIV>
  									
  									<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">${video.shorttitle }&nbsp;</A></DIV>
  									
  									<DIV class=height1><SPAN class=c_grey>主讲：</SPAN><A class=c_green target=_blank href="http://t.openv.com/zj/show.php?pid=finance_2008_1906">${video.writer }</A></DIV>
  									<DIV><SPAN class=c_grey></SPAN> </DIV>
  									<DIV>
  										<A class=c_grey href="javascript:playerInner('dvdprogramme_20081024_6826943','${video.shorttitle }')">
  											<IMG align=absMiddle src="video/images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;预览 
  										</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  										<A class=c_grey title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">完整播放</A>
  									</DIV>
  									<DIV class=line></DIV>
  								<LI>
  								</LI>
  								</c:if>
  								
  								<c:if test="${count % 2 == 0}">	
  								<DIV class=img name="chborder">
  									<A title=${video.shorttitle } target=_play href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html" 
  										content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl }','${video.shorttitle }')" 
  										b_pic="${video.litpic }">
  										<IMG alt=${video.shorttitle } src="${video.litpic }" width=124 height=97>
  									</A>
  									<DIV class=bg><A title=${video.shorttitle } target=_play href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG src="video/images/gif.gif"></A></DIV>
  									<DIV class=bf><A title=${video.shorttitle } target=_play href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG src="video/images/ico_4.gif" width=10 height=19></A></DIV>
  								</DIV>
  								<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html">${video.shorttitle }&nbsp;</A></DIV>
  								<DIV class=height1><SPAN class=c_grey>主讲：</SPAN><A class=c_green>${video.writer }</A></DIV>
  								
  								<DIV><SPAN class=c_grey></SPAN> </DIV>
  								<DIV>
  									<A class=c_grey href="javascript:playerInner('${video.firstVideoUrl.url }','${video.shorttitle }')"><IMG align=absMiddle src="video/images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;预览 </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  									<A class=c_grey title=${video.shorttitle } target=_play href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html">完整播放</A>
  								</DIV>
  								<DIV class=line></DIV>
  								</c:if>
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
  <LI><A class=c_grey target=_play 
  href="http://finance.cctv.com/special/C22514/02/index.shtml">[热点] 
  央视经济频道重磅改版</A> 
  <LI><A class=c_grey target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826709_0.html">[实拍] 
  偷车贼遭围观者暴打</A> 
  <LI><A class=c_grey target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822397.html">[热点]&nbsp;08新剧古灵精探第1集</A> 

  <LI><A class=c_grey target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1822">[推荐] CCTV-2 
  直击华尔街金融风暴</A> </LI></UL></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=js_bot></DIV></DIV></DIV>
<DIV class=right></DIV></DIV></DIV><!-- 内容结束  -->
<DIV class=clear></DIV>
<DIV class=swf_menu>
<DIV class=left></DIV>
<DIV class=mid>
<UL id=swf_tag>
  <LI class="hand expli c_white b f14">热点
  <LI class="hand c_black b f14">创业人生
  <LI class="hand c_black b f14">励志成功
  <LI class="hand c_black b f14">营销管理
  <LI class="hand c_black b f14">经济金融
  <LI class="hand c_black b f14">投资理财
  <LI class="hand c_black b f14">财富观念
  <LI class="hand c_black b f14">名师名家 </LI></UL>
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
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>
<DIV id=contain>
<DIV class=siderA_box>
<!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src="video/images/page=1&amp;pindao=homepage&amp;position=bottom_1"></SCRIPT>
<!-- 广告 结束 -->

<!-- 推荐专辑 -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="http://zj.openv.com/">创业励志</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="http://t.openv.com/zj/show.php?pid=bt_2008_1812">&nbsp;创业&nbsp;</A> 
  					<LI><A class=c_grey2 target=_play href="http://t.openv.com/zj/show.php?pid=ent_2008_1872">&nbsp;励志&nbsp;</A> 
					</LI>
				</UL>
			</DIV>
			<DIV id=L_1_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_1_UL',0)" border=0 align=absMiddle src="video/images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
				<IMG class=M_L onclick="M_L_Move('L_1_UL',1)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
				<IMG class=M_L onclick="M_L_Move('L_1_UL',2)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
				<IMG class=hand onClick="M_L_Move('L_1_UL',0,-1)" border=0 align=absMiddle src="video/images/ico_8.jpg" width=30 height=21>
				<IMG class=hand onClick="M_L_Move('L_1_UL',0,1)" border=0 align=absMiddle src="video/images/ico_9.jpg" width=30 height=21> 
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
	
	<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://zj.openv.com/">更多&gt;&gt;</A></DIV>
	<DIV class=clear></DIV>
</DIV>

<DIV class=bot></DIV>

<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
<!-- 广告 结束 -->

<!-- 高清节目 -->
<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" target=_blank href="http://hd.openv.com/index_list.php?t=1">营销管理</A></SPAN> 
			<DIV class=bb>
			<UL>
  				<LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_293.html">&nbsp;管理&nbsp;</A> 
  				<LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_231.html">&nbsp;营销&nbsp;</A> 
  				</LI>
  			</UL>
  		</DIV>
		<DIV id=L_2_UL_C class=fy>
			<IMG class=M_L onClick="M_L_Move('L_2_UL',0)" border=0 align=absMiddle src="video/images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
			<IMG class=M_L onclick="M_L_Move('L_2_UL',1)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
			<IMG class=M_L onclick="M_L_Move('L_2_UL',2)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
			<IMG class=hand onClick="M_L_Move('L_2_UL',0,-1)" border=0 align=absMiddle src="video/images/ico_8.jpg" width=30 height=21>
			<IMG class=hand onClick="M_L_Move('L_2_UL',0,1)" border=0 align=absMiddle src="video/images/ico_9.jpg" width=30 height=21> 
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
<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://hd.openv.com/index_list.php?t=1">更多&gt;&gt;</A></DIV>

<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
<!-- 广告 结束 -->

<!-- 综艺节目 -->

<DIV class=siderC_box>
	<DIV class=title>
		<DIV class=left></DIV>
		<DIV class=mid>
			<SPAN><A class="f14 b c_black" href="http://ent.openv.com/">财富人生</A></SPAN> 
			<DIV class=bb>
				<UL>
					<LI><A class=c_grey2 target=_play href="http://movie.openv.com/">&nbsp;财富&nbsp;</A> 
					<LI><A class=c_grey2 target=_play href="http://fashion.openv.com/">&nbsp;人生&nbsp;</A> 
  					</LI>
  				</UL>
  			</DIV>
  			
  			<DIV id=L_3_UL_C class=fy>
  				<IMG class=M_L onClick="M_L_Move('L_3_UL',0)" border=0 align=absMiddle src="video/images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
  				<IMG class=M_L onclick="M_L_Move('L_3_UL',1)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
  				<IMG class=M_L onclick="M_L_Move('L_3_UL',2)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
  				<IMG class=hand onClick="M_L_Move('L_3_UL',0,-1)" border=0 align=absMiddle src="video/images/ico_8.jpg" width=30 height=21>
  				<IMG class=hand onClick="M_L_Move('L_3_UL',0,1)" border=0 align=absMiddle src="video/images/ico_9.jpg" width=30 height=21> 
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
<DIV class="tright more"><A class="b c_grey2" target=_blank href="http://ent.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>

<!-- 体育赛事 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://sports.openv.com/">经济金融</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_8302.html">&nbsp;经济&nbsp;</A> 
  <LI><A class=c_grey2 target=_play href="http://tv.openv.com/col_8346.html">&nbsp;金融&nbsp;</A> 
  </LI>
</UL>
</DIV>
<DIV id=L_4_UL_C class=fy>
<IMG class=M_L onClick="M_L_Move('L_4_UL',0)" border=0 align=absMiddle src="video/images/ico_7.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
<IMG class=M_L onclick="M_L_Move('L_4_UL',1)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp;&nbsp; 
<IMG class=M_L onclick="M_L_Move('L_4_UL',2)" border=0 align=absMiddle src="video/images/ico_6.jpg" width=7 height=7>&nbsp;&nbsp; 
<IMG class=hand onClick="M_L_Move('L_4_UL',0,-1)" border=0 align=absMiddle src="video/images/ico_8.jpg" width=30 height=21>
<IMG class=hand onClick="M_L_Move('L_4_UL',0,1)" border=0 align=absMiddle src="video/images/ico_9.jpg" width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_4_UL class=four px="636">
  
	<DIV id="economy_finance">
  			<img src="images/loading.gif" />
  	
  	</DIV>

</UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://sports.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 高清影视剧 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://hd.openv.com/index.shtml">高清影视剧</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20081013_6779072.html">&nbsp;百万富翁的初恋 
  &nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20081017_6795692.html">&nbsp;幕后女英雄&nbsp;</A> 

  <LI><A class=c_grey2 target=_play 
  href="http://hd.openv.com/mov_play-hdmovieclips_20081009_6765656.html">&nbsp;妓房动乱事件&nbsp;</A> 

  <LI><A class=c_grey2 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20081014_6784194.html">&nbsp;鸦魔战士&nbsp;</A> 
  </LI></UL></DIV>
<DIV id=L_5_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_5_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_5_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_5_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_5_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_5_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_5_UL class=four px="636">
  <LI>
  <DIV class=img><A title=丑女无敌完整版 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081017_6796178.html"><IMG 
  alt=丑女无敌完整版 
  src="video/images/20081023_dvdprogramme_Programme_131559607_1002.529.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=丑女无敌完整版 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081017_6796178.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=丑女无敌完整版 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081017_6796178.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=丑女无敌完整版 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081017_6796178.html">丑女无敌完整版</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>林无敌，是刚走出校门的金融硕士。成绩优异、能力超群，可就是找不到体面的工作。主要是因为她比较抱歉的长相和落后时代20年的穿着打扮...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=李小龙传奇全集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG 
  alt=李小龙传奇全集 
  src="video/images/20081023_dvdprogramme_Programme_092631456_1179.600.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=李小龙传奇全集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=李小龙传奇全集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=李小龙传奇全集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html">李小龙传奇全集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>李小龙年少时无心学业，却对武术着迷，他在一次街头殴斗中失败，从此拜在了叶问大师父的名下铁心学武，如饥似渴，乃至疯狂...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=贝多芬病毒第10集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081010_6769469.html"><IMG 
  alt=贝多芬病毒第10集 
  src="video/images/20081010_dvdprogramme_Programme_152224755_3343.302.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=贝多芬病毒第10集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081010_6769469.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=贝多芬病毒第10集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081010_6769469.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=贝多芬病毒第10集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081010_6769469.html">贝多芬病毒第10集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>贝多芬病毒是部关于被音乐抛弃也抛弃了音乐的人,组织了交响乐团并遭遇到的问题.这故事主题是古典音乐让人联想到日本漫画 
  “交响情人梦”</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=越狱第四季第8集 target=_play 
  href="http://hd.openv.com/tv_play-teleplay_20081022_6817219.html"><IMG 
  alt=越狱第四季第8集 
  src="video/images/20081007_dvdprogramme_Programme_155512148_1279.718.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=越狱第四季第8集 target=_play 
  href="http://hd.openv.com/tv_play-teleplay_20081022_6817219.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=越狱第四季第8集 target=_play 
  href="http://hd.openv.com/tv_play-teleplay_20081022_6817219.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=越狱第四季第8集 target=_play 
  href="http://hd.openv.com/tv_play-teleplay_20081022_6817219.html">越狱第四季第8集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>就当他们以为自己已经逃脱升天时，却又被重新卷入前所未有的恐怖逃亡。迈克尔-斯科菲尔德阴差阳错地被投入了监狱...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=实习医生格蕾第4集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817584.html"><IMG 
  alt=实习医生格蕾第4集 
  src="video/images/20081022_dvdprogramme_Programme_165531280_2264.280.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=实习医生格蕾第4集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817584.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=实习医生格蕾第4集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817584.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=实习医生格蕾第4集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817584.html">实习医生格蕾第4集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>菲尔普斯“很认真，很搞笑”地客串《实习医生格蕾》。赤裸上身、下身只有一件泳裤的他化身从伊拉克完成任务回到为西雅图格蕾丝医院的医生...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=绝望主妇第五季 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817637.html"><IMG 
  alt=绝望主妇第五季 
  src="video/images/20081022_dvdprogramme_Programme_165636907_313.769.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=绝望主妇第五季 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817637.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=绝望主妇第五季 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817637.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=绝望主妇第五季 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817637.html">绝望主妇第五季</A></DIV>
  <DIV class=ly><SPAN class=c_black>故事是从Mary 
  为了掩盖一个惊天秘密而自杀身亡开始的。每集中，她都会以逝者的身份，从局外人的角度，用旁白的方式讲述朋友的生活...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=英雄第三季第6集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6820866.html"><IMG 
  alt=英雄第三季第6集 
  src="video/images/20081022_dvdprogramme_Programme_192258087_1331.725.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=英雄第三季第6集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6820866.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=英雄第三季第6集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6820866.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=英雄第三季第6集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6820866.html">英雄第三季第6集</A></DIV>
  <DIV class=ly><SPAN class=c_black>Nathan被刺杀，在场的 
  Peter和Matt被此事弄了个措手不及陷入慌乱，新闻发布会也不得不提前结束...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=无敌珊宝妹第9集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081021_6811776.html"><IMG 
  alt=无敌珊宝妹第9集 
  src="video/images/20081006_dvdprogramme_Programme_183919744_2396.252.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=无敌珊宝妹第9集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081021_6811776.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=无敌珊宝妹第9集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081021_6811776.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=无敌珊宝妹第9集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081021_6811776.html">无敌珊宝妹第9集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>心里受创的小珊宝，救起了木桶里的小无敌，并把伤心三宝饭给了小无敌，这盒饭变成了无敌一辈子难忘的味道…</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=黑糖群侠传第13集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820712.html"><IMG 
  alt=黑糖群侠传第13集 
  src="video/images/20081023_dvdprogramme_Programme_095624344_2400.917.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=黑糖群侠传第13集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820712.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=黑糖群侠传第13集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820712.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=黑糖群侠传第13集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820712.html">黑糖群侠传第13集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>「黑糖群侠传」是一部集合韩国火山高校的张力、英国哈利波特的情绪、香港龙虎门的镜头的偶像连续剧...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=超人前传第八季第5集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817878.html"><IMG 
  alt=超人前传第八季第5集 
  src="video/images/20081022_dvdprogramme_Programme_182336820_1124.755.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=超人前传第八季第5集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817878.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=超人前传第八季第5集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817878.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=超人前传第八季第5集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817878.html">超人前传第八季第5集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>这部现代重拍版的超人传奇还有其经典的人物角色都将继续，融合真实性，动作和情感深度来对这个经久不衰的传奇进行全新的诠释...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=死神第191集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820896.html"><IMG 
  alt=死神第191集 
  src="video/images/20081023_dvdprogramme_Programme_091749301_478.941.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=死神第191集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820896.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=死神第191集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820896.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=死神第191集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6820896.html">死神第191集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>黑崎一护是个看似单薄却满身热血少年，并且拥有能看见灵的体质。一护每天七点必须按时回家否则老爸便会使用“身体语言教训”的暴力家规...</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div-->
  <LI>
  <DIV class=img><A title=海贼王第374集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081013_6779141.html"><IMG 
  alt=海贼王第374集 
  src="video/images/20081022_dvdprogramme_Programme_165905110_179.080.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=海贼王第374集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081013_6779141.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=海贼王第374集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081013_6779141.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=海贼王第374集 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081013_6779141.html">海贼王第374集</A></DIV>
  <DIV class=ly><SPAN 
  class=c_black>主角路飞是一个和朋友有过承诺的人，在他的脑子里有着唯一的信念，那就是“我是要成为海贼王的男人!”。</SPAN></DIV><!--div class="bf1"><span class="c_black">播放数：</span><span class="c_orange"></span></div--></LI></UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://hd.openv.com/index.shtml">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV>
<!-- 大千世界 -->
<!-- 网友热搜 -->

</DIV>

<!-- 排行榜 -->
<DIV id=sider_box>
	<img src="images/loading.gif" />
</DIV>
<!-- 电视节目大全 -->
<DIV class=clear></DIV>

<DIV style="DISPLAY: none" id=dsjmdq class=dq_content><!-- -->


<!-- -->
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>
<SCRIPT 
src="video/images/zt_foot.js"></SCRIPT>

<DIV style="PADDING-TOP: 2px"></DIV></DIV>
<DIV class=clear></DIV></DIV>

<!-- 统计 开始-->
<SCRIPT 
src="video/images/vmis.php"></SCRIPT>
<!-- 统计 结束--><!--usetime:0.180598974228--></BODY></HTML>
