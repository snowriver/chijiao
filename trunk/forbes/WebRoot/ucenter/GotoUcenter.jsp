<%@page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!--ͬ����¼����-->
${SYN_LGIN}

 <script language="javascript" >
    <c:if test="${ not empty GOTO_URL}">
    	self.location="${GOTO_URL}";
    </c:if>
    <c:if test="${ empty GOTO_URL}">
    	self.location="/";
    </c:if>
 </script>

