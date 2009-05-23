<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
		<c:forEach items="${UC_HOME_BLOG_LIST}" var="blog" begin="0" varStatus="is"> 
  		<TR>
    		<TD width="10%" align=middle><IMG src="images/top_${is.index + 1 }.gif"></TD>
    		<TD class=daren_name><A class=linktext target=_blank href="${UC_HOME_URL }/space.php?uid=${blog.uid}&do=blog&id=${blog.blogid}">${fn:substring(blog.subject, 0, 25)}</A></TD>
    	</TR>
  		</c:forEach>
	</TBODY>
</TABLE>