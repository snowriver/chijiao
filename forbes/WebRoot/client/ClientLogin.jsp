<%@page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE>�û���¼ - �����</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/My_Login.css" rev=stylesheet></LINK>
<LINK rel=stylesheet type=text/css href="css/main.css">
<script type="text/javascript" src="../js/common.js" ></script>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<DIV id=container>

	<%@ include file="include/Header.jsp"%>

	<DIV id=content>

	<DIV class=my_login_main>
		<DIV class=my_login_left>
			<DIV class=my_login_leftmain>
				<DIV>
					<IMG src="images/icon.login_24x39.gif">
					<IMG class=my_login_leftregname src="images/caption.login_171x39.gif"> 
				</DIV>
				<DIV>
					<FORM id=loginForm_apf_id_6 method=post name=loginForm_apf_id_6 action="ClientLogin.do?act=login">
						<BR>
						<SPAN style="WIDTH: 70%; COLOR: red; MARGIN-LEFT: 52px">${FAIL_MESSAGE }</SPAN><BR><BR>
						<SPAN class=my_login_leftword>�û�����</SPAN>
						<INPUT id=loginName class=my_login_logininput2 onfocus="javascript:if(this.value=='�û���')this.value='';this.className='my_login_logininput';" value='�û���' type=text name=loginName><BR><BR>
						<SPAN class=my_login_leftword>�ܡ��룺</SPAN>
						<INPUT style="BORDER-BOTTOM: #666 1px solid; BORDER-LEFT: #666 1px solid; WIDTH: 175px; HEIGHT: 18px; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid" type=password name=password>&nbsp;&nbsp;
						<A href="#">�������룿</A><BR><BR>
						<SPAN class=my_login_leftremember>
							<INPUT value=1 CHECKED type=checkbox name=remember>�´��Զ���¼
						</SPAN> <BR><BR>
						<INPUT value=1 type=hidden name=loginpost> 
						<INPUT type=hidden name=formhash> 
						<INPUT value="${RETURN_URL }" type=hidden name=history>
						<INPUT id=systemtime value=1225983847 type=hidden name=systemtime> 
						<SPAN class=my_login_leftremember>
							<INPUT class=my_login_leftsbubmit type=submit name=submit value="">
						</SPAN> 
					</FORM>
				</DIV>
			</DIV>
		</DIV>
		
		<DIV class=my_login_right>
			<DIV class=my_login_rightmain>&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="images/caption.reg_170x50.gif"> <BR><BR>
			<DIV class=my_login_rightword><IMG src="images/icon.login01_29x31.gif"><SPAN>���ٸ�Чѧϰ</SPAN> </DIV>
			<DIV class=my_login_rightword><IMG src="images/icon.login02_30x30.gif"><SPAN>ʡ��ʡ����ɧ��</SPAN> </DIV>
			<DIV class=my_login_rightword><IMG src="images/icon.login03_30x30.gif"><SPAN>�ʹ�ҵ��һ����</SPAN> </DIV>
			<DIV class=my_login_rightbt><A href="#"><IMG src="images/btn.reg_153x33.gif"></A> </DIV>
		</DIV>
	</DIV>
</DIV>


<DIV style="CLEAR: both"></DIV></DIV>
<DIV style="CLEAR: both"></DIV>
</DIV>

<%@ include file="include/Footer.jsp"%>

</BODY></HTML>
