<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<UL>
	<c:forEach items="${ARTICLE_LIST}" var="article"> 
		<LI><A href="article/ArticleView.do?id=${article.id}" target=_blank>${fn:substring(article.title, 0, 16)}</A>
	</c:forEach>
	</LI>
</UL>