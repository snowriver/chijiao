<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<ul>
	<c:forEach items="${ARTICLE_LIST}" var="article"> 
	<li>
		¡¤<a href="article/ArticleView.do?id=${article.id}" target="_blank">
			<c:choose> 
				<c:when test="${fn:length(article.title) > 18}"> 
					<c:out value="${fn:substring(article.title, 0, 17)}" />
				</c:when> 
				<c:otherwise> 
					<c:out value="${article.title}" /> 
				</c:otherwise>
			</c:choose>       
		</a>
		<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
	</li>
	</c:forEach>
</ul>