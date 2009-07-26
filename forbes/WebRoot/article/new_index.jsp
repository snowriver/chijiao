<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ��ҵ��ѧ - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
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

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->
<!--header��ʼ-->
<%@ include file="include/header.jsp"%>

<!--header����-->
<!--���ṹ��ʼ-->

<DIV id=wrapper>
	<DIV id=container>
		<DIV id=main>
			<!--flash�ֲ���ʼ-->
			<DIV id=flasharea>
			    <DIV id=flashid style="VISIBILITY: hidden; OVERFLOW: hidden; WIDTH: 0px; HEIGHT: 0px">
			        <SCRIPT language=javascript src="js/pic.js" type=text/javascript></SCRIPT>
			    </DIV>
				<SCRIPT language=javascript type=text/javascript>playFlash("flashid",290,385);</SCRIPT>
			</DIV>
			<!--flash�ֲ�����-->
			
			<!--������Ѷ��ʼ-->
			<DIV id=news>
				<H2>
					<SPAN class=left>������Ѷ</SPAN>
					<A class="more right" target=_blank href="NewsSearch.do?act=list&orderby=pubdate desc"><font color="black">+������Ѷ</font></A>
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
			<!--������Ѷ����-->
			
			
			<DIV class=clear></DIV>
			
			
			<!--�����ʼ-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">��ҵ����</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc">+����</A>
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
						<SPAN class="left">��ҵͶ��</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc">+����</A>
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
		<!--�������-->
		
		<DIV class=clear></DIV>
		
		
		<!--�̳����⿪ʼ-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">�ɹ�����</SPAN>
			
				
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc">+����</A></H2>
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
<SPAN class="left">��ƹ滮</SPAN>
<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">+����</A></H2>
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
<!--�̳��������-->


<!--�̳����⿪ʼ-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">�Ƹ�����</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">+����</A></H2>
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

<!--�̳��������-->


<!--�̳����⿪ʼ-->
<DIV class="pingce swpatch">
<H2>

<SPAN class="left">��������</SPAN>
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc">+����</A></H2>
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
<!--�̳����⿪ʼ-->


<DIV class=clear></DIV>
			
			
			<!--�����ʼ-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">ְ������</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc">+����</A>
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
						<SPAN class="left">��������</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc">+����</A>
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
		<!--�������-->
		
		<DIV class=clear></DIV>
		
		

<DIV class=clear></DIV><!--���⿪ʼ-->


<DIV class=theme>
<H2><SPAN class=left>����ע��</SPAN><A class="more right" target=_blank href="http://localhost/uc/home/network.php?ac=space">+����</A></H2>
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



</DIV></DIV></DIV><!--�������--></DIV>

<!--�ұ�����ʼ-->

<DIV id=sidebar>
		<!--������ʼ-->
	
	<DIV class=search>
		<FORM id=search_form1 name=search_form1 method=post target=_blank>
			<DIV class=left>
				<INPUT class=input id=keyword onblur="if(this.value=='')this.value='������ؼ���'" onfocus="if(this.value=='������ؼ���')this.value=''" value=������ؼ��� name=keyword>
			</DIV>
			<DIV class=left>
				<SELECT id=channel name=channel> 
					<OPTION value="article" selected>��Ѷ</OPTION> 
					<OPTION value="news">����</OPTION>
				</SELECT> 
			</DIV>
			<DIV class=right>
				<INPUT class=search_btn id=button onclick="Search();" type=submit value="�� ��" name=button> 
			</DIV>
			<DIV class=clear></DIV>
		</FORM>
	</DIV>

	<DIV class=searchhot>
		<H2>������Ѷ��ǩ</H2>
		<DIV class=hotkeys>

			<A href="javascript:void(0);" onclick="getSearchPage('article','��ҵ');"><FONT color=#d38f64>��ҵ</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','����');"><FONT color=#97591c>����</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','�Ƹ�');"><FONT color=#dba0bd>�Ƹ�</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','����');"><FONT color=#ca1762>����</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','���');"><FONT color=#c1cd63>���</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','ְҵ');"><FONT color=#9732d6>ְҵ</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','�滮');"><FONT color=#b12765>�滮</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','��Ŀ');"><FONT color=#ebc054>��Ŀ</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','����');"><FONT color=#9edd4>����</FONT></A> 
			<A href="javascript:void(0);" onclick="getSearchPage('article','����');"><FONT color=#a4535d>����</FONT></A> 

	</DIV>
</DIV>


	
  	<!--��������-->
  
	<!--���а�ʼ-->

	<!--���а����-->

	<!--�Ƽ����ݿ�ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�Ƽ�����</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=iscommend desc">�����Ƽ�</A></H2>
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
	<!--�Ƽ����ݽ���-->
	
	<!--�����ȵ㿪ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�����ȵ�</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=click desc">�����ȵ�</A></H2>
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
	<!--�����ȵ����-->

	<!--�ֻ���̳��ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>��ҵȦ��־</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }">��������</A></H2>
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
	<!--�ֻ���̳����-->
	
		
	<DIV class=report>
		<A href="javascript:win_open_bug();">
			<IMG title=����������飬���������ύ alt=����������飬���������ύ src="../images/report.jpg" width=281 height=75>
		</A> 
	</DIV>
	
	
	
</DIV>
<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV>

<!--���ṹ����-->
<!--footer��ʼ-->

<!--footer��ʼ-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
    <SCRIPT language=javascript src="../js/search.js" type=text/javascript></SCRIPT>
<!--footer����-->
<!--footer����-->
</BODY></HTML>
