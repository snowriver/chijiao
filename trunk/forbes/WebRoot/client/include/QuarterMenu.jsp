<%@ page language="java" pageEncoding="gbk"%>

<a <c:if test="${quarter == 1}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=1">第一季度</a>
<a <c:if test="${quarter == 2}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=2">第二季度</a>
<a <c:if test="${quarter == 3}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=3">第三季度</a>
<a <c:if test="${quarter == 4}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=4">第四季度</a>