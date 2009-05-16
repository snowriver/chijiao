<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<ul>
<c:forEach items="${UC_HOME_BLOG_LIST}" var="blog" varStatus="is">						
	<li><a href="#" target="_blank">${fn:substring(blog.subject, 0, 20)}</a><span><a href="#" target="_blank">${fn:substring(blog.username, 0, 5)}</a></span></li>
</c:forEach>
</ul>