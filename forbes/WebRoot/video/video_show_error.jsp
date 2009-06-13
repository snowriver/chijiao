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
	<SCRIPT src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	
	


<SCRIPT language="javascript" type="text/javascript">
	
	
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
		
	
		
		$(window).bind("load",function(){
			listCommends("iscommend DESC", "commend_video");
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
<DIV>



<DIV>
	<br>
</DIV>
<A name=list></A>
<DIV id=content>
<DIV class=siderA_box>
<DIV class=siderC_box>
<DIV class=siderC_box_top>
<DIV class=sider_box_left></DIV>
<DIV class="sider_box_mid widthA"><SPAN class="f14 b c_color">错误信息</SPAN> 

<DIV class=nn> 
<SPAN><br></SPAN></DIV></DIV>
<DIV class=sider_box_right></DIV></DIV>
<DIV class=clear></DIV>

<br>

<DIV id=pagelist class="siderC_box_mid border">
<!--列表-->
<font color="white">您访问的视频不存在或者已经被删除！</font>
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



</BODY></HTML>
