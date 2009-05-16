<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
	<TITLE>赤脚网注册</TITLE>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	<LINK rel=stylesheet type=text/css href="css/My_Register_Register.css" rev=stylesheet></LINK>
	<LINK rel=icon type=image/ico href="http://pages.anjukestatic.com/favicon.ico"></LINK>
	<LINK rel="shortcut icon" href="http://pages.anjukestatic.com/favicon.ico"></LINK>
	<link type="text/css" rel="stylesheet" href="../css/validator.css"></link>
	<LINK rel=stylesheet type=text/css href="css/main.css">
	
	<script type="text/javascript" src="../dwr/engine.js"></script>
	<script type="text/javascript" src="../dwr/util.js"></script>
	<script type="text/javascript" src="../dwr/interface/ClientRegisterManager.js"></script>
	<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
	<script type="text/javascript" src="../js/jqtool.js"></script>
	

	
	<script type="text/javascript">
		function chkemail(s, msg){
			if($(s).val().length==0)
				return false;   
			var reg = /^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/i;
		  	if(reg.test($(s).val()))
		  		return true;   
		  	else {      
		  		//$(s).focus();   
		  		//$(s).select()   
		  		return false;   
			}   
		}

		function checkLoginName(){
			ClientRegisterManager.checkLoginName( ""+$("#loginName").val(),showCheckLoginNameRs);
		}
		
				
    	function showCheckLoginNameRs(rs){	
			if(rs.indexOf("OK")>=0){
				$("#checkloginname").html("<img src='../images/reg4.gif'><font color='#000000'>该用户名可以注册</font>");
			}
			else{
				$("#checkloginname").html("<img src='../images/reg3.gif'><font color=red>"+rs + "</font>");
				//$("#loginName").focus();
			}
		}
    
    			
		function checkEmail(){
			if( $("#email").val().length < 1  ||  !chkemail( $("#email") ) ){
				//	alert( $("#email").val().length);
				$("#checkemail").html("<img src='../images/reg3.gif'><font color=red>邮件格式不正确，请重新输入</font>");
				//$("#email").focus();
			}
			else {
				$("#checkemail").html("<img src='../images/reg4.gif'><font color='#000000'>该邮件可以使用</font>");
				//ClientRegisterManager.checkEmail( ""+$("#email").val(),showCheckEmailRs);
			}
		}
		
		function checkPassword(){
			if( $("#password").val().length < 6 || $("#password").val().length > 16 ){
				//	alert( $("#email").val().length);
				$("#checkpassword").html("<img src='../images/reg3.gif'><font color=red>6-16个字符，英文字母加数字或符号的组合密码</font>");
				//$("#checkpassword").focus();
			}
			else {
				$("#checkpassword").html("<img src='../images/reg4.gif'><font color='#000000'>正确</font>");
				//ClientRegisterManager.checkEmail( ""+$("#email").val(),showCheckEmailRs);
			}
		}
		
		function checkConfirmPassword(){
			if( $("#confirmPassword").val().length < 6 || $("#confirmPassword").val().length > 16 ){
				//	alert( $("#email").val().length);
				$("#checkconfirmpassword").html("<img src='../images/reg3.gif'><font color=red>6-16个字符，英文字母加数字或符号的组合密码</font>");
				//$("#confirmPassword").focus();
			}
			else {
				if( $("#confirmPassword").val().length == $("#password").val().length ){
					$("#checkconfirmpassword").html("<img src='../images/reg4.gif'><font color='#000000'>正确</font>");
				}
				else {
					$("#checkconfirmpassword").html("<img src='../images/reg3.gif'><font color=red>你输入的两次密码不相同，请重新输入</font>");
				}				
				//ClientRegisterManager.checkEmail( ""+$("#email").val(),showCheckEmailRs);
			}
		}
		
	    function showCheckEmailRs(rs){
			if( rs == false) {
				$("#checkemail").html("<img src='../images/reg4.gif'><font color='#000000'>该邮件可以使用</font>");
				//$("#email").focus();
			}
			if( rs == true) {
				$("#checkemail").html("<img src='../images/reg3.gif'><font color=red>该邮件已经被其他用户使用</font>");
				//$("#email").focus();
			}
			
		}
		
		
		function checkValidateCode(){
			$.ajax({
				url: '../include/GetCode.jsp',
				type: 'post',
				dataType: 'html',
				data:"act=select",
				timeout: 10000,
				error: function(){
					alert('System error');
				},
				success: showCode
			});
		}
		
		function showCode(rsHtml){
			var code = (rsHtml).replace(/(^\s*)|(\s*$)/g, "");
			if( $("#validateCode").val() == code) {
				$("#checkvalidatecode").html("<img src='../images/reg4.gif'><font color='#000000'>验证码正确</font>");
				//$("#email").focus();
			}
			else {
				$("#checkvalidatecode").html("<img src='../images/reg3.gif'><font color=red>您输入的验证码不正确，请重新输入</font>");
				//$("#email").focus();
			}
			//$("#checkvalidatecode").html(rsHtml);
		}
	


    	function checkVal(){
		    if( !notNull( $("#loginName"),"会员名不能为空") ){
				return false;
			}
			
			if( !notNull( $("#name"),"昵称不能为空") ){
				return false;
			}

			if(!notNull($("#password"),"密码不能为空")){
				return false;
			}
			if($("#password").val().length < 6 || $("#password").val().length > 16 ){
			    alert("密码长度必须是6到16位");
				return false;
			}
			if($("#password").val() != $("#confirmPassword").val() ){
		    	alert("两次输入的密码不一致");
				return false;
			}
		
			if( !notNull( $("#email"),"邮件不能为空") ){
				return false;
			}
			
			if( $("#email").val().length > 1 ){
				if(!isemail($("#email"),"邮件地址不正確")){
					return false;
				}
			}
			
			if( !notNull( $("#validateCode"),"验证码不能为空") ){
				return false;
			}

			
			/*
			
			if( $("#validateCode").val().length == 4 ){
					$.ajax({
						url: '../include/GetCode.jsp',
						type: 'post',
						dataType: 'html',
						data:"act=select",
						timeout: 10000,
						error: function(){
							alert('System error');
						},
						success: function(rsHtml){
					     	var code = (rsHtml).replace(/(^\s*)|(\s*$)/g, "");
							if( $("#validateCode").val() != code) {
								alert("您输入的验证码不正确，请重新输入");
								return false;
							}
					   }

					});
			}
			*/
			
			regForm_apf_id_6.submit();
		}
	
		

	
	</script>

</HEAD>

<BODY>


<DIV id=container>
	
	<%@ include file="include/Header.jsp"%>
	
	<DIV id=content>
		<FORM id=regForm_apf_id_6 onSubmit="return checkVal();" method=post name=regForm_apf_id_6 action="ClientRegister.do">
		<br />
		<TABLE border=0 cellSpacing=0 cellPadding=2 width=800>
  			<TBODY>
  				<TR>
    				<TD class=my_register_td1><IMG src="images/icon.broker_34x31.gif"> </TD>
    				<TD class=my_register_td2>
    					请填写以下信息
    					<SPAN style="COLOR: #999; FONT-SIZE: 12px">(</SPAN>
    					<SPAN class=my_register_red>*</SPAN> 
    					<SPAN style="COLOR: #999; FONT-SIZE: 12px">为必填)</SPAN> &nbsp;&nbsp;
    					<font color=red>${FAIL_MESSAGE }</font>
    				</TD>
    			</TR>
    			<!-- 
    			<TR>
    				<TD class=my_register_td1></TD>
    				<TD class=my_register_td2>
    					
    				</TD>
    			</TR>
    			 -->
  				<TR>  					
    				<TD class=my_register_td1>用户名<SPAN class=my_register_red>*</SPAN>：</TD>
    				<TD class=my_register_td2>
      					<DIV class=my_register_input>
      					<INPUT id=loginName maxLength=15 size=25 type=text name=loginName onblur="checkLoginName()" value="${CLIENT.loginName }"> </DIV>
      					<DIV id=checkloginname>
      						<c:if test="${empty ERROR_LOGIN_NAME}">
      								<img src="../images/reg1.gif">5-18个字符(包括英文字母、数字、下划线) 
      							</c:if>
      							<c:if test="${not empty ERROR_LOGIN_NAME}">
      								<img src="../images/reg4.gif"> <font color=red>${ERROR_LOGIN_NAME }</font>
      							</c:if>
      					</DIV>
      				</TD>
      			</TR>      			
      			
				<TR>
				    	<TD class=my_register_td1>密码<SPAN class=my_register_red>*</SPAN>：</TD>
				    	<TD class=my_register_td2>
				      		<DIV class=my_register_input><INPUT id=password maxLength=16 size=25 type=password name=password onblur="checkPassword()" /> </DIV>
				      		<DIV id=checkpassword><img src="../images/reg1.gif">6-16个字符，英文字母加数字或符号的组合密码</DIV>
				      	</TD>
					</TR>
  					<TR>
    					<TD class=my_register_td1>确认密码<SPAN class=my_register_red>*</SPAN>：</TD>
    					<TD class=my_register_td2>
      						<DIV class=my_register_input>
      							<INPUT id="confirmPassword" maxLength=16 size=25 type=password name="confirmPassword" onblur="checkConfirmPassword()" />
      						</DIV>
      						<DIV id=checkconfirmpassword><img src="../images/reg1.gif">请再输入一遍您上面输入的密码 </DIV>
      					</TD>
      				</TR>
  					<TR>
    					<TD class=my_register_td1>邮箱<SPAN class=my_register_red>*</SPAN>：</TD>
    					<TD class=my_register_td2>
      						<DIV class=my_register_input>
      							<INPUT id=email maxLength=30 size=25 type=text name=email onblur="checkEmail()" value="${CLIENT.email }" /> 
      						</DIV>
      						<DIV id=checkemail><img src="../images/reg1.gif">请输入邮箱</DIV>
      					</TD>
      				</TR>
  					<TR>
    					<TD class=my_register_td1>校验码<SPAN class=my_register_red>*</SPAN>：</TD>
    					<TD class=my_register_td2>
      						<DIV class=my_register_input><INPUT id="validateCode" maxLength=4 size=25 type=text name="validateCode" onblur="checkValidateCode()"> </DIV>
      						<DIV id=checkvalidatecode>
      							<c:if test="${empty ERROR_VALIDATE_CODE}">
      								<img src="../images/reg1.gif">请输入验证码
      							</c:if>
      							<c:if test="${not empty ERROR_VALIDATE_CODE}">
      								<img src="../images/reg4.gif"> <font color=red>${ERROR_VALIDATE_CODE }</font>
      							</c:if>
      						</DIV>
      						
      					</TD>
      				</TR>
  					<TR>
  						<TD class=my_register_td1></TD>
    					<TD class=my_register_td2>
      						<DIV><IMG title=如果看不清数字，请点图片刷新验证码 onclick="javascript:this.src='../include/validateCode.jsp?cn=cyreg&amp;x=120&amp;y=40&amp;s=30&amp;x1=2&amp;y1=46&amp;x2=12&amp;y2=38&amp;id=' + Math.round(Math.random()*1000);" 
      								align=absMiddle src="../include/validateCode.jsp" width="80" height="30">
      						</DIV>
      					</TD>
      				</TR>
  					<TR>
    					<TD class=my_register_td1></TD>
    					<TD class=my_register_td2>
      						<DIV class=my_register_input2>
      							<INPUT id=acceptanjuke value=1 CHECKED type=checkbox name=acceptanjuke>我已阅读并接受《
      							<A target=_blank href="user-agreement.html">用户服务协议</A>》 
      						</DIV>
      						<DIV id=checkallow></DIV>
      					</TD>
      				</TR>
				  	<TR>
				 		<TD height=20 colSpan=2></TD>
				 	</TR>
				  	<TR>
    					<TD class=my_register_td1></TD>
    					<TD class=my_register_td2>
    						<INPUT id=my_register_submit class=my_register_submit type=submit name=submit value=""> 
    					</TD>
    				</TR>
    			</TBODY>
    		</TABLE>
    	</FORM>
    	
  
	<DIV style="CLEAR: both"></DIV>


	<%@ include file="include/Footer.jsp"%>
</DIV>

</BODY>
</HTML>
