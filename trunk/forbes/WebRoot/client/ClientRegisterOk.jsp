<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
	<TITLE>�����ע��</TITLE>
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
		alert("���ͼ����ʼ��ɹ���");
	</SCRIPT>
</c:if>
<DIV id=container>
	<%@ include file="include/Regheader.jsp"%>
	

	<DIV id=content>
		<DIV class=my_register_actmain>
			<DIV class=my_register_acttitle>
				<DIV class=my_register_actthank><SPAN>��л��ע�������������밴���²��輤�������ʺ�</SPAN></DIV>
				<DIV><IMG src="images/jh.step2_250x27.gif"></DIV>
			</DIV>
			<DIV class=my_register_actbody>
				<DIV><IMG src="images/jh.boxleft_85x287.gif"></DIV>
				<DIV class=my_register_actmid>
					<DIV class=my_register_actone>��һ�����鿴���ĵ�������</DIV>
					<DIV class=my_register_actoneagin2>���Ǹ�����������ʾ�ʼ�����ַΪ��<SPAN>${CLIENT.email }</SPAN> </DIV>
					<DIV class=my_register_actoneword>���¼�����������ţ�<A target=_blank href="http://www.${fn:substringAfter(CLIENT.email, '@')}">http://www.${fn:substringAfter(CLIENT.email, "@")}</A></DIV>
					<DIV class=my_register_actoneagin>
						<SPAN>���û���յ������ʼ���</SPAN><A href="ClientVerifyEmail.do?act=resend&id=${CLIENT.uid }">��������</A> 
						<SPAN>���·�����֤�š�</SPAN>
					</DIV>
					<DIV class=my_register_actone>�ڶ������������ȷ�ϰ�ť</DIV>
					<DIV class=my_register_actoneword>�������ʼ��е����ӣ����ɼ��������ʺţ� </DIV>
					<DIV class=my_register_actoneword>����24Сʱ�ڼ��������ʺš�</DIV>
				</DIV>
				<DIV><IMG src="images/jh.boxright_16x287.gif"></DIV>
			</DIV>
			<DIV class=my_register_actbot><A href="http://my.anjuke.com/v2/reg/modifyemail">�����ʼ���ַ������ȡ������</A></DIV>
		</DIV>
	</DIV>

	<DIV style="CLEAR: both"></DIV>


	<%@ include file="include/Footer.jsp"%>
</DIV>

</BODY>
</HTML>
