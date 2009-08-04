<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
	try{
  		//if(request.getSession().getAttribute("CLIENT") == null ) {
			//response.sendRedirect("ClientLogin.jsp");
		//}
  		//else {
  			//response.sendRedirect("ClientMain.jsp");
  		//}
		response.sendRedirect("ClientLogin.do?act=cookie");
  	} catch(Exception e){
		e.printStackTrace();
	}	
%>