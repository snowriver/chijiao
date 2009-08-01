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
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<script language="javascript" type="text/javascript">

	$(function() {
    	$('#content').wysiwyg();
  	});
  	
  	function Check(){
  		if( planForm.receiver.value == '' ){
			$("#inputReceiver").html("<font color=red>* ��Ȩ�˲���Ϊ��</font>");
			return false;
		}
		
		if( planForm.title.value == '' ){
			$("#inputTitle").html("<font color=red>* ��Ȩ������ⲻ��Ϊ��</font>");
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
	  			<LI><A id=switch_birthday_button href="ClientAddUserDailyPlan.jsp">���ռƻ�</A> </LI>
	  			<LI><A class=current id=switch_commemo_button href="javascript:void(0)">������Ȩ</A></LI>
	  			<!-- <LI><A id=switch_commemo_button href="javascript:void(0)">���շ�ʡ</A></LI> -->
	  		</UL>
	  	</DIV>
	  	
	  	<DIV class=blockNoBorder>
	  		<form name="planForm" method="post" action="ClientManageUserDailyAccredit.do?act=add" onsubmit="Check();return false;">
			<TABLE class=tellmeTable>
	  			<TBODY>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>��Ȩ��:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=receiver name=receiver></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan id=inputReceiver>����</SPAN></TD>
					</TR>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>�������:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=title name=title></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan id=inputTitle>����</SPAN></TD>
					</TR>
	  				<TR id=sex_form_row>
					    <TD class=tellmeNameTd>����:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=date name=date value="${DATE }" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
					
	      			<TR id=sex_form_row>
					    <TD class=tellmeNameTd>����:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=limit_time name=limit_time readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})"></LI>				       		
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
					    	<textarea id="content" name="content" rows="11" cols="90"></textarea> 
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
