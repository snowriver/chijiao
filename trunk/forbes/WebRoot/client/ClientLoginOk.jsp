<%@page contentType="text/html; charset=gbk" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
	String serverIp = request.getServerName();
	String serverPort   = "" + request.getServerPort();
	
	String context = request.getContextPath();
	String http= "http://" + serverIp + ":" + serverPort + context + "/client/";
%>

<!--ͬ����¼����-->
${SYN_LGIN}

 <script language="javascript" >
    alert("��䛳ɹ�");
    ///client/ClientMain.jsp
    <c:if test="${ not empty RETURN_URL}">
    	self.location="${RETURN_URL}";
    </c:if>
    <c:if test="${ empty RETURN_URL}">
    	self.location="ClientMain.jsp";
    </c:if>
    	
   
 </script>

