<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	
    com.forbes.ajax.VideoTypeSelector vs = new com.forbes.ajax.VideoTypeSelector();
    request.setAttribute("VIDEO_TYPE_LIST", vs.getTopVideoType());
	
%>

<table width="164" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFE">
	<c:forEach items="${VIDEO_TYPE_LIST}" var="at" varStatus="is">
	<tr>
		<td id="M_0" valign="top" style="background:url(images/bg_1.jpg) no-repeat left top;">
			<div align="center">
				<table width="90%" border="0" cellspacing="0" cellpadding="0">
			    	<tr>
			        	<td height="12" colspan="2"></td>
			        </tr>
			        <tr class="hand" onClick="showlist(${is.index})">
			       		<td width="16%" height="32"><div align="left"><img id="I_0" src="images/ico_4.jpg" width="11" height="10" /></div></td>
			          	<td width="84%" class="f14"><div align="left"><a class="c_black">${at.name }</a></div></td>
			        </tr>		        
			        <tr>
			    		<td colspan="2">
			    			<div id="L_${is.index}" align="center" style="display:block">
				         		<table width="90%" border="0" cellspacing="0" cellpadding="0">
					              	<c:forEach items="${at.videoTypes}" var="a">
					                <tr>
					               		<td width="16%"><img src="images/jt.gif"/></td>
					                  	<td width="84%" height="22" align="left">
			                            	<a href="VideoSearch.do?act=search&typeid=${a.id }" class="c_black">${a.name }</a>
			                            </td>
					                </tr>
					                </c:forEach>
					    		</table>
			       			</div>
			    		</td>
			       	</tr>
				</table>
			</div>
		</td>
	</tr>
	</c:forEach>
</table>