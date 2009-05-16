<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>DedeCms Home</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td style="color:#FF6600; line-height:31px;"><strong>赤脚网管理系统</strong></td>
	</tr>
</table>

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">最新消息</div>
</div>

<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>		
		<td height="80" class="main_dnews">
			<form name="uploadspider" action="upload_spider.jsp" method="post">
			</form>
		</td>
	</tr>
</table>

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">快捷功能</div>
</div>

<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="60" align="center">
			<table width="96%" border="0" cellspacing="10" cellpadding="0" style="margin-top:10px;">
				<tr class="main_qbut">
					<td width="16%" align="center"><div style="background-position:center 10px;"><a href="AdminUpdateArticleType.do?act=list">栏目管理</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -130px;"><a href="catalog_menu.php" target="menu">发布文档</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -270px;"><a href="content_list.php?arcrank=-1">待审核文档</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -414px;"><a href="feedback_main.php">评论管理</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -554px;"><a href="makehtml_list.php">更新HTML</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -694px;"><a href="sys_info.php">更改系统参数</a></div></td>
					<td width="4%" align="center">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">系统基本信息</div>
</div>

<table width="96%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#E2F5BC" style="margin-top:6px;">
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">你的级别：</td>
			<td bgcolor="#FFFFFF" class="main_bright">
				<strong>管理员</strong>
       		</td>
		</tr>
	<tr>
		<td width="22%" rowspan="5" align="right" bgcolor="#F9FFE6" class="main_bleft">JSP环境摘要：</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>服务器名称</strong> <%=request.getServerName() %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>服务器IP</strong> <%=request.getRemoteAddr() %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>服务器端口</strong> <%=request.getRemotePort() %></td>
	</tr>
	<tr>
		<td width="78%" bgcolor="#FFFFFF" class="main_bright"><strong>站点物理路径</strong> <%=request.getRealPath("/") %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>服务器编码</strong> <%=request.getCharacterEncoding() %> </td>
	</tr>
		
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">系统摘要：</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>文章总数</strong></td>
	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">软件版本信息：</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>版本名称</strong> <strong>版本号</strong> </td>
  	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">开发团队：</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>徐少敏</strong></td>
  	</tr>
</table>

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">使用帮助</div>
</div>

<table width="96%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#E2F5BC" style="margin-top:6px;">
	<tr>
		<td width="22%" align="right" bgcolor="#F9FFE6" class="main_bleft">QQ：</td>
		<td width="78%" bgcolor="#FFFFFF" class="main_bright">746167</td>
	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">邮箱：</td>
		<td bgcolor="#FFFFFF" class="main_bright">xushaomin@qq.vip.com</td>
	</tr>
</table>

<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center" style="line-height:51px;">网站版权信息<br /></td>
  	</tr>
</table>

</body>
</html>
