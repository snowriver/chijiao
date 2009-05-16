<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:if test="${empty ASK_LIST}">
无
</c:if>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
		<c:forEach items="${ASK_LIST}" var="ask"> 
		<TR>
    		<TD width="20%">[<A style="COLOR: #3b5a90" href="AskSearch.do?act=search&typeid=${ask.askType.id }&status=0_1&orderby=expiredTime desc">${fn:substring(ask.askType.name, 0, 5)}</A>]</TD>
    		<TD>·<A class=linktext target="_blank" title="${ask.title }" href="AskSearch.do?act=view&id=${ask.id }">${fn:substring(ask.title, 0, 30)}</A></TD>
    		<TD style="PADDING-LEFT: 15px; BACKGROUND: url(images/money.gif) no-repeat left center" width="15%">${ask.reward}</TD>
    		<TD width="10%"><fmt:formatDate value='${ask.expiredTime}' pattern='MM-dd' /></TD>
    	</TR>
    	</c:forEach>
  	</TBODY>
</TABLE>


