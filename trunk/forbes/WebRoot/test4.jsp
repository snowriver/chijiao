<%@page contentType="text/html; charset=utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0021)http://www.openv.com/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>天线视频 - OpenV - 电视节目 - 视频 - 视频搜索 - 改变看法</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=Keywords content=OpenV,天线视频,电视节目,视频,栏目,点播,视频搜索>
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
<SCRIPT type=text/javascript src="js/common.js"></SCRIPT>

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
    var swf_path = 'http://img.openv.tv/openvcom/swf/player.swf';
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

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<DIV id=wrapper><!-- 头引用 开始 -->







<DIV id=header>
<DIV class=logo><A href="http://localhost/sv/"><IMG alt=SupeV 
src="SupeV%20-%20Powered%20by%20SupeV_files/logo.gif" width=146 height=38></A> 
</DIV>
<DIV class=toolnav>
<A  href="http://localhost/sv/">首页</A> 
<A class=toolnav_on
href="http://localhost/sv/ivideo.php">视频</A> <A 
href="http://localhost/sv/ispecial.php">专辑</A> <A 
href="http://localhost/sv/icategory.php">频道</A> </DIV>
<DIV class=topmenu>
<DIV class=topmenu_tools>
<SCRIPT type=text/javascript>
			dw('<ul>');
			dw('<li class="myname" style="background:none;"><a href="./vspace.php?mid=1">admin</a></li>');
			dw('<li class="myspace"><h3><a href="./vspacecp.php?mid=1" onmouseover="hide($(\'myvspace\'), \'\');" >我的</a></h3>');
			dw('<div class="myspace_on myspece_on_l" style="display:none;" id="myvspace" onmouseover="hide($(\'myvspace\'), \'\');" onmouseout="hide($(\'myvspace\'), \'none\');"><a href="./vspacecp.php?script=video&action=list">我的视频</a><a href="./vspacecp.php?script=specials&action=list">我的专辑</a><a href="./vspacecp.php?script=favs&action=list">我的收藏</a><a href="./vspacecp.php?script=subs&action=list">我的订阅</a><a href="./vspacecp.php?script=comments&action=list">我的评论</a><a href="./vspace.php?mid=1">我的空间</a></div>');
			dw('</li>');
			dw('<li><a href="./login.php?action=logout">退出</a></li>');
			dw('<li><a href="#" onclick="pmwin(\'open\')">短消息</a></li>');
			dw('<li><a href="./history.php">看过的节目</a></li>');
			dw('<li><a href="./playlist.php">点播单</a></li>');
			dw('<li class="myspace">');
			dw('<h3><a href="#" onmouseover="hide($(\'applist\'), \'\');hide($(\'showiframe\'), \'\');">应用导航</a></h3>');
			dw('<iframe class="myspace_on_iframebg" name="showiframe" id="showiframe" style="display:none;" frameborder="0" scrolling="no"></iframe>');
			dw('<div class="myspace_on myspece_on_r"  style="display:none;" id="applist" onmouseover="hide($(\'applist\'), \'\');hide($(\'showiframe\'), \'\');"  onmouseout="hide($(\'applist\'), \'none\'); hide($(\'showiframe\'), \'none\');"><a href="http://localhost/upload/home" title="���˿ռ�" target="_blank">���˿ռ�</a><a href="http://localhost/upload/bbs" title="Discuz! Board" target="_blank">Discuz! Board</a></div>');
			dw('</li>');
			dw('<li><a href="./help.php">帮助</a></li>');
			dw('</ul>');
		</SCRIPT>
</DIV>
<DIV class=searchtool>
<FORM method=post name=searchform_header action=./search.php>
<FIELDSET><LEGEND>视频搜索</LEGEND><INPUT size=30 name=keywords> <SELECT name=stype> 
  <OPTION selected value=0>视频</OPTION> <OPTION value=2>专辑</OPTION> <OPTION 
  value=1>用户</OPTION></SELECT><BUTTON name=search type=submit 
value="true">搜索</BUTTON> </FIELDSET> </FORM></DIV></DIV>
<DIV class=clear></DIV>
<DIV class=mainnav>
<UL>
  <LI style="BACKGROUND: none transparent scroll repeat 0% 0%"><A title="" 
  href="http://localhost/sv/category.php?cid=1">原创</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=2">娱乐</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=3">影视</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=4">动漫</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=5">游戏</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=6">美女</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=7">音乐</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=8">广告</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=9">体育</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=10">搞笑</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=11">旅游</A> </LI>
  <LI><A title="" href="http://localhost/sv/category.php?cid=12">生活</A> </LI></UL>
<P class=upvideo><A target=_blank 
href="http://localhost/sv/vspacecp.php?script=video&amp;action=upload">上传视频</A></P></DIV></DIV>

<!-- 头引用 结束 -->
<DIV class=clear></DIV><!-- 导航 开始 -->
<SCRIPT>nvg_name = 'shouye'</SCRIPT>

<SCRIPT 
src="video/js/openv_nvg.js"></SCRIPT>
<!-- 导航 结束 -->
<DIV class=clear></DIV><!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>

<DIV class=clear></DIV><!-- 广告 结束 --><!-- 二级导航 开始 --><!--script src="http://t.openv.com/zt/inc/openv_sub_nvg.js"></script--><!-- 二级导航 结束 -->
<DIV class=clear></DIV>
<DIV class=tj><!-- 滚动推荐 -->
<DIV class="title c_grey2 b">火辣播报： <SPAN id=top_tj><A style="DISPLAY: none" 
class="c_green nob" target=_blank 
href="http://hd.openv.com/pro_play-hdprog_20081022_6819657.html">&nbsp;印度卫星插国旗上月球紧逼中国&nbsp;</A> 
<A style="DISPLAY: none" class="c_green nob" target=_blank 
href="http://www.openv.com/play/CCTVNEWSnews_20081021_6810868_0.html">&nbsp;微软“黑屏”行动遭反对声浪&nbsp;</A> 
<A style="DISPLAY: none" class="c_green nob" target=_blank 
href="http://hd.openv.com/tv_play-hdteleplay_20081019_6804247.html">&nbsp;丑女无敌完整版&nbsp;</A> 
<A style="DISPLAY: none" class="c_green nob" target=_blank 
href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822371.html">&nbsp;郭晋安蒙嘉慧《与敌同行》精彩欣赏 
&nbsp;</A> <A style="DISPLAY: none" class="c_green nob" target=_blank 
href="http://www.openv.com/play/dvdprogramme_20081022_6816299_0.html">&nbsp;黎姿含泪宣布退出娱乐圈&nbsp;</A> 
</SPAN></DIV>
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
<DIV 
style="Z-INDEX: 99; POSITION: absolute; MARGIN: 265px 0px 0px 875px; DISPLAY: none" 
id=M_L_MSG><IMG 
src="video/images/loading.gif" 
width=50 height=50> </DIV><!-- Loadding 结束 -->
<DIV id=M_L_0>
<DIV class=left></DIV>
<DIV class=mid><!-- 播放器 开始 -->
<DIV id=play_swf class=swf>
<DIV pn="-1"><!-- 大图 --></DIV>
<DIV style="DISPLAY: none"><!-- 播放器 --></DIV></DIV><!-- 播放器 结束 -->
<DIV class=js>
<DIV class=js_top></DIV>
<DIV class=js_mid>
<DIV class=title1><A class="f14 b c_white" href="http://www.openv.com/">精彩推荐</A> 

<DIV id=M_L_0_UL_C class=fy><IMG class=hand onClick="M_L_Move('M_L_0_UL',0,-1)" 
align=absMiddle 
src="video/images/js_jian1.jpg" 
width=8 height=16> <IMG class=M_L onClick="M_L_Move('M_L_0_UL',0)" 
align=absMiddle 
src="video/images/ico_2.jpg" 
width=8 height=8> <IMG class=M_L onClick="M_L_Move('M_L_0_UL',1)" 
align=absMiddle 
src="video/images/ico_3.jpg" 
width=8 height=8> <IMG class=M_L onClick="M_L_Move('M_L_0_UL',2)" 
align=absMiddle 
src="video/images/ico_3.jpg" 
width=8 height=8> <IMG class=hand onClick="M_L_Move('M_L_0_UL',0,1)" 
align=absMiddle 
src="video/images/js_jian2.jpg" 
width=8 height=16> </DIV></DIV>
<DIV class=list_img>
<UL id=M_L_0_UL px="492">
  <LI>
  <DIV class=img name="chborder"><A title=央视经济频道重磅改版 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html" 
  content="%E4%BD%9C%E4%B8%BA%E4%B8%AD%E5%9B%BD%E7%BB%8F%E6%B5%8E%E6%8A%A5%E9%81%93%E9%A2%86%E5%9F%9F%E9%87%8D%E5%9C%B0%E7%9A%84%E5%A4%AE%E8%A7%86%E7%BB%8F%E6%B5%8E%E9%A2%91%E9%81%93%EF%BC%8C%E4%BB%A5%E2%80%9C%E5%BC%BA%E5%8C%96%E7%BB%8F%E6%B5%8E%E7%89%B9%E8%89%B2%E2%80%9D%E4%B8%BA%E5%AE%97%E6%97%A8%E7%9A%84%E6%94%B9%E7%89%88%EF%BC%8C%E5%8D%B3%E5%B0%86%E6%8F%AD%E5%BC%80%E5%85%B6%E7%A5%9E%E7%A7%98%E7%9A%84%E9%9D%A2%E7%BA%B1%E3%80%82" 
  view="javascript:playerInner('dvdprogramme_20081024_6826943','央视经济频道重磅改版')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081024/20081024_1831130290748645.jpg"><IMG 
  alt=央视经济频道重磅改版 
  src="video/images/20081024_1832407325059494.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=央视经济频道重磅改版 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=央视经济频道重磅改版 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=央视经济频道重磅改版 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">央视经济频道重磅改版&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>专题：</SPAN><A class=c_green target=_blank 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1906">华尔街风云</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('dvdprogramme_20081024_6826943','央视经济频道重磅改版')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=央视经济频道重磅改版 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=李小龙传奇 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html" 
  content="%E6%9D%8E%E5%B0%8F%E9%BE%99%E5%B9%B4%E5%B0%91%E6%97%B6%E6%97%A0%E5%BF%83%E5%AD%A6%E4%B8%9A%EF%BC%8C%E5%8D%B4%E5%AF%B9%E6%AD%A6%E6%9C%AF%E7%9D%80%E8%BF%B7%EF%BC%8C%E4%BB%96%E5%9C%A8%E4%B8%80%E6%AC%A1%E8%A1%97%E5%A4%B4%E6%AE%B4%E6%96%97%E4%B8%AD%E5%A4%B1%E8%B4%A5%EF%BC%8C%E4%BB%8E%E6%AD%A4%E6%8B%9C%E5%9C%A8%E4%BA%86%E5%8F%B6%E9%97%AE%E5%A4%A7%E5%B8%88%E7%88%B6%E7%9A%84%E5%90%8D%E4%B8%8B%E9%93%81%E5%BF%83%E5%AD%A6%E6%AD%A6..." 
  view="javascript:playerInner('hdteleplay_20081022_6817862','李小龙传奇')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081024/20081024_0847379149331972.jpg"><IMG 
  alt=李小龙传奇 
  src="video/images/20081024_0847473073873960.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=李小龙传奇 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=李小龙传奇 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=李小龙传奇 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html">李小龙传奇&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>主演：</SPAN><A class=c_green>陈国坤</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('hdteleplay_20081022_6817862','李小龙传奇')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=李小龙传奇 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081022_6817862.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=麦凯恩被俘录像曝光 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826811_0.html" 
  content="%E7%BE%8E%E5%9B%BD%E5%85%B1%E5%92%8C%E5%85%9A%E6%80%BB%E7%BB%9F%E7%AB%9E%E9%80%89%E4%BA%BA%E7%BA%A6%E7%BF%B0-%E9%BA%A6%E5%87%AF%E6%81%A9%E6%9C%80%E5%BC%95%E4%B8%BA%E8%87%AA%E8%B1%AA%E7%9A%84%E4%B8%80%E6%AE%B5%E7%BB%8F%E5%8E%86%EF%BC%8C%E5%B0%B1%E6%98%AF%E4%BB%96%E5%9C%A8%E5%8C%97%E8%B6%8A%E5%BA%A6%E8%BF%87%E7%9A%845%E5%B9%B4%E6%88%98%E4%BF%98%E5%B2%81%E6%9C%88%E3%80%82%E5%A6%82%E6%9E%9C%E4%BD%A0%E8%A6%81%E6%B1%82%E4%BB%96%E6%8F%90%E4%BE%9B%E8%BF%99%E6%AE%B5%E7%BB%8F%E5%8E%86%E7%9A%84%E8%A7%81%E8%AF%81%E4%BA%BA%EF%BC%8C%E4%BB%96%E5%BE%88%E5%8F%AF%E8%83%BD%E4%BC%9A%E4%B8%8D.." 
  view="javascript:playerInner('dvdprogramme_20081024_6826811','麦凯恩被俘录像曝光')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081024/20081024_1531586425579214.jpg"><IMG 
  alt=麦凯恩被俘录像曝光 
  src="video/images/20081024_1531586425579214.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=麦凯恩被俘录像曝光 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826811_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=麦凯恩被俘录像曝光 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826811_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=麦凯恩被俘录像曝光 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826811_0.html">麦凯恩被俘录像曝光&nbsp;</A></DIV>
  <DIV class=height1><A class=c_green target=_blank 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">专辑：美国大选</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('dvdprogramme_20081024_6826811','麦凯恩被俘录像曝光')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=麦凯恩被俘录像曝光 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826811_0.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=日称我核潜艇恐吓美日 target=_play 
  href="http://www.openv.com/play/PhoenixTV1prog_20081022_6819658_0.html" 
  content="%E6%97%A5%E5%AA%92%E7%A7%B0%EF%BC%8C10%E6%9C%88%E4%B8%8A%E6%97%AC%E4%B8%AD%E5%9B%BD%E6%9B%BE%E6%B4%BE%E5%87%BA%E4%B8%A4%E8%89%98%E6%BD%9C%E8%89%87%E7%A7%98%E5%AF%86%E7%9B%91%E8%A7%86%E2%80%9C%E5%8D%8E%E7%9B%9B%E9%A1%BF%E2%80%9D%E5%8F%B7%EF%BC%8C%E4%B8%AD%E5%9B%BD%E6%A0%B8%E6%BD%9C%E8%89%87%E5%AE%9E%E5%8A%9B%E4%B8%8D%E6%96%AD%E5%A2%9E%E5%BC%BA%EF%BC%8C%E6%9C%AC%E6%AC%A1%E9%99%A4%E4%BA%86%E5%88%BA%E6%8E%A2%E6%83%85%E6%8A%A5%EF%BC%8C%E8%BF%98%E6%9C%89%E5%90%91%E6%97%A5%E7%BE%8E%E5%8F%91%E5%87%BA%E6%81%90%E5%90%93%E7%9A%84%E6%84%8F%E5%9B%BE%E3%80%82" 
  view="javascript:playerInner('PhoenixTV1prog_20081022_6819658','日称我核潜艇恐吓美日')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081023/20081023_1044089471217729.jpg"><IMG 
  alt=日称我核潜艇恐吓美日 
  src="video/images/20081023_1044140779563152.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=日称我核潜艇恐吓美日 target=_play 
  href="http://www.openv.com/play/PhoenixTV1prog_20081022_6819658_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=日称我核潜艇恐吓美日 target=_play 
  href="http://www.openv.com/play/PhoenixTV1prog_20081022_6819658_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=日称我核潜艇恐吓美日 target=_play 
  href="http://www.openv.com/play/PhoenixTV1prog_20081022_6819658_0.html">日称我核潜艇恐吓美日&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_293.html">军情观察室</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('PhoenixTV1prog_20081022_6819658','日称我核潜艇恐吓美日')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=日称我核潜艇恐吓美日 target=_play 
  href="http://www.openv.com/play/PhoenixTV1prog_20081022_6819658_0.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=当狗爱上猫 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822352.html" 
  content="%E5%B9%BF%E5%91%8A%E5%85%AC%E5%8F%B8%E5%AE%A2%E6%88%B7%E7%BB%8F%E7%90%86%E5%91%A8%E8%87%AA%E7%91%9C%EF%BC%88%E8%83%A1%E6%9D%8F%E5%84%BF%E9%A5%B0%EF%BC%89%E6%9B%BE%E5%9B%A0%E6%94%B6%E7%95%99%E6%B5%81%E6%B5%AA%E7%8B%97%E5%A4%A7%E5%B7%B4%EF%BC%8C%E4%BB%A4%E7%88%B6%E4%BA%B2%E5%91%A8%E4%B8%8D%E8%8B%9F%EF%BC%88%E9%83%AD%E5%B3%B0%E9%A5%B0%EF%BC%89%E7%9A%84%E7%8B%97%E5%9C%BA%E5%85%A8%E9%83%A8%E7%8B%97%E5%8F%AA%E5%8F%97%E7%97%85%E6%AF%92%E6%84%9F%E6%9F%93%E8%80%8C%E6%AD%BB%EF%BC%8C%E8%BF%9E%E7%B4%AF%E5%93%A5%E5%93%A5%E5%91%A8%E8%87%AA%E6%B2%BE%EF%BC%88%E5%90%95%E6%96%B9%E9%A5%B0%EF%BC%89.." 
  view="javascript:playerInner('hdteleplay_20081023_6822352','当狗爱上猫')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081024/20081024_0847126112439859.jpg"><IMG 
  alt=当狗爱上猫 
  src="video/images/20081024_0847210967394901.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=当狗爱上猫 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822352.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=当狗爱上猫 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822352.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=当狗爱上猫 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822352.html">当狗爱上猫&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>主演：</SPAN><A class=c_green>罗嘉良</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('hdteleplay_20081023_6822352','当狗爱上猫')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=当狗爱上猫 target=_play 
  href="http://hd.openv.com/tv_play-hdteleplay_20081023_6822352.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=央视韩乔生雷人街舞秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6820603_0.html" 
  content="%E6%97%A5%E5%89%8D%EF%BC%8C%E6%9C%89%E2%80%9C%E5%A4%AE%E8%A7%86%E5%91%A8%E6%98%9F%E9%A9%B0%E2%80%9D%E4%B9%8B%E7%A7%B0%E7%9A%84%E9%9F%A9%E4%B9%94%E7%94%9F%E6%9D%A5%E5%88%B0%E2%80%9C%E5%8A%A8%E6%84%9F%E5%9C%B0%E5%B8%A6%E2%80%9D%E5%85%A8%E5%9B%BD%E8%A1%97%E8%88%9E%E7%94%B5%E8%A7%86%E6%8C%91%E6%88%98%E8%B5%9B%E5%AE%A2%E4%B8%B2%E5%98%89%E5%AE%BE%EF%BC%8C%E5%90%8C%E6%97%B6%E9%9F%A9%E8%80%81%E5%B8%88%E8%BF%98%E5%A4%A7%E7%A7%80%E8%88%9E%E6%8A%80%EF%BC%8C%E2%80%9C%E9%9F%A9%E2%80%9D%E5%BC%8F%E8%88%9E%E8%B9%88%E6%BB%91%E7%A8%BD%E5%88%AB%E6%89%AD%E7%9A%84%E6%A0%B7%E5%AD%90%E6%83%B9%E5%BE%97.." 
  view="javascript:playerInner('dvdprogramme_20081023_6820603','央视韩乔生雷人街舞秀')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081023/20081023_1530148178537851.jpg"><IMG 
  alt=央视韩乔生雷人街舞秀 
  src="video/images/20081023_1530315512274966.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=央视韩乔生雷人街舞秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6820603_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=央视韩乔生雷人街舞秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6820603_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=央视韩乔生雷人街舞秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6820603_0.html">央视韩乔生雷人街舞秀&nbsp;</A></DIV>
  <DIV class=height1><A class=c_green target=_blank 
  href="http://www.openv.com/ls.php?q=%E8%A1%97%E8%88%9E&amp;t=0">相关搜索</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('dvdprogramme_20081023_6820603','央视韩乔生雷人街舞秀')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=央视韩乔生雷人街舞秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6820603_0.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=哈警方拟邀媒体观尸检 target=_play 
  href="http://www.openv.com/play/LiaoNingTVprog_20081019_6803834_0.html" 
  content="%E5%93%88%E5%B0%94%E6%BB%A8%E5%B8%82%E5%85%AC%E5%AE%89%E5%B1%80%E5%89%AF%E5%B1%80%E9%95%BF%E5%8D%A2%E6%B4%AA%E5%96%9C%E8%A1%A8%E7%A4%BA%EF%BC%8C%E4%B8%BA%E7%A1%AE%E4%BF%9D%E6%9F%A5%E6%B8%85%E6%9E%97%E6%9D%BE%E5%B2%AD%E7%9A%84%E6%AD%BB%E5%9B%A0%EF%BC%8C%E5%85%AC%E5%AE%89%E6%9C%BA%E5%85%B3%E5%B0%86%E9%82%80%E8%AF%B7%E6%9C%80%E9%AB%98%E6%A3%80%E3%80%81%E6%B3%95%E5%8C%BB%E4%B8%93%E5%AE%B6%E3%80%81%E5%BE%8B%E5%B8%88%E3%80%81%E5%85%AC%E8%AF%81%E5%A4%84%E3%80%81%E5%AA%92%E4%BD%93%EF%BC%8C%E5%85%A8%E7%A8%8B%E5%BD%95%E5%83%8F%E8%BF%9B%E8%A1%8C%E5%B0%B8%E6%A3%80%E3%80%82" 
  view="javascript:playerInner('LiaoNingTVprog_20081019_6803834','哈警方拟邀媒体观尸检')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081017/20081017_1514560016817986.jpg"><IMG 
  alt=哈警方拟邀媒体观尸检 
  src="video/images/20081019_LiaoNingTV_Programme_1200_1112.639.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=哈警方拟邀媒体观尸检 target=_play 
  href="http://www.openv.com/play/LiaoNingTVprog_20081019_6803834_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=哈警方拟邀媒体观尸检 target=_play 
  href="http://www.openv.com/play/LiaoNingTVprog_20081019_6803834_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=哈警方拟邀媒体观尸检 target=_play 
  href="http://www.openv.com/play/LiaoNingTVprog_20081019_6803834_0.html">哈警方拟邀媒体观尸检&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>专题：</SPAN><A class=c_green target=_blank 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1873">哈尔滨警察打死人</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('LiaoNingTVprog_20081019_6803834','哈警方拟邀媒体观尸检')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=哈警方拟邀媒体观尸检 target=_play 
  href="http://www.openv.com/play/LiaoNingTVprog_20081019_6803834_0.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=色即是秘密 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html" 
  content="%E6%80%A7%E6%84%9F%E7%BE%8E%E4%B8%BD%E7%9A%84%E7%BE%8E%E8%8B%B1%E5%9C%A8%E7%88%B5%E5%A3%AB%E9%85%92%E5%90%A7%E5%81%9A%E6%AD%8C%E6%89%8B%EF%BC%8C%E5%A5%B9%E8%BA%AB%E6%9D%90%E7%83%AD%E8%BE%A3%E6%A8%A1%E6%A0%B7%E6%BC%82%E4%BA%AE%E8%BA%AB%E8%BE%B9%E4%BB%8E%E6%9D%A5%E9%83%BD%E4%B8%8D%E7%BC%BA%E4%BC%98%E7%A7%80%E7%9A%84%E7%94%B7%E4%BA%BA%EF%BC%8C%E4%BD%86%E5%A4%A9%E7%94%9F%E5%B0%A4%E7%89%A9%E7%9A%84%E5%A5%B9%E4%BC%BC%E4%B9%8E%E4%BB%8E%E6%9D%A5%E9%83%BD%E4%B8%8D%E6%8A%8A%E7%94%B7%E4%BA%BA%E6%94%BE%E5%9C%A8%E7%9C%BC%E9%87%8C%EF%BC%8C%E7%9B%B4%E5%88%B0%E5%A5%B9%E7%94%9F%E5%91%BD%E4%B8%AD.." 
  view="javascript:playerInner('hdmovie_20080815_6546474','色即是秘密')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081024/20081024_0854087378992371.jpg"><IMG 
  alt=色即是秘密 
  src="video/images/20081024_0854203077586757.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=色即是秘密 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=色即是秘密 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=色即是秘密 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html">色即是秘密&nbsp;</A></DIV>
  <DIV class=height1><SPAN class=c_grey>主演：</SPAN><A class=c_green>李秉宪</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('hdmovie_20080815_6546474','色即是秘密')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=色即是秘密 target=_play 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html">完整播放</A></DIV>
  <DIV class=line></DIV>
  <LI>
  <DIV class=img name="chborder"><A title=老汉开肠破肚苦等医生 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816296_0.html" 
  content="19%E6%97%A5%E4%B8%8A%E5%8D%88%EF%BC%8C%E9%BB%84%E4%B8%AD%E8%BD%A9%E6%AD%BB%E5%9C%A8%E4%BA%86%E9%95%87%E5%8D%AB%E7%94%9F%E9%99%A2%E7%9A%84%E7%97%85%E5%BA%8A%E4%B8%8A%EF%BC%8C%E6%AD%A4%E6%97%B6%E8%B7%9D%E4%BB%9660%E5%B2%81%E7%94%9F%E6%97%A5%E8%BF%98%E6%9C%894%E5%A4%A9%E3%80%82%E4%B9%8B%E5%89%8D%EF%BC%8C%E4%BB%96%E5%9B%A0%E8%82%9A%E5%AD%90%E7%97%9B%E5%88%B0%E8%AF%A5%E5%8D%AB%E7%94%9F%E9%99%A2%E6%A3%80%E6%9F%A5%EF%BC%8C%E4%B8%BB%E5%88%80%E5%8C%BB%E7%94%9F%E5%9C%A8%E6%89%93%E5%BC%80%E5%85%B6%E8%85%B9%E8%85%94%E5%90%8E%E5%8F%91%E7%8E%B0%E6%98%AF%E8%82%A0.." 
  view="javascript:playerInner('dvdprogramme_20081022_6816296','老汉开肠破肚苦等医生')" 
  b_pic="http://img.openv.tv/t/UserFiles/Image/20081022/20081022_1452158432982262.jpg"><IMG 
  alt=老汉开肠破肚苦等医生 
  src="video/images/20081022_1452269495179008.jpg" 
  width=124 height=97></A>
  <DIV class=bg><A title=老汉开肠破肚苦等医生 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816296_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=老汉开肠破肚苦等医生 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816296_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=height><A class=c_white title=老汉开肠破肚苦等医生 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816296_0.html">老汉开肠破肚苦等医生&nbsp;</A></DIV>
  <DIV class=height1><A class=c_green target=_blank 
  href="http://www.openv.com/ls.php? q=%E5%8C%BB%E7%94%9F&amp;t=0&amp;s=date">相关搜索</A></DIV>
  <DIV><SPAN class=c_grey></SPAN> </DIV>
  <DIV><A class=c_grey 
  href="javascript:playerInner('dvdprogramme_20081022_6816296','老汉开肠破肚苦等医生')"><IMG 
  align=absMiddle 
  src="video/images/ico_5.gif" 
  width=13 height=13>&nbsp;&nbsp;预览 
  </A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A class=c_grey 
  title=老汉开肠破肚苦等医生 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816296_0.html">完整播放</A></DIV>
  <DIV class=line></DIV></LI></UL>
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
  <LI class="hand c_black b f14">NBA战火
  <LI class="hand c_black b f14">真情明星
  <LI class="hand c_black b f14">新片快递
  <LI class="hand c_black b f14">爆笑喜剧
  <LI class="hand c_black b f14">惊恐瞬间
  <LI class="hand c_black b f14">社会冷暖 </LI></UL>
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
<DIV class=siderA_box><!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 
src="video/images/page=1&amp;pindao=homepage&amp;position=bottom_1"></SCRIPT>
<!-- 广告 结束 --><!-- 推荐专辑 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" target=_blank 
href="http://zj.openv.com/">专辑推荐</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1812">&nbsp;天线原创&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1872">&nbsp;名模怀胎闪婚&nbsp;</A> 

  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">&nbsp;性感写真&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1613">&nbsp;裸聊系列&nbsp;</A> 
  </LI></UL></DIV>
<DIV id=L_1_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_1_UL',0)" border=0 
align=absMiddle 
src="天线视频%20-%20OpenV%20-%20电视节目%20-%20视频%20-%20视频搜索%20-%20改变看法_files/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_1_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_1_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_1_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_1_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_1_UL class=three px="648">
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(0,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">信用评级机构</A></DIV>
  <DIV><A class=c_grey2 title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">商业票据</A></DIV>
  <DIV><A class=c_grey2 title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">对冲基金</A></DIV>
  <DIV><A class=c_grey2 title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">破产保护</A></DIV>
  <DIV><A class=c_grey2 title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">新自由主义</A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832"><IMG 
  src="video/images/20081018_0924014015499546.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832">金融专业术语解说</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>10</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">央视二套推出《直击华尔街风暴》系列访谈，请国内顶级专家解读全球经济走势..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=金融专业术语解说 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1832"><IMG 
  align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(0,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(1,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲《十大暴笑语录》 </A></DIV>
  <DIV><A class=c_grey2 title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲《痛骂CCTV》 </A></DIV>
  <DIV><A class=c_grey2 title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲《天下无贼》 </A></DIV>
  <DIV><A class=c_grey2 title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲《学聋哑》 </A></DIV>
  <DIV><A class=c_grey2 title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲《赌论》 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912"><IMG 
  src="video/images/20081022_1749566588627814.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912">郭德纲相声全集</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>64</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">床前明月光、疑是地上霜,举头望明月、我叫郭德纲。8岁投身艺坛，先拜评书前..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=郭德纲相声全集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1912"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(1,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_2 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(2,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">“万人购房团”能不能降低..</A></DIV>
  <DIV><A class=c_grey2 title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">全球经济对中国房地产影响..</A></DIV>
  <DIV><A class=c_grey2 title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">锵锵三人行：聚焦大陆房地..</A></DIV>
  <DIV><A class=c_grey2 title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">锵锵三人行：中国房市进入..</A></DIV>
  <DIV><A class=c_grey2 title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">冯仑：房地产“过冬” 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830"><IMG 
  src="video/images/20081023_0904411994558763.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830">专家看房产该不该救市</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>34</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">随着央行宣布下调人民币存贷款基准利率，不到一个月，央行两次下调贷款利率..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=专家看房产该不该救市 target=_play 
  href="http://t.openv.com/zj/show.php?pid=finance_2008_1830"><IMG 
  align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(2,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_3 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(3,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林、郭启儒《相面》 </A></DIV>
  <DIV><A class=c_grey2 title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林、郭全宝《关公战秦..</A></DIV>
  <DIV><A class=c_grey2 title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林、郭启儒《三棒鼓》..</A></DIV>
  <DIV><A class=c_grey2 title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林、郭启儒《串调》 </A></DIV>
  <DIV><A class=c_grey2 title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林、郭全宝《改行》 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758"><IMG 
  src="video/images/20081006_0848255625537976.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758">侯宝林相声集</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>23</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">相声是一门语言艺术，侯宝林更被誉为“语言大师”。侯宝林幼年家境贫寒，12..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=侯宝林相声集 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1758"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(3,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_4 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(4,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">Unee生前的写真拍摄现场 
</A></DIV>
  <DIV><A class=c_grey2 title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">裸替邵小珊新裸露写真曝光 </A></DIV>
  <DIV><A class=c_grey2 title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">范冰冰拍床上写真尴尬露眼..</A></DIV>
  <DIV><A class=c_grey2 title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">性感女星田原的清纯写真 </A></DIV>
  <DIV><A class=c_grey2 title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">史上最美女老板写真视频 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777"><IMG 
  src="video/images/20081007_1141406606465838.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">至美视觉性感写真</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>163</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">网络红人私密自拍、超性感模特宝贝的极致诱惑、日本AV女优的惹火比基尼写真..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=至美视觉性感写真 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(4,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_5 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(5,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">武汉退出引发积分变动问题 
  </A></DIV>
  <DIV><A class=c_grey2 title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">中超印象 </A></DIV>
  <DIV><A class=c_grey2 title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">武汉退赛影响中超 
  申花金..</A></DIV>
  <DIV><A class=c_grey2 title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">中超退赛风波让人笑话 
  </A></DIV>
  <DIV><A class=c_grey2 title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">国安退出为哪般 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774"><IMG 
  src="video/images/20081006_1632590599866932.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774">谢天谢地中超又出事了</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>32</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">“既然足协不能对李玮锋的判罚进行改判，那我们就退出和辽宁队的比赛，也退..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=谢天谢地中超又出事了 target=_play 
  href="http://t.openv.com/zj/show.php?pid=sports_2008_1774"><IMG 
  align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(5,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_6 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(6,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">希拉里称不会主动寻求成为..</A></DIV>
  <DIV><A class=c_grey2 title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">美国大选：希拉里宣布停止..</A></DIV>
  <DIV><A class=c_grey2 title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">美国总统大选：奥麦决战拉..</A></DIV>
  <DIV><A class=c_grey2 title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">话题女王希尔顿自拍竞选广..</A></DIV>
  <DIV><A class=c_grey2 title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">麦凯恩竞选助手佩林曝裸照..</A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751"><IMG 
  src="video/images/20081009_1027483534454949.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751">美国大选谁主沉浮</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>67</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">美国的总统选举每四年举行一次，主要包括预选、党代表大会、总统候选人竞选..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=美国大选谁主沉浮 target=_play 
  href="http://t.openv.com/zj/show.php?pid=news_2008_1751"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(6,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_7 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(7,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">第一恐怖车模芙蓉 </A></DIV>
  <DIV><A class=c_grey2 title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">车展中车模遭遇的非礼 </A></DIV>
  <DIV><A class=c_grey2 title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">养眼车模吸爆眼球 </A></DIV>
  <DIV><A class=c_grey2 title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">日本东京车展车模 </A></DIV>
  <DIV><A class=c_grey2 title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">火辣身材天使脸蛋 
  </A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755"><IMG 
  src="video/images/20081001_0844006495522932.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">香车美女尽收眼底</A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>65</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">正所谓香车加美女！车展上光彩照人的模特不仅仅是一种陪衬，而是汽车文化与..</SPAN></DIV>
  <DIV class=sm><A class=c_black title=香车美女尽收眼底 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(7,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV>
  <LI>
  <DIV class="t mab">
  <DIV style="DISPLAY: none" id=zjlist_8 class="t mab">
  <DIV class=tc></DIV>
  <DIV class=tcc>
  <DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  <DIV class="close c_orange hand" 
  onclick=showzjlist(8,false);>[&nbsp;关闭&nbsp;]</DIV></DIV>
  <DIV class=content1>
  <DIV><A class=c_grey2 title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》之秦始皇..</A></DIV>
  <DIV><A class=c_grey2 title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》之秦始皇..</A></DIV>
  <DIV><A class=c_grey2 title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》之秦始皇..</A></DIV>
  <DIV><A class=c_grey2 title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》之秦始皇..</A></DIV>
  <DIV><A class=c_grey2 title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》之秦始皇..</A></DIV></DIV></DIV></DIV></DIV>
  <DIV class=img><A title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270"><IMG 
  src="video/images/20081016_0956267591191510.jpg" 
  width=180 height=90></A></DIV>
  <DIV><A class="f14 b" title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270">王立群读《史记》秦始皇 </A></DIV>
  <DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>33</SPAN></DIV>
  <DIV><SPAN 
  class="c_grey1 l18">公元前259年的农历正月，一个男婴在赵国的邯郸降生了。没有人会想到，他就..</SPAN></DIV>
  <DIV class=sm><A class=c_black title="王立群读《史记》秦始皇 " target=_play 
  href="http://t.openv.com/zj/show.php?pid=cul_2008_1270"><IMG align=absMiddle 
  src="video/images/ico_10.jpg" 
  width=13 height=13> 观 看</A> <A class=c_black 
  href="javascript:showzjlist(8,true)"><IMG align=absMiddle 
  src="video/images/ico_11.jpg" 
  width=11 height=11> 视频列表</A> </DIV></LI></UL>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://zj.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
<!-- 广告 结束 --><!-- 高清节目 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" target=_blank 
href="http://hd.openv.com/index_list.php?t=1">高清节目</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_293.html">&nbsp;军情观察室&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_231.html">&nbsp;探索&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_334.html">&nbsp;超级搜查令&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_6226.html">&nbsp;康熙来了&nbsp;</A> </LI></UL></DIV>
<DIV id=L_2_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_2_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_2_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_2_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_2_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_2_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_2_UL class=four px="636">
  <LI>
  <DIV class=img><A title=不老容颜铸造术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828772.html"><IMG 
  alt=不老容颜铸造术 
  src="video/images/20081025_1241101996120693.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=不老容颜铸造术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828772.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=不老容颜铸造术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828772.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=不老容颜铸造术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828772.html">不老容颜铸造术</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_328.html">美丽最前线</A></DIV>
  <LI>
  <DIV class=img><A title=迷死人的红毯POSS target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828134.html"><IMG 
  alt=迷死人的红毯POSS 
  src="video/images/20081025_1647393600261491.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=迷死人的红毯POSS target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828134.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=迷死人的红毯POSS target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828134.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=迷死人的红毯POSS target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828134.html">迷死人的红毯POSS</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_648.html">第42天</A></DIV>
  <LI>
  <DIV class=img><A title=30熟女也能变少女 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828279.html"><IMG 
  alt=30熟女也能变少女 
  src="video/images/20081025_1257225222118973.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=30熟女也能变少女 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828279.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=30熟女也能变少女 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828279.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=30熟女也能变少女 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828279.html">30熟女也能变少女</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_634.html">衣妆盛典</A></DIV>
  <LI>
  <DIV class=img><A title=美眉暧昧好友大爆料 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6827360.html"><IMG 
  alt=美眉暧昧好友大爆料 
  src="video/images/20081025_1410405283235795.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=美眉暧昧好友大爆料 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6827360.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=美眉暧昧好友大爆料 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6827360.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=美眉暧昧好友大爆料 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6827360.html">美眉暧昧好友大爆料</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_460.html">我爱黑涩会</A></DIV>
  <LI>
  <DIV class=img><A title=隐藏在语言中的性暗示 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823957.html"><IMG 
  alt=隐藏在语言中的性暗示 
  src="video/images/20081024_1600137239408493.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=隐藏在语言中的性暗示 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823957.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=隐藏在语言中的性暗示 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823957.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=隐藏在语言中的性暗示 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823957.html">隐藏在语言中的性暗示</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_328.html">美丽最前线</A></DIV>
  <LI>
  <DIV class=img><A title=周董魔术秀宇宙大首播 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824353.html"><IMG 
  alt=周董魔术秀宇宙大首播 
  src="video/images/20081024_1600207674694319.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=周董魔术秀宇宙大首播 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824353.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=周董魔术秀宇宙大首播 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824353.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=周董魔术秀宇宙大首播 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824353.html">周董魔术秀宇宙大首播</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6226.html">康熙来了</A></DIV>
  <LI>
  <DIV class=img><A title="吵个充满艺术的架 " target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824101.html"><IMG 
  alt="吵个充满艺术的架 " 
  src="video/images/20081024_1600254423442982.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="吵个充满艺术的架 " target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824101.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="吵个充满艺术的架 " target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824101.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="吵个充满艺术的架 " target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824101.html">吵个充满艺术的架 
  </A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6228.html">大学生了没</A></DIV>
  <LI>
  <DIV class=img><A title=八月桂花创意料理上桌 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6820303.html"><IMG 
  alt=八月桂花创意料理上桌 
  src="video/images/20081024_1600017410461651.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=八月桂花创意料理上桌 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6820303.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=八月桂花创意料理上桌 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6820303.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=八月桂花创意料理上桌 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6820303.html">八月桂花创意料理上桌</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5742.html">快乐生活王</A></DIV>
  <LI>
  <DIV class=img><A title=超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  alt=超刺激团体PK争霸战 
  src="video/images/20081023_1425500538494425.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html">超刺激团体PK争霸战</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_458.html">模范棒棒堂</A></DIV>
  <LI>
  <DIV class=img><A title=打造职场亲和妆 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819044.html"><IMG 
  alt=打造职场亲和妆 
  src="video/images/20081023_1426562071762858.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=打造职场亲和妆 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819044.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=打造职场亲和妆 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819044.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=打造职场亲和妆 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819044.html">打造职场亲和妆</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_328.html">美丽最前线</A> </DIV>
  <LI>
  <DIV class=img><A title=解析08秋冬新潮流 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819183.html"><IMG 
  alt=解析08秋冬新潮流 
  src="video/images/20081023_1426343695860034.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=解析08秋冬新潮流 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819183.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=解析08秋冬新潮流 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819183.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=解析08秋冬新潮流 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819183.html">解析08秋冬新潮流</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_245.html">魅力前线</A></DIV>
  <LI>
  <DIV class=img><A title=修不到的独家课程 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819332.html"><IMG 
  alt=修不到的独家课程 
  src="video/images/20081023_1426020436952359.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=修不到的独家课程 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819332.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=修不到的独家课程 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819332.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=修不到的独家课程 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819332.html">修不到的独家课程</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6228.html">大学生了没</A></DIV></LI></UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://hd.openv.com/index_list.php?t=1">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 广告 开始 -->
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
<!-- 广告 结束 --><!-- 综艺节目 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://ent.openv.com/">综艺节目</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://movie.openv.com/">&nbsp;影视&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://fashion.openv.com/">&nbsp;时尚&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://music.openv.com/">&nbsp;音乐&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://comic.openv.com/">&nbsp;动漫&nbsp;</A> </LI></UL></DIV>
<DIV id=L_3_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_3_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_3_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_3_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_3_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_3_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_3_UL class=four px="636">
  <LI>
  <DIV class=img><A title="珠光宝气范玮琪 演唱会造型扮贵妇" target=_play 
  href="http://www.openv.com/play/HuaYuTVprog_20081024_6828452_0.html"><IMG 
  alt="珠光宝气范玮琪 演唱会造型扮贵妇" 
  src="video/images/20081025_1436508054840963.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="珠光宝气范玮琪 演唱会造型扮贵妇" target=_play 
  href="http://www.openv.com/play/HuaYuTVprog_20081024_6828452_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="珠光宝气范玮琪 演唱会造型扮贵妇" target=_play 
  href="http://www.openv.com/play/HuaYuTVprog_20081024_6828452_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="珠光宝气范玮琪 演唱会造型扮贵妇" target=_play 
  href="http://www.openv.com/play/HuaYuTVprog_20081024_6828452_0.html">珠光宝气范玮琪 
  演唱会造型扮贵妇</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_1622.html">Young Walker</A></DIV>
  <LI>
  <DIV class=img><A title="林俊杰阿Sa做宣传 感觉恰似结婚" target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827773_0.html"><IMG 
  alt="林俊杰阿Sa做宣传 感觉恰似结婚" 
  src="video/images/20081025_1436577130872359.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="林俊杰阿Sa做宣传 感觉恰似结婚" target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827773_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="林俊杰阿Sa做宣传 感觉恰似结婚" target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827773_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="林俊杰阿Sa做宣传 感觉恰似结婚" target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827773_0.html">林俊杰阿Sa做宣传 
  感觉恰似结婚</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6902.html">娱乐急先锋</A></DIV>
  <LI>
  <DIV class=img><A title=S.H.E电台发片不畏与周董大对台 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081024_6828807_0.html"><IMG 
  alt=S.H.E电台发片不畏与周董大对台 
  src="video/images/20081025_1437121750950680.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=S.H.E电台发片不畏与周董大对台 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081024_6828807_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=S.H.E电台发片不畏与周董大对台 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081024_6828807_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=S.H.E电台发片不畏与周董大对台 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081024_6828807_0.html">S.H.E电台发片不畏与周董大对台</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5202.html">新娱乐在线</A></DIV>
  <LI>
  <DIV class=img><A title=传黎姿隐退是为嫁残障富豪马廷强 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827958_0.html"><IMG 
  alt=传黎姿隐退是为嫁残障富豪马廷强 
  src="video/images/20081025_1437068816692831.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=传黎姿隐退是为嫁残障富豪马廷强 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827958_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=传黎姿隐退是为嫁残障富豪马廷强 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827958_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=传黎姿隐退是为嫁残障富豪马廷强 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081024_6827958_0.html">传黎姿隐退是为嫁残障富豪马廷强</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6902.html">娱乐急先锋</A></DIV>
  <LI>
  <DIV class=img><A title=赵薇第一次献给妓院 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081023_6823865_0.html"><IMG 
  alt=赵薇第一次献给妓院 
  src="video/images/20081024_1440278767615196.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=赵薇第一次献给妓院 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081023_6823865_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=赵薇第一次献给妓院 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081023_6823865_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=赵薇第一次献给妓院 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081023_6823865_0.html">赵薇第一次献给妓院</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5202.html">新娱乐在线</A></DIV>
  <LI>
  <DIV class=img><A title=仔仔渴望被范冰冰包养 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081023_6823039_0.html"><IMG 
  alt=仔仔渴望被范冰冰包养 
  src="video/images/20081024_1442261974210118.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=仔仔渴望被范冰冰包养 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081023_6823039_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=仔仔渴望被范冰冰包养 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081023_6823039_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=仔仔渴望被范冰冰包养 target=_play 
  href="http://www.openv.com/play/HuNanYuLeprog_20081023_6823039_0.html">仔仔渴望被范冰冰包养</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6902.html">娱乐急先锋</A></DIV>
  <LI>
  <DIV class=img><A title=小贝保镖给刘亦菲下跪 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823819.html"><IMG 
  alt=小贝保镖给刘亦菲下跪 
  src="video/images/20081024_1434217409740209.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=小贝保镖给刘亦菲下跪 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823819.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=小贝保镖给刘亦菲下跪 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823819.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=小贝保镖给刘亦菲下跪 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6823819.html">小贝保镖给刘亦菲下跪</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_163.html">天天影视圈</A></DIV>
  <LI>
  <DIV class=img><A title=百代天后宫濒临瓦解 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824079.html"><IMG 
  alt=百代天后宫濒临瓦解 
  src="video/images/20081024_1446484597814622.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=百代天后宫濒临瓦解 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824079.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=百代天后宫濒临瓦解 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824079.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=百代天后宫濒临瓦解 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824079.html">百代天后宫濒临瓦解</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_166.html">音乐风云榜</A></DIV>
  <LI>
  <DIV class=img><A title=网友自拍《红楼梦》林妹妹才四年级 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819224_0.html"><IMG 
  alt=网友自拍《红楼梦》林妹妹才四年级 
  src="video/images/20081023_1451243314389011.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=网友自拍《红楼梦》林妹妹才四年级 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819224_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=网友自拍《红楼梦》林妹妹才四年级 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819224_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=网友自拍《红楼梦》林妹妹才四年级 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819224_0.html">网友自拍《红楼梦》林妹妹才四年级</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5202.html">新娱乐在线</A></DIV>
  <LI>
  <DIV class=img><A title=爆笑方言版《海燕》笑翻全场 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818724.html"><IMG 
  alt=爆笑方言版《海燕》笑翻全场 
  src="video/images/20081022_BTV2_Programme_1900_917.604.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=爆笑方言版《海燕》笑翻全场 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818724.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=爆笑方言版《海燕》笑翻全场 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818724.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=爆笑方言版《海燕》笑翻全场 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818724.html">爆笑方言版《海燕》笑翻全场</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_158.html">每日文娱播报</A></DIV>
  <LI>
  <DIV class=img><A title=棒棒堂超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  alt=棒棒堂超刺激团体PK争霸战 
  src="video/images/20081023_1450489062443121.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=棒棒堂超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=棒棒堂超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=棒棒堂超刺激团体PK争霸战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819701.html">棒棒堂超刺激团体PK争霸战</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_458.html">模范棒棒堂</A> </DIV>
  <LI>
  <DIV class=img><A title=央视名嘴韩乔生当评委秀街舞 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819078_0.html"><IMG 
  alt=央视名嘴韩乔生当评委秀街舞 
  src="video/images/20081022_Shxwyl_Programme_2200_711.056.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=央视名嘴韩乔生当评委秀街舞 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819078_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=央视名嘴韩乔生当评委秀街舞 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819078_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=央视名嘴韩乔生当评委秀街舞 target=_play 
  href="http://www.openv.com/play/Shxwylprog_20081022_6819078_0.html">央视名嘴韩乔生当评委秀街舞</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5202.html">新娱乐在线</A></DIV></LI></UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://ent.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 体育赛事 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://sports.openv.com/">体育赛事</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_8302.html">&nbsp;智勇大冲关&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_8346.html">&nbsp;我是冠军&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_8203.html">&nbsp;武林风&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://tv.openv.com/col_5665.html">&nbsp;狂野角斗士&nbsp;</A> </LI></UL></DIV>
<DIV id=L_4_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_4_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_4_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_4_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_4_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_4_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_4_UL class=four px="636">
  <LI>
  <DIV class=img><A title=WWE：RAW师徒大战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828951.html"><IMG 
  alt=WWE：RAW师徒大战 
  src="video/images/20081025_1124013039712421.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=WWE：RAW师徒大战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828951.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=WWE：RAW师徒大战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828951.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=WWE：RAW师徒大战 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828951.html">WWE：RAW师徒大战</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5665.html">狂野角斗士</A></DIV>
  <LI>
  <DIV class=img><A title=足协整风国安再度遭罚 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828667.html"><IMG 
  alt=足协整风国安再度遭罚 
  src="video/images/20081025_1130399685290498.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=足协整风国安再度遭罚 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828667.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=足协整风国安再度遭罚 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828667.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=足协整风国安再度遭罚 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828667.html">足协整风国安再度遭罚</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_596.html">天天体育</A></DIV>
  <LI>
  <DIV class=img><A title="火箭三杰全力助推 新赛季剑指冠军" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828872.html"><IMG 
  alt="火箭三杰全力助推 新赛季剑指冠军" 
  src="video/images/20081025_1115323506074317.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="火箭三杰全力助推 新赛季剑指冠军" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828872.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="火箭三杰全力助推 新赛季剑指冠军" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828872.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="火箭三杰全力助推 新赛季剑指冠军" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828872.html">火箭三杰全力助推 
  新赛季剑指冠军</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_4803.html">强强三人组</A></DIV>
  <LI>
  <DIV class=img><A title=08/09赛季联盟杯小组赛首轮战报 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828195.html"><IMG 
  alt=08/09赛季联盟杯小组赛首轮战报 
  src="video/images/20081025_1137032461011949.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=08/09赛季联盟杯小组赛首轮战报 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828195.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=08/09赛季联盟杯小组赛首轮战报 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828195.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=08/09赛季联盟杯小组赛首轮战报 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6828195.html">08/09赛季联盟杯小组赛首轮战报</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_235.html">足球世界波</A></DIV>
  <LI>
  <DIV class=img><A title="因扎吉破纪录 米兰3-1海伦芬" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6826606.html"><IMG 
  alt="因扎吉破纪录 米兰3-1海伦芬" 
  src="video/images/20081024_1434004083764426.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="因扎吉破纪录 米兰3-1海伦芬" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6826606.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="因扎吉破纪录 米兰3-1海伦芬" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6826606.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="因扎吉破纪录 米兰3-1海伦芬" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6826606.html">因扎吉破纪录 
  米兰3-1海伦芬</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_7604.html">体育午报</A></DIV>
  <LI>
  <DIV class=img><A title=08-09赛季前瞻：达拉斯小牛 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824474.html"><IMG 
  alt=08-09赛季前瞻：达拉斯小牛 
  src="video/images/20081024_1348134374003693.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=08-09赛季前瞻：达拉斯小牛 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824474.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=08-09赛季前瞻：达拉斯小牛 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824474.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=08-09赛季前瞻：达拉斯小牛 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824474.html">08-09赛季前瞻：达拉斯小牛</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_596.html">天天体育</A></DIV>
  <LI>
  <DIV class=img><A title="阿联16分 篮网负76人遭4连败" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824049.html"><IMG 
  alt="阿联16分 篮网负76人遭4连败" 
  src="video/images/20081024_1342169238797658.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="阿联16分 篮网负76人遭4连败" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824049.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="阿联16分 篮网负76人遭4连败" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824049.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="阿联16分 篮网负76人遭4连败" target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824049.html">阿联16分 
  篮网负76人遭4连败</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_4827.html">NBA季前赛</A></DIV>
  <LI>
  <DIV class=img><A title=WWE：阿特鲁夫飞腿放倒本杰明 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824477.html"><IMG 
  alt=WWE：阿特鲁夫飞腿放倒本杰明 
  src="video/images/20081024_1422083785267330.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=WWE：阿特鲁夫飞腿放倒本杰明 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824477.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=WWE：阿特鲁夫飞腿放倒本杰明 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824477.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=WWE：阿特鲁夫飞腿放倒本杰明 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6824477.html">WWE：阿特鲁夫飞腿放倒本杰明</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5665.html">狂野角斗士</A></DIV>
  <LI>
  <DIV class=img><A title=欧冠：切尔西1-0力克罗马 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819983.html"><IMG 
  alt=欧冠：切尔西1-0力克罗马 
  src="video/images/20081023_0913327419500632.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=欧冠：切尔西1-0力克罗马 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819983.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=欧冠：切尔西1-0力克罗马 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819983.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=欧冠：切尔西1-0力克罗马 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819983.html">欧冠：切尔西1-0力克罗马</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_8422.html">欧洲冠军联赛</A></DIV>
  <LI>
  <DIV class=img><A title=欧冠：巴萨5-0戏耍巴塞尔 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819986.html"><IMG 
  alt=欧冠：巴萨5-0戏耍巴塞尔 
  src="video/images/20081023_0912516790842357.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=欧冠：巴萨5-0戏耍巴塞尔 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819986.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=欧冠：巴萨5-0戏耍巴塞尔 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819986.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=欧冠：巴萨5-0戏耍巴塞尔 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081023_6819986.html">欧冠：巴萨5-0戏耍巴塞尔</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_8422.html">欧洲冠军联赛</A></DIV>
  <LI>
  <DIV class=img><A title=中超：山东主场1-1平10人天津 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819206.html"><IMG 
  alt=中超：山东主场1-1平10人天津 
  src="video/images/20081023_0936233353323942.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=中超：山东主场1-1平10人天津 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819206.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=中超：山东主场1-1平10人天津 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819206.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=中超：山东主场1-1平10人天津 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819206.html">中超：山东主场1-1平10人天津</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_8442.html">中超联赛</A></DIV>
  <LI>
  <DIV class=img><A title=中超：辽宁1-2不敌深圳滑向降级深渊 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818093.html"><IMG 
  alt=中超：辽宁1-2不敌深圳滑向降级深渊 
  src="video/images/20081023_0913245227176018.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=中超：辽宁1-2不敌深圳滑向降级深渊 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818093.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=中超：辽宁1-2不敌深圳滑向降级深渊 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818093.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=中超：辽宁1-2不敌深圳滑向降级深渊 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6818093.html">中超：辽宁1-2不敌深圳滑向降级深渊</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5704.html">中超</A></DIV></LI></UL>
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
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 大千世界 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://news.openv.com/">大千世界</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://culture.openv.com/">&nbsp;文化&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://auto.openv.com/">&nbsp;汽车&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://life.openv.com/">&nbsp;生活&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://military.openv.com/">&nbsp;军事&nbsp;</A> </LI></UL></DIV>
<DIV id=L_6_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_6_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_6_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_6_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_6_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_6_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<UL id=L_6_UL class=four px="636">
  <LI>
  <DIV class=img><A title=男子经济拮据发帖转让女友 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830281_0.html"><IMG 
  alt=男子经济拮据发帖转让女友 
  src="video/images/20081025_1328038063692502.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=男子经济拮据发帖转让女友 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830281_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=男子经济拮据发帖转让女友 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830281_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=男子经济拮据发帖转让女友 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830281_0.html">男子经济拮据发帖转让女友</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_456.html">第一时间之资讯版</A></DIV>
  <LI>
  <DIV class=img><A title=在暗处能“发光”的猫 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830285_0.html"><IMG 
  alt=在暗处能“发光”的猫 
  src="video/images/20081025_1327336729816120.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=在暗处能“发光”的猫 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830285_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=在暗处能“发光”的猫 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830285_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=在暗处能“发光”的猫 target=_play 
  href="http://www.openv.com/play/LiaoNingTVnews_20081025_6830285_0.html">在暗处能“发光”的猫</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_456.html">第一时间之资讯版</A></DIV>
  <LI>
  <DIV class=img><A title=电视版《鬼吹灯》第五集《古玉魔棺》 target=_play 
  href="http://www.openv.com/play/GuangDongPublicprog_20081024_6829643_0.html"><IMG 
  alt=电视版《鬼吹灯》第五集《古玉魔棺》 
  src="video/images/20081025_1256407895854893.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=电视版《鬼吹灯》第五集《古玉魔棺》 target=_play 
  href="http://www.openv.com/play/GuangDongPublicprog_20081024_6829643_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=电视版《鬼吹灯》第五集《古玉魔棺》 target=_play 
  href="http://www.openv.com/play/GuangDongPublicprog_20081024_6829643_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=电视版《鬼吹灯》第五集《古玉魔棺》 target=_play 
  href="http://www.openv.com/play/GuangDongPublicprog_20081024_6829643_0.html">电视版《鬼吹灯》第五集《古玉魔棺》</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_5258.html">解密大行动</A></DIV>
  <LI>
  <DIV class=img><A title=保姆爱漂亮也错了？ target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6829495.html"><IMG 
  alt=保姆爱漂亮也错了？ 
  src="video/images/20081025_1326078865364672.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=保姆爱漂亮也错了？ target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6829495.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=保姆爱漂亮也错了？ target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6829495.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=保姆爱漂亮也错了？ target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081024_6829495.html">保姆爱漂亮也错了？</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_1701.html">北京青年</A></DIV>
  <LI>
  <DIV class=img><A title=面目全非的事故车 target=_play 
  href="http://www.openv.com/play/BTV9prog_20081023_6823851_0.html"><IMG 
  alt=面目全非的事故车 
  src="video/images/20081024_1424383120167998.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=面目全非的事故车 target=_play 
  href="http://www.openv.com/play/BTV9prog_20081023_6823851_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=面目全非的事故车 target=_play 
  href="http://www.openv.com/play/BTV9prog_20081023_6823851_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=面目全非的事故车 target=_play 
  href="http://www.openv.com/play/BTV9prog_20081023_6823851_0.html">面目全非的事故车</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_258.html">红绿灯</A></DIV>
  <LI>
  <DIV class=img><A title=奥的斯电梯按钮检出有放射性 target=_play 
  href="http://www.openv.com/play/HuNanTVprog_20081024_6826370_0.html"><IMG 
  alt=奥的斯电梯按钮检出有放射性 
  src="video/images/20081024_1424246993904431.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=奥的斯电梯按钮检出有放射性 target=_play 
  href="http://www.openv.com/play/HuNanTVprog_20081024_6826370_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=奥的斯电梯按钮检出有放射性 target=_play 
  href="http://www.openv.com/play/HuNanTVprog_20081024_6826370_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=奥的斯电梯按钮检出有放射性 target=_play 
  href="http://www.openv.com/play/HuNanTVprog_20081024_6826370_0.html">奥的斯电梯按钮检出有放射性</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_314.html">播报多看点</A></DIV>
  <LI>
  <DIV class=img><A title=官员出国考察“恋”上捉迷藏 target=_play 
  href="http://www.openv.com/play/HuNanDuShiprog_20081023_6824548_0.html"><IMG 
  alt=官员出国考察“恋”上捉迷藏 
  src="video/images/20081024_1424485045311517.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=官员出国考察“恋”上捉迷藏 target=_play 
  href="http://www.openv.com/play/HuNanDuShiprog_20081023_6824548_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=官员出国考察“恋”上捉迷藏 target=_play 
  href="http://www.openv.com/play/HuNanDuShiprog_20081023_6824548_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=官员出国考察“恋”上捉迷藏 target=_play 
  href="http://www.openv.com/play/HuNanDuShiprog_20081023_6824548_0.html">官员出国考察“恋”上捉迷藏</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_6908.html">夜夜都市</A></DIV>
  <LI>
  <DIV class=img><A title=国道旁的“红灯区” target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081024_6825923_0.html"><IMG 
  alt=国道旁的“红灯区” 
  src="video/images/20081024_1644095941164871.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=国道旁的“红灯区” target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081024_6825923_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=国道旁的“红灯区” target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081024_6825923_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=国道旁的“红灯区” target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081024_6825923_0.html">国道旁的“红灯区”</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_345.html">看东方</A></DIV>
  <LI>
  <DIV class=img><A title=不可思议的惊险艺术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819766.html"><IMG 
  alt=不可思议的惊险艺术 
  src="video/images/20081023_1602598685333130.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=不可思议的惊险艺术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819766.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=不可思议的惊险艺术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819766.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=不可思议的惊险艺术 target=_play 
  href="http://hd.openv.com/pro_play-hdprog_20081022_6819766.html">不可思议的惊险艺术</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_1701.html">北京青年</A></DIV>
  <LI>
  <DIV class=img><A title=山寨加油站雷翻路人 target=_play 
  href="http://www.openv.com/play/JiangXiTVprog_20081023_6821962_0.html"><IMG 
  alt=山寨加油站雷翻路人 
  src="video/images/20081023_1602301492301148.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=山寨加油站雷翻路人 target=_play 
  href="http://www.openv.com/play/JiangXiTVprog_20081023_6821962_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=山寨加油站雷翻路人 target=_play 
  href="http://www.openv.com/play/JiangXiTVprog_20081023_6821962_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=山寨加油站雷翻路人 target=_play 
  href="http://www.openv.com/play/JiangXiTVprog_20081023_6821962_0.html">山寨加油站雷翻路人</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_631.html">杂志天下</A></DIV>
  <LI>
  <DIV class=img><A title=模特被朋友引入毒窝 target=_play 
  href="http://www.openv.com/play/ShanDongLifeprog_20081022_6818834_0.html"><IMG 
  alt=模特被朋友引入毒窝 
  src="video/images/20081023_1435340755669302.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=模特被朋友引入毒窝 target=_play 
  href="http://www.openv.com/play/ShanDongLifeprog_20081022_6818834_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=模特被朋友引入毒窝 target=_play 
  href="http://www.openv.com/play/ShanDongLifeprog_20081022_6818834_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=模特被朋友引入毒窝 target=_play 
  href="http://www.openv.com/play/ShanDongLifeprog_20081022_6818834_0.html">模特被朋友引入毒窝</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_7586.html">生活帮</A></DIV>
  <LI>
  <DIV class=img><A title=史上最牛乞丐英语乞讨 target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081022_6819772_0.html"><IMG 
  alt=史上最牛乞丐英语乞讨 
  src="video/images/20081023_1619002057533020.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=史上最牛乞丐英语乞讨 target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081022_6819772_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=史上最牛乞丐英语乞讨 target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081022_6819772_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=史上最牛乞丐英语乞讨 target=_play 
  href="http://www.openv.com/play/SHDongFangTVprog_20081022_6819772_0.html">史上最牛乞丐英语乞讨</A></DIV>
  <DIV class=ly><SPAN>栏目：</SPAN><A class=c_green target=_blank 
  href="http://tv.openv.com/col_347.html">真情实录</A></DIV></LI></UL>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://news.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV style="HEIGHT: 12px" class=clear></DIV><!-- 网友热搜 -->
<DIV class=siderC_box>
<DIV class=title>
<DIV class=left></DIV>
<DIV class=mid><SPAN><A class="f14 b c_black" 
href="http://bt.openv.com/">网友热搜</A></SPAN> 
<DIV class=bb>
<UL>
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=ent_2008_1872">&nbsp;Leah 
  Dizon&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1777">&nbsp;写真&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1755">&nbsp;车模&nbsp;</A> 
  <LI><A class=c_grey2 target=_play 
  href="http://t.openv.com/zj/show.php?pid=bt_2008_1613">&nbsp;裸聊&nbsp;</A> 
</LI></UL></DIV>
<DIV id=L_7_UL_C class=fy><IMG class=M_L onClick="M_L_Move('L_7_UL',0)" border=0 
align=absMiddle 
src="video/images/ico_7.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_7_UL',1)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp;&nbsp; <IMG class=M_L 
onclick="M_L_Move('L_7_UL',2)" border=0 align=absMiddle 
src="video/images/ico_6.jpg" 
width=7 height=7>&nbsp;&nbsp; <IMG class=hand onClick="M_L_Move('L_7_UL',0,-1)" 
border=0 align=absMiddle 
src="video/images/ico_8.jpg" 
width=30 height=21><IMG class=hand onClick="M_L_Move('L_7_UL',0,1)" border=0 
align=absMiddle 
src="video/images/ico_9.jpg" 
width=30 height=21> </DIV></DIV>
<DIV class=right></DIV></DIV>
<DIV class=clear></DIV>
<DIV class="content border">
<DIV id=L_7_UL class=max px="656">
<UL class=eight>
  <LI>
  <DIV class=img><A title=英超足球宝贝内衣秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826222_0.html"><IMG 
  alt=英超足球宝贝内衣秀 
  src="video/images/20081024_dvdprogramme_Programme_124438954_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=英超足球宝贝内衣秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826222_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=英超足球宝贝内衣秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826222_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=英超足球宝贝内衣秀 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826222_0.html">英超足球宝贝内衣秀</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>六间房</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E5%86%85%E8%A1%A3%E7%A7%80">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=新婚初夜要做什么 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826226_0.html"><IMG 
  alt=新婚初夜要做什么 
  src="video/images/20081024_1531474985845822.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=新婚初夜要做什么 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826226_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=新婚初夜要做什么 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826226_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=新婚初夜要做什么 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826226_0.html">新婚初夜要做什么</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>酷六</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%AC%AC%E4%B8%80%E6%AC%A1">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=密室裸露瑜伽 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826228_0.html"><IMG 
  alt=密室裸露瑜伽 
  src="video/images/20081024_dvdprogramme_Programme_124735889_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=密室裸露瑜伽 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826228_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=密室裸露瑜伽 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826228_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=密室裸露瑜伽 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826228_0.html">密室裸露瑜伽</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>酷六</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%91%9C%E4%BC%BD">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=经典避孕套另类用途 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826236_0.html"><IMG 
  alt=经典避孕套另类用途 
  src="video/images/20081024_1532175578421261.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=经典避孕套另类用途 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826236_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=经典避孕套另类用途 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826236_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=经典避孕套另类用途 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826236_0.html">经典避孕套另类用途</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>酷六</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E9%81%BF%E5%AD%95%E5%A5%97">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=性情饥饿的都市女人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826238_0.html"><IMG 
  alt=性情饥饿的都市女人 
  src="video/images/20081024_1532292863535188.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=性情饥饿的都市女人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826238_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=性情饥饿的都市女人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826238_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=性情饥饿的都市女人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826238_0.html">性情饥饿的都市女人</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>酷六</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%80%A7%E9%A5%A5%E6%B8%B4">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=大学宿舍雷人灯光表演 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826239_0.html"><IMG 
  alt=大学宿舍雷人灯光表演 
  src="video/images/20081024_1533292293524008.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=大学宿舍雷人灯光表演 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826239_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=大学宿舍雷人灯光表演 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826239_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=大学宿舍雷人灯光表演 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826239_0.html">大学宿舍雷人灯光表演</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>微视</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E9%9B%B7%E4%BA%BA">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=好莱坞艳情女皇全裸写真 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826237_0.html"><IMG 
  alt=好莱坞艳情女皇全裸写真 
  src="video/images/20081024_dvdprogramme_Programme_124900169_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=好莱坞艳情女皇全裸写真 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826237_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=好莱坞艳情女皇全裸写真 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826237_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=好莱坞艳情女皇全裸写真 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826237_0.html">好莱坞艳情女皇全裸写真</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>YOUTUBE</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E5%86%99%E7%9C%9F">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=少女出走惨遭男友诱奸 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826227_0.html"><IMG 
  alt=少女出走惨遭男友诱奸 
  src="video/images/20081024_1531100512342540.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=少女出走惨遭男友诱奸 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826227_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=少女出走惨遭男友诱奸 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826227_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=少女出走惨遭男友诱奸 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081024_6826227_0.html">少女出走惨遭男友诱奸</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>YOUTUBE</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E5%BC%BA%E5%A5%B8">搜索相关视频</A></DIV></LI></UL>
<UL class=eight>
  <LI>
  <DIV class=img><A title="一夜情旅馆大学门口猖狂揽客 " target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821618_0.html"><IMG 
  alt="一夜情旅馆大学门口猖狂揽客 " 
  src="video/images/20081023_dvdprogramme_Programme_133218405_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="一夜情旅馆大学门口猖狂揽客 " target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821618_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="一夜情旅馆大学门口猖狂揽客 " target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821618_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="一夜情旅馆大学门口猖狂揽客 " target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821618_0.html">一夜情旅馆大学门口猖狂揽客 
  </A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>新浪视频</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E4%B8%80%E5%A4%9C%E6%83%85">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=日本整人节目：疯狂出租车 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821611_0.html"><IMG 
  alt=日本整人节目：疯狂出租车 
  src="video/images/20081023_dvdprogramme_Programme_132922073_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=日本整人节目：疯狂出租车 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821611_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=日本整人节目：疯狂出租车 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821611_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=日本整人节目：疯狂出租车 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821611_0.html">日本整人节目：疯狂出租车</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>六间房</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%95%B4%E4%BA%BA">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=老外整人就是狠 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821592_0.html"><IMG 
  alt=老外整人就是狠 
  src="video/images/20081023_dvdprogramme_Programme_132741398_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=老外整人就是狠 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821592_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=老外整人就是狠 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821592_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=老外整人就是狠 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821592_0.html">老外整人就是狠</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>优酷</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%95%B4%E4%BA%BA">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=湖南主持人节目现场发飙 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821588_0.html"><IMG 
  alt=湖南主持人节目现场发飙 
  src="video/images/20081023_dvdprogramme_Programme_132707973_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=湖南主持人节目现场发飙 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821588_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=湖南主持人节目现场发飙 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821588_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=湖南主持人节目现场发飙 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821588_0.html">湖南主持人节目现场发飙</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>新浪视频</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E4%B8%BB%E6%8C%81%E4%BA%BA">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=最性感惊艳水做晚礼服 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821273_0.html"><IMG 
  alt=最性感惊艳水做晚礼服 
  src="video/images/20081023_dvdprogramme_Programme_113225618_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=最性感惊艳水做晚礼服 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821273_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=最性感惊艳水做晚礼服 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821273_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=最性感惊艳水做晚礼服 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821273_0.html">最性感惊艳水做晚礼服</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>YouTube</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%BE%8E%E5%A5%B3">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=超级搞笑的腹语 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6822730_0.html"><IMG 
  alt=超级搞笑的腹语 
  src="video/images/20081023_1743115427364284.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=超级搞笑的腹语 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6822730_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=超级搞笑的腹语 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6822730_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=超级搞笑的腹语 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6822730_0.html">超级搞笑的腹语</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>YouTube</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%90%9E%E7%AC%91">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=实拍北京华贸玻璃清洁工坠楼惨死 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821584_0.html"><IMG 
  alt=实拍北京华贸玻璃清洁工坠楼惨死 
  src="video/images/20081023_1721244558668530.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=实拍北京华贸玻璃清洁工坠楼惨死 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821584_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=实拍北京华贸玻璃清洁工坠楼惨死 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821584_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=实拍北京华贸玻璃清洁工坠楼惨死 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821584_0.html">实拍北京华贸玻璃清洁工坠楼惨死</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>新浪视频</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%84%8F%E5%A4%96">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=艺术院校女生陪酒陪吸毒 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821613_0.html"><IMG 
  alt=艺术院校女生陪酒陪吸毒 
  src="video/images/20081023_1721106763754823.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=艺术院校女生陪酒陪吸毒 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821613_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=艺术院校女生陪酒陪吸毒 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821613_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=艺术院校女生陪酒陪吸毒 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081023_6821613_0.html">艺术院校女生陪酒陪吸毒</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>优酷</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E4%B8%89%E9%99%AA">搜索相关视频</A></DIV></LI></UL>
<UL class=eight>
  <LI>
  <DIV class=img><A title=现代动作片《车皮》 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816546_0.html"><IMG 
  alt=现代动作片《车皮》 
  src="video/images/20081022_1427246799803479.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=现代动作片《车皮》 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816546_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=现代动作片《车皮》 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816546_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=现代动作片《车皮》 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816546_0.html">现代动作片《车皮》</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>天线原创</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%94%BB%E7%9A%AE">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=美女网络寻爱沦为性奴 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816302_0.html"><IMG 
  alt=美女网络寻爱沦为性奴 
  src="video/images/20081022_1428026576493473.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=美女网络寻爱沦为性奴 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816302_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=美女网络寻爱沦为性奴 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816302_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=美女网络寻爱沦为性奴 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816302_0.html">美女网络寻爱沦为性奴</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>优酷</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%BD%91%E6%81%8B">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=北京女：没房没车不算男人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816295_0.html"><IMG 
  alt=北京女：没房没车不算男人 
  src="video/images/20081022_1427098646524112.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=北京女：没房没车不算男人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816295_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=北京女：没房没车不算男人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816295_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=北京女：没房没车不算男人 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816295_0.html">北京女：没房没车不算男人</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>微视</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E7%94%B7%E4%BA%BA">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=洋妞车展上演群乳斗艳 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816293_0.html"><IMG 
  alt=洋妞车展上演群乳斗艳 
  src="video/images/20081022_1428430255581682.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=洋妞车展上演群乳斗艳 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816293_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=洋妞车展上演群乳斗艳 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816293_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=洋妞车展上演群乳斗艳 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816293_0.html">洋妞车展上演群乳斗艳</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>六间房</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%B4%8B%E5%A6%9E">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=没有视觉情色只有意淫 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816301_0.html"><IMG 
  alt=没有视觉情色只有意淫 
  src="video/images/20081022_1429004966523715.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=没有视觉情色只有意淫 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816301_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=没有视觉情色只有意淫 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816301_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=没有视觉情色只有意淫 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816301_0.html">没有视觉情色只有意淫</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>微视</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%84%8F%E6%B7%AB">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=施瓦辛格裸诱少妇 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816303_0.html"><IMG 
  alt=施瓦辛格裸诱少妇 
  src="video/images/20081022_1426512618503585.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=施瓦辛格裸诱少妇 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816303_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=施瓦辛格裸诱少妇 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816303_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=施瓦辛格裸诱少妇 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816303_0.html">施瓦辛格裸诱少妇</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>YouTube</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%96%BD%E7%93%A6%E8%BE%9B%E6%A0%BC">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title="商家雷人性药广告 大谈床上房事" target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6817420_0.html"><IMG 
  alt="商家雷人性药广告 大谈床上房事" 
  src="video/images/20081022_dvdprogramme_Programme_162205776_5.000.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title="商家雷人性药广告 大谈床上房事" target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6817420_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title="商家雷人性药广告 大谈床上房事" target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6817420_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title="商家雷人性药广告 大谈床上房事" target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6817420_0.html">商家雷人性药广告 
  大谈床上房事</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
class=c_grey2>优酷</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E6%B4%9E%E6%88%BF">搜索相关视频</A></DIV>
  <LI>
  <DIV class=img><A title=夏日小骚妇床上自拍 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816307_0.html"><IMG 
  alt=夏日小骚妇床上自拍 
  src="video/images/20081022_1427509124874660.jpg" 
  width=124 height=97></A> 
  <DIV class=bg><A title=夏日小骚妇床上自拍 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816307_0.html"><IMG 
  src="video/images/gif.gif"></A></DIV>
  <DIV class=bf><A title=夏日小骚妇床上自拍 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816307_0.html"><IMG 
  src="video/images/ico_4.gif" 
  width=10 height=19></A></DIV></DIV>
  <DIV class=tm><A class=b title=夏日小骚妇床上自拍 target=_play 
  href="http://www.openv.com/play/dvdprogramme_20081022_6816307_0.html">夏日小骚妇床上自拍</A></DIV>
  <DIV class=ly><SPAN class=c_black>来源：</SPAN><SPAN 
  class=c_grey2>六间房</SPAN></DIV><!--div class="ly"><img src="http://img.openv.tv/openvcom/images/ico_5.gif" width="13" height="13" align="absmiddle" />&nbsp;&nbsp;<a href="#" class="c_orange">观 看</a></div-->
  <DIV class=bf1><A class=c_blue1 target=_blank 
  href="http://www.openv.com/ls.php?q=%E9%AA%9A">搜索相关视频</A></DIV></LI></UL></DIV>
<DIV class=clear></DIV>
<DIV class="tright more"><A class="b c_grey2" target=_blank 
href="http://bt.openv.com/">更多&gt;&gt;</A></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=bot></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV></DIV>
<DIV class=siderB_box>
<DIV class=siderI_box>
<DIV id=right_1 class=sider_right><!-- 右侧1 -->
<DIV class=top></DIV>
<DIV class=mid>
<DIV class=title><SPAN class="c_grey2 f14 b">电视剧排行</SPAN></DIV>
<UL>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num1.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【传奇传记】李小龙年少时无心学业，却对武术着迷，儿时还曾随父出演电影。餐馆老板徐迪雅女士是位具有女政治家的风范的华人社团代言人，她看出了李小龙是个颇有志向的同胞青年，在辞去李小龙餐馆工作时，借给李小龙一笔仅可维持一个月生计的美金，并以一位同胞和长者的口吻给了李小龙一番临别赠言。 
  target=_blank href="http://hd.openv.com/tv_show.php?col=2112">李小龙传奇</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num2.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【青春偶像剧】林无敌，是个刚刚走出校门的金融硕士。成绩优异、能力超群，可就是找不到体面的工作。究其原因，主要就是因为她比较抱歉的长相、刻板认真的作品和落后时代20年的穿着打扮。无敌屡次求职受挫，虽然坚信总会遇到赏识自己的老板，但为了能尽快赚到工资，以分担父母的日益严重经济压力，从不肯轻易服输的她，也不得不降低要求，尝试着去应聘秘书这个不起眼的职位。终于无敌等到了国内著名广告公司“概念”给打来了面试电话，本以为以自己的实力可以轻松赢得这个职位，不想和她同场竞争的是位虽蠢，却格外美丽性感留学生。更要命的是，这个叫裴娜的女孩还有另外一重身份——概念公司制作总监李安茜闺中密友。李安茜之所以推荐裴娜前来面试总裁秘书，是因为心中有自己的小九九。 
  target=_blank href="http://hd.openv.com/tv_show.php?col=2244">丑女无敌</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num3.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title="【青春偶像剧】在霹雳队中担任重要角色的是东方翔（言承旭饰）和元大鹰（罗志祥饰），他们在篮球方面都有自己的一套本领．连一年一度激起全国青年热血参与的全国大专联赛C.U.B.A.，五大篮球名校----玄武、苍龙、白虎、朱雀、澄麟，到底谁会得到冠军金杯？同时，为了追求心中的篮球梦，元大鹰继承了死去的奶奶所收藏的一颗金线篮球（奶奶铁兰唯一的遗物），按照奶奶的遗愿离乡前来投靠霹雳大学校长李子平的父亲。获得全国大专联赛最佳MVP的天才明星球员----东方翔，竟然从不败的篮球名校玄武工学院转到霹雳大学来了！因移情作用大鹰对洁儿有著莫名的好感，但洁儿同时也是东方翔家中司机的女儿，两人之间也有著青梅竹马的暧昧情愫，三人在霹雳命运的交会，也注定会改写霹雳球队的历史…. " 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1441">篮球火</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num4.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title="【青春偶像剧】故事，就从某一种盘据全亚洲的女孩类型说起。这种女孩，叫“便利贴女孩”。她，朴素、简单安分、愿望也小小的，从来就不是什么Somebody，也不期待变成一个Somebody。她们功能小小，但是又不可或缺，就像是一张随手可撕的便利贴，不起眼也不特别，但你的身边一定有她！一趟豪华邮轮之旅，让这样一位平凡的女孩碰上史上最不平凡的际遇…… " 
  target=_blank 
href="http://hd.openv.com/tv_show.php?col=1241">命中注定我爱你</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num5.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【青春偶像剧】夏之星，24岁的女诈欺犯，准予假释。一个为爱入狱的女子，终于等待到今日，与她情人十三见面，她还特地到六星级饭店，挑选礼物。今天是E.SHINE集团二少爷仲天骐昔日情人欧雅若与哥哥仲天骏的婚礼，同时也是母亲家传蓝钻的“QUEENMARY”的切割拍卖会。刻意避开婚礼的仲天骐硬是被怪兽从机场押回来，来到会台的他溜进婚礼后台，将雅若扯入怀，天骐吻了她。同时，窃走QUEENMARY…… 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1714">放羊的星星</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num6.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【青春偶像剧】剧中杨丞琳扮演打扮夸张，身上有五颜六色，一个自以为很潮却打扮得很俗的女生，甚至会把自己扮成圣诞树。而潘玮柏将扮演一个很机车的造型师。相信两人一定能擦出精彩火花，共同打造一部有全新感觉的偶像剧。凡事要求完美的唐门，却遇上五颜六色的蒋小花，更夸张的是：这颗圣诞树还敢对他做的造型品头论足？!“没有品味的人比感冒病毒还可怕，你，最好离我远一点”！唐门对小花，避之唯恐不及，怎料到他的好朋友贾思乐却爱她爱到盲目，连美丽、大方的未婚妻江蜜都愿意拱手让给他？ 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1906">不良笑花</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num7.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title="【青春偶像剧】《黑糖群侠传》是一部集合韩国火山高校的张力、英国哈利波特的情绪、香港龙虎门的镜头的偶像连续剧。由两大最受欢迎的人气团体棒棒堂、黑涩会美眉携手演出，各界引领期盼的功夫偶像剧即将登场!看千年前各大武林门派的独门绝活、弟弟美眉的惊人火花，激荡出一段让你拍案叫绝的校园喜剧…暨07轰动演艺圈的「黑糖玛奇朵」后，棒棒堂、黑涩会美眉的第二部令人期待的偶像剧终于要登场了!!一部结合各种新鲜元素的全新功夫偶像剧「黑糖群侠传」即将轰动08年暑假!黑涩会美眉--小薰、小蛮、丫头;棒棒堂-王子、小煜、阿纬以及模范男孩阿本、小马将担任要角演出，令人期待!  " 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1501">黑糖群侠传</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num8.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【经典美剧】在洛杉矶，他眼见着格雷奇恩和惠斯勒从一辆由马洪驾驶的豪华轿车中钻出来，并且进入了罗斯福饭店。在乔装打扮成一个侍者后，迈克尔走向了这群夺走了他一切的混蛋们。随后，惠斯勒跟一个男人做了笔5千万美元的买卖，而买卖的对象则是一枚对公司有着非比寻常价值的计算机存储卡，拿到卡以后惠斯勒便杀了可怜的卖方。在惠斯勒正准备逃走之际，一直尾随的迈克尔出面制服了他。在格雷奇恩进来查看到底发生了什么的时候迈克尔用枪瞄准了她，她告诉他说萨拉仍然活着。在警察赶到的时候，三个人跑出了旅店。但是在迈克尔问出萨拉下落之前其他俩人却早已逃之夭夭了。 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1860">越狱第四季</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num9.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【青春偶像剧】一对八竿子打不着的年轻男女，因为街头的一次意外撞击，不小心撞出漫天绯闻，也撞出一段趣味横生的浪漫情缘，两个平行的人生，从此交缠在一起，展开了一段浪漫而不凡的人生旅程。微笑Pasta，一段爱与Smile的故事，夹杂着青春和美味，让你边笑边感动，边笑边落泪。 
  target=_blank 
href="http://hd.openv.com/tv_show.php?col=1641">微笑pasta</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num10.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【青春偶像剧】如果童话故事是真的，那么俞心蕾无疑是童话故事里最完美的公主。随着父母赴彼岸经商，从小生长在上海的她在富裕环境下优雅成长，被父母当成“公主”般照顾呵护着，不但让她年纪轻轻就懂得八国语言，更弹得一手好钢琴。每当听到他人称赞的话语，甚至有人对她心生羡慕时，俞心蕾的脸上，总是挂着无所谓的笑容。她并不觉得这一切有什么稀奇，眼前的幸福，对身为公主的她来说，再理所当然不过的了。她从不担心这些幸福会不会有一天突然消失，因为在她心目中，这根本是不可能发生的事。从小到大陪在俞心蕾身边的人除了父母外，还有她的儿时玩伴熙贤。 
  target=_blank href="http://hd.openv.com/tv_show.php?col=1561">转角遇到爱</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV></LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=bot1></DIV></DIV></DIV>
<DIV class=clear></DIV>
<DIV style="HEIGHT: 10px"></DIV>
<DIV class=siderI_box>
<DIV id=right_2 class=sider_right><!-- 右侧2 -->
<DIV class=top></DIV>
<DIV class=mid>
<DIV class=title><SPAN class="c_grey2 f14 b">电影排行</SPAN></DIV>
<UL>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num1.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【惊悚片】秦汉年间，都尉王生率王家军在西域与沙匪激战中救回一绝色女子，并带回江都王府。不想此女乃“九霄美狐”小唯披人皮所变。其皮必须用人心养护，故小唯的隐形助手小易——一只沙漠蜥蜴修成的妖，每隔几天便杀人取心供奉小唯，以表对小唯的爱意，江都城因此陷入一片恐怖中。小唯因王家军首领王生勇猛英俊对其萌生爱意，并不停用妖术诱惑王生，想取代王生妻子佩容的地位...... 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081009_6765633.html">画皮</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num2.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【动作片】本·斯蒂勒自导自演的动作喜剧，讲述的是一个拍摄战争片的剧组在东南亚的丛林中遭遇到真实的战争，笑料不断。本片的拍摄地是夏威夷群岛中最大的岛屿之一的Kauai，本-斯蒂勒在那里有一幢房子。之所以选择这个岛拍摄是得益于与Kauai电影协会谈判的结果，剧组能够享受税收上的优惠政策。 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081018_6801124.html">热带惊雷</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num3.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt></A><A 
  title=【情感片】本片讲述的是狗与人情感物语，描绘一只没有特殊能力的狗和普通少女的故事，以人的成长作为主线来刻画人与动物之间的感情。由于影片跨度长达十年，还要反应春夏秋冬的不同景色，摄制组特地将拍摄分为三个阶段，第一次是在2006年11月，第二次是2007年的4月和5月，第三次则是2007年的7月。 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081007_6757361.html">狗狗与我的十个约定</A></DIV>
  <DIV class=tjl>
  <DIV align=right><SPAN class=c_grey2><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></SPAN></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num4.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【动作片】为了一件大案子的调查，他加入了洛杉矶街头黑夜充满刺激的速度竞赛。在这个不同的城市，不同的时间，奥康纳只有最后的一次机会，来捍卫自己的荣誉。在迈阿密长大的卡特是个精明的商人，他利用自己的进出口生意为全球性的黑市交易洗钱。奥康纳的任务就是接近这个家伙套取情报。但是这个不守常规的人在接受任务前必须抹掉自己身上的烙印。不过他很不情愿的发现那些隐藏着的伙伴里居然有自己童年时代的好友、前搭档罗曼?皮尔斯，他可是个犯罪高手。现在他的假释官给了他一个机会??跟奥康纳合作。现在对于皮尔斯和奥康纳来说都是他们最后一个机会了。这个夏天，在同一条跑道后，再次出发…… 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081008_6761835.html">速度与激情2：飙风再起</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num5.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【情感片】主人公宰京是一名出生豪门毫无目标的花花公子，对于他来说，现在唯一要做的事情就是等待自己成年拿到身份证那一天的到来，这样他就可以名正言顺的继承爷爷所留下的巨额遗产。但是生活却与宰京开了一个大玩笑，就在他他满心欢喜地拿到身份证的第二天，却得知爷爷在遗书中声明，如果他想要继承遗产，就必须拿到韩国江原道某山沟中学校的毕业证书，否则将失去遗产的继承权。逼于无奈宰京只好来到爷爷所指定的偏远山沟... 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081013_6779072.html">百万富翁的初恋</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num6.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【爱情片】看来平凡无奇的小镇居民，失意乐团主唱阿嘉、只会弹月琴的老邮差茂伯、在修车行当黑手的水蛙、唱诗班钢琴伴奏大大、小米酒制造商马拉桑、以及交通警察劳马父子，组合出了一个让人跌破眼镜的乐团.... 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081007_6757337.html">海角七号</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num7.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【卡通片】在宁静祥和的和平谷里，生活着一群悠闲可爱的动物。其中，胖胖的熊猫阿波作为面馆里的服务生，一向以好吃懒做而闻名，但他也是天底下最热血的中国功夫迷。不过，善良诚实的他倒也常得到人们的喜爱。然而，一只凶猛邪恶的雪豹泰龙的闯入，使得和平谷里的人们遭遇了前所未有的威胁。为了，尽早铲除恶豹，和平谷的居民们准备召集各路好汉，以比武大会的形式推选出最强悍之人前去迎敌。熊猫波爱凑热闹的毛病，竟让包括浣熊师父、猴子大师、毒蛇大师、丹顶鹤大师、老虎大师、螳螂大师等几位身怀绝技的高手，认定熊猫波是上天安排的拯救和平谷之人。于是，慵懒贪吃的日子被整日习武练功的苦差所取代。胖熊猫能最终功成名就，打败强敌吗…… 
  target=_blank 
  href="http://hd.openv.com/mov_play-movieclips_20080828_6599862.html">功夫熊猫</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num8.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【惊悚片】一位摄影师，在地铁站漫无目的地闲逛时遭遇了一个手拿提包的神秘人，并认定他就是那个让城市笼罩在恐慌当中的连环杀人犯。 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20081013_6779108.html">午夜食人列车</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num9.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【动作片】公元前50年，龙帝（李连杰）残暴虐杀，百姓苦不堪言。女术士紫媛（杨紫琼）拼了性命，用咒语将暴君和其手下兵将全变成兵马俑，封印于地下墓陵。转眼已是1946年，出生入死的冒险家里克（布兰登·弗雷泽）和妻子伊芙琳（玛丽娅·贝罗），如今隐居于英国牛津郡。平静的生活未免有些乏味，于是，当得到了外国办事处提供的“最后任务”--把一件从上海博物馆偷走的珍贵文物物归原主的时候，两人欣然启程。此时，他们完全不清楚这一路将有多少艰险！ 
  target=_blank 
  href="http://hd.openv.com/mov_play-movieclips_20080829_6603689.html">木乃伊3：龙帝之墓</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=下降 
  src="video/images/20081008_1047469065882078.gif" 
  width=9 height=9></DIV></DIV>
  <LI>
  <DIV class=numb><IMG 
  src="video/images/num10.jpg" 
  width=14 height=11></DIV>
  <DIV class=bt><A 
  title=【伦理片】性感美丽的美英在爵士酒吧做歌手，她身材热辣模样漂亮身边从来都不缺优秀的男人，但天生尤物的她似乎从来都不把男人放在眼里，直到她生命中出现一个神秘的英俊男人秀铉。美英迅速爱上了他，并且第一次感受到什么叫爱情的只烈，两个人的感情以惊人的速度不断升温彼此都难以割舍后，美英将他领回了家。而这个男人的到来却打乱了整个家庭平静的生活，美英的两个姐姐都陷入了秀炫的温柔陷阱而无一幸免。美英的大姐是个先连书的的传统女性家庭妇女，表面上看生活波澜不惊其实内心却是汹涌；而二姐是个书呆子，女研究生把自己用知识包裹的像一个爱情斗士只是已经27岁仍旧固执的监守着自己所谓一见钟情的爱情。三个女人性格窘仪，生活圈子也大相径庭，然而却和同一个男人纠葛…… 
  target=_blank 
  href="http://hd.openv.com/mov_play-hdmovie_20080815_6546474.html">色即是秘密</A></DIV>
  <DIV class=tjl>
  <DIV align=right><IMG alt=上升 
  src="video/images/20081008_1047369717979270.gif" 
  width=9 height=9></DIV></DIV></LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=bot1></DIV></DIV></DIV>
<DIV class=clear></DIV>
<DIV id=right_3><!-- 右侧3 --><!-- 广告 开始 -->
<DIV class=siderK_box>
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
</DIV>
<DIV class=clear></DIV>
<DIV class=siderK_box>
<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
</DIV><!-- 广告 结束 --></DIV></DIV><!-- 电视节目大全 -->
<DIV class=clear></DIV>
<DIV class="dq hand" onclick=showDq()>电视节目大全</DIV>
<DIV style="DISPLAY: none" id=dsjmdq class=dq_content><!-- -->
<UL>
  <LI class="expli hand" onclick=showTag(0)>节目类型 
  <LI class=hand onclick=showTag(1)>电视台 </LI></UL>
<DIV class=clear></DIV>
<DIV class=tab></DIV>
<DIV style="DISPLAY: none" class=tab></DIV><!-- -->
<DIV class=clear></DIV></DIV>
<DIV class=clear></DIV>
<SCRIPT 
src="video/images/zt_foot.js"></SCRIPT>

<DIV style="PADDING-TOP: 2px"></DIV></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT>
    $('.foot_mulu:first','#zt_foot').css('width','935px');
  </SCRIPT>
<!-- 统计 开始-->
<SCRIPT 
src="video/images/vmis.php"></SCRIPT>
<!-- 统计 结束--><!--usetime:0.180598974228--></BODY></HTML>
