<%@ page language="java" pageEncoding="gbk"%>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  session.removeAttribute("ADMIN");
  response.sendRedirect(path+"/admin/index.jsp");
%>