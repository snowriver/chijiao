<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.forbes.hibernate.bean.UcMembers"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	UcMembers ucMembers = (UcMembers)request.getSession().getAttribute("CLIENT");
	String date = request.getParameter("date");
	com.forbes.ajax.UserPlanCount upc = new com.forbes.ajax.UserPlanCount();
	upc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, "Y");
	request.setAttribute("USER_DAILY_PLAN_COUNT", upc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, "Y"));
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
<link rel="stylesheet" type="text/css" href="../js/jquery/ui.datepicker.css" />
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />

<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/ui.datepicker.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>

<script language="javascript" type="text/javascript">
	
	$(window).ready(function(){
		$('#date-pick').datepicker();
		$('#date-pick').datepicker('option', {dateFormat: 'yy-mm-dd'});		
	});

	$(function() {
    	$('#wysiwyg').wysiwyg();
  	});
</script>
</head>
<body>

<DIV class="ucbody">
	
	<DIV class=addBday id=main_container>
		<DIV class=tabDiv>
			<UL>
	  			<LI><A class=current id=switch_birthday_button href="javascript:void(0)">今日计划</A> </LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">今日授权</A></LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">今日反省</A></LI>
	  		</UL>
	  	</DIV>
	  	
	  	<DIV class=blockNoBorder>
	  		<form>
			<TABLE class=tellmeTable>
	  			<TBODY>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>事项标题:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=name name=name></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan>必填</SPAN></TD>
					</TR>
	  				<TR id=sex_form_row>
					    <TD class=tellmeNameTd>日期:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2 it date-pick" id=date-pick name=datex></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
					<TR>
						<TD class=tellmeNameTd id=select_day_caption>起至时间:</TD>
						<TD class=tellmeInputTd id=select_day_container>
	      					<DIV class=bdaySelectDiv>
	      						<SELECT id=dateinputer_year> 
	      							<OPTION value="00:00">00:00</OPTION>
	      							<OPTION value="00:15">00:15</OPTION>
	      							<OPTION value="00:30">00:30</OPTION>
	      							<OPTION value="01:00">01:00</OPTION>
	      							<OPTION value="01:15">01:15</OPTION>
	      							
	      							<OPTION value="08:15">08:15</OPTION>
	      							<OPTION value="09:15">09:15</OPTION>
	      						</SELECT> 
	      						<SELECT id=dateinputer_month> 
	      							<OPTION value="00:00">00:00</OPTION>
	      							<OPTION value="00:15">00:15</OPTION>
	      							<OPTION value="00:30">00:30</OPTION>
	      							<OPTION value="01:00">01:00</OPTION>
	      							<OPTION value="01:15">01:15</OPTION>
	      							
	      							<OPTION value="08:15">08:15</OPTION>
	      							<OPTION value="09:15">09:15</OPTION>
	      						</SELECT>  
	      						<DIV class=clear><!----></DIV>
	      					</DIV>
	      				</TD>
	      				<TD class=inputDesSpanTd><SPAN class=inputDesSpan>必填</SPAN></TD>
	      			</TR>
	      			<TR id=sex_form_row>
					    <TD class=tellmeNameTd>期限:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2 it date-pick" id=date-pick name=datex></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
				  	<TR>
				    	<TD class=tellmeNameTd id=relation_caption>是否完成:</TD>
				    	<TD class=tellmeInputTd>
				      		<UL>
				      			<LI>
				      				<LABEL class=pretty_radio for=sex-male>
				      					<INPUT id=sex-male type=radio CHECKED value=1 name=sex>已完成
				      				</LABEL>
				      			</LI>
				      			<LI>
				      				<LABEL class=pretty_radio for=sex-female>
				      					<INPUT id=sex-female type=radio value=2 name=sex>处理中
				      				</LABEL> 
				      			</LI>
      						</UL>
				      	</TD>
				    	<TD class=inputDesSpanTd></TD>
				    </TR>
				    <TR>
					    <TD class=tellmeNameTd>备注:</TD>
					    <TD colspan="2">
					    	<textarea id="wysiwyg" rows="11" cols="90"></textarea> 
					 	</TD>					 
					</TR>
					<TR>
						<TD class=tellmeNameTd></TD>
						<TD class=tellmeInputTd>
							<DIV class=erronotice id=erronotice_container style="DISPLAY: none"></DIV>
      						<P><INPUT class=confirmBtn id=submit_button type=button value=确定>
      						<SPAN><A class=cancelBtn id=cancel_button href="javascript:void(0)">取消</A></SPAN> 
      						</P>
      					</TD>
    					<TD class=inputDesSpanTd></TD>
    				</TR>
				</TBODY>
			</TABLE>
	    	</form>
    	</DIV>
    </DIV>
    
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
	<DIV class=addBdaySuccessful id=submit_success style="DISPLAY: none">
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
				<SPAN><A class=cancelBtn id=close_button href="javascript:void(0)">关闭</A></SPAN> 
			</P>
		</DIV>
	</DIV>
	
</DIV>


      


<!--footer end-->
</body></html>
