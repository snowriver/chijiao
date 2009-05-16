<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.forbes.ajax.CitySelector"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	String pid = request.getParameter("pid");

	CitySelector cs = new CitySelector();
	

	java.util.List cityList = cs.getCitys(pid);
	
	
	request.setAttribute("CITY", cityList);
	
%>

<c:forEach items="${CITY}" var="c">
	${c.id}&${c.name}#
</c:forEach>

