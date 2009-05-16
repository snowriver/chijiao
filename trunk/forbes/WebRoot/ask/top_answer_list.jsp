<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:forEach items="${ASK_ANSWER_LIST}" var="aa"> 

<TABLE cellPadding=8 width="100%" border=0>
	<TBODY>
  		<TR>
  			<TD class=linktext bgColor=#e4eef3 height=40 width="10"></TD>
    		<TD class=linktext bgColor=#e4eef3 height=40>
    			<SPAN class=font11t>回答者：<A class=font11t href="UserView.do?act=ask&uid=${aa.userId }" target=_blank><STRONG>
    			<SPAN id=answerusernumDiv>${aa.loginName }</SPAN></STRONG></A> &nbsp;&nbsp;${aa.pubdate } </SPAN>
    		</TD>
    		<TD class=linktext bgColor=#e4eef3 height=40 width="40" valign="middle">
    			<img src="${UC_CENTER_URL }/avatar.php?uid=${aa.userId }&size=small&type=virtual" border="0" height="30" width="30">
    		</TD>
    	</TR>
  		<TR>
  			<TD class=linktext bgColor=#fafeff width="10"></TD>
    		<TD class=text01 bgColor=#fafeff colspan=2>
      			<TABLE class=fontv11 cellSpacing=1 cellPadding=0 width="98%" border=0>
        			<TBODY>
        				<TR><TD class=wordwrap id=answerliving960Td height=22>
        					${aa.content } <BR><BR>
        					<c:if test="${not empty aa.referTo }">参考资料：${aa.referTo }</c:if>
        					</TD>
        				</TR>
        				<TR><TD class=wordwrap height=22></TD></TR>
        				<TR>
        					<TD height=24>
        						<c:if test="${not empty aa.modifyDate}"><FONT color=#aaaaaa><B>${aa.username }</B> 最后编辑于 ${aa.modifyDate}</FONT></c:if>
        					</TD>
        				</TR>
        			</TBODY>
        		</TABLE>
        		
            	<DIV class=linktext align=right>
            		<!-- 
            		<SPAN id=svote46>
	            		<A onclick=AddVote(46,1,233); href="javascript:">同意</A> | 
	            		<A onclick=AddVote(46,2,233); href="javascript:">不同意</A>  | 
            		</SPAN>
      				<SPAN id=mvote46><A onclick=AddVote(46,1,233); href="javascript:">投你一票</A> | </SPAN>
     			 	-->
     			 	
      				<c:if test="${not empty sessionScope.CLIENT && sessionScope.CLIENT.uid == aa.userId}">
      					<SPAN id=manswer46><A onclick="openDIV('修正','ManageAnswer.do?act=getAnswer&id=${aa.id }','650','450');" href="javascript:void(0);">修正</A> | </SPAN>
      					
      				</c:if>
      				
      				<c:if test="${not empty sessionScope.CLIENT && sessionScope.CLIENT.uid == aa.ask.userId}">
      					<SPAN id=accept46><A href="ManageAnswer.do?act=bestanswer&id=${aa.ask.id }&bid=${aa.id }">设为最佳答案</A> | </SPAN>
      				</c:if>
      				
      				<span id="rightjb"><a href="javascript:void(0);" onclick="openDIV('登录','UserReport.do?act=getanswer&id=${aa.id }','700','500');">举报</a></span><span id="answerjb46">&nbsp;&nbsp;&nbsp; </span><BR><BR>
      			</DIV>
      		</TD>
      	</TR>
   	</TBODY>
</TABLE>
</c:forEach>

<c:if test="${empty ASK_ANSWER_LIST}">

<TABLE cellPadding=8 width="100%" border=0>
	<TBODY>
  		<TR>
  			<TD class=linktext bgColor=#e4eef3 height=80 width="10"></TD>
    		<TD class=linktext bgColor=#e4eef3 height=80>
    			<SPAN class=font11t>此提问尚无答案<STRONG>
    		
    		</TD>
    	</TR>
  
   	</TBODY>
</TABLE>

	
</c:if>