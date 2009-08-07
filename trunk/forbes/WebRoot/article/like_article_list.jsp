<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!--相关资讯开始-->
<c:if test="${not empty LIKE_ARTICLE_LIST}">
	<c:forEach items="${LIKE_ARTICLE_LIST}" var="article"> 
		<LI class=reationNews><A href="ArticleView.do?id=${article.id}">${fn:substring(article.title, 0, 20)}</A><FONT color=#828282>(<fmt:formatDate value='${article.pubdate}' pattern='MM-dd' />)</FONT>
	</c:forEach>
	</LI>
</c:if>

<c:if test="${empty LIKE_ARTICLE_LIST}">
	无相关文章
</c:if>
<!--相关资讯结束-->
