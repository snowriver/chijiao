<%@ page language="java" pageEncoding="gbk"%>

<%
	//com.forbes.hibernate.bean.UcMembers ucMembers = (com.forbes.hibernate.bean.UcMembers)request.getSession().getAttribute("CLIENT");
	//java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	//String date = request.getParameter("date");
	//if(date == null || date.length() < 1) {
		//date   = df.format(new java.util.Date()) ;		
	//}
		
	//com.forbes.ajax.UserDailyCount udc = new com.forbes.ajax.UserDailyCount();
	//com.forbes.ajax.UserWeekCount uwc = new com.forbes.ajax.UserWeekCount();
	
	//request.setAttribute("USER_DAILY_PLAN_COUNT", udc.getUserDailyPlanCount(ucMembers.getUid().toString(), date, null));
	//request.setAttribute("USER_DAILY_ACCREDIT_COUNT", udc.getUserDailyAccreditCount(ucMembers.getUid().toString(), date, null));
			
	//java.util.Date tempDate = df.parse(date);
	//request.setAttribute("WEEK_DAY", tempDate.getDay());	
	
	//if(tempDate.getDay() ==6 ) {		
		//request.setAttribute("USER_WEEK_ATTITUDE_COUNT", uwc.getUserWeekAttitudeCount(ucMembers.getUid().toString(), date));
		//request.setAttribute("USER_WEEK_AIM_EXAM_COUNT", uwc.getUserWeekAimExamCount(ucMembers.getUid().toString(), date));
	//} else {
		//request.setAttribute("USER_DAILY_SUMUP_COUNT", udc.getUserDailySumupCount(ucMembers.getUid().toString(), date));
	//}
	
	//if(tempDate.getDay() ==0 ) {
		//request.setAttribute("USER_WEEK_AIM_PLAN_COUNT", uwc.getUserWeekAimExamCount(ucMembers.getUid().toString(), date));
		//request.setAttribute("USER_WEEK_ABILITY_COUNT", uwc.getUserWeekAbilityCount(ucMembers.getUid().toString(), date));
	//}
%>

<a <c:if test="${month == 0}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=0">一月</a>
<a <c:if test="${month == 1}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=1">二月</a>
<a <c:if test="${month == 2}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=2">三月</a>
<a <c:if test="${month == 3}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=3">四月</a>
<a <c:if test="${month == 4}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=4">五月</a>
<a <c:if test="${month == 5}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=5">六月</a>
<a <c:if test="${month == 6}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=6">七月</a>
<a <c:if test="${month == 7}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=7">八月</a>
<a <c:if test="${month == 8}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=8">九月</a>
<a <c:if test="${month == 9}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=9">十月</a>
<a <c:if test="${month == 10}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=10">十一月</a>
<a <c:if test="${month == 11}">class="ucontype"</c:if> href="ClientManageUserMonthAimPlan.do?act=list&year=${PARA['year'] }&month=11">十二月</a>