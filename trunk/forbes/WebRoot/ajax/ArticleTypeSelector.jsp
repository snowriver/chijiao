<%@page contentType="text/html; charset=utf-8" %>
<%@page import="com.forbes.ajax.ArticleTypeSelector"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	
	String pid = request.getParameter("pid");
	
	ArticleTypeSelector vs = new ArticleTypeSelector();
	
	java.util.List articleTypeList = vs.getArticleTypes(pid);
	
	request.setAttribute("ARTICLE_TYPE_LIST", articleTypeList);
	
%>

<c:forEach items="${ARTICLE_TYPE_LIST}" var="c">
	${c.id}&${c.name}#
</c:forEach>

