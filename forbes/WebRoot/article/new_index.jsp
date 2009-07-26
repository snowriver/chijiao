<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 创业大学 - 全力打造创业者学习和交流平台</TITLE>
	<META name="Keywords" content="${WEB_KEYWORD }" />
	<META name="Description" content="${WEB_DESCRIPTION }" />
	
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT src="../js/feedback.js"></SCRIPT>
	<SCRIPT src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT language=javascript src="js/turn_play_pic.js" type=text/javascript></SCRIPT>
	
	


<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
	
<c:set var="index" value="article"></c:set>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->
<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->
<!--主结构开始-->

<DIV id=wrapper>
	<DIV id=container>
		<DIV id=main>
			<!--flash轮播开始-->
			<DIV id=flasharea>
			    <DIV id=flashid style="VISIBILITY: hidden; OVERFLOW: hidden; WIDTH: 0px; HEIGHT: 0px">
			        <SCRIPT language=javascript src="js/pic.js" type=text/javascript></SCRIPT>
			    </DIV>
				<SCRIPT language=javascript type=text/javascript>playFlash("flashid",290,385);</SCRIPT>
			</DIV>
			<!--flash轮播结束-->
			
			<!--最新资讯开始-->
			<DIV id=news>
				<H2>
					<SPAN class=left>最新资讯</SPAN>
					<A class="more right" target=_blank href="NewsSearch.do?act=list&orderby=pubdate desc"><font color="black">+更多资讯</font></A>
				</H2>
				
				<DIV id="newslist">
					<DIV class=headline>
						<c:forEach items="${NEWS_LIST}" var="news" begin="0" end="0" >
						<A target=_blank href="NewsSearch.do?act=view&id=${news.id }">${news.title}</A>
						<BR>${fn:substring(news.description, 0, 50)}...<BR>
						</c:forEach>
					</DIV>
					<DIV class=con>
						<TABLE class=cmsTable>
					  		<TBODY>
					  			<c:forEach items="${NEWS_LIST}" var="news" begin="1"> 
					  			<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
									<TD><A target=_blank href="NewsSearch.do?act=view&id=${news.id }">${news.title}</A></TD>
									<TD>[${news.pubdateString } ]</TD>
								</TR>
								</c:forEach>
							</TBODY>
						</TABLE>
					</DIV>
				</DIV>
			</DIV>
			<!--最新资讯结束-->
			
			
			<DIV class=clear></DIV>
			
			
			<!--软件开始-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">企业管理</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc">+更多</A>
					</H2>
					
					<DIV class=clear></DIV>

					<DIV class=con>
						<DIV id="div_5"> 
							<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_5}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
						</DIV>

						<DIV class=clear></DIV>
					</DIV>
				</DIV>
			</DIV>
			


			<DIV class="pingce swpatch">
				<DIV id=gametab_1>
					<H2>
						<SPAN class="left">创业投资</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc">+更多</A>
					</H2>

					<DIV class=con>

						<DIV id="div_26">
							<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_26}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
						</DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--软件结束-->
		
		<DIV class=clear></DIV>
		
		
		<!--教程评测开始-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">成功激励</SPAN>
			
				
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc">+更多</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_42"> 
						<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_42}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
					</DIV>
					
				</DIV></DIV>
				

</DIV>

<DIV class="pingce swpatch">
<H2>
<SPAN class="left">理财规划</SPAN>
<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">+更多</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_17"> 
		<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_17}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
	</DIV>
	
</DIV></DIV>
</DIV>
<!--教程评测结束-->


<!--教程评测开始-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">财富人生</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">+更多</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_10"> 
					
						<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_10}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
					</DIV>
					
				</DIV></DIV>
				

</DIV>

<!--教程评测结束-->


<!--教程评测开始-->
<DIV class="pingce swpatch">
<H2>

<SPAN class="left">能力提升</SPAN>
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc">+更多</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_49"> 
		<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_49}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
	</DIV>
	
</DIV></DIV>
</DIV>
<!--教程评测开始-->


<DIV class=clear></DIV>
			
			
			<!--软件开始-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">职场晋级</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc">+更多</A>
					</H2>
					
					<DIV class=clear></DIV>

					<DIV class=con>
						<DIV id="div_35"> 
							<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_35}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
						</DIV>

						<DIV class=clear></DIV>
					</DIV>
				</DIV>
			</DIV>
			


			<DIV class="pingce swpatch">
				<DIV id=gametab_1>
					<H2>
						<SPAN class="left">健康养生</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc">+更多</A>
					</H2>

					<DIV class=con>

						<DIV id="div_16"> 
							<TABLE class=cmsTable width="356" height="147">
								<TBODY>	    	
							    	<c:forEach items="${NEW_ARTICLE_LIST_TYPE_16}" var="article"> 
							  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
							    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 30)}</A></TD>
							    		<TD>${article.pubdateString }</TD>
							    	</TR>
							    	</c:forEach>
								</TBODY>
							</TABLE>
						</DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--软件结束-->
		
		<DIV class=clear></DIV>
		
		

<DIV class=clear></DIV><!--主题开始-->


<DIV class=theme>
<H2><SPAN class=left>最新注册</SPAN><A class="more right" target=_blank href="http://localhost/uc/home/network.php?ac=space">+更多</A></H2>
<DIV class=con>

	<DIV id="new_register"> 
		<c:forEach items="${USER_LIST}" var="user"> 
			<UL class=left>
		  		<LI><A target=_blank href="${UC_HOME_URL }/space.php?uid=${user.uid }"><IMG src="${UC_CENTER_URL }/avatar.php?uid=${user.uid }&size=mid&type=virtual"></A> 
		  		<LI><A target=_blank href="${UC_HOME_URL }/space.php?uid=${user.uid }">${user.username }</A> </LI>
			</UL>
		</c:forEach>
	</DIV>
	
<DIV class=clear></DIV>
<DIV class=wallpaper_down>



</DIV></DIV></DIV><!--主题结束--></DIV>

<!--右边栏开始-->

<DIV id=sidebar>
		<!--搜索开始-->
	
	<DIV class=search>
		<FORM id=search_form1 name=search_form1 method=post target=_blank>
			<DIV class=left>
				<INPUT class=input id=keyword onblur="if(this.value=='')this.value='请输入关键字'" onfocus="if(this.value=='请输入关键字')this.value=''" value=请输入关键字 name=keyword>
			</DIV>
			<DIV class=left>
				<SELECT id=channel name=channel> 
					<OPTION value="article" selected>资讯</OPTION> 
					<OPTION value="news">文章</OPTION>
				</SELECT> 
			</DIV>
			<DIV class=right>
				<INPUT class=search_btn id=button onclick="Search();" type=submit value="搜 索" name=button> 
			</DIV>
			<DIV class=clear></DIV>
		</FORM>
	</DIV>

	<DIV class=searchhot>
		<H2>热门资讯标签</H2>
		<DIV class=hotkeys>

			<A href="javascript:void(0);" onclick="getSearchPage('article','创业');"><FONT color=#d38f64>创业</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','激情');"><FONT color=#97591c>激情</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','财富');"><FONT color=#dba0bd>财富</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','人生');"><FONT color=#ca1762>人生</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','理财');"><FONT color=#c1cd63>理财</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','职业');"><FONT color=#9732d6>职业</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','规划');"><FONT color=#b12765>规划</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','项目');"><FONT color=#ebc054>项目</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','健康');"><FONT color=#9edd4>健康</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','经济');"><FONT color=#a4535d>经济</FONT></A> 

	</DIV>
</DIV>


	
  	<!--搜索结束-->
  
	<!--排行榜开始-->

	<!--排行榜结束-->

	<!--推荐内容开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>推荐内容</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=iscommend desc">更多推荐</A></H2>
		<DIV class=con>
			<DIV id="command_article">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${COMMEND_ARTICLE_LIST}" var="article" begin="0" varStatus="is"> 
					  		<TR>
					    		<TD width="10%" align=middle><IMG src="images/top_${is.index +1 }.gif"></TD>
					    		<TD class=daren_name><A class=linktext target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 25)}</A></TD>
					    	</TR>
					  		</c:forEach>
						</TBODY>
					</TABLE>
			</DIV>
		</DIV>
	</DIV>
	<!--推荐内容结束-->
	
	<!--本月热点开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>本月热点</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=click desc">更多热点</A></H2>
		<DIV class=con>
			<DIV id="top_article">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${TOP_ARTICLE_LIST}" var="article" begin="0" varStatus="is"> 
					  		<TR>
					    		<TD width="10%" align=middle><IMG src="images/top_${is.index +1 }.gif"></TD>
					    		<TD class=daren_name><A class=linktext target=_blank href="ArticleSearch.do?act=view&id=${article.id}">${fn:substring(article.title, 0, 25)}</A></TD>
					    	</TR>
					  		</c:forEach>
						</TBODY>
					</TABLE>
			</DIV>
		</DIV>
	</DIV>
	<!--本月热点结束-->

	<!--手机论坛开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>创业圈日志</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }">更多内容</A></H2>
		<DIV class=con id="home_blog">
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
				<TBODY>
					<c:forEach items="${UC_HOME_BLOG_LIST}" var="blog" begin="0" varStatus="is"> 
			  		<TR>
			    		<TD width="10%" align=middle><IMG src="images/top_${is.index + 1 }.gif"></TD>
			    		<TD class=daren_name><A class=linktext target=_blank href="${UC_HOME_URL }/space.php?uid=${blog.uid}&do=blog&id=${blog.blogid}">${fn:substring(blog.subject, 0, 25)}</A></TD>
			    	</TR>
			  		</c:forEach>
				</TBODY>
			</TABLE>
		</DIV>
	</DIV>
	<!--手机论坛结束-->
	
		
	<DIV class=report>
		<A href="javascript:win_open_bug();">
			<IMG title=如有问题或建议，请点击这里提交 alt=如有问题或建议，请点击这里提交 src="../images/report.jpg" width=281 height=75>
		</A> 
	</DIV>
	
	
	
</DIV>
<!--右边栏结束-->
<DIV class=clear></DIV></DIV></DIV>

<!--主结构结束-->
<!--footer开始-->

<!--footer开始-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
    <SCRIPT language=javascript src="../js/search.js" type=text/javascript></SCRIPT>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
