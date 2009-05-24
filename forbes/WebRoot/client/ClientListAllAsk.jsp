<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>我的管理后台 - 百问管理</TITLE>
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
		 
		  window.location="ClientManageAsk.do?act=all&pno=" + (page_id+1);
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
  
	  	function CheckAll(form)  {
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.name != 'chkall') e.checked = form.chkall.checked; 
	   		}
	  	}
	  	
	  	function Check(form) {
	  		var flag = false;
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.checked == true)
	    			 flag = true;
	   		}
			if(flag == false) {
				alert("请选择你要删除的提问！");
				return false;
			}
		}
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
	<H1>提问管理</H1>
	<DIV class=data_opt_title>
		<UL>
  			<LI><A class=curmenu>我的提问</A> </LI>
  			<LI><A class=ocurmenu href="ClientManageAsk.do?act=answer">我的回答</A> </LI>
  			<LI><A class=ocurmenu href="ClientManageAsk.do?act=unsolved&status=0">待处理的问题</A> </LI>
  			<!-- <LI><A class=ocurmenu href="#">我投票过的问题</A> </LI> -->
  		</UL>
  	</DIV><!--data_opt_title end-->
  	
  	<DIV style="PADDING-LEFT: 2%">
		
		<FORM name=askForm method="post" action="ClientManageAsk.do?act=del" onSubmit="return Check(this);">
		<TABLE class=datalist_opt border=0 cellSpacing=0 cellPadding=0 width="95%">
			<TBODY>
		  		<TR class=datelist_opt_title>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 10%"><INPUT onclick="CheckAll(this.form)" type=checkbox name=chkall></TD>
				    <TD style="WIDTH: 10%">类型</TD>
				    <TD style="WIDTH: 50%">标题</TD>			
				    <TD style="WIDTH: 20%">提问时间</TD>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 10%">状态</TD>
		    	</TR>
		    	
		    	
		    	<c:if test="${empty ASK_LIST}">
		    		<TR>
		    			<TD colspan="5" align="center">您还没有提过问题</TD>
		    		</TR>
		    	</c:if>
		    	
		    		<c:forEach items="${ASK_LIST}" var="ask" varStatus="is">
		    		<TR>
			    		<TD align=middle><INPUT id=askid value=${ask.id } type=checkbox name=askid></TD>
			    		<TD style="WIDTH:50px">
			    			<A target=_blank href="../ask/AskSearch.do?act=search&typeid=${ask.askType.id }&orderby=expiredTime desc">${ask.askType.name }</A>
			    		</TD>
			    		<TD><P class=datalist_opt_video_title><A target=_blank href="../ask/AskSearch.do?act=view&id=${ask.id }"> ${ask.title }</A></P></TD>
			    		
			    		<TD><fmt:formatDate value='${ask.expiredTime}' pattern='yyyy-MM-dd' /></TD>
			    		<TD align="center">
			    			<c:if test="${ask.status == 1}"><img src="../ask/images/Solved_ico.gif" title="已经解决"></c:if>
			    			<c:if test="${ask.status == 0}"><img src="../ask/images/UnSolved_ico.gif" title="等待处理"></c:if>
			      		</TD>
			      	</TR>
		      		</c:forEach>
		    	
		  		
		      	
			</TBODY>
		</TABLE>
		
		<BR>
		<DIV class="pagescroll">
			<DIV id="Pagination" class="pagination"></DIV>
		</DIV>
		<!-- 
		<DIV class="pagescroll">
			<DIV class="pagination"><input name="del" type="submit" value="删除" /></DIV>
		</DIV>
		 -->
		</FORM>
	</DIV>
</DIV>
      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
