<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:if test="${empty USER_LEVEL_PROMOTION_LIST}">
无
</c:if>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
	<c:forEach items="${USER_LEVEL_PROMOTION_LIST}" var="promot" varStatus="is"> 
	<TR>
    	<TD><A class=linktext target=_blank href="UserView.do?act=ask&uid=${promot.uid}">${promot.username}</A></TD>
    	<TD width="35%">学前班</TD>
    </TR>
	</c:forEach> 
	</TBODY>
</TABLE>