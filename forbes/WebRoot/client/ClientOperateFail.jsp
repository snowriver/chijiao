<%@page contentType="text/html; charset=gbk" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<%
	String serverIp = request.getServerName();
	String serverPort   = "" + request.getServerPort();
	
	String context = request.getContextPath();
	String http= "http://" + serverIp + ":" + serverPort + context + "/client/";
%>
 <script language="javascript" >

		alert('${RESULT_MESSAGE}');
    	window.parent.closeDivn();
   
 </script>

