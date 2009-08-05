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
			
	Date tempDate = df.parse(date);
	request.setAttribute("WEEK_DAY", tempDate.getDay());
	
	if(tempDate.getDay() ==6 ) {
		com.forbes.ajax.UserWeekCount uwc = new com.forbes.ajax.UserWeekCount();
		request.setAttribute("USER_WEEK_ATTITUDE_COUNT", uwc.getUserWeekAttitudeCount(ucMembers.getUid().toString(), date));
	} else {
		request.setAttribute("USER_DAILY_SUMUP_COUNT", udc.getUserDailySumupCount(ucMembers.getUid().toString(), date));
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的管理后台 - 计划管理</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="../js/jquery/pagination.css" />
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>

<script language="javascript" type="text/javascript">
	
		function pageselectCallback(page_id, jq){
		
		  window.location="ClientManageUserDailyPlan.do?act=list&keyword=${PARA['keyword']}&iscomplete=${PARA['iscomplete']}&date=${PARA['date']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:10,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
  
	  	function checkall(form, prefix, checkall) {
			var checkall = checkall ? checkall : 'chkall';
		
			for(var i = 0; i < form.elements.length; i++) {
				var e = form.elements[i];
				if(e.name && e.name != checkall && (!prefix || (prefix && e.name.match(prefix)))) {
					e.checked = form.elements[checkall].checked;
				}
			}
		}
	  	
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
		
		function deletePlan(){
			var plans = getCheckboxItem();
			if(plans == '') {
				alert("请选择其中一个计划！");
			}
			else {
				$.ajax({
					beforeSend: function(){
						//$("#RESULTE_MSG").html("删除中...");
					},
					url: 'ClientManageUserDailyPlan.do',
					type: 'post',
					dataType: 'html',
					data:"act=delete&planID=" + plans,
					timeout: 10000,
					error: function(){
						//alert('System error');
						alert("删除失败");
					},
					success: function(rsHtml){
						var code = (rsHtml).replace(/(^\s*)|(\s*$)/g, "");
						if(code == 'OK') {
							location.reload();
						}
						else {
							alert("删除失败，请稍后再试！");
						}
					}
				});
			}
		}
		
		function completePlan(id){
			var iscomplete = $("#iscomplete_"+id).val();
			var data = "act=complete&id=" + id;
			if(iscomplete == 0) {
				data = data + "&is_complete=1"
			}
			else {
				data = data + "&is_complete=0"
			}
			$.ajax({
				beforeSend: function(){
					//$("#RESULTE_MSG").html("完成中...");
				},
				url: 'ClientManageUserDailyPlan.do',
				type: 'post',
				dataType: 'html',
				data:data,
				timeout: 10000,
				error: function(){
					//alert('System error');
					alert("设置失败");
				},
				success: function(rsHtml){
					//alert(rsHtml);				
				}
			});
		}

		
		function getCheckboxItem() {
			var allSel="";
			if(document.form2.planID.value) return document.form2.planID.value;
			for(i=0;i<document.form2.planID.length;i++) {
				if(document.form2.planID[i].checked) {
					if(allSel=="")
						allSel=document.form2.planID[i].value;
					else
						allSel=allSel+"`"+document.form2.planID[i].value;
				}
			}
			return allSel;	
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
	<h1>今日计划 [${DATE }]</h1>
	<h2>今日事项：诵读成功誓言并复习你的人生目标，再写下你的今日计划，付诸行动。</h2>
	<div class="ucnav">
		<a class="ucontype" href="javascript:void(0);">今日事项<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
		<a href="ClientManageUserDailyAccredit.do?act=list">今日授权[${USER_DAILY_ACCREDIT_COUNT }]</a>
		
		<c:if test="${not empty USER_DAILY_SUMUP_COUNT}">			
			<a href="ClientManageUserDailySumup.do?act=list">			
				<c:if test="${WEEK_DAY == 0}">本周反省</c:if>	<c:if test="${WEEK_DAY != 0}">今日反省</c:if>
				[${USER_DAILY_SUMUP_COUNT }]
			</a>
		</c:if>
		
		<c:if test="${not empty USER_WEEK_ATTITUDE_COUNT}">
			<a href="ClientManageUserDailySumup.do?act=list">一周心态检查表[${USER_WEEK_ATTITUDE_COUNT }]</a>
		</c:if>
		
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('添加今日事项','ClientAddUserDailyPlan.jsp', '15', '0', '700','550');">添加今日事项</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="form2" action="#">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
				
				<c:if test="${empty USER_PLAN_LIST}">
		    		<tr class="onset">
		    			<TD colspan="5" align="center">您还没有写今日计划！</TD>
		    		</tr>
		    	</c:if>
		    	
		    	<c:if test="${not empty USER_PLAN_LIST}">
		   		<tr align="center" style="font-weight:bold">
					<td width="5%"></td>
					<td width="5%">序号</td>
					<td width="15%">时间</td>
					<td width="35%">事项内容</td>
					<td width="15%">期限</td>
					<td width="15%">是否完成</td>
					<td width="10%">备注</td>
				</tr>
				
		    	<c:forEach items="${USER_PLAN_LIST}" var="plan" varStatus="status">
				<tr class="onset">
					<td width="5%"><input type="checkbox" name="planID" value="${plan.id}" /></td>
					<td width="5%">
						${ (PAGER.curPage -1) * 10 + status.index + 1 }
					</td>
					<td>
						<fmt:formatDate value="${plan.startTime}" pattern="HH:mm"/>-
						<fmt:formatDate value="${plan.endTime}" pattern="HH:mm"/>
					</td>
					<td><a href="javascript:void(0)" onclick="openPage('修改今日事项','ClientManageUserDailyPlan.do?act=get&id=${plan.id }', '15', '0', '700','550');">${fn:substring(plan.title, 0,30) }</a></td>
					<td>
						<fmt:formatDate value="${plan.limitTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td>
						<input id="iscomplete_${plan.id}" name="iscomplete_${plan.id}" type="checkbox" value="${plan.isComplete}" onclick="completePlan(${plan.id});" <c:if test="${plan.isComplete == 1}">checked</c:if> />						
					</td>
					<td >${fn:substring(plan.note, 0,15) }</td>
				</tr>
				</c:forEach>
				</c:if>
				
				</tbody>
				<tfoot>
				<tr >
					<td ><input name="chkall" type="checkbox" onclick="checkall(this.form, 'planID')" /></td>
					<td ><button onclick="deletePlan();" type="button">删除</button></td>
					<td ></td>
					<td >
						<div class="pagescroll">
							<div id="Pagination" class="pagination"></div>
						</div>
					</td>
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
