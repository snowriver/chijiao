<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:forEach items="${ARTICLE_COMMENT_LIST}" var="acl"> 
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td width="5" height="5"><img height="5" src="images/content/comment_bg1.gif" width="5" /></td>
      <td height="5" colspan="2" background="images/content/comment_bg3.gif"></td>
      <td align="right" width="5" height="5"><img height="5" src="images/content/comment_bg2.gif" width="5" /></td>
    </tr>
    <tr>
      <td width="5" background="images/content/comment_bg4.gif"><img height="1" src="images/content/comment_bg4.gif" width="5" /></td>
      <td colspan="2" class="comment">+ ${acl.content }</td>
      <td width="5" background="images/content/comment_bg5.gif"><img height="1" src="images/content/comment_bg5.gif" width="5" /></td>
    </tr>
    <tr>
      <td valign="top" width="5"><img height="6" src="images/content/comment_bg9_con.gif" width="5" /></td>
      <td width="300" background="images/content/comment_bg8.gif" class="red">
      	<a href="${UC_HOME_URL }/space.php?uid=${acl.user.uid }" target="_blank">${acl.username }</a>
      	<img height="20" src="images/content/comment_bg7.gif" width="24" />
      </td>
      <td align="right" valign="bottom" background="images/content/comment_bg8.gif" class="grey">${acl.pubdate } </td>
      <td valign="top" width="5"><img height="6" src="images/content/comment_bg9.gif" width="5" /></td>
    </tr>
  </tbody>
</table>
<br>
</c:forEach>