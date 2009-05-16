<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  //response.sendRedirect(path+"/admin/index_main.jsp");
%>


<script>
	<c:if test="${not empty OK_MESSAGE}">
		alert('${OK_MESSAGE }');
	</c:if>
	location='${RETURN_URL}';
</script>
