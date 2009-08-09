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
				alert("请选择你要删除的提问！");
				return false;
			}
		}
		
		
		
	

		
	
</script>
</head>
<body>
<c:set var="p" value="client_manage_daily_plan"></c:set>
<c:set var="plan" value="sumup"></c:set>


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
	<h1>今日计划 [${DATE}]</h1>
		
	<div class="ucnav">	
		
		<%@ include file="include/PlanMenu.jsp"%>
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('添加今日事项','ClientAddUserDailyPlan.jsp', '15', '0', '700','550');">添加今日事项</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserDailySumup.do?act=add">
			<input type="hidden" id="id" name="id" value="${USER_DAILY_SUMUP.id }" />
			<INPUT type="hidden" id=date name=date value="${PARA['date'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset">
		    			<TD colspan="5" align="center">
		    				<c:if test="${WEEK_DAY == 0}">本周检讨与成功感言：</c:if>
		    				<c:if test="${WEEK_DAY != 0}">今日进步</c:if>
		    			</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<textarea id="advance" name="advance" rows="11" cols="90" style="width:98%">${USER_DAILY_SUMUP.advance }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">
		    				<c:if test="${WEEK_DAY == 0}">这一周我遇到的最大的挑战是什么？我要从那些方面改善？我可以为我的公司和家人做更多的是？</c:if>
		    				<c:if test="${WEEK_DAY != 0}">今日反省</c:if>
		    			</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<textarea id="meditate" name="meditate" rows="11" cols="90" style="width:98%">${USER_DAILY_SUMUP.meditate }</textarea> 
						</td>
					</tr>				
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_DAILY_SUMUP }'>添加</c:if><c:if test='${ not empty USER_DAILY_SUMUP }'>修改</c:if>"></td>
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
