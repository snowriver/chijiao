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

<link rel="stylesheet" type="text/css" href="css/user_daily_plan_edit.css">
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>


<script language="javascript" type="text/javascript">
	
	

</script>
</head>
<body>

<div class="ucbody">
	
	<DIV class=addBday id=main_container>
<DIV class=tabDiv>
<UL>
  <LI><A class=current id=switch_birthday_button 
  href="javascript:void(0)">��������</A> </LI>
  <LI><A id=switch_commemo_button href="javascript:void(0)">����������</A> 
</LI></UL></DIV>
<DIV class=blockNoBorder>
<TABLE class=tellmeTable>
  <TBODY>
  <TR>
    <TD class=tellmeNameTd id=name_title_caption>����:</TD>
    <TD class=tellmeInputTd><INPUT class=importInput id=name name=name></TD>
    <TD class=inputDesSpanTd><SPAN class=inputDesSpan>����, 
  2-16����ĸ����</SPAN></TD></TR>
  <TR id=sex_form_row>
    <TD class=tellmeNameTd>�Ա�:</TD>
    <TD class=tellmeInputTd>
      <UL>
        <LI><LABEL class=pretty_radio for=sex-male><INPUT id=sex-male type=radio 
        CHECKED value=1 name=sex>��</LABEL> </LI>
        <LI><LABEL class=pretty_radio for=sex-female><INPUT id=sex-female 
        type=radio value=2 name=sex>Ů</LABEL> </LI>
        <LI><LABEL class=pretty_radio for=sex-unknow><INPUT id=sex-unknow 
        type=radio value=0 name=sex>����</LABEL> </LI></UL></TD>
    <TD class=inputDesSpanTd></TD></TR>
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
<DIV class=openMore><A id=detail_switcher_button 
href="javascript:void(0);">��ʾ����������Ϣ</A></DIV>
<TABLE class=tellmeTable>
  <TBODY>
  <TR id=tel_form_row>
    <TD class=tellmeNameTd>��ϵ�绰:</TD>
    <TD class=tellmeInputTd><INPUT class=importInput id=tel name=tel> </TD>
    <TD class=inputDesSpanTd></TD></TR>
  <TR id=address_form_row>
    <TD class=tellmeNameTd>��ϵ��ַ:</TD>
    <TD class=tellmeInputTd><INPUT class=importInput id=address name=address> 
    </TD>
    <TD class=inputDesSpanTd></TD></TR>
  <TR id=detail_form_row>
    <TD class=tellmeNameTd>����:</TD>
    <TD class=tellmeInputTd><TEXTAREA id=description name=description rows=3></TEXTAREA> 
    </TD>
    <TD class=inputDesSpanTd></TD></TR>
  <TR id=email_notify_form_row>
    <TD class=tellmeNameTd>Email����:</TD>
    <TD class=tellmeInputTd>
      <DIV id=email_notify_rule_selector></DIV>
      <DIV class=bottomBorder2><!----></DIV></TD>
    <TD class=inputDesSpanTd></TD></TR>
  <TR id=phone_notify_form_row>
    <TD class=tellmeNameTd>�ֻ�����:</TD>
    <TD class=tellmeInputTd>
      <DIV id=phone_notify_rule_selector></DIV>
      <DIV class=bottomBorder2><!----></DIV></TD>
    <TD class=inputDesSpanTd></TD></TR>
  <TR>
    <TD class=tellmeNameTd></TD>
    <TD class=tellmeInputTd>
      <DIV class=erronotice id=erronotice_container style="DISPLAY: none"></DIV>
      <P><INPUT class=confirmBtn id=submit_button type=button value=ȷ��><SPAN><A 
      class=cancelBtn id=cancel_button href="javascript:void(0)">ȡ��</A></SPAN> 
      </P></TD>
    <TD class=inputDesSpanTd></TD></TR></TBODY></TABLE></DIV></DIV>
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
