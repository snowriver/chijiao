<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<ul>
	<c:forEach items="${VIDEO_LIST}" var="video" begin="0"> 
	<li><a href="video/VideoShow.do?id=${video.id }" target="_blank"><img src="#" alt="" border="0" height="90" width="120"></a><span>
	<a href="video/VideoShow.do?id=${video.id }" target="_blank" id="clubindex_17190"><font color="red">xxxxxxxxxx</font></a></span></li>
	
	</c:forEach>
</ul>