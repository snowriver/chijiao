<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%

  	if(request.getSession().getAttribute("ADMIN") != null ) {
		try{
			request.getRequestDispatcher("index_main.jsp").forward(request,response);
		} catch(Exception e){
			e.printStackTrace();
		}	
  	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������̨����ϵͳ</title>
<style type="text/css">
<!--
*{
	padding:0px;
	margin:0px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
}
body {
	margin: 0px;
	background:#F7F7F7;
	font-size:12px;
}
input{
	vertical-align:middle;
}
img{
	border:none;
	vertical-align:middle;
}
a{
	color:#333333;
}
a:hover{
	color:#FF3300;
	text-decoration:none;
}
.main{
	width:640px;
	margin:40px auto 0px;
	border:4px solid #EEE;
	background:#FFF;
	padding-bottom:10px;
}

.main .title{
	width:600px;
	height:50px;
	margin:0px auto;
	background:url(images/login_toptitle.jpg) -10px 0px no-repeat;
	text-indent:326px;
	line-height:46px;
	font-size:14px;
	letter-spacing:2px;
	color:#F60;
	font-weight:bold;
}

.main .login{
	width:560px;
	margin:20px auto 0px;
	overflow:hidden;
}
.main .login .inputbox{
	width:260px;
	float:left;
	background:url(images/login_input_hr.gif) right center no-repeat;
}
.main .login .inputbox dl{
	width:230px;
	height:41px;
	clear:both;
}
.main .login .inputbox dl dt{
	float:left;
	width:60px;
	height:31px;
	line-height:31px;
	text-align:right;
	font-weight:bold;
}
.main .login .inputbox dl dd{
	width:160px;
	float:right;
	padding-top:1px;
}
.main .login .inputbox dl dd input{
	font-size:12px;
	font-weight:bold;
	border:1px solid #888;
	padding:4px;
	background:url(images/login_input_bg.gif) left top no-repeat;
}


.main .login .butbox{
	float:left;
	width:200px;
	margin-left:26px;
}
.main .login .butbox dl{
	width:200px;
}
.main .login .butbox dl dt{
	width:160px;
	height:41px;
	padding-top:5px;
}
.main .login .butbox dl dt input{
	width:98px;
	height:33px;
	background:url(images/login_submit.gif) no-repeat;
	border:none;
	cursor:pointer;
}
.main .login .butbox dl dd{
	height:21px;
	line-height:21px;
}
.main .login .butbox dl dd a{
	margin:5px;
}



.main .msg{
	width:560px;
	margin:10px auto;
	clear:both;
	line-height:17px;
	padding:6px;
	border:1px solid #FC9;
	background:#FFFFCC;
	color:#666;
}

.copyright{
	width:640px;
	text-align:right;
	margin:10px auto;
	font-size:10px;
	color:#999999;
}
.copyright a{
	font-weight:bold;
	color:#F63;
	text-decoration:none;
}
.copyright a:hover{
	color:#000;
}
-->
</style>

<script type="text/javascript" language="javascript">
<!--
	window.onload = function (){
		loginName = document.getElementById("loginName");
		loginName.focus();
	}
-->
</script>


</head>
<body>
<c:set var="cfg_use_vdcode" value="Y" />

	<div class="main">	
		<div class="title">�����½</div>

		<div class="login">
		<form action="../admin/AdminLogin.do" method="post">
            <input type="hidden" name="validateFlag" value="${cfg_use_vdcode }" />
            
            <div class="msgbox">
	            <dl>
					<dt>
						<font color="red">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						${ERROR_INFO }
						<html:errors property="loginName.error" />
						&nbsp;&nbsp;<html:errors property="password.error" />
						&nbsp;&nbsp;<html:errors property="validateCode.error" />
						</font>
					</dt>
					<dd>&nbsp;</dd>
				</dl>
			</div>
			
            <div class="inputbox">
				<dl>
					<dt>�û�����</dt>
					<dd><input type="text" name="loginName" id="loginName" size="20" value="${LOGIN_NAME }" onfocus="this.style.borderColor='#F93'" onblur="this.style.borderColor='#888'" />
					</dd>
				</dl>
				
				<dl>
					<dt>���룺</dt>
					<dd><input type="password" name="password" size="20" value="${PASSWORD }" onfocus="this.style.borderColor='#F93'" onblur="this.style.borderColor='#888'" />
					</dd>
				</dl>
				
				<c:if test="${cfg_use_vdcode == 'Y'}">
					<dl>
						<dt>��֤�룺</dt>
						<dd>
							<input type="text" name="validateCode" size="4" onfocus="this.style.borderColor='#F90'" onblur="this.style.borderColor='#888'" />
							<img src="../include/validateCode.jsp" width="50" height="20" />
						</dd>
					</dl>
				</c:if>
            </div>
            <div class="butbox">
	            <dl>
					<dt><input name="submit" type="submit" value="" /></dt>
					<dd align="center"><a href="../index.jsp">������ҳ</a> </dd>
				</dl>
			</div>
		</form>
		</div>
		
		<c:if test="${cfg_use_vdcode == 'N'}">
			<div class="msg">
				Ϊ��ʹ�����и���̶ȵļ��ݣ���̨Ĭ�Ϲر�����֤�룬Ϊ����ĵ�¼����ȫ����ȷ�����ϵͳ֧��GD���ں�̨�����п�����
			</div>
		</c:if>
	</div>
	
	<div class="copyright">
		Powered by <a href="http://www.chijiao.org">����� </a> Copyright &copy;2004-2008 
	</div>

</body>
</html>
