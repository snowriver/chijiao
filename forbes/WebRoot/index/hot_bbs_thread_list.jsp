<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<ul>
<c:forEach items="${UC_BBS_THREAD_LIST}" var="thread" varStatus="is">
	<li><a href="${UC_BBS_URL }/viewthread.php?tid=${thread.tid}" target="_blank">${fn:substring(thread.subject, 0, 15)}</a><span>${thread.views}</span></li> 
</c:forEach>
</ul>