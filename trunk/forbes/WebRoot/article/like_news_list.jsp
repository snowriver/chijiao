<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!--�����Ѷ��ʼ-->
<c:if test="${not empty LIKE_NEWS_LIST}">
	<c:forEach items="${LIKE_NEWS_LIST}" var="news"> 
		<LI class=reationNews><A href="NewsView.do?id=${news.id}">${fn:substring(news.title, 0, 20)}</A><FONT color=#828282>(<fmt:formatDate value='${news.pubdate}' pattern='MM-dd' />)</FONT>
	</c:forEach>
	</LI>
</c:if>

<c:if test="${empty LIKE_NEWS_LIST}">
	���������
</c:if>
<!--�����Ѷ����-->
