<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=utf=8">
	<META content="" name=description>
	<META content="" name=keywords>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
</HEAD>
<BODY style="BACKGROUND-COLOR: #f2f6f8; TEXT-ALIGN: left">
<BR><BR><BR><BR>
<TABLE cellSpacing=0 cellPadding=0 width=550 align=center bgColor=#ffffff border=0>
	<TBODY>
  	<TR>
    	<TD colSpan=3>
      		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        		<TBODY>
        		<TR>
          			<TD class=sub_nav_tit_left></TD>
          			<TD class=sub_nav_tit_main><DIV class=sub_nav_ico>�ٱ�</DIV></TD>
          			<TD class=sub_nav_tit_right></TD>
          		</TR>
          		</TBODY>
          	</TABLE>
     	</TD>
    </TR>
	<TR>
    	<TD style="BORDER-LEFT: #d3ebef 1px solid">&nbsp;</TD>
    	<TD>
      		<TABLE cellSpacing=5 cellPadding=0 width="100%" align=center border=0>
        		<TBODY>
        		<TR>
		     		<TD vAlign=top>
		            	<TABLE id=gamelist1 cellSpacing=0 cellPadding=0 width="100%">
		              		<TBODY>
		              		<TR>
		                		<TD>
		                  			<TABLE style="FONT-SIZE: 12px" cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
		                    			<TBODY>
		                    			<TR>
		                      				<TD align=middle width="28%" height=131 rowSpan=2><IMG src="images/message.gif" align=absMiddle></TD>
		                      				<TD align=left width="72%" height=150>
		                      					<FORM name=form3 onSubmit="return CheckForm(this);" action="UserReport.do?act=report" method=post>
		                        				<TABLE style="FONT-SIZE: 12px" cellSpacing=0 cellPadding=2 width="100%" border=0>
						                          	<TBODY>
						                          	<TR>
						                            	<TD width=59>�û���Ϣ:</TD>
						                            	<TD width=306 height=31>${USER_NAME}(ID:${USER_ID })</TD>
						                            </TR>
						                    		<TR>
						                            	<TD>�ٱ�����:</TD>
						                            	<TD height=34>
						                            		<SELECT id=errorType name=errorType> 
								                                <OPTION value=1 selected>ˢ����</OPTION>
								                                <OPTION value=2>�������</OPTION> 
								                                <OPTION value=3>ɫ������</OPTION> 
								                                <OPTION value=4>Σ�����Ұ�ȫ������</OPTION> 
								                                <OPTION value=5>����̰�����</OPTION> 
								                                <OPTION value=6>��ˮ����</OPTION> 
								                                <OPTION value=7>��Ϯ��</OPTION> 
								                                <OPTION value=8>��������</OPTION>
								                 			</SELECT> 
								             			</TD>
								           			</TR>
						                          	<TR>
		                            					<TD>�ٱ�����:</TD>
		                            					<TD height=20></TD>
		                            				</TR>
						                          	<TR align=middle>
						                            	<TD colSpan=2 height=117>
						                            		<TEXTAREA id=content style="WIDTH: 100%" name=content rows=6 cols=40></TEXTAREA>
						                            	</TD>
						                           	</TR>
						                          	<TR align=middle>
						                            	<TD colSpan=2>
						                            		<INPUT class=small_btn type=submit value="�� ��" name=Submit10 />
															<INPUT class=small_btn onclick="window.parent.closeDivn();" type=button value="�� ��" name=Submit11> 
						                              		<INPUT type=hidden id=reportType name="reportType" value=${REPORT_TYPE } > 
						                              		<INPUT type=hidden id=userId name=userId value=${USER_ID }> 
						                              		<INPUT type=hidden id=objectId name=objectId value=${OBJECT_ID }  > 
						                   
						                             	</TD>
						                  			</TR>
						                      	</TBODY>
						                	</TABLE>
						                	</FORM>
						                </TD>
						          	</TR>
		                    		<TR>
		                      			<TD align=middle height=20><A href="#">������ҳ </A></TD>
		                      		</TR>
		                      	</TBODY>
		                 	</TABLE>
		                 </TD>
		         	</TR>
		        </TBODY>
		 	</TABLE>
		</TD>
	</TR>
	</TBODY>
</TABLE></TD>
		    <TD style="BORDER-RIGHT: #d3ebef 1px solid">&nbsp;</TD></TR>
		  <TR>
		    <TD height=10><IMG height=10 src="images/border_08.gif" width=10></TD>
		    <TD width="100%" background=images/borderb_02.gif></TD>
		    <TD><IMG height=10 src="images/border_09.gif" width=10></TD></TR></TBODY></TABLE></BODY></HTML>
