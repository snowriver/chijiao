<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<UL class=send_comment_tit>
						<c:if test="${not empty sessionScope.CLIENT}">
					<FORM id="pubForm" method="post" name="pubForm" action="NewsContentAdd.do">
					<SCRIPT language=JavaScript>function reply_clearfield(){if(document.formComment.name.value == "������û�") document.formComment.name.value = "";}</SCRIPT>
  					<TABLE class="commentSend" border="0" cellSpacing="1" cellPadding="1">
    					<TBODY>
						 	<TR>
						    	<TD>&nbsp;</TD>
						      	<TD>ʣ���ַ���
					    			<INPUT id=remLen style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; COLOR: red; BORDER-RIGHT-WIDTH: 0px" 
					    				readOnly maxLength=4 size=4 value=1000 name=remLen /></TD>
						  	</TR>
						  	<!-- 
						    <TR>
						      	<TD align=right>�ǳ�:</TD>
						      	<TD height=22><INPUT id=name onfocus=reply_clearfield() value="����" type=text name=name></TD></TR>
						      -->
						    <TR>
								<TD align=right>����:</TD>
						      	<TD height=22><TEXTAREA rows=8 cols=70 id="content" name="content" onMouseUp="textCounter(pubForm.content.value, 1000 )" 
    								onKeyUp="textCounter(pubForm.content.value, 1000)"></TEXTAREA></TD>
						 	</TR>
						    <TR>
								<TD>&nbsp;</TD>
								<TD height=22 align=right><br />
									
									<INPUT type="hidden" id="id" name="id" value="${NEWS.id }" >
									<!--
									<INPUT type="submit" name=Submit value="�� ��" >
									-->
									<c:if test="${ empty sessionScope.CLIENT }">
										<DIV id="login">
										�û�����<INPUT type="text" id="loginName" name="loginName" value="" >
										���룺<INPUT type="text" id="password" name="password" value="" >
										&nbsp;&nbsp;&nbsp;<a href="#">ע�����û�?</a>
										</DIV>								
									</c:if>
								
									<INPUT type="hidden" id="remeber" name="remeber" value="Y" >
									<input type="button" value=" �ύ " class="button" id="submit" onclick="sendJS();"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					</FORM>
					</c:if>
					
					
					 <c:if test="${empty sessionScope.CLIENT}">
 						&nbsp;&nbsp;&nbsp;&nbsp;����
					 	<DIV style="TEXT-ALIGN: center; LINE-HEIGHT: 50px; HEIGHT: 50px" id=show_login>
						<a href="javascript:void(0);" id="loginx" onclick="openDIV('��¼','../client/ClientReLogin.jsp','500','350');" style="CURSOR: pointer"><FONT style="TEXT-DECORATION: underline" 
						color=#ff6600>���ȵ�¼��������</FONT></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<A style="CURSOR: pointer" target="_blank" href="../client/ClientRegister.jsp"><FONT style="TEXT-DECORATION: underline" 
						color=#ff6600>��Ҫע��</FONT></A>
						</DIV>			
					
					 </c:if>
				</UL>