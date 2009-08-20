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
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>

<script language="javascript" type="text/javascript">
	
		$(function() {
    		$('#aim').wysiwyg();
    		$('#gain').wysiwyg();
    		$('#challenge').wysiwyg();
    		$('#improve').wysiwyg();
    		$('#analyse').wysiwyg();    		
  		});
	
</script>
</head>
<body>
<c:set var="p" value="client_manage_life_aim"></c:set>

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
	<h1>我的人生阶段目标</h1>
	<div class="ucnav">		
		<a <c:if test="${PARA['years'] == 3}">class="ucontype"</c:if> href="ClientManageUserLifeStageAim.do?act=list&years=3">3年目标</a>
		<a <c:if test="${PARA['years'] == 5}">class="ucontype"</c:if> href="ClientManageUserLifeStageAim.do?act=list&years=5">5年目标</a>
		<a <c:if test="${PARA['years'] == 10}">class="ucontype"</c:if> href="ClientManageUserLifeStageAim.do?act=list&years=10">10年目标</a>
		<a <c:if test="${PARA['years'] == 20}">class="ucontype"</c:if> href="ClientManageUserLifeStageAim.do?act=list&years=20">中期目标</a>
		<a <c:if test="${PARA['years'] == 30}">class="ucontype"</c:if> href="ClientManageUserLifeStageAim.do?act=list&years=30">远期目标</a>
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserLifeStageAim.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_LIFE_STAGE_AIM.id }" />
			<INPUT type="hidden" id="years" name="years" value="${PARA['years'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
					
		    		<tr class="onset">
		    			<TD colspan="5" align="center">
		    				我的人生阶段目标
		    			</TD>
		    		</tr>
					<tr class="onset">
						<td colspan="5">
							<textarea id="aim" name="aim" rows="11" cols="90" style="width:98%">${USER_LIFE_STAGE_AIM.aim }</textarea> 
						</td>
					</tr>
					
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_LIFE_STAGE_AIM }'>添加</c:if><c:if test='${ not empty USER_LIFE_STAGE_AIM }'>修改</c:if>"></td>
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

<script type="text/javascript">	
	function selectOnchange(year) {
		var gotoUrl = "ClientManageUserMonthSumup.do?act=list&year=" +  year;
	    self.location= gotoUrl;
	}
</script>

</body></html>
