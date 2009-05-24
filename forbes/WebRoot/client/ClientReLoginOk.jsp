<%@page contentType="text/html; charset=gbk" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<%
	String serverIp = request.getServerName();
	String serverPort   = "" + request.getServerPort();
	
	String context = request.getContextPath();
	String http= "http://" + serverIp + ":" + serverPort + context + "/client/";
%>

<!--同步登录代码-->
${SYN_LGIN}

 <script language="javascript" >
    //alert("登录成功");
    //parent.location=reload();
    
    //window.parent.closeDiv();
    //alert(window.parent.topmenu);
    //window.parent.showUserInfo();
   //remove();
	//showUserInfo();
	//window.parent.location.reload();
	//self.location = self.parent.location;
	
	
	<c:if test="${ not empty RETURN_URL}">
    	self.location="${RETURN_URL}";
    </c:if>
    <c:if test="${ empty RETURN_URL}">
    	window.parent.closeDiv();
    </c:if>
 </script>

