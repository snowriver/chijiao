<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		
	</SCRIPT>


	<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
							<c:forEach items="${ASK_LIST}" var="ask"> 
						  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
						    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${ask.id}">${fn:substring(ask.title, 0, 30)}</A></TD>
						    		<TD><fmt:formatDate value='${article.expiredTime}' pattern='MM-dd' /></TD>
						    	</TR>
					    	</c:forEach>
							<tr>
								<c:if test="${empty ASK_LIST}">
									<td>
							   			����ص��ѽ������
									</td>
								</c:if>
							</tr>
	 				
						</table>
						
						<c:if test="${not empty ASK_LIST}">
							�� ${PAGER.totoalPage} ҳ&nbsp;&nbsp;${PAGER.totoalCnt} ����¼&nbsp;&nbsp;
						<A href="AskQuestion.do?act=first&pno=1&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AskQuestion.do?act=first&pno=${PAGER.prePage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
                  
        				<A href="AskQuestion.do?act=first&pno=${PAGER.nextPage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AskQuestion.do?act=first&pno=${PAGER.totoalPage}&${PARA['parameter'] }">ĩҳ</A>&nbsp;&nbsp;
						</c:if>
					
</BODY></HTML>
