<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	
	String date = request.getParameter("date");
	if(date == null) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date   = df.format(new Date()) ;
	}
	request.setAttribute("DATE", date);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加今日计划</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/user_daily_plan_edit.css" />
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css" />


<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.3.2.min.js"></SCRIPT>
  

</head>
<body>

<DIV class="ucbody">
	
	    
    <DIV class=addBdaySuccessful id=submit_loading style="DISPLAY: none">
		<DIV class=successBlock>
			<DIV class=blockTitleDiv2>
				<DIV class=orderPayOk>保存中...</DIV>
			</DIV>
			<DIV class=loading><!----></DIV>
			<DIV class=payOkDes><!----></DIV>
		</DIV>
	</DIV>
	<DIV></DIV>
	<DIV class=addBdaySuccessful id=submit_success style="DISPLAY: block">
		<DIV class=successBlock>
			<DIV class=blockTitleDiv>
				<SPAN class=orderPayOk id=submit_success_msg>保存成功!</SPAN> 
				<DIV class=clear><!----></DIV>
			</DIV>
			<DIV class=payOkDes><!----></DIV>
		</DIV>
		<DIV class=addBdaySuccessfulBtn>
			<P>
				<INPUT class=confirmBtn id=continue_button type=button value=继续添加> 
				<INPUT class=confirmBtn id=continue_button type=button value=关闭>
			</P>
		</DIV>
	</DIV>
	
</DIV>


      


<!--footer end-->
</body></html>
