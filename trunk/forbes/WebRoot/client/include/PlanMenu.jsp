<%@ page language="java" pageEncoding="gbk"%>

<%
	com.forbes.hibernate.bean.UcMembers ucMembers = (com.forbes.hibernate.bean.UcMembers)request.getSession().getAttribute("CLIENT");
	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String date = request.getParameter("date");
	if(date == null || date.length() < 1) {
		date   = df.format(new java.util.Date()) ;		
	}
		
	com.forbes.ajax.UserDailyCount udc = new com.forbes.ajax.UserDailyCount();
	com.forbes.ajax.UserWeekCount uwc = new com.forbes.ajax.UserWeekCount();
	
	request.setAttribute("USER_DAILY_PLAN_COUNT", udc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, null));
	request.setAttribute("USER_DAILY_ACCREDIT_COUNT", udc.getUserDailyAccreditCount(ucMembers.getUid().toString(), date, null));
			
	java.util.Date tempDate = df.parse(date);
	request.setAttribute("WEEK_DAY", tempDate.getDay());	
	
	if(tempDate.getDay() ==6 ) {		
		request.setAttribute("USER_WEEK_ATTITUDE_COUNT", uwc.getUserWeekAttitudeCount(ucMembers.getUid().toString(), date));
		request.setAttribute("USER_WEEK_AIM_EXAM_COUNT", uwc.getUserWeekAimExamCount(ucMembers.getUid().toString(), date));
	} else {
		request.setAttribute("USER_DAILY_SUMUP_COUNT", udc.getUserDailySumupCount(ucMembers.getUid().toString(), date));
	}
	
	if(tempDate.getDay() ==0 ) {
		request.setAttribute("USER_WEEK_AIM_PLAN_COUNT", uwc.getUserWeekAimExamCount(ucMembers.getUid().toString(), date));
		request.setAttribute("USER_WEEK_ABILITY_COUNT", uwc.getUserWeekAbilityCount(ucMembers.getUid().toString(), date));
	}
%>

<a <c:if test="${plan == 'plan'}">class="ucontype"</c:if> href="ClientManageUserDailyPlan.do?act=list">今日事项<strong>[${USER_DAILY_PLAN_COUNT }]</strong></a>
<a <c:if test="${plan == 'accredit'}">class="ucontype"</c:if> href="ClientManageUserDailyAccredit.do?act=list">今日授权[${USER_DAILY_ACCREDIT_COUNT }]</a>
		
<c:if test="${not empty USER_DAILY_SUMUP_COUNT}">			
	<a <c:if test="${plan == 'sumup'}">class="ucontype"</c:if> href="ClientManageUserDailySumup.do?act=list">			
		<c:if test="${WEEK_DAY == 0}">本周反省</c:if>
		<c:if test="${WEEK_DAY != 0}">今日反省</c:if>
		[${USER_DAILY_SUMUP_COUNT }]
	</a>
</c:if>
		
<c:if test="${not empty USER_WEEK_ATTITUDE_COUNT}">
	<a <c:if test="${plan == 'attitude'}">class="ucontype"</c:if> href="ClientManageUserWeekAttitude.do?act=list">一周心态检视表[${USER_WEEK_ATTITUDE_COUNT }]</a>
</c:if>

<c:if test="${not empty USER_WEEK_AIM_EXAM_COUNT}">
	<a <c:if test="${plan == 'aimExam'}">class="ucontype"</c:if> href="ClientManageUserWeekAimExam.do?act=list">周目标达成检视表[${USER_WEEK_AIM_EXAM_COUNT }]</a>
</c:if>

<c:if test="${not empty USER_WEEK_ABILITY_COUNT}">
	<a <c:if test="${plan == 'ability'}">class="ucontype"</c:if> href="ClientManageUserWeekAbility.do?act=list">下周能力提升[${USER_WEEK_ABILITY_COUNT }]</a>
</c:if>

<c:if test="${not empty USER_WEEK_AIM_PLAN_COUNT}">
	<a <c:if test="${plan == 'aimExam'}">class="ucontype"</c:if> href="ClientManageUserWeekAimExam.do?act=list">下周目标与计划[${USER_WEEK_AIM_PLAN_COUNT }]</a>
</c:if>