<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	<META content="text/html;charset=GBK" http-equiv="Content-Type">
	<META name="Keywords" content="${WEB_KEYWORD }" />
	<META name="Description" content="${WEB_DESCRIPTION }" />
	<META name="GENERATOR" content="MSHTML 8.00.6001.18241">
	
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="css/article_view.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	
	
	<STYLE type="text/css" media=all>
		@import url( css/article_list.css );
	</STYLE>
	
	<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/feedback.js"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="ArticleSearch.do?act=search&keyword=${PARA['keyword']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:10,
				num_edge_entries: 1,
				num_display_entries: 10,
				callback: pageselectCallback
			});
			}
		);
		
		function copyUserHomeToClipBoard(msg) {
      		window.clipboardData.setData("Text",msg);  
         	alert("���Ƴɹ�����ճ�������QQ/MSN���Ƽ�����ĺ��ѣ�\r\n\r\n�������£�\r\n" + msg);  
        }
        
        function Digg(id) {
			$.ajax({
				url: 'ArticleDigg.do',
				type: 'post',
				dataType: 'html',
				data:"id="+id,
				timeout: 10000,
				error: function(){
					alert("����ʧ�ܣ����Ժ�����");
				},
				success: function(rsHtml){
					var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
					$("#diggs-strong-"+id).html(result);
					//$("#digg").empty();
					//$("#digg").append("<center>������</center>");
				}
			});
			
		}
	</SCRIPT>

</HEAD>

<BODY>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->

<!--header��ʼ-->
<%@ include file="include/header.jsp"%>
<!--header����-->

<!--���ṹ��ʼ-->
<DIV id=wrapper>
	<DIV id=container>
	
	<!--��Ѷ��ʼ-->
	<DIV id=news>
		<DIV class=newsmapbg>
			<DIV class=news_map>
				<A href="ArticleSearch.do?act=list&orderby=pubdate%20desc">����</A> &gt;
				����
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<BR>
			<DIV align="right">
				<UL id=sorts>
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'pubdate desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=search&keyword=${PARA['keyword'] }&orderby=pubdate%20desc"> �������� </A>
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'click desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=search&keyword=${PARA['keyword'] }&orderby=click%20desc"> ����� </A> 
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'commentCnt desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=search&keyword=${PARA['keyword'] }&orderby=commentCnt%20desc"> ������� </A> 
					<!-- <FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'pubdate desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=search&keyword=${PARA['keyword'] }&orderby=pubdate%20desc">	����ղ� </A> -->
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'digg desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=search&keyword=${PARA['keyword'] }&orderby=digg%20desc"> ��ඥ</A> 
					<FONT style="COLOR: #ccc">|</FONT>  
				</UL>
  			</DIV>
			<DIV class="boxoff"></DIV>
			
			<c:forEach items="${ARTICLE_LIST}" var="article"> 
				<DIV style="Z-INDEX: 955" id=enclosure8 class=news-summary>
					<A class="thumb offsite ct-lifestyle" target="_blank" href="${UC_HOME_URL }/space.php?uid=${article.userid}"><IMG alt="" src="${UC_CENTER_URL }/avatar.php?uid=&size=small&type=virtual" width=48 height=48></A>
					<DIV class=news-body>
				        <H3><A class="offsite ct-lifestyle" target="_blank" href="ArticleView.do?id=${article.id}">${fn:substring(article.title, 0, 30)}</A> </H3>
				       
				        	<P>${fn:substring(article.description, 0, 145)}...</P>
				       
				        
				        <DIV class=news-details>
				        	<A class="tool comments" href="#"><IMG alt="" src="images/sort_icon.gif" alt="����">����</A> 
				            <A class="tool comments" href="ArticleCommentSearch.do?act=list&id=${article.id }" target="_blank"><IMG alt="" src="images/comment_icon.gif" alt="����">����(${article.commentCnt })</A> 
				            <A class="tool comments" href="ArticleView.do?id=${article.id}" target="_blank"><IMG alt="" src="images/click_icon.gif" alt="���">���(${article.click })</A> 
				            <A class="tool share" href="javascript:void(0)" onclick="openDIV('�ղ�','../client/ClientManageArticleFavorite.do?act=add&id=${article.id }','500','350')"><IMG alt="" src="images/collect_icon.gif" alt="�ղ�">�ղ�</A> 
				             <A class="tool share" href="JavaScript:copyUserHomeToClipBoard('${article.title }  <%=(String)request.getRequestURL().substring(0, request.getRequestURL().indexOf("article") )%>article/ArticleView.do?id=${article.id }');"><IMG alt="" src="images/recommand_icon.gif">�Ƽ�</A> 
				           
				            
				            <SPAN class="tool share">				            	
								<IMG alt="" src="${UC_CENTER_URL }/avatar.php?uid=${article.userid}&size=small&type=virtual" width=13 height=13 alt="��������Ϣ"><SPAN class=d>${article.username }</SPAN> 				            
				             
				     		</SPAN>
				     		<SPAN class="tool share">				            	
								<IMG alt="" src="images/pubdate_icon.gif" width=13 height=13 alt="����ʱ��"><SPAN class=d>${fn:substring(article.pubdate, 0, 10)}</SPAN> 				            
				             
				     		</SPAN>
				 		</DIV>
					</DIV>				
					<UL class=news-digg>
				  		<LI id=main${article.id} class=digg-count><A id=diggs${article.id} href="javascript:void(0);" onclick="Digg(${article.id});"><STRONG id=diggs-strong-${article.id}>${article.digg }</STRONG><br>��һ��</A></LI>
				  		<LI id=diglink${article.id} class=digg-it><A href="javascript:void(0)" onclick="openDIV('�ղ�','../client/ClientManageArticleFavorite.do?act=add&id=${article.id }','500','350')">�ղ�</A> </LI>
				    </UL>
				</DIV>				
				<DIV class="boxoff"></DIV>
            	
			</c:forEach>
			
			
  			
  			
  			
  			
  			<div class="viewbox">
  				<DIV class="pagescroll">			     
					<DIV id="Pagination" class="pagination"></DIV>
				</DIV>  
			
			</div><br />
  			
  			
  		</DIV>
  		
  		
<DIV class=news_about>

</DIV></DIV><!--��Ѷ����-->

<!--�ұ�����ʼ-->
	
	
	
	<DIV id=sidebar>
	
	<!--�����ȵ㿪ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�������</SPAN></H2>
		<DIV class=con>
			<DIV id="article_type">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${ARTICLE_TYPE.articleTypes}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate%20desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
					  		
					  		<c:forEach items="${ARTICLE_TYPE_LIST}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate%20desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
						</TBODY>
					</TABLE>
			</DIV>
		</DIV>
	</DIV>
	<!--�����ȵ����-->
	
	<%@ include file="include/siderbar.jsp"%>
	</DIV>

<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV><!--���ṹ����-->
<!--footer��ʼ-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer����-->
</BODY></HTML>
