<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<DIV class=loginbox id="loginbox">

	<c:if test="${ empty sessionScope.CLIENT }">

		<FORM id="x" method=post name=loginForm action="client/ClientLogin.do?act=index">

			<TABLE border=0 cellSpacing=3 cellPadding=0 width="100%">
				<TBODY>
					<TR>
    					<TD>&nbsp;</TD>
    					<TD style="TEXT-ALIGN: left; PADDING-LEFT: 8px" colSpan=2></TD>
					</TR>
  					<TR>
    					<TD style="TEXT-ALIGN: right; WIDTH: 20%;">�û���</TD>
    					<TD style="WIDTH: 50%">
    						<INPUT id=loginName class=my_login_logininput2 onfocus="javascript:if(this.value=='�û�������email')this.value='';this.className='my_login_logininput';" tabIndex=1 value=�û�������Email type=text name=loginName>
						</TD>
    					<TD style="WIDTH: 30%" rowSpan=2>
    						<INPUT class=my_login_leftsbubmit tabIndex=3 type=submit name=submit value="">
    					</TD>
    				</TR>
					<TR>
    					<TD style="TEXT-ALIGN: right">�ܡ���</TD>
    					<TD>
    						<INPUT style="WIDTH: 100px" id=password tabIndex=2 type=password name=password>
    					</TD>
  					</TR>
  					<TR>
    					<TD>&nbsp;</TD>
    					<TD style="TEXT-ALIGN: left; PADDING-LEFT: 8px" colSpan=2>
	    					<INPUT tabIndex=4 value="Y" CHECKED type=checkbox name=remember>�´��Զ���¼ <br /><br />
							<A style="PADDING-LEFT: 20px" href="http://my.anjuke.com/v2/register">���û�ע��</A> 
							&nbsp;&nbsp;<A style="PADDING-LEFT: 20px" href="http://my.anjuke.com/v2/register">�һ�����</A> 
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</c:if>

	<c:if test="${ not empty sessionScope.CLIENT }">

		<table cellspacing="0" cellpadding="0">
  			<TR>
    			<TD height="20" colSpan="2" align="middle">
    				<IMG src="http://localhost/templets/img/menumember.gif" alt="c" width="16" height="15">��ã� �������� ����ӭ��¼
    			</TD>
  			</TR>
  			<TR>
    			<TD rowSpan="3" align="middle">
    				<IMG border="0" name="ok" alt="�������ǵĸ��˿ռ�" src="${sessionScope.CLIENT.image }" width="75" height="56"> 
    			</TD>
    			<TD height="25" width="40%" align="middle"><A href="#">[�ҵ�����]</A>	</TD>
  			</TR>
  			<TR>
    			<TD height="25" align="middle"><A href="#">[�ҵ��ղ�]</A></TD>
  			</TR>
  			<TR>
    			<TD height="25" align="middle"><A href="#">[��������]</A></TD>
  			</TR>
  			<TR align="middle">
    			<TD height="22" colSpan="2">
    				<TABLE border="0" cellSpacing="1" cellPadding="1" width="96%" bgColor="#dedede" height="20">
      					<TBODY>
        					<TR>
          						<TD bgColor="#fafafa" align="middle">
          							<A href="http://localhost/member/index.php">������ҳ</A> | 
          							<A href="http://localhost/member/control.php">����</A> | 
          							<A href="http://localhost/member/index.php?uid=admin">�ռ�</A> | 
          							<A href="http://localhost/member/index_do.php?fmdo=login&dopost=exit">ע��</A> 
          						</TD>
        					</TR>
      					</TBODY>
    				</TABLE>
    			</TD>
  			</TR>
		</table>

	</c:if>
	
</DIV>
