<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.forbes.ajax.AskTypeSelector"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	String pid = request.getParameter("pid");

	AskTypeSelector as = new AskTypeSelector();
	

	java.util.List askTypeList = as.getAskTypes(pid);
	
	
	request.setAttribute("ASK_TYPE_LIST", askTypeList);
	
%>

<c:forEach items="${ASK_TYPE_LIST}" var="c">
	${c.id}&${c.name}#
</c:forEach>

