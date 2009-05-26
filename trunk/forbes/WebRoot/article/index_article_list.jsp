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
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function listArticles(type, divid){
			$.ajax({
				url: '../article/ArticleSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=type&typeid=" + type,
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		
		function listNews(divid){
			$.ajax({
				url: '../article/NewsSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top",
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		function listNewRegister(divid){
			
			$.ajax({
				url: '../article/NewRegister.do',
				type: 'post',
				dataType: 'html',
				data:"orderby=regdate DESC",
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		$(window).bind("load",function(){
				//showUserInfo();
				listNews("newslist");
				
				listArticles(5, "div_5");				
				listArticles(26, "div_26");
				listArticles(42, "div_42");
				listArticles(17, "div_17");				
				listArticles(10, "div_10");
				listArticles(49, "div_49");
				listArticles(35, "div_35");
				listArticles(16, "div_16");
				listNewRegister("new_register");
				//listComps();
        	}
		);
	</SCRIPT>


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
					<img src="images/loading.gif" />
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
						<DIV id="div_5"> <img src="images/loading.gif" /> </DIV>

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

						<DIV id="div_26"> <img src="images/loading.gif" /> </DIV>


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
					<DIV id="div_42"> <img src="images/loading.gif" /> </DIV>
					
				</DIV></DIV>
				

</DIV>

<DIV class="pingce swpatch">
<H2>
<SPAN class="left">理财规划</SPAN>
<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">+更多</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_17"> <img src="images/loading.gif" /> </DIV>
	
</DIV></DIV>
</DIV>
<!--教程评测结束-->


<!--教程评测开始-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">财富人生</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">+更多</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_10"> <img src="images/loading.gif" /> </DIV>
					
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
	<DIV id="div_49"> <img src="images/loading.gif" /> </DIV>
	
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
						<DIV id="div_35"> <img src="images/loading.gif" /> </DIV>

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

						<DIV id="div_16"> <img src="images/loading.gif" /> </DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--软件结束-->
		
		<DIV class=clear></DIV>
		
		

<DIV class=clear></DIV><!--主题开始-->


<DIV class=theme>
<H2><SPAN class=left>最新注册</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }/network.php?ac=space">+更多</A></H2>
<DIV class=con>

	<DIV id="new_register"> <img src="images/loading.gif" /> </DIV>
	
<DIV class=clear></DIV>
<DIV class=wallpaper_down>



</DIV></DIV></DIV><!--主题结束--></DIV>

<!--右边栏开始-->

<DIV id=sidebar>
	<%@ include file="include/siderbar.jsp"%>
	</DIV>
<!--右边栏结束-->
<DIV class=clear></DIV></DIV></DIV>

<!--主结构结束-->
<!--footer开始-->

<!--footer开始-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
