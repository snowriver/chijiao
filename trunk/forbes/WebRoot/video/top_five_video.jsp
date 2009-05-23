<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


	<c:forEach items="${VIDEO_LIST}" var="video" begin="0"> 
		<LI>
			<DIV class=img><A title=${video.title} target=_play href="VideoShow.do?id=${video.id}"><IMG src="../${video.litpic}" width=180 height=90></A></DIV>
  			<DIV><A class=c_color1 title=${video.title} target=_play href="VideoShow.do?id=${video.id}">${video.title}</A></DIV>
  			<DIV class="c_color5 l18"><SPAN class=b>¼ò½é£º</SPAN>${fn:substring(video.description, 0, 27)}..</DIV>
  	</c:forEach>
  
	</LI>

 
		

  		
