<%@ page contentType="text/html; charset=gbk" %>

<SCRIPT language="javascript" type="text/javascript">
	function showUserInfo(){
		$.ajax({
			url: '../client/ClientLogin.do',
			type: 'post',
			dataType: 'html',
			data:"act=top",
			timeout: 10000,
			error: function(){
				//alert('System error');
			},
			success: function(rsHtml){
				//alert(rsHtml);
				$("#topmenu").html(rsHtml);
			}
		});
	}
				
	$(window).bind("load",function(){
			showUserInfo();
        }
	);

</SCRIPT>

<DIV id=supevbox></DIV>
<!--header start-->
<DIV id=header>
	<DIV class=logo><A href="../index.jsp"><IMG alt=赤脚网 src="../images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A href="../">首页</A> 
		<A href="../article/" class=toolnav_on>创业大学</A> 
		<A href="../video/">学习视频</A> 
		<A href="../ask/">创业百问</A> 
		<A target="_blank" href="${UC_HOME_URL }/index.php">创业圈子</A> 
		<!-- <A target="_blank" href="${UC_BBS_URL }/index.php">创业论坛</A>   -->
	</DIV>
	<DIV class=topmenu>
		<DIV class=topmenu_tools id="topmenu">
			<!-- 
			<iframe frameborder=0 height=100% marginheight=1 marginwidth=1 src="include/userinfo.jsp" width="589" bordercolor="#000000" name="I4" noresize scrolling=no>
			</iframe>
			<img src="images/loadings.gif">
		 	-->		 	
		</DIV>
		<DIV class=searchtool>
			<FORM method=post name=searchform_header action="AskSearch.do?act=search&orderby=expiredTime desc">
				<FIELDSET><LEGEND>搜索</LEGEND>
					<INPUT size=15 name=keyword> 
					<SELECT name=stype> 
	  					<OPTION value="news">资讯</OPTION>
	  					<OPTION value="article">文章</OPTION>
	  				</SELECT>
	  				<BUTTON name=search type=submit value="true">搜索</BUTTON> 
  				</FIELDSET> 
  			</FORM>
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>
		
		
		<UL>
	  		<LI style="BACKGROUND: none transparent scroll repeat 0% 0%"><A title="" href="index.jsp">首页</A></LI>
			<LI><A title="" href="ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate desc">创业阶段</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc">企业管理</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc">创业投资</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">理财规划</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate desc">经济金融</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc">成功激励</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc">能力提升</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">财富人生</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc">健康养生</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc">职场晋级</A> </LI>
		  	
		</UL>
		
	</DIV>
</DIV>
<!--header end-->