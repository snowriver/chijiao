<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<c:forEach items="${USER_LIST}" var="user"> 
	<UL class=left>
  		<LI><A target=_blank href="${UC_HOME_URL }/space.php?uid=${user.uid }"><IMG src="${UC_CENTER_URL }/avatar.php?uid=${user.uid }&size=mid&type=virtual"></A> 
  		<LI><A target=_blank href="${UC_HOME_URL }/space.php?uid=${user.uid }">${user.username }</A> </LI>
	</UL>
</c:forEach>
