<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%@ include file="../include/gloable.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 学习库 - 全力打造创业者学习和交流平台</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>

	<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="UserView.do?act=ask&uid=${PARA['uid']}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:10,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
	</SCRIPT>


<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="index" value="ask"></c:set>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->
<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->
<!--主结构开始-->


<DIV class=clear></DIV>

<DIV class=wapper><!--内容开始-->
	<DIV id=main>
		<DIV class=list_left><!--二级导航开始-->

			<DIV class=sub_nav>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  					<TBODY>
  						<TR>
			    <TD class=sub_nav_tit_left></TD>
			    <TD class=sub_nav_tit_main>
			      <DIV class=sub_nav_ico 
			      style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #fff">用户信息</DIV></TD>
			    <TD class=sub_nav_tit_right></TD></TR></TBODY></TABLE></DIV><!--二级导航结束-->
			<DIV class=tabmain id=tabmains2>
			<UL class=block>
			  <LI><!--所有问题列表开始-->
			  <DIV class=all_ask_main>
			  <DIV class=all_ask_info>
			  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			    <TBODY>
			    <TR>
			      <TD class=user_photo vAlign=top><IMG src="${UC_CENTER_URL }/avatar.php?uid=${USER.uid }&size=big&type=virtual"></TD>
			      <TD vAlign=top>
			        <DIV class=user_dengji>
			        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			          <TBODY>
			          <TR>
			            <TD style="PADDING-LEFT: 20px">
			              <P>昵称：<SPAN>${USER.username }</SPAN>&nbsp;&nbsp;&nbsp;
			              	等级：<SPAN>${USER.userDetail.userLevel }</SPAN>&nbsp;&nbsp;&nbsp;
			              	等级总积分：<SPAN>${BANLANCE }</SPAN></P></TD></TR></TBODY></TABLE></DIV>
			        <DIV class=all_ask_jifen style="OVERFLOW: hidden">
			        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			          <TBODY>
			          <TR class=all_ask_jifen_tit>
			            <TD class=all_ask_jifen_td1 width="14%">积分明细</TD>
			            <TD width="7%">总分</TD>
			            <TD width="11%">回答得分</TD>
			            <TD width="11%">悬赏得分</TD>
			            <TD width="17%">来访站点得分</TD>
			            <TD width="17%">发表问题得分</TD>
			            <TD width="11%">惩罚扣分</TD>
			            <TD class=bg_none width="11%">其他得分</TD>
			            <TD class=border_r width="1%">&nbsp;</TD></TR>
			          <TR>
			            <TD>&nbsp;</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
			        <DIV class=all_ask_jifen>
			        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			          <TBODY>
			          <TR class=all_ask_jifen_tit>
			            <TD class=all_ask_jifen_td2>回答明细</TD></TR></TBODY></TABLE>
			        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			          <TBODY>
			          <TR class=all_ask_huida_tit>
			            <TD width="9%">回答数</TD>
			            <TD width="18%">回答被采纳数</TD>
			            <TD width="15%">回答被采纳率</TD>
			            <TD width="12%">提问数</TD>
			            <TD width="14%">已解决提问</TD>
			            <TD width="12%">解决中提问</TD>
			            <TD class=bg_none width="14%">被撤销提问</TD>
			            <TD class=bg_none width="6%">&nbsp;</TD></TR>
			          <TR>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0%</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>0</TD>
			            <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></DIV>
  <DIV class=user_info_tit><A href="UserView.do?act=answer&uid=${USER.uid }">${USER.username }用户回答</A> 
  <A class=on href="UserView.do?act=ask&uid=${USER.uid }">${USER.username }提问</A> 
  </DIV>
  <DIV class=all_ask_list>
  <DIV class=all_ask_list_tit>
  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
      <TD width="20%">类型</TD>
      <TD width="48%">标题</TD>
      <TD width="10%">悬赏</TD>
      <TD width="15%">提问时间</TD>
      <TD width="10%">状态</TD>
      </TR></TBODY></TABLE></DIV>
  <DIV class=all_ask_list_main>
  <DIV style="PADDING-LEFT: 15px">
  
  		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
    		<TBODY>
				<c:forEach items="${ASK_LIST}" var="ask"> 
				<TR><!--<td width="7%" class="wrong_ico">&nbsp;</td>-->
					<TD width="20%"><A class=type href="#">[${fn:substring(ask.askType.name, 0, 5)}]</A></TD>
					<TD width="45%">
						<DIV style="OVERFLOW: hidden; WIDTH: 340px; LINE-HEIGHT: 30px; HEIGHT: 30px">
							<A target="_blank" title=${ask.title } href="AskSearch.do?act=view&id=${ask.id }">${fn:substring(ask.title, 0, 30)}</A>
						</DIV>
					</TD>					
					<TD class=xuanshang_ico width="10%">${ask.reward}</TD>
					<TD width="15%"><fmt:formatDate value='${ask.expiredTime}' pattern='yyyy-MM-dd' /></TD>
					<TD width="10%" align="center">
						<c:if test="${ask.status == 1}"><img src="../ask/images/Solved_ico.gif" title="已经解决"></c:if>
			    		<c:if test="${ask.status == 0}"><img src="../ask/images/UnSolved_ico.gif" title="等待处理"></c:if>
					</TD>
				</TR>
				</c:forEach>
   			</TBODY>
   		</TABLE>

  </DIV>
  <DIV style="TEXT-ALIGN: center">
  
		<DIV class=list_page>
  									<BR><DIV class="pagescroll"><DIV id="Pagination" class="pagination"></DIV></DIV>  
  								</DIV>
  								
  </DIV></DIV><!--<div class="jinji_more"><a href="#">更多</a></div>
				<div class="clear"></div>--></DIV></DIV><!--所有问题列表结束--></LI></UL></DIV></DIV>
			</DIV>


<!--右边内容开始-->
<%@ include file="include/siderbar.jsp"%>
<!--右边内容结束-->


<DIV class=clear></DIV></DIV><!--内容结束-->




<!--主结构结束-->
<!--footer开始-->
<!--footer开始-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
