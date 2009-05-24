<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0056)http://localhost/sv/vspacecp.php -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>我的管理后台</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	
<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="ClientManageFriend.do?act=list&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:5,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
	</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="p" value="client_manage_friend"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>好友管理</H1>
	<DIV style="PADDING-LEFT: 2%">
	<FORM method=post action="">
		<TABLE style="MARGIN-BOTTOM: 8px" border=0 cellSpacing=0 cellPadding=0 width="95%" height=28>
  			<TBODY>
  				<TR>
    				<TD width=230>
    					<BUTTON id=del_special_top class=del_special onclick="delchk(this.form, this.id, 'friendid[]', './vspacecp.php?script=friend&amp;action=del')" name=del_special value="true">取消好友</BUTTON>
    				</TD>
    				<TD></TD>
    			</TR>
    		</TBODY>
    	</TABLE>
    	
    	<TABLE class=datalist_opt border=0 cellSpacing=0 cellPadding=0 width="95%">
			<TBODY>
		  		<TR class=datelist_opt_title>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 50px"><INPUT onclick="checkall(this.form, 'friendid')" type=checkbox name=chkall></TD>
				    <TD style="WIDTH: 130px">用户头像</TD>
				    <TD>用户信息</TD>
				    <TD style="WIDTH: 100px">视频数</TD>
				    <TD style="WIDTH: 100px">专辑数</TD>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 100px">管理</TD>
		    	</TR>
		    	
		    	
		    	<c:if test="${empty FRIEND_LIST}">
		    		<TR>
		    			<TD colspan="6" align="center">无好友</TD>
		    		</TR>
		    	</c:if>
		    	<c:if test="${not empty FRIEND_LIST}">
		    		<c:forEach items="${FRIEND_LIST}" var="friend" varStatus="is" end="0">
		    		<TR>
			    		<TD align=middle><INPUT id=friendid[] value=3 type=checkbox name=friendid[]></TD>
			    		<TD style="WIDTH: 90px">
			    			<A target=_blank href="#">
			    				<IMG onerror="this.src='images/noavatar_middle.gif'" src="${friend.friend.image }">
			    			</A>
			    		</TD>
			    		<TD><P class=datalist_opt_video_title><A target=_blank href="http://localhost/SupeV/upload/vspace.php?mid=3">${friend.friend.loginName }</A></P></TD>
			    		<TD>0</TD>
			    		<TD>0</TD>
			    		<TD class=collection_video_opt>
			    			<A target=_blank href="http://localhost/SupeV/upload/vspace.php?mid=3">查看资料</A> 
			    			<A onclick="pmwin('open', 'ClientReLogin.jsp');" href="javascript:void(0);">发送短信</A> 
			      			<A href='javascript:if(confirm("确定要取消好友 “${friend.friend.loginName }” 吗？")){top.location.href="ClientManageFriend.do?act=del&id=${friend.id }&returnUrl=|ClientManageFriend.do|act=list|pno=${PAGER.curPage}|orderby=${PARA['orderby'] }|";}'>取消好友</A>
			      		</TD>
			      	</TR>
		      		</c:forEach>
		    	</c:if>
		  		
		      	
			</TBODY>
		</TABLE>
	</FORM>
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
