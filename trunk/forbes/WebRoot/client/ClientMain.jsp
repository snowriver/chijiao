<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ include file="include/gloable.jsp"%>
<%
	com.forbes.hibernate.bean.UcMembers ucMember = (com.forbes.hibernate.bean.UcMembers)request.getSession().getAttribute("CLIENT");
	com.forbes.ajax.ScoreBalanceLoad score = new com.forbes.ajax.ScoreBalanceLoad();
	//Short accountType = com.forbes.util.DictionaryManager.getInstance().getVal("ACCOUNT_TYPE", "2").getDvalue();
	try {
	
		request.setAttribute("BANLANCE", score.getUserBalance(ucMember.getUid().toString()) );
				//accountType.toString()));
	} catch (Exception e ) {
		e.printStackTrace();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>我的管理后台</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<script type="text/javascript" src="../js/common.js" ></script>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="p" value="client_main"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>管理中心首页</H1>
	<DIV class=userinfo>
		<DIV class=userface>	
			<IMG src="${UC_CENTER_URL }/avatar.php?uid=${sessionScope.CLIENT.uid }&size=mid&type=virtual">	
			<SPAN><A target="_blank" href="${UC_HOME_URL }/cp.php?ac=avatar">更换头像</A></SPAN>
		</DIV>
		
		<DIV class=userdetail>
			<UL>
  				<LI class=useradd>
  					我的空间地址：<A target="_blank" href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }">${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }</A> 
  				</LI>
  				<LI class=usernickname>
  					我的昵称：<SPAN>${sessionScope.CLIENT.username }</SPAN> <A href="ClientModifyProfile.do?act=getdetail">[修改基本资料]</A> 
  				</LI>
  				<LI class=userintegral>我的积分：<SPAN><PRE>${BANLANCE }</PRE>分</SPAN> <A href="#">[积分规则]</A> </LI>
  			</UL>
  		</DIV>
  		
  		<DIV class=useroperate>
  			<A title="我的文章" href="ClientManageArticle.do?act=list">我的文章</A> 
  			<A title="我的提问" href="ClientManageAsk.do?act=all&status=0_1">我的提问</A> 
  			<A title="我的收藏" href="ClientManageArticleFavorite.do?act=list">我的收藏</A> 
  		</DIV>
  	</DIV>
  	
  	<!-- 
  	
  	<DIV id=user_up class=data_opt_title>
		<UL>
  			<LI><A id=myupload_btn class=curmenu onclick="aj_settab('myupload', 'tab_my', event);">我上传的视频</A> </LI>
  			<LI><A id=mysp_btn class=ocurmenu onclick="aj_settab('mysp', 'tab_my', event);" href="#">我的专辑</A>  </LI>
  		</UL>
  	</DIV>
  	
  	<DIV style="DISPLAY: block" id=myupload class=data_opt_contentbox><P class="info info_side">没有相关视频。</P></DIV>
		<DIV style="DISPLAY: none" id=mysp class=data_opt_contentbox></DIV>
			<DIV id=user_take class=data_opt_title>
				<UL>
		  			<LI><A id=mysubmem_btn class=curmenu onclick="aj_settab('mysubmem', 'tab_other', event);">我订阅的用户</A> </LI>
		  			<LI><A id=mysubsp_btn class=ocurmenu onclick="aj_settab('mysubsp', 'tab_other', event);" href="#">我订阅的专辑</A> </LI>
				  	<LI><A id=myfav_btn class=ocurmenu onclick="aj_settab('myfav', 'tab_other', event);" href="#">我的收藏</A> </LI>
				  	<LI><A id=myfriend_btn class=ocurmenu onclick="aj_settab('myfriend', 'tab_other', event);" href="#">我的好友</A> </LI>
				</UL>
			</DIV>
			<DIV style="DISPLAY: block" id=mysubmem class=data_opt_contentbox>
				<P class="info info_side">没有相关用户。</P></DIV>
				<DIV style="DISPLAY: none" id=mysubsp class=data_opt_contentbox></DIV>
				<DIV style="DISPLAY: none" id=myfav class=data_opt_contentbox></DIV>
				<DIV style="DISPLAY: none" id=myfriend class=data_opt_contentbox></DIV>
				<SCRIPT>
					var checkedtab = 'curmenu';
					var uncheckedtab = 'ocurmenu';
					var tab_my = ['myupload', 'mysp'];
					var tab_other = ['mysubmem', 'mysubsp', 'myfav', 'myfriend'];
				</SCRIPT>
			</DIV>
			<!--searchzone start--></DIV>
			<DIV class=clear></DIV>
			<!--searchzone end-->
	 -->

<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
