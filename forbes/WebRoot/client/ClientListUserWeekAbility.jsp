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
				alert("��ѡ����Ҫɾ�������ʣ�");
				return false;
			}
		}
		
</script>
</head>
<body>
<c:set var="p" value="client_manage_daily_plan"></c:set>
<c:set var="plan" value="ability"></c:set>


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
	<h1><div style="float:left">���ռƻ� [${DATE }]</div><div style="float:right" onclick="calendarOpen();" id="calendarButton"><a href="javascript:void(0)">��ʾ����</a>&nbsp;&nbsp;&nbsp;</div></h1>
	<%@ include file="include/Calendar.jsp"%>
	
	<div class="ucnav">
		
		<%@ include file="include/PlanMenu.jsp"%>
		
		
		<span class="navinfo">
			<img src="../res/icon_uptime.gif" />
			<strong><a href="javascript:void(0);" onclick="openPage('��ӽ�������','ClientAddUserDailyPlan.jsp', '15', '0', '700','550');">��ӽ�������</a></strong> 
		</span>
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserWeekAbility.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_WEEK_ABILITY.id }" />
			<INPUT type="hidden" id=date name=date value="${PARA['date'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset">
		    			<TD colspan="5" align="center">��������Ҫ�������쵼������������д���</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							
							<table width="98%">
							  <tr align=center>
							    <td><input type="checkbox" name="ardour" value="Y" <c:if test="${USER_WEEK_ABILITY.ardour == 'Y' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="promises" value="Y" <c:if test="${USER_WEEK_ABILITY.promises == 'Y' }">checked</c:if> />&nbsp;��ŵ</td>
							    <td><input type="checkbox" name="responsibility" value="Y" <c:if test="${USER_WEEK_ABILITY.responsibility == 'Y' }">checked</c:if> />&nbsp;������</td>
							    <td><input type="checkbox" name="admire" value="Y" <c:if test="${USER_WEEK_ABILITY.admire == 'Y' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="contribute" value="Y" <c:if test="${USER_WEEK_ABILITY.contribute == 'Y' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="believe" value="Y" <c:if test="${USER_WEEK_ABILITY.believe == 'Y' }">checked</c:if> />&nbsp;����</td>							  
							    <td><input type="checkbox" name="winwin" value="Y" <c:if test="${USER_WEEK_ABILITY.winwin == 'Y' }">checked</c:if> />&nbsp;��Ӯ</td>
							    <td><input type="checkbox" name="impel" value="Y" <c:if test="${USER_WEEK_ABILITY.impel == 'Y' }">checked</c:if> />&nbsp;����</td>
							  </tr>
		
							</table>

						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">��������Ҫ�����Ĺ�ͨ������������д���</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<table width="98%">
							  <tr>
							    <td><input type="checkbox" name="listen" value="N" <c:if test="${USER_WEEK_ABILITY.listen == 'N' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="focus" value="N" <c:if test="${USER_WEEK_ABILITY.focus == 'N' }">checked</c:if> />&nbsp;ע��</td>
							    <td><input type="checkbox" name="echo" value="N" <c:if test="${USER_WEEK_ABILITY.echo == 'N' }">checked</c:if> />&nbsp;��Ӧ</td>
							    <td><input type="checkbox" name="praise" value="N" <c:if test="${USER_WEEK_ABILITY.praise == 'N' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="convince" value="N" <c:if test="${USER_WEEK_ABILITY.convince == 'N' }">checked</c:if> />&nbsp;˵��</td>
							    <td><input type="checkbox" name="feedback" value="N" <c:if test="${USER_WEEK_ABILITY.feedback == 'N' }">checked</c:if> />&nbsp;����</td>							  
							    <td><input type="checkbox" name="thank" value="N" <c:if test="${USER_WEEK_ABILITY.thank == 'N' }">checked</c:if> />&nbsp;��л</td>
							    <td><input type="checkbox" name="visualize" value="N" <c:if test="${USER_WEEK_ABILITY.visualize == 'N' }">checked</c:if> />&nbsp;��������</td>
							  </tr>
							</table>
						</td>
					</tr>
					<tr class="onset">
		    			<TD colspan="5" align="center">��������Ҫ�����ĸ������ʣ�������д���</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<table width="98%">
							  <tr>
							    <td><input type="checkbox" name="study" value="N" <c:if test="${USER_WEEK_ABILITY.study == 'N' }">checked</c:if> />&nbsp;ѧϰ</td>
							    <td><input type="checkbox" name="innovation" value="N" <c:if test="${USER_WEEK_ABILITY.innovation == 'N' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="love" value="N" <c:if test="${USER_WEEK_ABILITY.love == 'N' }">checked</c:if> />&nbsp;����</td>
							    <td><input type="checkbox" name="gumption" value="N" <c:if test="${USER_WEEK_ABILITY.gumption == 'N' }">checked</c:if> />&nbsp;��ȡ��</td>
							    <td><input type="checkbox" name="purpose" value="N" <c:if test="${USER_WEEK_ABILITY.purpose == 'N' }">checked</c:if> />&nbsp;��ͼ��</td>
							    <td><input type="checkbox" name="intent" value="N" <c:if test="${USER_WEEK_ABILITY.intent == 'N' }">checked</c:if> />&nbsp;����</td>							  
							    <td><input type="checkbox" name="professional" value="N" <c:if test="${USER_WEEK_ABILITY.professional == 'N' }">checked</c:if> />&nbsp;רҵ֪ʶ</td>
							    <td><input type="checkbox" name="willpower" value="N" <c:if test="${USER_WEEK_ABILITY.willpower == 'N' }">checked</c:if> />&nbsp;����</td>
							  </tr>
							</table>
						</td>
					</tr>
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_WEEK_ABILITY }'>���</c:if><c:if test='${ not empty USER_WEEK_ABILITY }'>�޸�</c:if>"></td>
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
