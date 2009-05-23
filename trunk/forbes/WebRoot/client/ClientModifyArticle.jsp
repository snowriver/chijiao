<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<%
    com.forbes.ajax.ArticleTypeSelector ss = new com.forbes.ajax.ArticleTypeSelector();
    
	java.util.List topTypes = ss.getTopArticleType();
	
	request.setAttribute("TOP_ARTICLE_TYPE_LIST", topTypes);
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0056)http://localhost/sv/vspacecp.php -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>�ҵĹ����̨</TITLE>
<META content="text/html; charset=GBK" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<script type="text/javascript" src="../fckeditor/fckeditor.js"></script>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>

<script language="javascript" type="text/javascript">
	function onSelectTopArticleType(obj){
		$.post(
			"../ajax/ArticleTypeSelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateSelectTopArticleType
		);
	}
	
	function updateSelectTopArticleType(response){
		var arr = new Array();
		arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
		var op = new Array();
		$("#typeid").empty();
        $("<option value='0'>��ѡ������</option>").appendTo("#typeid");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#typeid");
		}
		
	}
</script>

<BODY>
<c:set var="p" value="client_publish_article"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>��������</H1>
	  	
  	<DIV style="PADDING-LEFT: 2%">
		<FORM method=post action="ClientPublishArticle.do?act=add">
			
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  				<TBODY>
  				
  					<TR height="10">
    					<TD align=right>&nbsp;</TD>
    					<TD>&nbsp;&nbsp;<font color=red>�뷢���йش�ҵ��־��������£�������������������˺󽫻ᱻ�ŵ���ҳ�ʹ�ҵ��ѧ��Ŀ�ϣ�</font></TD>
    				</TR>
    				
    				<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
  					<TR>
    					<TD style="TEXT-ALIGN: right; WIDTH: 10%">���±���:</TD>
    					<TD style="TEXT-ALIGN: left;  WIDTH: 90%">&nbsp;&nbsp;
    						<INPUT name="title" value="${ARTICLE.title }" size="50" />
    					</TD>
    				</TR>
    				
    				<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
  					<TR style="HEIGHT: 27px">
    					<TD align=right>������Դ:</TD>
    					<TD>&nbsp;&nbsp;
    						<INPUT name="source" value="${ARTICLE.source }" size="50" />
    					</TD>    					
    				</TR>
  
  					<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
  					<TR>
    					<TD align=right>����:</TD>
    					<TD>&nbsp;&nbsp;
    						<INPUT name="writer" value="${ARTICLE.writer }" size="50" />
						</TD>    					
    				</TR>
  					
  					<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
  					<TR>
					    <TD align=right>��������:</TD>
					    <TD>&nbsp;&nbsp;
							<select id="maintypeid" name="maintypeid" style="width:170px">
	            				<option value="0">��ѡ��������</option>
	            				<c:forEach items="${TOP_ARTICLE_TYPE_LIST}" var="at" varStatus="is">
	            					<c:if test="${ARTICLE.articleType.id == at.id }">
	            						<option value="${at.id }" selected>${at.name }</option>
	            					</c:if>
	            					<c:if test="${ARTICLE.articleType.id != at.id }">
	            						<option value="${at.id }" selected>${at.name }</option>
	            					</c:if>
	            				</c:forEach>	
	            			</select>&nbsp;&nbsp;
                     		<select id="typeid" name="typeid" style="width:170px">
	            				<option value="0">��ѡ������</option>            				
	            			 </select>
						</TD>
						
					</TR>
					
					<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>����ժҪ:</TD>
					    <TD>&nbsp;&nbsp; 
							<TEXTAREA style="WIDTH: 360px; HEIGHT: 100px" name=description>${ARTICLE.description }</TEXTAREA>
 
 
						</TD>
						
					</TR>
					
					<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>��������:</TD>
					    <TD>
					    	<FCK:editor instanceName="content" height="500" toolbarSet="Basic">
								<jsp:attribute name="value">${ARTICLE.content }</jsp:attribute>
							</FCK:editor>
					    </TD>
					   
					</TR>
					
					<TR height="10">
    					<TD colspan="2"></TD>    					
    				</TR>
    				
					

					<TR>
					    <TD></TD>
					    <TD class=padding_top8>
					    	<BUTTON class=add_del name=submit_btn type=submit value="true">�ύ</BUTTON>
					    	<BUTTON class=add_del name=reset_btn type=reset value="true">����</BUTTON>
					   	</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</DIV>
</DIV>
      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<script src="../video/js/zt_foot.js"></script>
<!--footer end-->
</BODY></HTML>
