<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.forbes.hibernate.bean.UcMembers,java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	UcMembers ucMembers = (UcMembers)request.getSession().getAttribute("CLIENT");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = request.getParameter("date");
	if(date == null || date.length() < 1) {
		date   = df.format(new Date()) ;		
	}
		
	com.forbes.ajax.UserDailyCount udc = new com.forbes.ajax.UserDailyCount();
	request.setAttribute("USER_DAILY_PLAN_COUNT", udc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, null));
	request.setAttribute("USER_DAILY_ACCREDIT_COUNT", udc.getUserDailyAccreditCount(ucMembers.getUid().toString(), date, null));
	request.setAttribute("USER_DAILY_SUMUP_COUNT", udc.getUserDailySumupCount(ucMembers.getUid().toString(), date));
	
	Date tempDate = df.parse(date);
	if(tempDate.getDay() ==6 ) {
		//ClientManageUserWeekAttitude
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�ҵĹ����̨ - �ƻ�����</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>

<script language="javascript" type="text/javascript">
	
		$(function() {
    		$('#advance').wysiwyg();
    		$('#meditate').wysiwyg();
    		
  		});
	  	
	  	function Check(form) {
	  		var flag = false;
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.checked == true)
	    			 flag = true;
	   		}
			if(flag == false) {
				alert("��ѡ����Ҫɾ�������ʣ�");
				return false;
			}
		}
		
		
		
	

		
	
</script>
</head>
<body>
<c:set var="p" value="client_manage_daily_plan"></c:set>



<div id=supevbox></div>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<div class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<div class=mainbody>
	<div id="append"></div>
<div class="ucbody">
	<h1>���ռƻ� [${DATE}]</h1>
		
	<div class="ucnav">
		<a href="ClientManageUserDailyPlan.do?act=list">��������<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
		<a href="ClientManageUserDailyAccredit.do?act=list">������Ȩ[${USER_DAILY_ACCREDIT_COUNT }]</a>
		<a class="ucontype" href="javascript:void(0);">���շ�ʡ[${USER_DAILY_SUMUP_COUNT }]</a>
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('��ӽ�������','ClientAddUserDailyPlan.jsp', '15', '0', '700','550');">��ӽ�������</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserDailySumup.do?act=add">
			<input type="hidden" id="id" name="id" value="${USER_DAILY_SUMUP.id }" />
			<INPUT type="hidden" id=date name=date value="${PARA['date'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset">
		    			<TD colspan="5" align="center">22�־����ɹ��Ļ�����̬�������Ĵ�V�����ܼ�����</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							
							<table width="98%">
							  <tr align=center>
							    <td><input type="checkbox" name="confident" value="Y" />����</td>
							    <td><input type="checkbox" name="intent" value="Y" />����</td>
							    <td><input type="checkbox" name="initiative" value="Y" />����</td>
							    <td><input type="checkbox" name="ebullient" value="Y" />����</td>
							    <td><input type="checkbox" name="love" value="Y" />����</td>
							    <td><input type="checkbox" name="study" value="Y" />ѧϰ</td>							  
							    <td><input type="checkbox" name="autonomic" value="Y" />����</td>
							    <td><input type="checkbox" name="pertinacious" value="Y" />��ǿ</td>
							    <td><input type="checkbox" name="insist" value="Y" />���</td>
							    <td><input type="checkbox" name="serious" value="Y" />����</td>
							    <td><input type="checkbox" name="rapid" value="Y" />Ѹ��</td>
							    <td><input type="checkbox" name="optimism" value="Y" />�ֹ�</td>
							  </tr>
							  <tr align=center>
							    <td><input type="checkbox" name="innovation" value="Y" />����</td>
							    <td><input type="checkbox" name="honest" value="Y" />���</td>
							    <td><input type="checkbox" name="responsibility" value="Y" />����</td>
							    <td><input type="checkbox" name="sonsy" value="Y" />���</td>
							    <td><input type="checkbox" name="diligence" value="Y" />�ڷ�</td>
							    <td><input type="checkbox" name="humility" value="Y" />ǫ��</td>							 
							    <td><input type="checkbox" name="purpose" value="Y" />��ͼ��</td>
							    <td><input type="checkbox" name="clear" value="Y" />��������</td>
							    <td><input type="checkbox" name="dobest" value="Y" />ȫ���Ը�</td>
							    <td><input type="checkbox" name="team" value="Y" />�ŶӾ���</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>

						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">22�ֵ���ʧ�ܵ�������̬�������Ĵ�X������һ���ĵ���</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<table width="98%" border="1">
							  <tr>
							    <td><input type="checkbox" name="sluggish" value="N" />���</td>
							    <td><input type="checkbox" name="inferiority" value="N" />�Ա�</td>
							    <td><input type="checkbox" name="fluke" value="N" />����</td>
							    <td><input type="checkbox" name="conceited" value="N" />����</td>
							    <td><input type="checkbox" name="pride" value="N" />����</td>
							    <td><input type="checkbox" name="boggle" value="N" />��ԥ</td>							  
							    <td><input type="checkbox" name="acedia" value="N" />����</td>
							    <td><input type="checkbox" name="anxiety" value="N" />����</td>
							    <td><input type="checkbox" name="falsity" value="N" />��α</td>
							    <td><input type="checkbox" name="dream" value="N" />����</td>
							    <td><input type="checkbox" name="adamancy" value="N" />��ִ</td>
							    <td><input type="checkbox" name="cynical" value="N" />����</td>
							  </tr>
							  <tr>
							    <td><input type="checkbox" name="vulgar" value="N" />ӹ��</td>
							    <td><input type="checkbox" name="recreance" value="N" />ų��</td>
							    <td><input type="checkbox" name="peacockery" value="N" />����</td>
							    <td><input type="checkbox" name="avarice" value="N" />̰��</td>
							    <td><input type="checkbox" name="asocial" value="N" />��˽</td>
							    <td><input type="checkbox" name="fussy" value="N" />����</td>							  
							    <td><input type="checkbox" name="testiness" value="N" />��ŭ</td>
							    <td><input type="checkbox" name="despair" value="N" />����</td>
							    <td><input type="checkbox" name="begrudge" value="N" />����</td>
							    <td><input type="checkbox" name="excuse" value="N" />�ҽ��</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>
						</td>
					</tr>				
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_DAILY_SUMUP }'>���</c:if><c:if test='${ not empty USER_DAILY_SUMUP }'>�޸�</c:if>"></td>
				</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
</div>
      

<!--searchzone start--></div>
<div class=clear></div>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</body></html>
