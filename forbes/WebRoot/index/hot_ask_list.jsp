<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<ul>
	<c:forEach items="${ASK_LIST}" var="ask" begin="0"> 
		<li>
			<div style="float:left">
				[<a href="ask/AskSearch.do?act=search&status=0_1&keyword=&flag=newest&orderby=expiredTime%20desc" target="_blank">创业百问</a>]<a href="ask/AskView.do?id=${ask.id }" target="_blank">${fn:substring(ask.title, 0, 20)}</a>
			</div>
			<div style="float:right">
				<span><a href="ask/UserView.do?act=ask&uid=${ask.userId}" target="_blank">${fn:substring(ask.username, 0, 5)}</a></span>
			</div>
		</li>
	
	</c:forEach>
</ul>