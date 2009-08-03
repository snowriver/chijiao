<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>移动列表</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />

</head>
<body>

<form name="form1" method="post" action="AdminUpdateArticleType.do?act=move&id=${ARTICLE_TYPE.id }&returnUrl=${RETURN_URL }">
   
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
	<tr>
   		<td width="100%" height="24" colspan="2" bgcolor="#EDF9D5">
   		&nbsp;<a href="AdminUpdateArticleType.do?act=list"><u>栏目管理</u></a>&gt;&gt;移动列表
		</td>
	</tr>
	<tr>
   		<td height="200" colspan="2" valign="top" bgcolor="#FFFFFF"> 
      
	   		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
       			<tr><td colspan="2" height="12"></td></tr>
       			<tr><td height="25" colspan="2" bgcolor="#F2F8FB">&nbsp;</td></tr>
          		<tr> 
            		<td width="30%" height="25">你选择的栏目是：</td>
            		<td width="70%"> ${ARTICLE_TYPE.name }(${ARTICLE_TYPE.id })</td>
          		</tr>
          		<tr> 
            		<td height="30">你希望移动到那个栏目？</td>
            		<td>
            			<select name="pid">
              				<option value='0'>移动为顶级栏目</option>
              				<c:forEach items="${ARTICLE_TYPE_LIST}" var="atl" varStatus="is">
      							<option value="${atl.id }">|- ${atl.name }</option>
      		  				</c:forEach>
       					</select>
            		</td>
          		</tr>
          		<tr> 
            		<td height="25" colspan="2" bgcolor="#F2F8FB">&nbsp;不允许从父级移动到子级目录，只允许子级到更高级或同级或不同父级的情况。</td>
          		</tr>
          		<tr> 
            		<td height="74">&nbsp;</td>
            		<td>
            			<input type="submit" name="Submit" value="确定操作" class="inputbut" /> 　 
            			<input name="Submit11" type="button" id="Submit11" value="-不理返回-" onclick="history.go(-1);" class="inputbut" />
            		</td>
          		</tr>
        	</table>
	 
		</td>
	</tr>
</table>

</form>
</body>
</html>