<%@ page contentType="text/html; charset=gbk" %>
<%@page import="com.forbes.hibernate.bean.UcMembers"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	UcMembers client = (UcMembers) request.getSession().getAttribute("CLIENT");
	
	if(client != null ) {
		com.forbes.ajax.SmsSearch ss = new com.forbes.ajax.SmsSearch();
		int smscnt = ss.getNewPmsCount(client.getUid().toString());
		request.setAttribute("NEW_SMS_COUNT", smscnt);
	}
    
	
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>��¼��</title>
	<link type="text/css" rel="stylesheet" href="../css/index_card_278_yellow_1.css" />
</head>

<body>
	<!--ͬ����¼����-->
	${SYN_LGIN}

	<c:if test="${ empty sessionScope.CLIENT }">
	
		<div class="passportc">
			<form method="post" action="../client/ClientLogin.do?act=index" name="loginform">
				<div class="pptitle"><b>�����ͨ��֤</b></div>
				<div class="ppcontent" id="ppcontid">
					<ul class="card">
						<div class="error" id="pperrmsg">${FAIL_MESSAGE }</div>
						<li>�û��� <input name="loginName" class="ppinput" autocomplete="off" disableautocomplete="" type="text"></li>
						<li>�ܡ��� <input name="password" class="ppinput" autocomplete="off" disableautocomplete="" type="password"></li><dt>
						<span><input name="remember" value="Y" type="checkbox" />��ס����</span>
						<input class="sign" value="�� ¼" src="../images/index/spacer.gif" alt="�� ¼" type="submit"></dt><dl>
						<a href="${UC_HOME_URL }/do.php?ac=3c7495bde72b124b806ed64fb89785db" target="_blank">ע�����û�</a><a href="${UC_HOME_URL }/do.php?ac=lostpasswd" target="_blank">��������</a><a href="#" target="_blank">��������</a></dl>
					</ul>
				</div>
			</form>
		</div>
	
	</c:if>
	
	<c:if test="${ not empty sessionScope.CLIENT }">
	
			<div class="passportc">
				
				
				<div class="pptitle2"><span>�����ͨ��֤<div class="ppthree"></div></span><a href="../client/ClientLogout.do?act=index">�˳���¼</a></div>
				<div class="ppcontent" id="ppcontid">
				
				<div class="listContA">
					<table width="100%" height="100%">
					  
					  <tr height="35%">
					    <td rowspan="2">&nbsp;</td>
					    <td rowspan="2" align="right" valign="bottom"><IMG width="50" height="50" src="${UC_CENTER_URL }/avatar.php?uid=${sessionScope.CLIENT.uid }&size=mid&type=virtual"></td>
					    <td rowspan="2">&nbsp;</td>
					    <td valign="bottom"><a href='${UC_HOME_URL }/space.php?do=pm' target='_parent'>����Ϣ(${NEW_SMS_COUNT })</a></td>
					    <td valign="bottom"><a href='${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }&do=friend&view=online&type=friend' target='_parent'>���ߺ���(0)</a></td>
					    <td rowspan="2">&nbsp;</td>
					  </tr>
					  <tr height="35%">
					    <td valign="middle"><a href='${UC_HOME_URL }/cp.php?ac=profile' target='_parent'>��������</a></td>
					    <td valign="middle"><a href='${UC_HOME_URL }/space.php?do=home' target='_parent'>�ռ����</a></td>
					  </tr>
					  <tr height="35%">
					    <td colspan="6">&nbsp;</td>
					  </tr>
					</table>
					
				</div>
				<div class="middle">
					<ul>     
	  					<li class="current">${ sessionScope.CLIENT.username }����ӭ��!  <a href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }">ת���ҵ���ҳ>></a></li>
						<li><img src="../images/spacer.gif" alt="ȥ"/></li>
					</ul>
				</div>
				<div class="bottom">
					<ul>
						
						
						<li><a href="../client/ClientMain.jsp" target="_blank">���۹���</a></li>
						<li>|</li>
						
						<li><a href="${UC_HOME_URL }/cp.php" target="_blank">Ȧ�ӹ���</a></li>
						<li>|</li>
						
						<li><a href="../client/ClientManageAsk.do?act=all&status=0_1" target="_blank">���ʹ���</a></li>
						
						
						
						<li class="dabenying"   style="display:none"><a href="'+durl+'" target="_blank"><img src="images/index/spacer.gif" alt="��Ӫ" /></a></li>
					</ul>
				</div>
			</div>

	</c:if>


</body>
</html>