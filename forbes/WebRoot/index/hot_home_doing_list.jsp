<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:forEach items="${UC_HOME_DOING_LIST}" var="doing" varStatus="is">						
	<li>·<a href="http://localhost/uc/home/space.php?uid=${doing.uid }" target="_blank">[${doing.username }] ${doing.message }</a></li>					
</c:forEach>
<a href="http://localhost/uc/home/network.php?ac=doing" target="_blank"><font color="red">点击查看更多</font></a>