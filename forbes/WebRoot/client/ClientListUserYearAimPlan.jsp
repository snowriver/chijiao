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
    		$('#firstMonth').wysiwyg();
    		$('#secondMonth').wysiwyg();
    		$('#thirdMonth').wysiwyg();
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
<c:set var="p" value="client_manage_year_plan"></c:set>
<c:set var="quarter" value="${PARA['quarter'] }"></c:set>


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
	<h1>
		<div style="float:left">年度计划进度表 [${PARA['year'] }年 - 第${PARA['quarter'] }季度]</div>
		<div style="float:right">
			<a href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year']-1 }">上一年</a>			
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value)"> 
				<c:forEach var="year" begin="2000" end="2050" step="1" >				
				<option value="${year }" <c:if test="${PARA['year'] == year }">selected</c:if> >${year }</option>
				</c:forEach>
			</select>			
			<a href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year']+1 }">下一年</a>&nbsp;&nbsp;&nbsp;
		</div>
	</h1>
			
	<div class="ucnav">
		<%@ include file="include/QuarterMenu.jsp"%>
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserYearAimPlan.do?act=add">
			<input type="hidden" id="id" name="id" value="${USER_YEAR_AIM_PLAN.id }" />
			<INPUT type="hidden" id=year name=year value="${PARA['year'] }">
			<INPUT type="hidden" id=quarter name=quarter value="${PARA['quarter'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset" align="center">
		    			<TD>
		    				&nbsp;&nbsp;&nbsp;&nbsp;<strong>${ 3 * (PARA['quarter'] - 1 ) + 1 } 月</strong>
		    			</TD>
		    		</tr>
					<tr class="onset">
						<td>
							<textarea id="firstMonth" name="firstMonth" rows="11" cols="90" style="width:98%">${USER_YEAR_AIM_PLAN.firstMonth }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD align="center" >
		    				&nbsp;&nbsp;&nbsp;&nbsp;${ 3 * (PARA['quarter'] - 1 ) + 2 } 月
		    			</TD>
		    		</tr>
					<tr class="onset">					
						<td>
							<textarea id="secondMonth" name="secondMonth" rows="11" cols="90" style="width:98%">${USER_YEAR_AIM_PLAN.secondMonth }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD align="center">
		    				&nbsp;&nbsp;&nbsp;&nbsp;${ 3 * (PARA['quarter'] - 1 ) + 3 } 月
		    			</TD>
		    		</tr>
					<tr class="onset">					
						<td>
							<textarea id="thirdMonth" name="thirdMonth" rows="11" cols="90" style="width:98%">${USER_YEAR_AIM_PLAN.thirdMonth }</textarea> 
						</td>
					</tr>
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td><input type="submit" value="<c:if test='${ empty USER_YEAR_AIM_PLAN }'>添加</c:if><c:if test='${ not empty USER_YEAR_AIM_PLAN }'>修改</c:if>"></td>
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
		var gotoUrl = "ClientManageUserYearAimPlan.do?act=list&year=" +  year;
	    self.location= gotoUrl;
	}
</script>
</body></html>
