<%@ page language="java" pageEncoding="gbk"%>
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
		<td style="color:#FF6600; line-height:31px;"><strong>���������ϵͳ</strong></td>
	</tr>
</table>

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">������Ϣ</div>
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
	<div class="bodytitletxt">��ݹ���</div>
</div>

<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="60" align="center">
			<table width="96%" border="0" cellspacing="10" cellpadding="0" style="margin-top:10px;">
				<tr class="main_qbut">
					<td width="16%" align="center"><div style="background-position:center 10px;"><a href="AdminUpdateArticleType.do?act=list">��Ŀ����</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -130px;"><a href="catalog_menu.php" target="menu">�����ĵ�</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -270px;"><a href="content_list.php?arcrank=-1">������ĵ�</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -414px;"><a href="feedback_main.php">���۹���</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -554px;"><a href="makehtml_list.php">����HTML</a></div></td>
					<td width="16%" align="center"><div style="background-position:center -694px;"><a href="sys_info.php">����ϵͳ����</a></div></td>
					<td width="4%" align="center">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">ϵͳ������Ϣ</div>
</div>

<table width="96%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#E2F5BC" style="margin-top:6px;">
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">��ļ���</td>
			<td bgcolor="#FFFFFF" class="main_bright">
				<strong>����Ա</strong>
       		</td>
		</tr>
	<tr>
		<td width="22%" rowspan="5" align="right" bgcolor="#F9FFE6" class="main_bleft">JSP����ժҪ��</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>����������</strong> <%=request.getServerName() %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>������IP</strong> <%=request.getRemoteAddr() %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>�������˿�</strong> <%=request.getRemotePort() %></td>
	</tr>
	<tr>
		<td width="78%" bgcolor="#FFFFFF" class="main_bright"><strong>վ������·��</strong> <%=request.getRealPath("/") %> </td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>����������</strong> <%=request.getCharacterEncoding() %> </td>
	</tr>
		
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">ϵͳժҪ��</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>��������</strong></td>
	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">����汾��Ϣ��</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>�汾����</strong> <strong>�汾��</strong> </td>
  	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">�����Ŷӣ�</td>
		<td bgcolor="#FFFFFF" class="main_bright"><strong>������</strong></td>
  	</tr>
</table>

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">ʹ�ð���</div>
</div>

<table width="96%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#E2F5BC" style="margin-top:6px;">
	<tr>
		<td width="22%" align="right" bgcolor="#F9FFE6" class="main_bleft">QQ��</td>
		<td width="78%" bgcolor="#FFFFFF" class="main_bright">746167</td>
	</tr>
	<tr>
		<td align="right" bgcolor="#F9FFE6" class="main_bleft">���䣺</td>
		<td bgcolor="#FFFFFF" class="main_bright">xushaomin@qq.vip.com</td>
	</tr>
</table>

<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center" style="line-height:51px;">��վ��Ȩ��Ϣ<br /></td>
  	</tr>
</table>

</body>
</html>
