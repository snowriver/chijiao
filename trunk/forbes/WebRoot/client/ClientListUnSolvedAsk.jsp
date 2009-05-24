<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>�ҵĹ����̨</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>

<script language="javascript" type="text/javascript">
	<!--
	function pageselectCallback(page_id, jq){
		 
		  window.location="ClientManageAsk.do?act=unsolved&pno=" + (page_id+1);
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
  
	//-->
</script>

<BODY>
<c:set var="p" value="client_manage_ask"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>���ʹ���</H1>
	<DIV class=data_opt_title>
		<UL>
  			<LI><A class=ocurmenu href="ClientManageAsk.do?act=all&status=0_1">�ҵ�����</A> </LI>
  			<LI><A class=ocurmenu href="ClientManageAsk.do?act=answer">�ҵĻش�</A> </LI>
  			<LI><A class=curmenu>�����������</A> </LI>
  			<!-- <LI><A class=ocurmenu href="#">��ͶƱ��������</A> </LI> -->
  		</UL>
  	</DIV><!--data_opt_title end-->
  	
  	<DIV style="PADDING-LEFT: 2%">
		
		
		<TABLE class=datalist_opt border=0 cellSpacing=0 cellPadding=0 width="95%">
			<TBODY>
		  		<TR class=datelist_opt_title>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 50px"><INPUT onclick="checkall(this.form, 'friendid')" type=checkbox name=chkall></TD>
				    <TD style="WIDTH: 130px">����</TD>
				    <TD>����</TD>			
				    <TD style="WIDTH: 100px">����ʱ��</TD>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 100px">״̬</TD>
		    	</TR>
		    	
		    	
		    	<c:if test="${empty ASK_LIST}">
		    		<TR>
		    			<TD colspan="5" align="center">�޴����������</TD>
		    		</TR>
		    	</c:if>
		    	
		    		<c:forEach items="${ASK_LIST}" var="ask" varStatus="is">
		    		<TR>
			    		<TD align=middle><INPUT id=friendid[] value=3 type=checkbox name=friendid[]></TD>
			    		<TD style="WIDTH: 90px">
			    			<A target=_blank href="#">${ask.askType.name }</A>
			    		</TD>
			    		<TD><P class=datalist_opt_video_title><A target=_blank href="../ask/AskSearch.do?act=view&id=${ask.id }"> ${ask.title }</A></P></TD>
			    		
			    		<TD><fmt:formatDate value='${ask.expiredTime}' pattern='MM-dd' /></TD>
			    		<TD class=collection_video_opt>
			    			<c:if test="${ask.status == 0}"><img src="../ask/images/UnSolved_ico.gif" title="�Ѿ����"></c:if>
			    			<c:if test="${ask.status == 1}"><img src="../ask/images/Solved_ico.gif" title="�ȴ�����"></c:if>
			      		</TD>
			      	</TR>
		      		</c:forEach>
		    	
		  		
		      	
			</TBODY>
		</TABLE>
		
		<BR>
		<DIV class="pagescroll">			     
			<DIV id="Pagination" class="pagination"></DIV>
		</DIV>  
	</DIV>
</DIV>
      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
