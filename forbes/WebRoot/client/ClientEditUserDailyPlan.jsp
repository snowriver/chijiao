<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


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
<link rel="stylesheet" type="text/css" href="../js/jquery/ui.datepicker.css" />

<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/ui.datepicker.js"></script>

<script language="javascript" type="text/javascript">
	
	$(window).ready(function(){
		$('#date-pick').datepicker();
		$('#date-pick').datepicker('option', {dateFormat: 'yy-mm-dd'});		
	});

</script>
</head>
<body>

<DIV class="ucbody">
	
	<DIV class=addBday id=main_container>
		<DIV class=tabDiv>
			<UL>
	  			<LI><A class=current id=switch_birthday_button href="javascript:void(0)">���ռƻ�</A> </LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">������Ȩ</A></LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">���շ�ʡ</A></LI>
	  		</UL>
	  	</DIV>
	  	
	  	<DIV class=blockNoBorder>
	  		<form>
			<TABLE class=tellmeTable>
	  			<TBODY>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>�������:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=name name=name></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan>����</SPAN></TD>
					</TR>
	  				<TR id=sex_form_row>
					    <TD class=tellmeNameTd>����:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2 it date-pick" id=date-pick name=datex></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
					<TR>
						<TD class=tellmeNameTd id=select_day_caption>����ʱ��:</TD>
						<TD class=tellmeInputTd id=select_day_container>
	      					<DIV class=bdaySelectDiv>
	      						<SELECT id=dateinputer_year> 
	      							<OPTION selected>ѡ����...</OPTION>
	      						</SELECT> 
	      						<SELECT id=dateinputer_month> 
	      							<OPTION selected>ѡ����...</OPTION>
	      						</SELECT>  
	      						<DIV class=clear><!----></DIV>
	      					</DIV>
	      				</TD>
	      				<TD class=inputDesSpanTd><SPAN class=inputDesSpan>����, �ֹ���ũ��ת��</SPAN></TD>
	      			</TR>
				  	<TR>
				    	<TD class=tellmeNameTd id=relation_caption>����Ĺ�ϵ:</TD>
				    	<TD class=tellmeInputTd>
				      		<DIV id=birthday_category_area></DIV>
				      		<DIV id=commemo_category_area style="DISPLAY: none"></DIV>
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
				<DIV class=orderPayOk>������...</DIV>
			</DIV>
			<DIV class=loading><!----></DIV>
			<DIV class=payOkDes><!----></DIV>
		</DIV>
	</DIV>
	<DIV></DIV>
	<DIV class=addBdaySuccessful id=submit_success style="DISPLAY: none">
		<DIV class=successBlock>
			<DIV class=blockTitleDiv>
				<SPAN class=orderPayOk id=submit_success_msg>����ɹ�!</SPAN> 
				<DIV class=clear><!----></DIV>
			</DIV>
			<DIV class=payOkDes><!----></DIV>
		</DIV>
		<DIV class=addBdaySuccessfulBtn>
			<P>
				<INPUT class=confirmBtn id=continue_button type=button value=�������> 
				<SPAN><A class=cancelBtn id=close_button href="javascript:void(0)">�ر�</A></SPAN> 
			</P>
		</DIV>
	</DIV>
	
</DIV>


      


<!--footer end-->
</body></html>
