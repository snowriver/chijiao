<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	String serverIp = request.getServerName();
	String serverPort   = "" + request.getServerPort();	
	String context = request.getContextPath();
	String http= "http://" + serverIp + ":" + serverPort + context + "/admin/";
%>
 <script language="javascript" >
 
    alert("${OK_MESSAGE}");
	self.location="${RETURN_URL}";
 </script>
