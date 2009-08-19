<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的管理后台 - 计划管理</title>
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
<c:set var="p" value="client_manage_month_plan"></c:set>
<c:set var="month" value="${PARA['month'] }"></c:set>


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
	<h1><div style="float:left">月度计划表 [${PARA['year'] }年-${PARA['month'] + 1}月]</div><div style="float:right" onclick="calendarOpen();" id="calendarButton"><a href="javascript:void(0)">显示日历</a>&nbsp;&nbsp;&nbsp;</div></h1>
		
	<div class="ucnav">
		<%@ include file="include/MonthMenu.jsp"%>		
	</div>
	
	<div>
		<form method="post" name="ClientUserMonthAimPlanForm" action="ClientManageUserMonthAimPlan.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_MONTH_AIM_PLAN.id }" />
			<INPUT type="hidden" id="year" name="year" value="${PARA['year'] }">
			<INPUT type="hidden" id="month" name="month" value="${PARA['month'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
					<tr class="onset">					
						<td colspan="5">
							
							<table width="98%">
							  <tr class="onset">
							    <td width="10%" style="font-weight: bold;"><div align="center"><strong>项目</strong></div></td>
							    <td width="45%" style="font-weight: bold;">本月目标</td>
							    <td width="45%" style="font-weight: bold;">行动计划</td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>事业</strong></div></td>
							    <td><textarea id="careerAim" name="careerAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.careerAim }</textarea></td>
							    <td><textarea id="careerPlan" name="careerPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.careerPlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>家庭</strong></div></td>
							    <td><textarea id="familyAim" name="familyAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.familyAim }</textarea></td>
							    <td><textarea id="familyPlan" name="familyPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.familyPlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>人际</strong></div></td>
							    <td><textarea id="contactAim" name="contactAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.contactAim }</textarea></td>
							    <td><textarea id="contactPlan" name="contactPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.contactPlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>财务</strong></div></td>
							    <td><textarea id="financeAim" name="financeAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.financeAim }</textarea></td>
							    <td><textarea id="financePlan" name="financePlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.financePlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>精神</strong></div></td>
							    <td><textarea id="spiritAim" name="spiritAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.spiritAim }</textarea></td>
							    <td><textarea id="spiritPlan" name="spiritPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.spiritPlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>健康</strong></div></td>
							    <td><textarea id="healthAim" name="healthAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.healthAim }</textarea></td>
							    <td><textarea id="healthPlan" name="healthPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.healthPlan }</textarea></td>
							  </tr>
							  <tr>
							    <td><div align="center"><strong>其他</strong></div></td>
							    <td><textarea id="otherAim" name="otherAim" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.otherAim }</textarea></td>
							    <td><textarea id="otherPlan" name="otherPlan" rows="5" cols="90" style="width:98%">${USER_MONTH_AIM_PLAN.otherPlan }</textarea></td>
							  </tr>
							</table>

						</td>
					</tr>
					
					
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_MONTH_AIM_PLAN }'>添加</c:if><c:if test='${ not empty USER_MONTH_AIM_PLAN }'>修改</c:if>"></td>
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