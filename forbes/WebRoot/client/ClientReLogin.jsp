<%@page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE>用户登录 - 赤脚网</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/My_Login.css" rev=stylesheet></LINK>
<LINK rel=stylesheet type=text/css href="css/main.css">
<script type="text/javascript" src="../js/common.js" ></script>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<DIV id=container>

	

	<DIV id=content>

	<DIV class=my_login_main>
		<DIV class=my_login_left>
			<DIV class=my_login_leftmain>
				<DIV>
					<IMG src="images/icon.login_24x39.gif">
					<IMG class=my_login_leftregname src="images/caption.login_171x39.gif"> 
				</DIV>
				<DIV>
					<FORM id=loginForm_apf_id_6 method=post name=loginForm_apf_id_6 action="ClientLogin.do?act=relogin">
						<BR>
						<SPAN style="WIDTH: 70%; COLOR: red; MARGIN-LEFT: 52px">${FAIL_MESSAGE }</SPAN><BR><BR>
						<SPAN class=my_login_leftword>用户名：</SPAN>
						<INPUT id=loginName class="my_login_logininput2" onfocus="javascript:if(this.value=='用户名或者email')this.value='';this.className='my_login_logininput';" value="${LOGIN_NAME }" type=text name=loginName><BR><BR>
						<SPAN class=my_login_leftword>密　码：</SPAN>
						<INPUT style="BORDER-BOTTOM: #666 1px solid; BORDER-LEFT: #666 1px solid; WIDTH: 175px; HEIGHT: 18px; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid" type=password name=password>&nbsp;&nbsp;
						<A href="../GotoUCenter.do?act=lostpasswd" target="_blank">忘记密码？</A><BR><BR>
						<SPAN class=my_login_leftremember>
							<INPUT value=1 CHECKED type=checkbox name=remember>下次自动登录
						</SPAN> <BR><BR>
						
						<INPUT value="${RETURN_URL }" type=hidden name=history>
						<SPAN class=my_login_leftremember>
							<INPUT class=my_login_leftsbubmit type=submit name=submit value="">
						</SPAN> 
					</FORM>
				</DIV>
			</DIV>
		</DIV>
		
		
	</DIV>
</DIV>


<DIV style="CLEAR: both"></DIV></DIV>
<DIV style="CLEAR: both"></DIV>



</BODY></HTML>
