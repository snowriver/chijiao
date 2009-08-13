<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

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
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>
<!-- -
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>
$(function() {
    		$('#advance').wysiwyg();
    		$('#meditate').wysiwyg();
    		
  		});
 -->
</head>
<body>
<c:set var="p" value="client_manage_daily_plan"></c:set>
<c:set var="plan" value="aimExam"></c:set>


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
		<%@ include file="include/PlanMenu.jsp"%>
		
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onClick="openPage('��ӽ�������','ClientAddUserDailyPlan.jsp', '15', '0', '700','550');">��ӽ�������</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="ClientUserWeekAttitudeForm" action="ClientManageUserWeekAimExam.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_WEEK_AIM_EXAM.id }" />
			<INPUT type="hidden" id="date" name="date" value="${PARA['date'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
					<tr class="onset">					
						<td colspan="5">
							
							<table width="98%">
							  <tr class="onset">
							    <td width="10%" style="font-weight: bold;"><div align="center"><strong>��Ŀ</strong></div></td>
							    <td width="50%" style="font-weight: bold;">
							    	<c:if test="${WEEK_DAY != '0'}">�Ҵ��Ŀ������</c:if>
							    	<c:if test="${WEEK_DAY == '0'}">Ŀ��</c:if>
							    </td>
							    <td width="40%" style="font-weight: bold;">
							    	<c:if test="${WEEK_DAY != '0'}">�����ж�����</c:if>
							    	<c:if test="${WEEK_DAY == '0'}">�ж��ƻ�</c:if>
							    </td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>��ҵ</strong></div></td>
							    <td><textarea id="careerDone" name="careerDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.careerDone }</textarea></td>
							    <td><textarea id="careerNext" name="careerNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.careerNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>��ͥ</strong></div></td>
							    <td><textarea id="familyDone" name="familyDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.familyDone }</textarea></td>
							    <td><textarea id="familyNext" name="familyNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.familyNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>�˼�</strong></div></td>
							    <td><textarea id="contactDone" name="contactDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.contactDone }</textarea></td>
							    <td><textarea id="contactNext" name="contactNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.contactNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>����</strong></div></td>
							    <td><textarea id="financeDone" name="financeDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.financeDone }</textarea></td>
							    <td><textarea id="financeNext" name="financeNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.financeNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>����</strong></div></td>
							    <td><textarea id="spiritDone" name="spiritDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.spiritDone }</textarea></td>
							    <td><textarea id="spiritNext" name="spiritNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.spiritNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>����</strong></div></td>
							    <td><textarea id="healthDone" name="healthDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.healthDone }</textarea></td>
							    <td><textarea id="healthNext" name="healthNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.healthNext }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>����</strong></div></td>
							    <td><textarea id="otherDone" name="otherDone" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.otherDone }</textarea></td>
							    <td><textarea id="otherNext" name="otherNext" rows="5" cols="90" style="width:98%">${USER_WEEK_AIM_EXAM.otherNext }</textarea></td>
							  </tr>
							</table>

						</td>
					</tr>
					
					
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_WEEK_AIM_EXAM }'>���</c:if><c:if test='${ not empty USER_WEEK_AIM_EXAM }'>�޸�</c:if>"></td>
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