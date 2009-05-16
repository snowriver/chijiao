<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:set var="pic_num" value="4"></c:set>
<c:set var="width" value="98"></c:set>

<table border=0 cellpadding=0 cellspacing=0 width=230>
	<col width="40"><col width="80"><col width="45"><col width="85">
	<tbody>
		<c:forEach items="${UC_BBS_FORUM_LIST}" var="forum" varStatus="is">
		
			<c:choose>
       			<c:when test="${is.index == 0}"><c:set var="pic_num" value="2"></c:set></c:when>
				<c:when test="${is.index == 1}"><c:set var="pic_num" value="3"></c:set></c:when>
				<c:otherwise><c:set var="pic_num" value="4"></c:set></c:otherwise>
			</c:choose>

			<tr>
				<td><span class=numa${is.index + 1}></span></td>
				<td><a href="index/top_bbs_forums.jsp?fid=${forum.fid }" target="_blank">${forum.name }</a></td>
				<td>${forum.threads }</td>
				<td><img src="images/index/plan0${pic_num }.gif" height="5" width="${width - is.index * 7 }%"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
