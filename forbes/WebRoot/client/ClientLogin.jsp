<%@page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<TITLE>用户登录 - 赤脚网</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/My_Login.css" rev=stylesheet></LINK>
<LINK rel=stylesheet type=text/css href="css/main.css">

<script language="JavaScript">
	<!--
	function check() 
	{
		var loginName=document.all.loginName;
		var password=document.all.password;
		
		if(loginName.value=="")
		 {
			 alert("用户名不能为空！");
			 loginForm.loginName.value="";
			 loginForm.loginName.focus();
			 return false;
		}
		if(password.value=="") 
		{
			 alert("密码不能为空！");
			 loginForm.password.value="";
			 loginForm.password.focus();
			 return false;
		}
	}
	//-->
	</script>
	
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
					<FORM id=loginForm method=post name=loginForm action="ClientLogin.do?act=login" onsubmit="return check();">
						<BR>
						<SPAN style="WIDTH: 70%; COLOR: red; MARGIN-LEFT: 52px" id="fail_message">${FAIL_MESSAGE }</SPAN><BR><BR>
						<SPAN class=my_login_leftword>用户名：</SPAN>
						<INPUT id=loginName class=my_login_logininput2 type=text name=loginName value="${LOGIN_NAME }"><BR><BR>
						<SPAN class=my_login_leftword>密　码：</SPAN>
						<INPUT style="BORDER-BOTTOM: #666 1px solid; BORDER-LEFT: #666 1px solid; WIDTH: 175px; HEIGHT: 18px; BORDER-TOP: #666 1px solid; BORDER-RIGHT: #666 1px solid" type=password name=password>&nbsp;&nbsp;
						<A target="_blank" href="../GotoUCenter.do?act=lostpasswd">忘记密码？</A><BR><BR>
						<SPAN class=my_login_leftremember>
							<INPUT value=1 CHECKED type=checkbox name=remember>下次自动登录
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
			<DIV class=my_login_rightword><IMG src="images/icon.login01_29x31.gif"><SPAN>快速高效学习</SPAN> </DIV>
			<DIV class=my_login_rightword><IMG src="images/icon.login02_30x30.gif"><SPAN>制定自己成功计划</SPAN> </DIV>
			<DIV class=my_login_rightword><IMG src="images/icon.login03_30x30.gif"><SPAN>和创业者一起交流</SPAN> </DIV>
			<DIV class=my_login_rightbt><A href="../GotoUCenter.do?act=register"><IMG src="images/btn.reg_153x33.gif"></A> </DIV>
		</DIV>
	</DIV>
</DIV>


<DIV style="CLEAR: both"></DIV></DIV>
<DIV style="CLEAR: both"></DIV>
</DIV>

<%@ include file="include/Footer.jsp"%>

</BODY></HTML>
