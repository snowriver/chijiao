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
<link rel="stylesheet" type="text/css" href="../css/datePicker.css" />

<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.datePicker-min.js"></script>

<script language="javascript" type="text/javascript">
	
	$(window).ready(function(){
		$('.date-pick').datePicker({clickInput:true});
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
				    <TD class=tellmeNameTd>ʱ��:</TD>
				    <TD class=tellmeInputTd>
				    	<UL>
				        	<LI><INPUT class="importInput2 it date-pick" id=datex name=datex></LI>
				       		<LI>
				       			<select name="ss" id="ss">
							      <option value="" selected="selected">Please Choose</option>
							      <option value="1">Option 1</option>
							      <option value="2">Option 2</option>
							      <option value="3">Option 3</option>
							      <option value="4">Option 4</option>
							      <option value="5">Option 5</option>
							      <option value="6">Option 6</option>
							      <option value="7">Option 7</option>
							      <option value="8">Option 8</option>
							      <option value="9">Option 9 with a really long line, that should wrap</option>
							      <option value="10">Option 10</option>
							      <option value="11">Option 11</option>
							    </select>
				       		</LI>
				       	</UL>
				 	</TD>
				    <TD class=inputDesSpanTd></TD>
				</TR>
				<TR>
    <TD class=tellmeNameTd id=select_day_caption>����:</TD>
    <TD class=tellmeInputTd id=select_day_container>
      <DIV class=bdayTab><A id=dateinputer_solar_btn title=���� 
      href="javascript:void(0)">����</A><A id=dateinputer_lunar_btn title=ũ�� 
      href="javascript:void(0)">ũ��</A> 
      <DIV class=clear><!----></DIV></DIV>
      <DIV class=bdaySelectDiv><SELECT id=dateinputer_year> <OPTION 
        selected>ѡ����...</OPTION></SELECT> <SELECT id=dateinputer_month> <OPTION 
        selected>ѡ����...</OPTION></SELECT> <SELECT id=dateinputer_day> <OPTION 
        selected>ѡ����...</OPTION></SELECT> <INPUT id=dateinputer_issolar 
      type=hidden> 
      <DIV class=clear><!----></DIV></DIV></TD>
    <TD class=inputDesSpanTd><SPAN class=inputDesSpan>����, 
֧�ֹ���ũ��ת��</SPAN></TD></TR>
  <TR>
    <TD class=tellmeNameTd id=relation_caption>����Ĺ�ϵ:</TD>
    <TD class=tellmeInputTd>
      <DIV id=birthday_category_area></DIV>
      <DIV id=commemo_category_area style="DISPLAY: none"></DIV></TD>
    <TD class=inputDesSpanTd></TD></TR></TBODY></TABLE>
    </form>
    

</DIV></DIV>
<DIV class=addBdaySuccessful id=submit_loading style="DISPLAY: none">
<DIV class=successBlock>
<DIV class=blockTitleDiv2>
<DIV class=orderPayOk>������...</DIV></DIV>
<DIV class=loading><!----></DIV>
<DIV class=payOkDes><!----></DIV></DIV></DIV>
<DIV></DIV>
<DIV class=addBdaySuccessful id=submit_success style="DISPLAY: none">
<DIV class=successBlock>
<DIV class=blockTitleDiv><SPAN class=orderPayOk 
id=submit_success_msg>����ɹ�!</SPAN> 
<DIV class=clear><!----></DIV></DIV>
<DIV class=payOkDes><!----></DIV></DIV>
<DIV class=addBdaySuccessfulBtn>
<P><INPUT class=confirmBtn id=continue_button type=button value=�������> <SPAN><A 
class=cancelBtn id=close_button href="javascript:void(0)">�ر�</A></SPAN> 
</P></DIV></DIV>
	
	
</div>


      


<!--footer end-->
</body></html>
