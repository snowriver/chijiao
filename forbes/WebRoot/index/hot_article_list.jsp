<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<ul>
	<c:forEach items="${ARTICLE_LIST}" var="article" begin="0"> 
	<li>
		<div style="float:left">
			[<a href="article/ArticleSearch.do?act=list&keyword=&orderby=pubdate desc" target="_blank">创业大学</a>]
			<a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 18)}</a>
		</div>
		<div style="float:right">
			<span align="right"><a href="${UC_HOME_URL }/space.php?uid=${article.userid}" target="_blank">${fn:substring(article.username, 0, 5)}</a></span>
		</div>
	</li>
	
	</c:forEach>
</ul>