<%@page contentType="text/html; charset=gbk" %>
<%@page import="com.forbes.ajax.VideoTypeSelector"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	
	String pid = request.getParameter("pid");
	
	VideoTypeSelector vs = new VideoTypeSelector();
	
	java.util.List videoTypeList = vs.getVideoTypes(pid);
	
	request.setAttribute("VIDEO_TYPE_LIST", videoTypeList);
	
%>

<c:forEach items="${VIDEO_TYPE_LIST}" var="c">
	${c.id}&${c.name}#
</c:forEach>

