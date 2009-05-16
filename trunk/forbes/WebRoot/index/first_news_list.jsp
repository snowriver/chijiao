<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<ul>

	<c:forEach items="${NEWS_LIST}" var="news" begin="0">	
	
	<h1><a href="article/NewsSearch.do?act=view&id=${news.id}" target="_blank"><strong><font color="000000">${fn:substring(news.title, 0, 20)}</font></strong></a></h1>

	<p><a href="article/NewsSearch.do?act=view&id=${news.id}" target="_blank">${fn:substring(news.description, 0, 30)}<BR>${fn:substring(news.description, 31, 60)}</a></p>
	
	</c:forEach>
</ul>