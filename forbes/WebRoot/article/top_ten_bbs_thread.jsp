<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:set var="cnt" value="1"></c:set>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
		<c:forEach items="${UC_BBS_THREAD_LIST}" var="thread" begin="0"> 
  		<TR>
    		<TD width="10%" align=middle><IMG src="images/top_${cnt }.gif"></TD>
    		<TD class=daren_name><A class=linktext target=_blank href="${UC_BBS_URL }/viewthread.php?tid=${thread.tid}">${fn:substring(thread.subject, 0, 25)}</A></TD>
    	</TR>
    	<c:set var="cnt" value="${cnt +1 }"></c:set>
  		</c:forEach>
	</TBODY>
</TABLE>