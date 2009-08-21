<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="../include/gloable.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 创业大学 - 全力打造创业者学习和交流平台</TITLE>
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
		 
		  window.location="ArticleSearch.do?act=list&typeid=${PARA['typeid']}&keyword=${PARA['keyword']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
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
         	alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友！\r\n\r\n内容如下：\r\n" + msg);  
        }
	</SCRIPT>

</HEAD>

<BODY>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->

<!--header开始-->
<c:set var="index" value="article"></c:set>
<%@ include file="include/header.jsp"%>
<!--header结束-->

<!--主结构开始-->
<DIV id=wrapper>
	<DIV id=container>
	
	<!--资讯开始-->
	<DIV id=news>
		<DIV class=newsmapbg>
			<DIV class=news_map>
				<A href="ArticleSearch.do?act=list&orderby=pubdate desc">所有</A> &gt;
				<c:if test="${not empty PARENT_ARTICLE_TYPE}"><A href="ArticleSearch.do?act=list&typeid=${PARENT_ARTICLE_TYPE.id}&keyword=&orderby=pubdate desc">${PARENT_ARTICLE_TYPE.name}</A> &gt; </c:if>
				<c:if test="${not empty ARTICLE_TYPE}"><A href="ArticleSearch.do?act=list&typeid=${ARTICLE_TYPE.id}&keyword=&orderby=pubdate desc">${ARTICLE_TYPE.name}</A> &gt; </c:if>
				正文
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<BR>
			<DIV align="right">
				<UL id=sorts>
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'pubdate desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=list&typeid=${PARA['typeid'] }&keyword=&orderby=pubdate desc"> 最新文章 </A>
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'click desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=list&typeid=${PARA['typeid'] }&keyword=&orderby=click desc">	最多点击 </A> 
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'contentCnt desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=list&typeid=${PARA['typeid'] }&keyword=&orderby=contentCnt desc"> 最多评论 </A> 
					<!-- <FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'pubdate desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=list&typeid=${PARA['typeid'] }&keyword=&orderby=pubdate desc"> 最多收藏 </A> --> 
					<FONT style="COLOR: #ccc">|</FONT> <A <c:if test="${PARA['orderby'] == 'digg desc'}">style="COLOR: #FF0000; font-weight: bold;"</c:if> href="ArticleSearch.do?act=list&typeid=${PARA['typeid'] }&keyword=&orderby=digg desc"> 最多顶</A> 
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
				        	<A class="tool comments" href="ArticleSearch.do?act=list&typeid=${article.articleType.id }&keyword=&orderby=pubdate desc" target="_blank"><IMG alt="" src="images/sort_icon.gif" alt="分类">分类</A> 
				            <A class="tool comments" href="ArticleContentSearch.do?act=list&id=${article.id }" target="_blank"><IMG alt="" src="images/comment_icon.gif" alt="评论">评论(${article.contentCnt })</A> 
				            <A class="tool comments" href="ArticleView.do?id=${article.id}" target="_blank"><IMG alt="" src="images/click_icon.gif" alt="浏览">浏览(${article.click })</A> 
				            <A class="tool share" href="javascript:void(0)" onclick="openDIV('收藏','../client/ClientManageArticleFavorite.do?act=add&id=${article.id }','500','350')"><IMG alt="" src="images/collect_icon.gif" alt="收藏">收藏</A> 
				            <A class="tool share" href="JavaScript:copyUserHomeToClipBoard('${article.title }  <%=(String)request.getRequestURL().substring(0, request.getRequestURL().indexOf("article") )%>article/ArticleView.do?id=${article.id }');"><IMG alt="" src="images/recommand_icon.gif">推荐</A> 
				           
				            
				            <SPAN class="tool share">				            	
								<IMG alt="" src="${UC_CENTER_URL }/avatar.php?uid=${article.userid}&size=small&type=virtual" width=13 height=13 alt="发布者信息"><SPAN class=d>${article.username }</SPAN> 				            
				             
				     		</SPAN>
				     		<SPAN class="tool share">				            	
								<IMG alt="" src="images/pubdate_icon.gif" width=13 height=13 alt="发布时间"><SPAN class=d>${fn:substring(article.pubdate, 0, 10)}</SPAN> 				            
				             
				     		</SPAN>
				 		</DIV>
					</DIV>				
					<UL class=news-digg>
				  		<LI id=main8 class=digg-count><A id=diggs8 href="#"><STRONG id=diggs-strong-8>${article.digg }</STRONG><br>顶一下</A></LI>
				  		<LI id=diglink8 class=digg-it><A href="javascript:void(0)" onclick="openDIV('收藏','../client/ClientManageArticleFavorite.do?act=add&id=${article.id }','500','350')">收藏</A> </LI>
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

</DIV></DIV><!--资讯结束-->

<!--右边栏开始-->
	
	
	
	<DIV id=sidebar>
	
	<!--本月热点开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>相关类型</SPAN></H2>
		<DIV class=con>
			<DIV id="article_type">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${ARTICLE_TYPE.articleTypes}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
					  		
					  		<c:forEach items="${ARTICLE_TYPE_LIST}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
						</TBODY>
					</TABLE>
			</DIV>
		</DIV>
	</DIV>
	<!--本月热点结束-->
	
	<%@ include file="include/siderbar.jsp"%>
	</DIV>

<!--右边栏结束-->
<DIV class=clear></DIV></DIV></DIV><!--主结构结束-->
<!--footer开始-->
	<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer结束-->
</BODY></HTML>
