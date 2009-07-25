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
<link type="text/css" rel="stylesheet"  href="../js/jquery/css/ui.all.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />

<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.3.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/ui.core.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/ui.datepicker.js"></SCRIPT>
  
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>


<script language="javascript" type="text/javascript">
	
	$(window).ready(function(){
		$('#date').datepicker();
		$('#date').datepicker('option', {dateFormat: 'yy-mm-dd'});	
		$('#date').datepicker('option', 'dayNamesMin', ['日', '一', '二', '三', '四', '五', '六']);
		$('#date').datepicker('option', 'monthNamesShort', ['一','二','三','四','五','六',	'七','八','九','十','十一','十二']);
		$('#date').datepicker('option', 'monthNames', ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']);
	
		$('#date').datepicker('option', 'closeText', '关闭');
		$('#date').datepicker('option', 'prevText', '&#x3c;上月');
		$('#date').datepicker('option', 'nextText', '下月&#x3e;');
	});

	$(function() {
    	$('#content').wysiwyg();
  	});
  	
  	function Check(){	
		if( planForm.title.value == '' ){
			$("#inputTitle").html("<font color=red>* 标题不能为空</font>");
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
	  			<LI><A class=current id=switch_birthday_button href="javascript:void(0)">今日计划</A> </LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">今日授权</A></LI>
	  			<LI><A id=switch_commemo_button href="javascript:void(0)">今日反省</A></LI>
	  		</UL>
	  	</DIV>
	  	
	  	<DIV class=blockNoBorder>
	  		<form name="planForm" method="post" action="ClientManageUserDailyPlan.do?act=add" onsubmit="Check();return false;">
			<TABLE class=tellmeTable>
	  			<TBODY>
	  				<TR>
					    <TD class=tellmeNameTd id=name_title_caption>事项标题:</TD>
					    <TD class=tellmeInputTd><INPUT class=importInput id=title name=title></TD>
					    <TD class=inputDesSpanTd><SPAN class=inputDesSpan id=inputTitle>必填</SPAN></TD>
					</TR>
	  				<TR id=sex_form_row>
					    <TD class=tellmeNameTd>日期:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=date name=date value="${DATE }" readonly></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
					<TR>
						<TD class=tellmeNameTd id=select_day_caption>起至时间:</TD>
						<TD class=tellmeInputTd id=select_day_container>
	      					<DIV style="float:left">
	      						<SELECT id=start_time_hh name=start_time_hh onchange="changeEndTimeHh(this.options[this.options.selectedIndex].value)"> 
	      							<OPTION value="00">00</OPTION>
	      							<OPTION value="01">01</OPTION>
	      							<OPTION value="02">02</OPTION>
	      							<OPTION value="03">03</OPTION>
	      							<OPTION value="04">04</OPTION>
	      							<OPTION value="05">05</OPTION>
	      							<OPTION value="06">06</OPTION>
	      							<OPTION value="07">07</OPTION>
	      							<OPTION value="08">08</OPTION>
	      							<OPTION value="09" selected>09</OPTION>
	      							<OPTION value="10">10</OPTION>
	      							<OPTION value="11">11</OPTION>
	      							<OPTION value="12">12</OPTION>
	      							<OPTION value="13">13</OPTION>
	      							<OPTION value="14">14</OPTION>
	      							<OPTION value="15">15</OPTION>
	      							<OPTION value="16">16</OPTION>
	      							<OPTION value="17">17</OPTION>	      							
	      							<OPTION value="18">18</OPTION>
	      							<OPTION value="19">19</OPTION>
	      							<OPTION value="20">20</OPTION>
	      							<OPTION value="21">21</OPTION>
	      							<OPTION value="22">22</OPTION>
	      							<OPTION value="23">23</OPTION>
	      						</SELECT>
	      						<SELECT id=start_time_mm name=start_time_mm> 
	      							<OPTION value="00" selected>00</OPTION>
	      							<OPTION value="05">05</OPTION>
	      							<OPTION value="10">10</OPTION>
	      							<OPTION value="15">15</OPTION>
	      							<OPTION value="20">20</OPTION>
	      							<OPTION value="25">25</OPTION>
	      							<OPTION value="30">30</OPTION>
	      							<OPTION value="35">35</OPTION>
	      							<OPTION value="40">40</OPTION>
	      							<OPTION value="45">45</OPTION>
	      							<OPTION value="50">50</OPTION>
	      							<OPTION value="55">55</OPTION>	      			
	      						</SELECT> 至  
	      					</DIV>
	      					<DIV style="float:left">					
	      						<SELECT id=end_time_hh name=end_time_hh> 
	      							<OPTION value="00">00</OPTION>
	      							<OPTION value="01">01</OPTION>
	      							<OPTION value="02">02</OPTION>
	      							<OPTION value="03">03</OPTION>
	      							<OPTION value="04">04</OPTION>
	      							<OPTION value="05">05</OPTION>
	      							<OPTION value="06">06</OPTION>
	      							<OPTION value="07">07</OPTION>
	      							<OPTION value="08">08</OPTION>
	      							<OPTION value="09" selected>09</OPTION>
	      							<OPTION value="10">10</OPTION>
	      							<OPTION value="11">11</OPTION>
	      							<OPTION value="12">12</OPTION>
	      							<OPTION value="13">13</OPTION>
	      							<OPTION value="14">14</OPTION>
	      							<OPTION value="15">15</OPTION>
	      							<OPTION value="16">16</OPTION>
	      							<OPTION value="17">17</OPTION>
	      							<OPTION value="18">18</OPTION>
	      							<OPTION value="19">19</OPTION>
	      							<OPTION value="20">20</OPTION>	      							
	      							<OPTION value="21">21</OPTION>
	      							<OPTION value="22">22</OPTION>
	      							<OPTION value="23">23</OPTION>
	      						</SELECT>
	      						<SELECT id=end_time_mm name=end_time_mm> 
	      							<OPTION value="00">00</OPTION>
	      							<OPTION value="05">05</OPTION>
	      							<OPTION value="10">10</OPTION>
	      							<OPTION value="15">15</OPTION>
	      							<OPTION value="20">20</OPTION>
	      							<OPTION value="25">25</OPTION>
	      							<OPTION value="30">30</OPTION>
	      							<OPTION value="35">35</OPTION>
	      							<OPTION value="40">40</OPTION>
	      							<OPTION value="45">45</OPTION>
	      							<OPTION value="50">50</OPTION>
	      							<OPTION value="55">55</OPTION>	      			
	      						</SELECT>
	      						
	      					</DIV>
	      				</TD>
	      				<TD class=inputDesSpanTd><SPAN class=inputDesSpan>必填</SPAN></TD>
	      			</TR>
	      			<TR id=sex_form_row>
					    <TD class=tellmeNameTd>期限:</TD>
					    <TD class=tellmeInputTd>
					    	<UL>
					        	<LI><INPUT class="importInput2" id=limit_time name=limit_time></LI>				       		
					       	</UL>
					 	</TD>
					    <TD class=inputDesSpanTd></TD>
					</TR>
				  	<TR>
				    	<TD class=tellmeNameTd id=relation_caption>是否完成:</TD>
				    	<TD class=tellmeInputTd>
				      		<INPUT type=radio CHECKED value=0 name=is_complete>处理中/计划中
				      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      		<INPUT type=radio value=1 name=is_complete>已完成	
				      	</TD>
				    	<TD class=inputDesSpanTd></TD>
				    </TR>
				    <TR>
					    <TD class=tellmeNameTd>详细内容:</TD>
					    <TD colspan="2">
					    	<textarea id="content" name="content" rows="11" cols="90"></textarea> 
					 	</TD>					 
					</TR>
					<TR>
						<TD class=tellmeNameTd></TD>
						<TD class=tellmeInputTd>
							<P>
								<INPUT class=confirmBtn id=continue_button type=submit value=确定> 
								<INPUT class=confirmBtn id=continue_button type=button value=关闭 onclick="parent.closeDiv();">
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
