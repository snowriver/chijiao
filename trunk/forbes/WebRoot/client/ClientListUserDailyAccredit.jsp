<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.forbes.hibernate.bean.UcMembers,java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	UcMembers ucMembers = (UcMembers)request.getSession().getAttribute("CLIENT");
	String date = request.getParameter("date");
	System.out.println(date);
	if(date == null || date.length() < 1) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date   = df.format(new Date()) ;		
	}
	com.forbes.ajax.UserDailyCount udc = new com.forbes.ajax.UserDailyCount();
	request.setAttribute("USER_DAILY_PLAN_COUNT", udc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, null));
	request.setAttribute("USER_DAILY_ACCREDIT_COUNT", udc.getUserDailyAccreditCount(ucMembers.getUid().toString(), date, null));
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
		
		  window.location="ClientManageUserDailyAccredit.do?act=list&keyword=${PARA['keyword']}&iscomplete=${PARA['iscomplete']}&date=${PARA['date']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
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
				alert("��ѡ����Ҫɾ�������ʣ�");
				return false;
			}
		}
		
		function deletePlan(){
			var accredits = getCheckboxItem();
			if(accredits == '') {
				alert("��ѡ������һ����Ȩ��");
			}
			else {
				$.ajax({
					beforeSend: function(){
						//$("#RESULTE_MSG").html("ɾ����...");
					},
					url: 'ClientManageUserDailyAccredit.do',
					type: 'post',
					dataType: 'html',
					data:"act=delete&accreditID=" + accredits,
					timeout: 10000,
					error: function(){
						//alert('System error');
						alert("ɾ��ʧ��");
					},
					success: function(rsHtml){
						var code = (rsHtml).replace(/(^\s*)|(\s*$)/g, "");
						if(code == 'OK') {
							location.reload();
						}
						else {
							alert("ɾ��ʧ�ܣ����Ժ����ԣ�");
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
					//$("#RESULTE_MSG").html("�����...");
				},
				url: 'ClientManageUserDailyAccredit.do',
				type: 'post',
				dataType: 'html',
				data:data,
				timeout: 10000,
				error: function(){
					//alert('System error');
					alert("����ʧ��");
				},
				success: function(rsHtml){
					//alert(rsHtml);				
				}
			});
		}

		
		function getCheckboxItem() {
			var allSel="";
			if(document.form2.accreditID.value) return document.form2.accreditID.value;
			for(i=0;i<document.form2.accreditID.length;i++) {
				if(document.form2.accreditID[i].checked) {
					if(allSel=="")
						allSel=document.form2.accreditID[i].value;
					else
						allSel=allSel+"`"+document.form2.accreditID[i].value;
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
	<h1>���ռƻ�[${PARA['date'] }]</h1>
		
	<div class="ucnav">
		<a href="ClientManageUserDailyPlan.do?act=list">��������<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
		<a class="ucontype" href="javascript:void(0);">������Ȩ[${USER_DAILY_ACCREDIT_COUNT }]</a>
		<a href="index.php?m=pm_client&a=ls&folder=outbox">���շ�ʡ[1]</a>
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('��ӽ�����Ȩ','ClientAddUserDailyAccredit.jsp', '15', '0', '700','550');">��ӽ�����Ȩ</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="form2" action="#">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
				
				<c:if test="${empty USER_ACCREDIT_LIST}">
		    		<tr class="onset">
		    			<TD colspan="5" align="center">����û��д������Ȩ��</TD>
		    		</tr>
		    	</c:if>
		    	
		    	<c:if test="${not empty USER_ACCREDIT_LIST}">
		   		<tr align="center" style="font-weight:bold">
					<td width="5%"></td>
					<td width="5%">���</td>
					<td width="15%">��Ȩ��</td>
					<td width="35%">��Ȩ����</td>
					<td width="15%">����</td>
					<td width="15%">�Ƿ����</td>
					<td width="10%">��ע</td>
				</tr>
				
		    	
		    	<c:forEach items="${USER_ACCREDIT_LIST}" var="accredit" varStatus="status">
				<tr class="onset">
					<td width="5%"><input type="checkbox" name="accreditID" value="${accredit.id}" /></td>
					<td width="5%">${(PAGER.curPage -1) * 10 + status.index + 1 }</td>
					<td>${accredit.receiver}</td>
					<td><a href="javascript:void(0)" onclick="openPage('�޸Ľ�������','ClientManageUserDailyPlan.do?act=get&id=${accredit.id }', '15', '0', '700','550');">${fn:substring(accredit.title, 0,30) }</a></td>
					<td><fmt:formatDate value="${accredit.limitTime}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>
						<input id="iscomplete_${accredit.id}" name="iscomplete_${accredit.id}" type="checkbox" value="${accredit.isComplete}" onclick="completePlan(${accredit.id});" <c:if test="${accredit.isComplete == 1}">checked</c:if> />						
					</td>
					<td >${fn:substring(accredit.note, 0,15) }</td>
				</tr>
				</c:forEach>
				</c:if>
				
				</tbody>
				<tfoot>
				<tr >
					<td ><input name="chkall" type="checkbox" onclick="checkall(this.form, 'accreditID')" /></td>
					<td ><button onclick="deletePlan();" type="button">ɾ��</button></td>
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
