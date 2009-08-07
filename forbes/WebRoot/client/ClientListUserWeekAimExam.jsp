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
		<a href="ClientManageUserDailyPlan.do?act=list">今日事项<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
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
		<form method="post" name="form2" action="ClientManageUserWeekAttitude.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_WEEK_ATTITUDE.id }" />
			<INPUT type="hidden" id=date name=date value="${PARA['date'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset">
		    			<TD colspan="5" align="center">22种决定成功的积极心态（做到的打V，下周继续）</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							
							<table width="98%">
							  <tr align=center>
							    <td><input type="checkbox" name="confident" value="Y" <c:if test="${USER_WEEK_ATTITUDE.confident == 'Y' }">checked</c:if> />&nbsp;自信</td>
							    <td><input type="checkbox" name="intent" value="Y" <c:if test="${USER_WEEK_ATTITUDE.intent == 'Y' }">checked</c:if> />&nbsp;决心</td>
							    <td><input type="checkbox" name="initiative" value="Y" <c:if test="${USER_WEEK_ATTITUDE.initiative == 'Y' }">checked</c:if> />&nbsp;主动</td>
							    <td><input type="checkbox" name="ebullient" value="Y" <c:if test="${USER_WEEK_ATTITUDE.ebullient == 'Y' }">checked</c:if> />&nbsp;热情</td>
							    <td><input type="checkbox" name="love" value="Y" <c:if test="${USER_WEEK_ATTITUDE.love == 'Y' }">checked</c:if> />&nbsp;爱心</td>
							    <td><input type="checkbox" name="study" value="Y" <c:if test="${USER_WEEK_ATTITUDE.study == 'Y' }">checked</c:if> />&nbsp;学习</td>							  
							    <td><input type="checkbox" name="autonomic" value="Y" <c:if test="${USER_WEEK_ATTITUDE.autonomic == 'Y' }">checked</c:if> />&nbsp;自律</td>
							    <td><input type="checkbox" name="pertinacious" value="Y" <c:if test="${USER_WEEK_ATTITUDE.pertinacious == 'Y' }">checked</c:if> />&nbsp;顽强</td>
							    <td><input type="checkbox" name="insist" value="Y" <c:if test="${USER_WEEK_ATTITUDE.insist == 'Y' }">checked</c:if> />&nbsp;坚持</td>
							    <td><input type="checkbox" name="serious" value="Y" <c:if test="${USER_WEEK_ATTITUDE.serious == 'Y' }">checked</c:if> />&nbsp;认真</td>
							    <td><input type="checkbox" name="rapid" value="Y" <c:if test="${USER_WEEK_ATTITUDE.rapid == 'Y' }">checked</c:if> />&nbsp;迅速</td>
							    <td><input type="checkbox" name="optimism" value="Y" <c:if test="${USER_WEEK_ATTITUDE.optimism == 'Y' }">checked</c:if> />&nbsp;乐观</td>
							  </tr>
							  <tr align=center>
							    <td><input type="checkbox" name="innovation" value="Y" <c:if test="${USER_WEEK_ATTITUDE.innovation == 'Y' }">checked</c:if> />&nbsp;创新</td>
							    <td><input type="checkbox" name="honest" value="Y" <c:if test="${USER_WEEK_ATTITUDE.honest == 'Y' }">checked</c:if> />&nbsp;真诚</td>
							    <td><input type="checkbox" name="responsibility" value="Y" <c:if test="${USER_WEEK_ATTITUDE.responsibility == 'Y' }">checked</c:if> />&nbsp;负责</td>
							    <td><input type="checkbox" name="sonsy" value="Y" <c:if test="${USER_WEEK_ATTITUDE.sonsy == 'Y' }">checked</c:if> />&nbsp;豁达</td>
							    <td><input type="checkbox" name="diligence" value="Y" <c:if test="${USER_WEEK_ATTITUDE.diligence == 'Y' }">checked</c:if> />&nbsp;勤奋</td>
							    <td><input type="checkbox" name="humility" value="Y" <c:if test="${USER_WEEK_ATTITUDE.humility == 'Y' }">checked</c:if> />&nbsp;谦虚</td>							 
							    <td><input type="checkbox" name="purpose" value="Y" <c:if test="${USER_WEEK_ATTITUDE.purpose == 'Y' }">checked</c:if> />&nbsp;企图心</td>
							    <td><input type="checkbox" name="clear" value="Y" <c:if test="${USER_WEEK_ATTITUDE.clear == 'Y' }">checked</c:if> />&nbsp;日清日新</td>
							    <td><input type="checkbox" name="dobest" value="Y" <c:if test="${USER_WEEK_ATTITUDE.dobest == 'Y' }">checked</c:if> />&nbsp;全力以赴</td>
							    <td><input type="checkbox" name="team" value="Y" <c:if test="${USER_WEEK_ATTITUDE.team == 'Y' }">checked</c:if> />&nbsp;团队精神</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>

						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">22种导致失败的消极心态（发生的打X，下周一定改掉）</TD>
		    		</tr>		    	
					<tr class="onset">					
						<td colspan="5">
							<table width="98%">
							  <tr>
							    <td><input type="checkbox" name="sluggish" value="N" <c:if test="${USER_WEEK_ATTITUDE.sluggish == 'N' }">checked</c:if> />&nbsp;拖沓</td>
							    <td><input type="checkbox" name="inferiority" value="N" <c:if test="${USER_WEEK_ATTITUDE.inferiority == 'N' }">checked</c:if> />&nbsp;自卑</td>
							    <td><input type="checkbox" name="fluke" value="N" <c:if test="${USER_WEEK_ATTITUDE.fluke == 'N' }">checked</c:if> />&nbsp;侥幸</td>
							    <td><input type="checkbox" name="conceited" value="N" <c:if test="${USER_WEEK_ATTITUDE.conceited == 'N' }">checked</c:if> />&nbsp;自满</td>
							    <td><input type="checkbox" name="pride" value="N" <c:if test="${USER_WEEK_ATTITUDE.pride == 'N' }">checked</c:if> />&nbsp;骄傲</td>
							    <td><input type="checkbox" name="boggle" value="N" <c:if test="${USER_WEEK_ATTITUDE.boggle == 'N' }">checked</c:if> />&nbsp;犹豫</td>							  
							    <td><input type="checkbox" name="acedia" value="N" <c:if test="${USER_WEEK_ATTITUDE.acedia == 'N' }">checked</c:if> />&nbsp;懒惰</td>
							    <td><input type="checkbox" name="anxiety" value="N" <c:if test="${USER_WEEK_ATTITUDE.anxiety == 'N' }">checked</c:if> />&nbsp;忧虑</td>
							    <td><input type="checkbox" name="falsity" value="N" <c:if test="${USER_WEEK_ATTITUDE.falsity == 'N' }">checked</c:if> />&nbsp;虚伪</td>
							    <td><input type="checkbox" name="dream" value="N" <c:if test="${USER_WEEK_ATTITUDE.dream == 'N' }">checked</c:if> />&nbsp;空想</td>
							    <td><input type="checkbox" name="adamancy" value="N" <c:if test="${USER_WEEK_ATTITUDE.adamancy == 'N' }">checked</c:if> />&nbsp;固执</td>
							    <td><input type="checkbox" name="cynical" value="N" <c:if test="${USER_WEEK_ATTITUDE.cynical == 'N' }">checked</c:if> />&nbsp;愤世</td>
							  </tr>
							  <tr>
							    <td><input type="checkbox" name="vulgar" value="N" <c:if test="${USER_WEEK_ATTITUDE.vulgar == 'N' }">checked</c:if> />&nbsp;庸俗</td>
							    <td><input type="checkbox" name="recreance" value="N" <c:if test="${USER_WEEK_ATTITUDE.recreance == 'N' }">checked</c:if> />&nbsp;懦弱</td>
							    <td><input type="checkbox" name="peacockery" value="N" <c:if test="${USER_WEEK_ATTITUDE.peacockery == 'N' }">checked</c:if> />&nbsp;虚荣</td>
							    <td><input type="checkbox" name="avarice" value="N" <c:if test="${USER_WEEK_ATTITUDE.avarice == 'N' }">checked</c:if> />&nbsp;贪婪</td>
							    <td><input type="checkbox" name="asocial" value="N" <c:if test="${USER_WEEK_ATTITUDE.asocial == 'N' }">checked</c:if> />&nbsp;自私</td>
							    <td><input type="checkbox" name="fussy" value="N" <c:if test="${USER_WEEK_ATTITUDE.fussy == 'N' }">checked</c:if> />&nbsp;急躁</td>							  
							    <td><input type="checkbox" name="testiness" value="N" <c:if test="${USER_WEEK_ATTITUDE.testiness == 'N' }">checked</c:if> />&nbsp;易怒</td>
							    <td><input type="checkbox" name="despair" value="N" <c:if test="${USER_WEEK_ATTITUDE.despair == 'N' }">checked</c:if> />&nbsp;绝望</td>
							    <td><input type="checkbox" name="begrudge" value="N" <c:if test="${USER_WEEK_ATTITUDE.begrudge == 'N' }">checked</c:if> />&nbsp;嫉妒</td>
							    <td><input type="checkbox" name="excuse" value="N" <c:if test="${USER_WEEK_ATTITUDE.excuse == 'N' }">checked</c:if> />&nbsp;找借口</td>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>
						</td>
					</tr>				
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_WEEK_ATTITUDE }'>添加</c:if><c:if test='${ not empty USER_WEEK_ATTITUDE }'>修改</c:if>"></td>
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