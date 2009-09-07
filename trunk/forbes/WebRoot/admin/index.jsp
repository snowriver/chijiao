<%@ page language="java" pageEncoding="gbk"%>

<%

  	if(request.getSession().getAttribute("ADMIN") != null ) {
		response.sendRedirect("index_main.jsp");
	}
  	else {
  		response.sendRedirect("login.jsp");
  	}
%>