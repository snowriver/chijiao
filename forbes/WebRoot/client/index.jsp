<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
	try{
  		if(request.getSession().getAttribute("CLIENT") == null ) {
			response.sendRedirect("ClientLogin.jsp");
		}
  		else {
  			response.sendRedirect("ClientMain.jsp");
  		}
  	} catch(Exception e){
		e.printStackTrace();
	}	
%>