<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>



<TABLE class=cmsTable width="356" height="147">
	<TBODY>	    	
    	<c:forEach items="${ARTICLE_LIST}" var="article"> 
  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
    		<TD><A target=_blank href="ArticleView.do?id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
    		<TD><fmt:formatDate value='${article.pubdate}' pattern='MM-dd' /></TD>
    	</TR>
    	</c:forEach>
	</TBODY>
</TABLE>