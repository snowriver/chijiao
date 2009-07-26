<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.forbes.hibernate.bean.UcMembers,java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	UcMembers ucMembers = (UcMembers)request.getSession().getAttribute("CLIENT");
	String date = request.getParameter("date");
	if(date == null) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date   = df.format(new Date()) ;
	}
	com.forbes.ajax.UserPlanCount upc = new com.forbes.ajax.UserPlanCount();
	request.setAttribute("USER_DAILY_PLAN_COUNT", upc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, null));
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
<link rel="stylesheet" type="text/css" href="../js/jquery/pagination.css" />
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>

<script language="javascript" type="text/javascript">
	
		function pageselectCallback(page_id, jq){
		
		  window.location="ClientManageUserDailyPlan.do?act=list&keyword=${param.keyword}&iscomplete=${param.iscomplete}&date=${param.date}&orderby=${param.orderby}&pno=" + (page_id+1);
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
  
	  	function CheckAll(form)  {
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.name != 'chkall') e.checked = form.chkall.checked; 
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
				alert("��ѡ����Ҫɾ�������ʣ�");
				return false;
			}
		}
		
		function deleteArticleFavorite(fid, pid){
				$.ajax({
					beforeSend: function(){
				     $("#RESULTE_MSG").html("ɾ����...");
				   },
					url: 'ClientManageArticleFavorite.do',
					type: 'post',
					dataType: 'html',
					data:"act=delete&id=" + fid,
					timeout: 10000,
					error: function(){
						//alert('System error');
						alert("ɾ��ʧ��");
					},
					success: function(rsHtml){
						//alert("ɾ���ɹ�!");
						pageselectCallback(pid, "jq");
						
					}
				});
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
	<h1>���ռƻ�[${PARA['date'] }]</h1>
	<script type="text/javascript">
		function checkall(form, prefix, checkall) {
			var checkall = checkall ? checkall : 'chkall';
			for(var i = 0; i < form.elements.length; i++) {
				var e = form.elements[i];
				if(e.name && e.name != checkall && (!prefix || (prefix && e.name.match(prefix)))) {
					e.checked = form.elements[checkall].checked;
				}
			}
		}

		function toggle_collapse(objname, ctrlobj) {
			var obj = document.getElementById(objname);
			if(obj.style.display == '') {
				obj.style.display = 'none';
				ctrlobj.innerHTML = '<img src="images/default/spread.gif" />';
			} else {
				obj.style.display = '';
				ctrlobj.innerHTML = '<img src="images/default/shrink.gif" />';
			}
		}

		function ctlent(event) {
			if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
				document.getElementById('postpmform').saveoutbox.value = 0;
				document.getElementById('postpmform').submit();
			}
		}
	</script>
	
	<div class="ucnav">
		<a class="ucontype" href="javascript:void(0);">��������<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
		<a href="index.php?m=pm_client&a=ls&folder=inbox&filter=announcepm">������Ȩ[1]</a>
		<a href="index.php?m=pm_client&a=ls&folder=outbox">���շ�ʡ[1]</a>
		

		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('��ӽ�������','ClientEditUserDailyPlan.jsp', '15', '0', '700','550');">��ӽ�������</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" action="index.php?m=pm_client&a=delete&folder=inbox&filter=&extra=page%3D">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
				
				<c:if test="${empty USER_PLAN_LIST}">
		    		<tr class="onset">
		    			<TD colspan="5" align="center">����û��д���ռƻ���</TD>
		    		</tr>
		    	</c:if>
		    	
		    	<c:if test="${not empty USER_PLAN_LIST}">
		   		<tr align="center" style="font-weight:bold">
					<td width="5%"></td>
					<td width="5%">���</td>
					<td width="15%">ʱ��</td>
					<td width="35%">��������</td>
					<td width="15%">����</td>
					<td width="15%">�Ƿ����</td>
					<td width="10%">��ע</td>
				</tr>
				
		    	
		    	<c:forEach items="${USER_PLAN_LIST}" var="plan" varStatus="status">
				<tr class="onset">
					<td width="5%"><input type="checkbox" name="delete[]" value="8" /></td>
					<td width="5%">
						${ (PAGER.curPage -1) * 10 + status.index + 1 }
					</td>
					<td >
						<fmt:formatDate value="${plan.startTime}" pattern="HH:mm"/>-
						<fmt:formatDate value="${plan.endTime}" pattern="HH:mm"/>
					</td>
					<td >${fn:substring(plan.title, 0,30) }</td>
					<td >
						<fmt:formatDate value="${plan.limitTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td >
						<input name="iscomplete" type="checkbox" value="${plan.id}" onclick=""/>						
					</td>
					<td >${fn:substring(plan.note, 0,15) }</td>
				</tr>
				</c:forEach>
				</c:if>
				
				</tbody>
				<tfoot>
				<tr >
					<td ><input type="checkbox" onclick="checkall(this.form, 'delete')" /></td>
					<td ><button onclick="this.form.pmsend.click()" type="button">ɾ��</button></td>
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
