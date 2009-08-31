<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
		<#list ARTICLE_LIST as article>
		<c:forEach items="${ARTICLE_LIST}" var="article" begin="0" varStatus="is"> 
  		<TR>
    		<TD width="10%" align=middle><IMG src="images/top_${is.index +1 }.gif"></TD>
    		<TD class=daren_name><A class=linktext target=_blank href="ArticleView.do?id=${article.id}">${fn:substring(article.title, 0, 25)}</A></TD>
    	</TR>
  		</c:forEach>
	</TBODY>
</TABLE>