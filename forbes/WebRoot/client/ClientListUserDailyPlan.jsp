<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的管理后台 - 百问管理</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="../js/jquery/pagination.css" />
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<script type="text/javascript" src="../js/common.js" ></script>
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>

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
				alert("请选择你要删除的提问！");
				return false;
			}
		}
		
		function deleteArticleFavorite(fid, pid){
				$.ajax({
					beforeSend: function(){
				     $("#RESULTE_MSG").html("删除中...");
				   },
					url: 'ClientManageArticleFavorite.do',
					type: 'post',
					dataType: 'html',
					data:"act=delete&id=" + fid,
					timeout: 10000,
					error: function(){
						//alert('System error');
						alert("删除失败");
					},
					success: function(rsHtml){
						//alert("删除成功!");
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
	<h1>今日计划</h1>
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
		<a class="ucontype" href="ClientListNewsFeeds.do?act=in">今日事项<strong>[1]</strong></a>
		<a href="index.php?m=pm_client&a=ls&folder=inbox&filter=announcepm">今日授权[1]</a>
		<a href="index.php?m=pm_client&a=ls&folder=outbox">今日反省[1]</a>
		<a  class="sendpm" href="index.php?m=pm_client&a=send"></a>

		<span class="navinfo">
			<img src="images/default/newpm.gif" />
			<strong><a href="index.php?m=pm_client&a=ls&folder=newbox">添加今日事项</a></strong> 
		</span>
	</div>
	
	<div class="ucinfo">
		<form method="post" action="index.php?m=pm_client&a=delete&folder=inbox&filter=&extra=page%3D">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
				
				<!-- 
				<tr class="ctrlbar">
					<td class="sel"><input type="checkbox" name="chkall" onclick="checkall(this.form, 'delete')" /></td>
					<td class="ava"><button name="pmsend" type="submit">删除</button></td>
					<td class="pef"></td>
					<td class=""></td>
				</tr>
				 -->
				<c:if test="${empty USER_PLAN_LIST}">
		    		<tr class="onset">
		    			<TD colspan="5" align="center">您还没有写今日计划！</TD>
		    		</tr>
		    	</c:if>
		    	
		    	<c:if test="${not empty USER_PLAN_LIST}">
		   
		    	
		    	<c:forEach items="${USER_PLAN_LIST}" var="plan" varStatus="status">
				<tr class="onset">
					<td class="sel"><input type="checkbox" name="delete[]" value="8" /></td>
					<td class="ava">${status.index + 1 }</td>
					<td class="per">
						<fmt:formatDate value="${plan.startTime}" pattern="HH:mm"/>-
						<fmt:formatDate value="${plan.endTime}" pattern="HH:mm"/>
					</td>
					<td class="title">${fn:substring(plan.title, 0,15) }</td>
					<td class="title">
						<fmt:formatDate value="${plan.limitTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td class="title">
						<input name="ww" type="checkbox" value="" />						
					</td>
					<td class="title">${fn:substring(plan.note, 0,15) }</td>
				</tr>
				</c:forEach>
				</c:if>
				
				</tbody>
				<tfoot>
				<tr class="ctrlbar">
					<td class="sel"><input type="checkbox" onclick="this.form.chkall.click()" /></td>
					<td class="ava">
						<div style="float:left"><button onclick="this.form.pmsend.click()" type="button">删除</button></div>
						<div style="float:right">
							<div class="pagescroll">
								<div id="Pagination" class="pagination"></div>
							</div>
						</div>						
					</td>
					<td class="pef"></td>
					<td class=""></td>
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
