<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 全力打造创业者学习和交流平台</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=utf=8">
	<META content="" name=description>
	<META content="" name=keywords>
	<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
</HEAD>
<BODY style="BACKGROUND-COLOR: #f2f6f8; TEXT-ALIGN: left">
<BR><BR>
<TABLE cellSpacing=0 cellPadding=0 width=550 align=center bgColor=#ffffff border=0>
	<TBODY>
  	<TR>
    	<TD colSpan=3>
      		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        		<TBODY>
        		<TR>
          			<TD class=sub_nav_tit_left></TD>
          			<TD class=sub_nav_tit_main><DIV class=sub_nav_ico>添加内容</DIV></TD>
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
		                      				<TD align=left width="72%" height=150>
		                      					<FORM name=form3 onSubmit="return CheckForm(this);" action="ManageAnswer.do?act=modifyAsk" method=post>
		                        				<TABLE style="FONT-SIZE: 12px" cellSpacing=0 cellPadding=2 width="100%" border=0>
						                          	<TBODY>
						                          	<TR>
						                            	<TD width=59>提问:</TD>
						                            	<TD width=306 height=31>${ASK.title}</TD>
						                            </TR>
						                    		
						                          	<TR>
		                            					<TD>添加内容:</TD>
		                            					<TD height=20></TD>
		                            				</TR>
						                          	<TR align=middle>
						                            	<TD colSpan=2 height=117>
						                            		<TEXTAREA id=extra style="WIDTH: 100%" name=extra rows=6 cols=40>${ASK.extra }</TEXTAREA>
						                            	</TD>
						                           	</TR>
						                          	<TR align=middle>
						                            	<TD colSpan=2>
						                            		<INPUT class=small_btn type=submit value="提 交" name=Submit10 />
															<INPUT class=small_btn onclick="window.parent.closeDivn();" type=button value="关 闭" name=Submit11> 
						                              		<INPUT type=hidden id="id" name="id" value=${ASK.id } > 						                              		
						                   
						                             	</TD>
						                  			</TR>
						                      	</TBODY>
						                	</TABLE>
						                	</FORM>
						                </TD>
						          	</TR>
		                    		<TR>
		                      			<TD align=middle height=20>&nbsp;</TD>
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
