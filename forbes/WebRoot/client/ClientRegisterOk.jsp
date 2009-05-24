<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
	<TITLE>赤脚网注册</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	<LINK rel=stylesheet type=text/css href="css/My_Register_Register.css" rev=stylesheet></LINK>
	<LINK rel=icon type=image/ico href="http://pages.anjukestatic.com/favicon.ico"></LINK>
	<LINK rel="shortcut icon" href="http://pages.anjukestatic.com/favicon.ico"></LINK>
	<link type="text/css" rel="stylesheet" href="../css/validator.css"></link>
	<link type="text/css" rel="stylesheet" href="css/My_Register_Activate.css"></link>
	


</HEAD>

<BODY>
<c:if test="${RESEND == 'Y'}">
	<SCRIPT type="text/javascript">
		alert("发送激活邮件成功！");
	</SCRIPT>
</c:if>
<DIV id=container>
	<%@ include file="include/Regheader.jsp"%>
	

	<DIV id=content>
		<DIV class=my_register_actmain>
			<DIV class=my_register_acttitle>
				<DIV class=my_register_actthank><SPAN>感谢您注册赤脚网！现在请按以下步骤激活您的帐号</SPAN></DIV>
				<DIV><IMG src="images/jh.step2_250x27.gif"></DIV>
			</DIV>
			<DIV class=my_register_actbody>
				<DIV><IMG src="images/jh.boxleft_85x287.gif"></DIV>
				<DIV class=my_register_actmid>
					<DIV class=my_register_actone>第一步：查看您的电子邮箱</DIV>
					<DIV class=my_register_actoneagin2>我们给您发送了提示邮件，地址为：<SPAN>${CLIENT.email }</SPAN> </DIV>
					<DIV class=my_register_actoneword>请登录您的邮箱收信，<A target=_blank href="http://www.${fn:substringAfter(CLIENT.email, '@')}">http://www.${fn:substringAfter(CLIENT.email, "@")}</A></DIV>
					<DIV class=my_register_actoneagin>
						<SPAN>如果没有收到激活邮件，</SPAN><A href="ClientVerifyEmail.do?act=resend&id=${CLIENT.uid }">请点击这里</A> 
						<SPAN>重新发送验证信。</SPAN>
					</DIV>
					<DIV class=my_register_actone>第二步：点击信中确认按钮</DIV>
					<DIV class=my_register_actoneword>击激活邮件中的链接，即可激活您的帐号！ </DIV>
					<DIV class=my_register_actoneword>请在24小时内激活您的帐号。</DIV>
				</DIV>
				<DIV><IMG src="images/jh.boxright_16x287.gif"></DIV>
			</DIV>
			<DIV class=my_register_actbot><A href="http://my.anjuke.com/v2/reg/modifyemail">更改邮件地址重新收取激活信</A></DIV>
		</DIV>
	</DIV>

	<DIV style="CLEAR: both"></DIV>


	<%@ include file="include/Footer.jsp"%>
</DIV>

</BODY>
</HTML>
