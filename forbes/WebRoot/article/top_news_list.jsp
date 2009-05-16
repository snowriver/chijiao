<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<DIV class=headline>
	<c:forEach items="${NEWS_LIST}" var="news" begin="0" end="0" >
	<A target=_blank href="NewsSearch.do?act=view&id=${news.id }">${news.title}</A>
	<BR>${fn:substring(news.description, 0, 50)}...<BR>
	</c:forEach>
</DIV>
<DIV class=con>
	<TABLE class=cmsTable>
  		<TBODY>
  			<c:forEach items="${NEWS_LIST}" var="news" begin="1"> 
  			<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
				<TD><A target=_blank href="NewsSearch.do?act=view&id=${news.id }">${news.title}</A></TD>
				<TD>[<fmt:formatDate value='${news.pubdate}' pattern='MM-dd' />]</TD>
			</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
</DIV>