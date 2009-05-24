<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>



<c:if test="${not empty sessionScope.CLIENT}">

<FORM id=pubForm name=pubForm method=post>
<TABLE class=post_tb cellSpacing=3 cellPadding=0 border=0>
	<TBODY>
  		<TR>
    		<!-- <TD>请选择你要使用的表情</TD> -->
    		<TD>
    			剩余字符：
    			<INPUT id=remLen style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; COLOR: red; BORDER-RIGHT-WIDTH: 0px" 
    				readOnly maxLength=4 size=4 value=1000 name=remLen />
			</TD>
 		</TR>
  		<TR>
  			<!-- 
		    <TD>
		   		<DIV class=icon_ctn>
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=1]')" src="images/content/1.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=2]')" src="images/content/2.gif">
		     	<IMG style="CURSOR: hand" onClick="setFace('[f=3]')" src="images/content/3.gif">
		   		<IMG style="CURSOR: hand" onClick="setFace('[f=4]')" src="images/content/4.gif">
		     	<IMG style="CURSOR: hand" onClick="setFace('[f=5]')" src="images/content/5.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=6]')" src="images/content/6.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=7]')" src="images/content/7.gif">
		    	<IMG style="CURSOR: hand" onClick="setFace('[f=8]')" src="images/content/8.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=9]')" src="images/content/9.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=10]')" src="images/content/10.gif">
		    	<IMG style="CURSOR: hand" onClick="setFace('[f=11]')" src="images/content/11.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=12]')" src="images/content/12.gif">
		     	<IMG style="CURSOR: hand" onClick="setFace('[f=13]')" src="images/content/13.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=14]')" src="images/content/14.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=15]')" src="images/content/15.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=16]')" src="images/content/16.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=17]')" src="images/content/17.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=18]')" src="images/content/18.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=19]')" src="images/content/19.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=20]')" src="images/content/20.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=21]')" src="images/content/21.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=22]')" src="images/content/22.gif">
				<IMG style="CURSOR: hand" onClick="setFace('[f=23]')" src="images/content/23.gif">
		      	<IMG style="CURSOR: hand" onClick="setFace('[f=24]')" src="images/content/24.gif"> 
		      	</DIV>
		  	</TD>
		 	-->
    		<TD>
    			<TEXTAREA onMouseUp="textCounter(pubForm.content.value, 1000 )" 
    				class=textareas id=content onKeyUp="textCounter(pubForm.content.value, 1000)" 
    				name=content rows=10 cols=46></TEXTAREA>
    		</TD>
    	</TR>
  		<TR>
    		<TD align=left colSpan=2>
      			<INPUT class=btn_submit type=button value=提交观点 onclick="sendJS();"/>&nbsp;
      			<INPUT class=btn_reset type=reset value=重置观点 />
			</TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>

</c:if>
					
					
<c:if test="${empty sessionScope.CLIENT}">
	<DIV style="TEXT-ALIGN: center; LINE-HEIGHT: 50px; HEIGHT: 50px" id=show_login>
		<a href="javascript:void(0);" id="loginx" onclick="openDIV('登录','../client/ClientReLogin.jsp','500','350');" style="CURSOR: pointer">
			<FONT style="TEXT-DECORATION: underline" color=#ff6600>请先登录后再评论</FONT>
		</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<A style="CURSOR: pointer" target="_blank" href="../GotoUCenter.do?act=register">
			<FONT style="TEXT-DECORATION: underline" color=#ff6600>我要注册</FONT>
		</A>
	</DIV>			
</c:if>