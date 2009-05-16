<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<div class="pp">
	<c:forEach items="${USER_LIST}" var="user">
	<LI>
		<a href="${UC_HOME_URL }/space.php?uid=${user.uid }" target="_blank">
			<img src="${UC_CENTER_URL }/avatar.php?uid=${user.uid }&size=small&type=virtual" border="0" height="48" width="48">
		</a>
		<span><a href="${UC_HOME_URL }/space.php?uid=${user.uid }" target="_blank">${user.username }</a></span>						  	
	</LI>
	</c:forEach>
</div>