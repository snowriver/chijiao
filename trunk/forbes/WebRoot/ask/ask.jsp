<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	
	<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="index" value="ask"></c:set>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->
<!--header��ʼ-->
<%@ include file="include/header.jsp"%>

<!--header����-->
<!--���ṹ��ʼ-->


<DIV class=clear></DIV>


<DIV class=wapper>
	<TABLE style="MARGIN-TOP: 50px; MARGIN-BOTTOM: 50px" border=0 cellSpacing=0 cellPadding=0 width=550 bgColor=#ffffff align=center>
  		<TBODY>
  			<TR>
    			<TD colSpan=3>
      				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        				<TBODY>
					        <TR>
					        	<TD class=sub_nav_tit_left></TD>
					          	<TD class=sub_nav_tit_main><DIV class=sub_nav_ico>����ؼ���</DIV></TD>
					          	<TD class=sub_nav_tit_right></TD>
					     	</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD style="BORDER-LEFT: #d3ebef 1px solid">&nbsp;</TD>
				<TD>
					<TABLE style="MARGIN: 40px 20px 40px 0px" border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
					  		<TR><TD style="LINE-HEIGHT: 40px; HEIGHT: 30px; FONT-SIZE: 12px" align=middle>����������Ҫ�������Ĺؼ��֣����ǽ��ṩ����й������ʴ����ο���</TD></TR>
					        <TR>
					     		<TD align=middle>
					            	<FORM id=form1 method=post name=form1 action="AskQuestion.do?act=first">
					            		<LABEL><INPUT style="WIDTH: 300px" id=keyword type=text name=keyword> </LABEL>
					            		<LABEL><INPUT id=button class=small_btn value=�ύ type=submit name=button> </LABEL>
					            	</FORM>
					            </TD>
					      	</TR>
					        <TR>
					 			<TD class=question_note>������Դ�ҵ��Ŀ�������⣬��� <A target=_blank href="��">��Ŀ�ڱ�</A></TD>
					 		</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD style="BORDER-RIGHT: #d3ebef 1px solid">&nbsp;</TD>
			</TR>
			<TR>
				<TD height=10><IMG src="images/border_08.gif" width=10 height=10></TD>
				<TD background=images/borderb_02.gif width="100%"></TD>
				<TD><IMG src="images/border_09.gif" width=10 height=10></TD>
			</TR>
		</TBODY>
	</TABLE>
</DIV>

<DIV class=clear></DIV><!--���ݽ���-->




<!--���ṹ����-->
<!--footer��ʼ-->
<!--footer��ʼ-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer����-->
<!--footer����-->
</BODY></HTML>
