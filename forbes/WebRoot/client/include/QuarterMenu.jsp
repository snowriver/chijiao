<%@ page language="java" pageEncoding="gbk"%>

<a <c:if test="${quarter == 1}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=1">��һ����</a>
<a <c:if test="${quarter == 2}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=2">�ڶ�����</a>
<a <c:if test="${quarter == 3}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=3">��������</a>
<a <c:if test="${quarter == 4}">class="ucontype"</c:if> href="ClientManageUserYearAimPlan.do?act=list&year=${PARA['year'] }&quarter=4">���ļ���</a>