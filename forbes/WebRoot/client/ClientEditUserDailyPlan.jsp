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
<title>��ӽ��ռƻ�</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/user_daily_plan_edit.css" />
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css" />
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />

<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.3.2.min.js"></SCRIPT>
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
  
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>


<script language="javascript" type="text/javascript">
	

	$(function() {
    	$('#content').wysiwyg();
  	});
  	
  	function Check(){	
		if( planForm.title.value == '' ){
			$("#inputTitle").html("<font color=red>* ���ⲻ��Ϊ��</font>");
			return false;
		}
		
		planForm.submit();
	}
	
	function changeEndTimeHh(index) {
		$("#end_time_hh").empty();
		for( var i = index; i < 24; i++ ){
			$("<option value='" + i + "'>" + i + "</option>").appendTo("#end_time_hh");
		}
	}
</script>
</head>
<body>

<DIV class="ucbody">
	
	<DIV class=addBday id=main_container>
		<DIV class=tabDiv>
			<UL>
	  			<LI><A class=current id=switch_birthday_button href="javascript:void(0)">�޸Ľ�������</A> </LI>
	  		</UL>
	  	</DIV>
	  	
	  	<DIV class=blockNoBorder>
	  		<form name="planForm" method="post" action="ClientManageUserDailyPlan.do?act=edit" onsubmit="Check();return false;">
			<INPUT type=hidden id=id name=id value="${USER_DETAILY_PLAN.id }">
			<TABLE class=tellmeTable>
	  			<TBODY>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>�������:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=title name=title value="${USER_DETAILY_PLAN.title }"></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan id=inputTitle>����</SPAN></TD>
					</TR>
	  				<TR id=sex_form_row>
					    <TD class=tellmeNameTd>����:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=date name=date value="<fmt:formatDate value='${USER_DETAILY_PLAN.date }' type='date'/>" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
					<TR>
						<TD class=tellmeNameTd id=select_day_caption>����ʱ��:</TD>
						<TD class=tellmeInputTd id=select_day_container>
	      					<DIV style="float:left">
	      						<SELECT id=start_time_hh name=start_time_hh onchange="changeEndTimeHh(this.options[this.options.selectedIndex].value)"> 
	      							<c:forEach var="start_time_hh" begin="0" end="24" step="1">
	      								<c:if test="${start_time_hh < 10}"><c:set var="start_time_hh_temp" value="0${start_time_hh}" /></c:if>
	      								<c:if test="${start_time_hh >= 10}"><c:set var="start_time_hh_temp" value="${start_time_hh}" /></c:if>
	      								<OPTION value="${start_time_hh_temp }" <c:if test="${fn:substring(USER_DETAILY_PLAN.startTime, 11, 13) == start_time_hh_temp }">selected</c:if>>${start_time_hh_temp }</OPTION>
	      							</c:forEach>
	      						</SELECT>
	      						<SELECT id=start_time_mm name=start_time_mm>
	      							<c:forEach var="start_time_mm" begin="0" end="55" step="5">
	      								<c:if test="${start_time_mm < 10}"><c:set var="start_time_mm_temp" value="0${start_time_mm}" /></c:if>
	      								<c:if test="${start_time_mm >= 10}"><c:set var="start_time_mm_temp" value="${start_time_mm}" /></c:if>
	      								<OPTION value="${start_time_mm_temp }" <c:if test="${fn:substring(USER_DETAILY_PLAN.startTime, 14, 16) == start_time_mm_temp }">selected</c:if>>${start_time_mm_temp }</OPTION>
	      							</c:forEach>
	      						</SELECT> ��  
	      					</DIV>
	      					<DIV style="float:left">					
	      						<SELECT id=end_time_hh name=end_time_hh> 
	      							<c:forEach var="end_time_hh" begin="0" end="24" step="1">
	      								<c:if test="${end_time_hh < 10}"><c:set var="end_time_hh_temp" value="0${end_time_hh}" /></c:if>
	      								<c:if test="${end_time_hh >= 10}"><c:set var="end_time_hh_temp" value="${end_time_hh}" /></c:if>
	      								<OPTION value="${end_time_hh_temp }" <c:if test="${fn:substring(USER_DETAILY_PLAN.endTime, 11, 13) == end_time_hh_temp }">selected</c:if>>${end_time_hh_temp }</OPTION>
	      							</c:forEach>
	      						</SELECT>
	      						<SELECT id=end_time_mm name=end_time_mm> 
	      							<c:forEach var="end_time_mm" begin="0" end="55" step="5">
	      								<c:if test="${end_time_mm < 10}"><c:set var="end_time_mm_temp" value="0${end_time_mm}" /></c:if>
	      								<c:if test="${end_time_mm >= 10}"><c:set var="end_time_mm_temp" value="${end_time_mm}" /></c:if>
	      								<OPTION value="${end_time_mm_temp }" <c:if test="${fn:substring(USER_DETAILY_PLAN.endTime, 14, 16) == end_time_mm_temp }">selected</c:if>>${end_time_mm_temp }</OPTION>
	      							</c:forEach>
	      						</SELECT>
	      						
	      					</DIV>
	      				</TD>
	      				<TD class=inputDesSpanTd><SPAN class=inputDesSpan>����</SPAN></TD>
	      			</TR>
	      			<TR id=sex_form_row>
					    <TD class=tellmeNameTd>����:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=limit_time name=limit_time readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<fmt:formatDate value='${USER_DETAILY_PLAN.limitTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" /></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
				  	<TR>
				    	<TD class=tellmeNameTd id=relation_caption>�Ƿ����:</TD>
				    	<TD class=tellmeInputTd>
				      		<INPUT type=radio CHECKED value=0 name=is_complete>������/�ƻ���
				      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      		<INPUT type=radio value=1 name=is_complete>�����	
				      	</TD>
				    	<TD class=inputDesSpanTd></TD>
				    </TR>
				    <TR>
					    <TD class=tellmeNameTd>��ϸ����:</TD>
					    <TD colspan="2">
					    	<textarea id="content" name="content" rows="11" cols="90">${USER_DETAILY_PLAN.content }</textarea> 
					 	</TD>					 
					</TR>
					<TR>
						<TD class=tellmeNameTd></TD>
						<TD class=tellmeInputTd>
							<P>
								<INPUT class=confirmBtn id=continue_button type=submit value=ȷ��> 
								<INPUT class=confirmBtn id=continue_button type=button value=�ر� onclick="parent.closeDiv();">
							</P>
      					</TD>
    					<TD class=inputDesSpanTd></TD>
    				</TR>
				</TBODY>
			</TABLE>
	    	</form>
    	</DIV>
    </DIV>   
	
</DIV>


      


<!--footer end-->
</body></html>
