<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>${VIDEO.title } - 专辑 - 赤脚网在线学习视频</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name="Keywords" content="${VIDEO.title }" />
	<META name="Description" content="${VIDEO.title }" />
	<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	
	<LINK rel=stylesheet type=text/css href="css/generl.css">
	<LINK rel=stylesheet type=text/css href="css/zj_bof.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	

	<STYLE type="text/css">
		BODY {
			BACKGROUND: url(images/bg.jpg) #5c5c5c repeat-x left top
		}
	</STYLE>
	<STYLE type=text/css>
		*#zt_foot A {
			COLOR: #cccccc !important
		}
		*#zt_foot A:visited {
			COLOR: #cccccc !important
		}
		*#zt_foot A:hover {
			COLOR: #d18f00 !important
		}
		#zt_foot *.foot_font {
			COLOR: #9e9e9e !important
		}
	</STYLE>
	
	<SCRIPT type=text/javascript src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type=text/javascript src="js/flashPlayList.js"></SCRIPT>
	<SCRIPT type=text/javascript src="js/sortList.js"></SCRIPT>
	<SCRIPT src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	
	


<SCRIPT language="javascript" type="text/javascript">
	function Digg() {	
	    	$.ajax({
				url: 'VideoDigg.do',
				type: 'post',
				dataType: 'html',
				data:"id=${VIDEO.id }",
				timeout: 10000,
				error: function(){
					alert("操作失败，请稍后再试");
				},
				success: function(rsHtml){
					var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
					//alert(result);
					$("#upnum").html(result);
					//$("#digg").attr("disabled","true"); 
					$("#up").empty();
					$("#up").append("<center>顶过了</center>");
				}
			});
			
	}
	
	function listCommends(orderby, divid){
			$.ajax({
				url: 'VideoSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top&orderby=" + orderby,
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
		
		function listLikes(orderby, divid){
			$.ajax({
				url: 'VideoSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=like&id=${VIDEO.id}&orderby=" + orderby,
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
		
		$(window).bind("load",function(){
			//listComments(${ARTICLE.id }, "commentinfoDiv1");
			listCommends("iscommend%20DESC", "commend_video");
			listLikes("pubdate%20desc", "like_video");
	    });
</script>
</HEAD>
<BODY>

<SCRIPT type="text/javascript">		
	var totalnum=${fn:length(VIDEO.videoUrls)};
	nvg_name = 'zhuanji'
</SCRIPT>

<DIV id=wrapper>
	<%@ include file="include/header.jsp"%>
	
	<DIV class=clear></DIV>
	
	<DIV class=clear></DIV>
	
	<DIV class=clear></DIV>
<DIV>

<SCRIPT language=JavaScript1.1 src=""></SCRIPT>

<DIV id=vedio>
	<DIV class=swf>
		<DIV class=title><SPAN id=title class="c_color f14 b"></SPAN>&nbsp;</DIV>

		<DIV id=vplay_td>
			<img src="images/loading.gif" />	
		</DIV>
	</DIV>
	
	<DIV class=swf_sm>
		<DIV class=swf_s_t></DIV>
		<DIV class=swf_s_m>
			<DIV class=title><SPAN class="c_color5 b f14">[ 专辑 ]&nbsp;${VIDEO.title }</SPAN></DIV>
			<DIV class=clear></DIV>
			<DIV class=content>
				<DIV class=img><IMG src="../${VIDEO.litpic }" width=120 height=90></DIV>
				<DIV class=font>
					<DIV class="c_color5 b">视频数：${fn:length(VIDEO.videoUrls)}</DIV>
					<DIV id=zjCategory class=c_color5>
						<SPAN class=b>分类：</SPAN>
						<c:if test="${not empty VIDEO.videoType2}"><A class=c_color1 target=_blank href="#">${VIDEO.videoType2.name }</A></c:if>
						<c:if test="${ empty VIDEO.videoType2}"><A class=c_color1 target=_blank href="#">${VIDEO.videoType.name }</A></c:if>
					</DIV>
					<DIV id=zjTag class=c_color5>
						<SPAN class=b>标签：</SPAN> 
						<A class=c_color1 target=_blank href="#">${ VIDEO.videoType2.name} </A>&nbsp;
						<c:set var="keywords" value="${fn:split(VIDEO.keywords, ' ')}"></c:set>
						
						<c:forEach items="${keywords}" var="item" varStatus="is">
							<A class=c_color1 target=_blank href="#">${item}</A>&nbsp;
						</c:forEach>
					</DIV>
					
					<DIV class="c_color5 b">责任编辑:${VIDEO.username }&nbsp; 
						<SPAN class=b>创建时间:</SPAN><fmt:formatDate value="${VIDEO.pubdate }" pattern="yyyy-MM-dd"/>
					</DIV>
				</DIV>
				<DIV class=clear></DIV>
				<DIV class=line2></DIV>
				<DIV class=clear></DIV>
				<DIV class="jj c_color5 l18">
					<SPAN class=b>简介：</SPAN> ${fn:substring(VIDEO.description, 0, 150)}..
			
				</DIV>
				<DIV class=clear></DIV>
				<DIV class=line2></DIV>
				<DIV class=clear></DIV>
				
				<DIV class=sc>
					<DIV class="title c_color5 f14">本专辑已被 <SPAN id=colectnum class=c_color2>${FAVORITE_COUNT }</SPAN> 个网友收藏</DIV>
					
					<DIV class=clear></DIV>
					<DIV class=anniu_sc>
						<IMG style="CURSOR: pointer" id=col title=添加到收藏夹 onclick="openDIV('收藏','../client/ClientManageVideoFavorite.do?act=add&id=${VIDEO.id }','500','350')" name=colect src="images/anniu_sc.jpg" width=63 height=23> 
					</DIV>
					
					<DIV class=anniu_ding>
						<DIV><SPAN id=upnum class=c_color2>${VIDEO.digg }</SPAN></DIV>
						<DIV><SPAN class=c_color><A id=up href="javascript:void(0);" onclick="Digg();" name=up>顶</A></SPAN></DIV>
					</DIV>
				</DIV>
				<DIV class=clear></DIV>
			</DIV>
		</DIV>
		<DIV class=swf_s_b></DIV>
	</DIV>
	<DIV class=clear></DIV>
</DIV>
<DIV class=clear></DIV>

<DIV>
	<SCRIPT language=JavaScript1.1 src=""></SCRIPT>
</DIV>
<A name=list></A>
<DIV id=content>
<DIV class=siderA_box>
<DIV class=siderC_box>
<DIV class=siderC_box_top>
<DIV class=sider_box_left></DIV>
<DIV class="sider_box_mid widthA"><SPAN class="f14 b c_color">专辑列表</SPAN> 
<FORM method=get action=isearch.do>
<DIV class=filter_panel>
<DIV class=combo_box>
<DIV>列表排序 </DIV>
<UL id=sort>
  <LI onClick="sortList('VList','zx')">正序 
  <LI onClick="sortList('VList','dx')">倒序 </LI></UL></DIV></DIV></FORM>
<DIV class=nn>
<SPAN>简介模式&nbsp;&nbsp;<IMG style="CURSOR: pointer" onclick="HList(1,2,'zx')" align=absMiddle src="images/ico_18.jpg" width=16 height=15>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
列表模式&nbsp;&nbsp;<IMG style="CURSOR: pointer" onClick="VList(1,1,'zx')" align=absMiddle src="images/ico_19.jpg" width=16 height=15></SPAN></DIV></DIV>
<DIV class=sider_box_right></DIV></DIV>
<DIV class=clear></DIV>

<SCRIPT type=text/javascript>
//v[${v}]='${VIDEO.title}:${url.title}||${url.url}';
			var v=[];
			var listCategory = "专辑";
			<c:forEach items="${VIDEO.videoUrls}" var="url" varStatus="is">
				
				<c:if test="${url.litpictype ==4}">
					v[${is.index}]='${url.title}||dvdprogramme_20081015_6787765||${url.litpic}||${url.url}||${url.title}';
				</c:if>
				<c:if test="${url.litpictype !=4}">
					v[${is.index}]='${url.title}||dvdprogramme_20081015_6787765||../${VIDEO.litpic}||${url.url}||${url.title}';
				</c:if>
			</c:forEach>
			//alert(v.length);
</SCRIPT>

<DIV id=pagelist class="siderC_box_mid border"><!--列表-->

</DIV>
<DIV class=clear></DIV>
<DIV class=page><!--页码--></DIV>
<DIV class=clear></DIV>


<DIV id=commentinfoDiv>
	<!-- ${VIDEO.content} -->
</DIV>


</DIV>
<DIV class=clear></DIV></DIV>
<DIV class=siderB_box>
<DIV class="siderG_box border">
<DIV class=siderG_box_top>
<UL>
  <LI class=expli tag="0">推荐专辑 
  <LI tag="1">相关专辑 </LI>
</UL></DIV>
<DIV class="siderG_box_mid ">
<!-- 推荐专辑 -->

<UL>
 
 <DIV id="commend_video">
	  <img src="images/loading.gif" />
 
 </DIV>
 </UL>


<!-- 相关专辑 --> 

<UL style="DISPLAY: none">
  
  <DIV id="like_video">
  <img src="images/loading.gif" />
  </DIV>
</UL>
 
 
<DIV class=clear></DIV></DIV></DIV>
<DIV class=clear></DIV></DIV></DIV>
<script src="js/zt_foot.js" charset="gb2312"></script>
<DIV class=clear></DIV>



<!--usetime:0.044538974762--></BODY></HTML>
