<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>�ҵĹ����̨ - ���ʹ���</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>

<script language="javascript" type="text/javascript">
	<!--
		function pageselectCallback(page_id, jq){
		 
		  window.location="ClientManageArticle.do?act=list&isverify=${param.isverify}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:10,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
  
	  	function CheckAll(form)  {
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.name != 'chkall') e.checked = form.chkall.checked; 
	   		}
	  	}
	  	
	  	function Check(form) {
	  		var flag = false;
			for (var i=0;i<form.elements.length;i++) {
				var e = form.elements[i];
	    		if (e.checked == true)
	    			 flag = true;
	   		}
			if(flag == false) {
				alert("��ѡ����Ҫɾ�������ʣ�");
				return false;
			}
		}
		
		function deleteArticle(id, pid){
				$.ajax({
					beforeSend: function(){
				     $("#RESULTE_MSG").html("ɾ����...");
				   },
					url: 'ClientManageArticle.do',
					type: 'post',
					dataType: 'html',
					data:"act=delete&id=" + id,
					timeout: 10000,
					error: function(){
						//alert('System error');
						alert("ɾ��ʧ��");
					},
					success: function(rsHtml){
						//alert("ɾ���ɹ�!");
						pageselectCallback(pid, "jq");
						
					}
				});
			}
	//-->
</script>

<BODY>
<c:set var="p" value="client_manage_article"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>���¹���</H1>
	<DIV class=data_opt_title>
		<UL>
  			<LI><A <c:if test="${empty param.isverify || param.isverify == '0_1'}">class="curmenu"</c:if> <c:if test="${ param.isverify == '0' || param.isverify == '1'}">class="ocurmenu"</c:if> href="ClientManageArticle.do?act=list&isverify=0_1">ȫ������</A> </LI>
  			<LI><A <c:if test="${param.isverify == '1'}">class="curmenu"</c:if> <c:if test="${param.isverify != '1'}">class="ocurmenu"</c:if> href="ClientManageArticle.do?act=list&isverify=1">�������</A> </LI>
  			<LI><A <c:if test="${param.isverify == '0'}">class="curmenu"</c:if> <c:if test="${param.isverify != '0'}">class="ocurmenu"</c:if> href="ClientManageArticle.do?act=list&isverify=0">δ�������</A> </LI>
  		</UL>
  	</DIV><!--data_opt_title end-->
  	
  	<DIV style="PADDING-LEFT: 2%">
		
		<FORM name=askForm method="post" action="ClientManageAsk.do?act=del" onSubmit="return Check(this);">
		<TABLE class=datalist_opt border=0 cellSpacing=0 cellPadding=0 width="95%">
			<TBODY>
		  		<TR class=datelist_opt_title>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 10%"><INPUT onclick="CheckAll(this.form)" type=checkbox name=chkall></TD>
				    <TD style="WIDTH: 10%">����</TD>
				    <TD style="WIDTH: 50%">����</TD>			
				    <TD style="WIDTH: 20%">����ʱ��</TD>
		    		<TD style="TEXT-ALIGN: center; WIDTH: 10%">����</TD>
		    	</TR>
		    	
		    	
		    	<c:if test="${empty ARTICLE_LIST}">
		    		<TR>
		    			<TD colspan="5" align="center">����û�������ղأ�</TD>
		    		</TR>
		    	</c:if>
		    	
		    		<c:forEach items="${ARTICLE_LIST}" var="art" varStatus="is">
		    		<TR>
			    		<TD align=middle><INPUT id=articleid value=${art.id } type=checkbox name=articleid></TD>
			    		<TD style="WIDTH:50px"> ${art.articleType.name }</TD>
			    		<TD><P class=datalist_opt_video_title><A target=_blank href="../article/ArticleView.do?id=${art.id }"> ${art.title }</A></P></TD>
			    		
			    		<TD><fmt:formatDate value='${art.pubdate}' pattern='yyyy-MM-dd' /></TD>
			    		<TD align="center">
			    			<A href="ClientPublishArticle.do?act=get&id=${art.id }">�޸�</A> | 
			    			<A href="javascript:void(0);" onclick="deleteArticle(${art.id },${PAGER.curPage-1});">ɾ��</A>
			      		</TD>
			      	</TR>
		      		</c:forEach>
		    	
		  		
		      	
			</TBODY>
		</TABLE>
		
		<BR>
		<DIV class="pagescroll">
			<DIV id="Pagination" class="pagination"></DIV>
		</DIV>
		<!-- 
		<DIV class="pagescroll">
			<DIV class="pagination"><input name="del" type="submit" value="ɾ��" /></DIV>
		</DIV>
		 -->
		</FORM>
	</DIV>
</DIV>
      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
