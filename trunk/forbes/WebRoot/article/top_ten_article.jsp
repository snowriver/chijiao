<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!-- 

<TABLE class=cmsTable width="356" height="147">
	<TBODY>	    	
    	<c:forEach items="${ARTICLE_LIST}" var="article"> 
  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
    		<TD><fmt:formatDate value='${article.pubdate}' pattern='MM-dd' /></TD>
    	</TR>
    	</c:forEach>
	</TBODY>
</TABLE>

-->

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
		<c:forEach items="${ARTICLE_LIST}" var="article" begin="0" varStatus="is"> 
  		<TR>
    		<TD width="10%" align=middle><IMG src="images/top_${is.index +1 }.gif"></TD>
    		<TD class=daren_name><A class=linktext target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 25)}</A></TD>
    	</TR>
  		</c:forEach>
	</TBODY>
</TABLE>