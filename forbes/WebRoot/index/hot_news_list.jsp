<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<ul>
	<c:forEach items="${NEWS_LIST}" var="news" begin="0"> 
	<li>
		[<a href="article/NewsSearch.do?act=list&orderby=pubdate%20desc" target="_blank">最新资讯</a>]
		<a href="article/NewsView.do?id=${news.id}" target="_blank">${fn:substring(news.title, 0, 20)}</a>
	</li>
	
	</c:forEach>
</ul>