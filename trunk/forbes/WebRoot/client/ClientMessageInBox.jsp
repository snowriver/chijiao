<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>我的管理后台</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<LINK rel=stylesheet type=text/css href="css/message_box.css">

<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	
<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="ClientManageFriend.do?act=list&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:5,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
	</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="p" value="client_manage_msg"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	

    					


								<div id="append"></div>
<div class="ucbody">
	<h1>短消息中心</h1>
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
		<a class="ucontype" href="ClientListNewsFeeds.do?act=in">收件箱<strong>[1]</strong></a>		
		<a href="index.php?m=pm_client&a=ls&folder=outbox">发件箱</a>
		<a href="index.php?m=pm_client&a=ls&folder=inbox&filter=announcepm">公共消息[1]</a>
		<a  class="sendpm" href="index.php?m=pm_client&a=send">发送短消息</a>

		<span class="navinfo">
			<img src="images/default/newpm.gif" />
			<strong>1</strong> <a href="index.php?m=pm_client&a=ls&folder=newbox">条未读消息</a>
		</span>
	</div>
	
	<div class="ucinfo">
		<form method="post" action="index.php?m=pm_client&a=delete&folder=inbox&filter=&extra=page%3D">
			<input type="hidden" name="formhash" value="26064ca43ca77b1e" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
					<tr class="ctrlbar">
						<td class="sel"><input type="checkbox" name="chkall" onclick="checkall(this.form, 'delete')" /></td>
						<td class="ava"><button name="pmsend" type="submit">删除</button></td>
						<td class="pef"></td>
						<td class=""></td>
					</tr>
				
					<c:if test="${empty MSG_LIST}">
			    		<TR>
			    			<TD colspan="4" align="center">没有短消息</TD>
			    		</TR>
			    	</c:if>
		    	
		    		<c:if test="${not empty MSG_LIST}">
		    		<c:forEach items="${MSG_LIST}" var="msg" varStatus="is">
				
				<tr class="onset">
					<td class="sel"><input type="checkbox" name="delete[]" value="8" /></td>
					<td class="ava"><img src="avatar.php?uid=2&size=small" /></td>
					<td class="per">xushaomin<p>今天  15:49</p></td>
					<td class="title">
						<h2><a class="boldtext" href="index.php?m=pm_client&a=view&pmid=8&folder=inbox&filter=&extra=page%3D" id="pm_view_8">admin</a></h2>
						<p>admin</p>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				</tbody>
				<tfoot>
				<tr class="ctrlbar">
					<td class="sel"><input type="checkbox" onclick="this.form.chkall.click()" /></td>
					<td class="ava"><button onclick="this.form.pmsend.click()" type="button">删除</button></td>
					<td class="pef"></td>
					<td class="">
						<DIV class="pagescroll"><DIV id="Pagination" class="pagination"></DIV></DIV>  
					</td>
				</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>




	

</DIV>
      
      
<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
