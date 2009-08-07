<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%

	com.forbes.ajax.AskTypeSelector as = new com.forbes.ajax.AskTypeSelector();
	java.util.List topAskTypes = as.getTopAskType();
	
	request.setAttribute("TOP_ASK_TYPE_LIST", topAskTypes);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 学习库 - 全力打造创业者学习和交流平台</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	



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




<div class="wapper">

<BR><BR><BR><BR><BR>
<TABLE border=0 cellSpacing=0 cellPadding=0 width=383 bgColor=#ffffff 
align=center>
  <TBODY>
  <TR>
    <TD colSpan=3>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD class=sub_nav_tit_left></TD>
          <TD class=sub_nav_tit_main>
            <DIV class=sub_nav_ico>提示</DIV></TD>
          <TD class=sub_nav_tit_right></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD style="BORDER-LEFT: #d3ebef 1px solid">&nbsp;</TD>
    <TD>
      <TABLE border=0 cellSpacing=5 cellPadding=0 width="100%" align=center>
        <TBODY>
        <TR>
          <TD class=list vAlign=top>
            <TABLE id=gamelist1 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD>
                  <TABLE style="FONT-SIZE: 12px" class=fontv11 border=0 
                  cellSpacing=0 cellPadding=0 width="100%" align=center>
                    <TBODY>
                    <TR>
                      <TD height=131 rowSpan=2 width="28%" align=middle><IMG 
                        alt="" align=absMiddle src="images/message.gif"> 
                      </TD>
                      <TD style="COLOR: #ff8919" height=150 width="72%" 
                      align=middle>问题发表成功,<A 
                        href="AskView.do?id=${ASK.id }"><FONT 
                        color=red>点击查看</FONT></A></TD></TR>
                    <TR>
                      <TD height=20 align=middle><A 
                        href="index.jsp">返回首页 
                  </A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD style="BORDER-RIGHT: #d3ebef 1px solid">&nbsp;</TD></TR>
  <TR>
    <TD height=10><IMG 
      src="images/border_08.gif" width=10 
      height=10></TD>
    <TD background=images/borderb_02.gif 
    width="100%"></TD>
    <TD><IMG src="images/border_09.gif" 
      width=10 height=10></TD></TR></TBODY></TABLE>
      
      
	

</DIV><!--内容结束-->




<!--主结构结束-->
<!--footer开始-->
<!--footer开始-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
