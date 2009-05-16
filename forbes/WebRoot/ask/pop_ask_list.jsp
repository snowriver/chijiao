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
    		<TD>
    			<DIV style="WIDTH: 190px; HEIGHT: 20px; OVERFLOW: hidden">
    				<SPAN class=linktext><A class=linktext title="${ask.title }" href="AskSearch.do?act=view&id=${ask.id }">${fn:substring(ask.title, 0, 18)}</A></SPAN>
    			</DIV>
    		</TD>
    		<TD><SPAN class="text01"><IMG style="MARGIN-RIGHT: 3px" src="images/money.gif" width=12 height=12></SPAN>${ask.reward }</TD>
    	</TR>
    	</c:forEach>
	</TBODY>
</TABLE>


