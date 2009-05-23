<%@ page language="java" pageEncoding="gbk"%>
<%@page import="java.util.Map,java.util.TreeMap "%>
<%@page import="com.forbes.util.SysConfigManager;"%>

<%
	Map sc = (TreeMap)SysConfigManager.scMap;
	request.setAttribute("SYS_CONFIG", sc );

%>
