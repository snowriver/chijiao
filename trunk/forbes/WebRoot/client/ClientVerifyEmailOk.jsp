<%@ page language="java" pageEncoding="gbk"%>

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
	<link type="text/css" rel="stylesheet" href="css/My_Register_VerifyEmail.css"></link>
</HEAD>

<BODY>
<DIV id=container>
	<%@ include file="include/Regheader.jsp"%>
	
	
	<DIV id=content>
		<DIV class=my_register_vermain>
			<DIV class=my_register_verleft><IMG src="images/jhok.boxleft_10x170.gif"></DIV>
			<DIV class=my_register_verok><IMG src="images/icon.right_76x76.gif"> </DIV>
			<DIV class=my_register_verword>激活成功啦！ </DIV>
			<DIV class=my_register_verline><DIV>
		</DIV>
	</DIV>
	<DIV class=my_register_vermid>
		<DIV class=my_register_verwel>${sessionScope.CLIENT.loginName },欢迎您加入 赤脚网！</DIV>
		<DIV class=my_register_verzhao>祝你能在学到更多！</DIV>
		<DIV class=my_register_verbtn>
			<DIV class=my_register_verbtnimg><A href="http://www.anjuke.com/v2/sale/"><IMG src="images/btn.control_125x35.gif"> </A></DIV>
			<DIV class=my_register_verbtnword><A href="http://my.anjuke.com/myanjuke/anjuke_modify_profile2.php">完善我的个人资料 &gt;&gt;</A></DIV>
		</DIV>
	</DIV>
	<DIV class=my_register_verright><IMG src="images/jhok.boxright_10x170.gif"></DIV>
</DIV>
</DIV>


	<DIV style="CLEAR: both"></DIV>


	<%@ include file="../include/foot.jsp"%>
</DIV>

</BODY>
</HTML>
