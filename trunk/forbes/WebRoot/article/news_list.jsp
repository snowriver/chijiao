<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


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

	<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="NewsSearch.do?act=list&keyword=${PARA['keyword']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:5,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
		
		function copyUserHomeToClipBoard(msg) {
      		window.clipboardData.setData("Text",msg);  
         	alert("���Ƴɹ�����ճ�������QQ/MSN���Ƽ�����ĺ��ѣ�\r\n\r\n�������£�\r\n" + msg);  
        }
	</SCRIPT>

</HEAD>

<BODY>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->

<!--header��ʼ-->
<c:set var="index" value="article"></c:set>
<%@ include file="include/header.jsp"%>
<!--header����-->

<!--���ṹ��ʼ-->
<DIV id=wrapper>
	<DIV id=container>
	
	<!--��Ѷ��ʼ-->
	<DIV id=news>
		<DIV class=newsmapbg>
			<DIV class=news_map>
				<A href="NewsSearch.do?act=list&orderby=pubdate desc">����</A> &gt;				
				����
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<BR>
			<DIV align="right">
				<UL id=sorts>
					<FONT style="COLOR: #ccc">|</FONT> <A href="NewsSearch.do?act=list&keyword=${PARA['keyWord'] }&orderby=pubdate desc"> ������Ѷ </A>
					<FONT style="COLOR: #ccc">|</FONT> <A href="NewsSearch.do?act=list&keyword=${PARA['keyWord'] }&orderby=click desc">	����� </A> 
					<FONT style="COLOR: #ccc">|</FONT> <A href="NewsSearch.do?act=list&keyword=${PARA['keyWord'] }&orderby=contentCnt desc"> ������� </A> 
					<FONT style="COLOR: #ccc">|</FONT> <A href="NewsSearch.do?act=list&keyword=${PARA['keyWord'] }&orderby=pubdate desc">	����ղ� </A> 
					<FONT style="COLOR: #ccc">|</FONT> <A href="NewsSearch.do?act=list&keyword=${PARA['keyWord'] }&orderby=digg desc"> ��ඥ</A> 
					<FONT style="COLOR: #ccc">|</FONT>  
				</UL>
  			</DIV>
			<DIV class="boxoff"></DIV>
			
			<c:forEach items="${NEWS_LIST}" var="news"> 
				<DIV style="Z-INDEX: 955" id=enclosure8 class=news-summary>
					
					<DIV class=news-body>
				        <H3><A class="offsite ct-lifestyle" target="_blank" href="NewsSearch.do?act=view&id=${news.id}">${fn:substring(news.title, 0, 30)}</A> </H3>
				        				        
				        <P>${fn:substring(news.description, 0, 145)}...</P>
				        <DIV class=news-details>
				        	
				            <A class="tool comments" href="NewsContentSearch.do?act=list&id=${news.id }" target="_blank"><IMG alt="" src="images/comment_icon.gif" alt="����">����(${news.contentCnt })</A> 
				            <A class="tool comments" href="NewsSearch.do?act=view&id=${news.id}" target="_blank"><IMG alt="" src="images/click_icon.gif" alt="���">���(${news.click })</A> 
				            <A class="tool share" href="javascript:void(0)" onclick="openDIV('�ղ�','../client/ClientManageNewsFavorite.do?act=add&id=${news.id }','500','350')"><IMG alt="" src="images/collect_icon.gif" alt="�ղ�">�ղ�</A>
				             <A class="tool share" href="JavaScript:copyUserHomeToClipBoard('${news.title }  <%=(String)request.getRequestURL().substring(0, request.getRequestURL().indexOf("article") )%>article/NewsSearch.do?act=view&id=${news.id }');"><IMG alt="" src="images/recommand_icon.gif">�Ƽ�</A> 
				           
				            
				            
				     		<SPAN class="tool share">				            	
								<IMG alt="" src="images/pubdate_icon.gif" width=13 height=13 alt="����ʱ��"><SPAN class=d>${fn:substring(news.pubdate, 0, 16)}</SPAN> 				            
				             
				     		</SPAN>
				 		</DIV>
					</DIV>				
					<UL class=news-digg>
				  		<LI id=main8 class=digg-count><A id=diggs8 href="#"><STRONG id=diggs-strong-8>${news.digg }</STRONG><br>��һ��</A></LI>
				  		<LI id=diglink8 class=digg-it><A onclick="openDIV('�ղ�','../client/ClientManageNewsFavorite.do?act=add&id=${news.id }','500','350')" href="javascript:void(0);">�ղ�</A> </LI>
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
	
	
	
	<%@ include file="include/siderbar.jsp"%>
	</DIV>

<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV><!--���ṹ����--><!--footer��ʼ-->

<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer����-->
</BODY></HTML>
