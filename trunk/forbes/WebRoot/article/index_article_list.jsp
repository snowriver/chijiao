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
					$("#" + divid +"").html("����ʧ�ܣ���ˢ��");
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
					$("#" + divid +"").html("����ʧ�ܣ���ˢ��");
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
					$("#" + divid +"").html("����ʧ�ܣ���ˢ��");
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
					<img src="images/loading.gif" />
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
						<DIV id="div_5"> <img src="images/loading.gif" /> </DIV>

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

						<DIV id="div_26"> <img src="images/loading.gif" /> </DIV>


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
					<DIV id="div_42"> <img src="images/loading.gif" /> </DIV>
					
				</DIV></DIV>
				

</DIV>

<DIV class="pingce swpatch">
<H2>
<SPAN class="left">��ƹ滮</SPAN>
<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">+����</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_17"> <img src="images/loading.gif" /> </DIV>
	
</DIV></DIV>
</DIV>
<!--�̳��������-->


<!--�̳����⿪ʼ-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">�Ƹ�����</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">+����</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_10"> <img src="images/loading.gif" /> </DIV>
					
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
	<DIV id="div_49"> <img src="images/loading.gif" /> </DIV>
	
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
						<DIV id="div_35"> <img src="images/loading.gif" /> </DIV>

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

						<DIV id="div_16"> <img src="images/loading.gif" /> </DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--�������-->
		
		<DIV class=clear></DIV>
		
		

<DIV class=clear></DIV><!--���⿪ʼ-->


<DIV class=theme>
<H2><SPAN class=left>����ע��</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }/network.php?ac=space">+����</A></H2>
<DIV class=con>

	<DIV id="new_register"> <img src="images/loading.gif" /> </DIV>
	
<DIV class=clear></DIV>
<DIV class=wallpaper_down>



</DIV></DIV></DIV><!--�������--></DIV>

<!--�ұ�����ʼ-->

<DIV id=sidebar>
	<%@ include file="include/siderbar.jsp"%>
	</DIV>
<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV>

<!--���ṹ����-->
<!--footer��ʼ-->

<!--footer��ʼ-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer����-->
<!--footer����-->
</BODY></HTML>
