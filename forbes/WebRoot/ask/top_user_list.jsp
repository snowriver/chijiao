<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:if test="${empty USER_LIST}">
无
</c:if>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
 	<TBODY>
 		<c:forEach items="${USER_LIST}" var="user" varStatus="is"> 
 		<TR>
    		<TD width="20%" align=middle><IMG src="images/top_${is.index + 1 }.gif"></TD>
    		<TD class=daren_name width="65%"><A class=linktext target=_blank href="UserView.do?act=ask&uid=${user[0].uid }">${user[0].username }</A> </TD>
    		<TD class=daren_jifen>${user[1].balance + user[1].presentBalance}</TD>
    	</TR>
  		</c:forEach>  		
    </TBODY>
</TABLE>


