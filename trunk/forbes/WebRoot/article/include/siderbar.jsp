<%@ page contentType="text/html; charset=gbk" %>

<SCRIPT language="javascript" type="text/javascript">
  
	function listSideBarArticles(divid, orderby){
			$.ajax({
				url: '../article/ArticleSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top&orderby="+orderby,
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
				listSideBarArticles("top_article", "click DESC");
				listSideBarArticles("command_article", "iscommend DESC");
				
				$('#home_blog').load('TopUchomeBlog.do');
        	}
		);
		
		function search_y(){
			if($("#channel").val() == '2'){
				location.href="ArticleSearch.do?act=search&keyword=" +$("#keyword").val() + "&orderby=pubdate desc"; 
			}
			else {
				location.href="NewsSearch.do?act=list&keyword=" +$("#keyword").val() + "&orderby=pubdate desc"; 
			}
			
		}
</SCRIPT>
	

<DIV id=sidebar>
	
  	
  	<!--搜索开始-->
	
	<DIV class=search>
		<FORM id=search_form1 name=search_form1 method=post target=_blank>
			<DIV class=left>
				<INPUT class=input id=keyword onblur="if(this.value=='')this.value='请输入关键字'" onfocus="if(this.value=='请输入关键字')this.value=''" value=请输入关键字 name=keyword>
			</DIV>
			<DIV class=left>
				<SELECT id=channel name=channel> 
					<OPTION value="1" selected>资讯</OPTION> 
					<OPTION value="2">文章</OPTION>
				</SELECT> 
			</DIV>
			<DIV class=right>
				<INPUT class=search_btn id=button onclick="search_y();" type=button value="搜 索" name=button> 
			</DIV>
			<DIV class=clear></DIV>
		</FORM>
	</DIV>

	<DIV class=searchhot>
		<H2>热门资讯标签</H2>
		<DIV class=hotkeys>

			<A href="ArticleSearch.do?act=search&keyword=创业&orderby=pubdate desc" target=_blank><FONT color=#d38f64>创业</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=激情&orderby=pubdate desc" target=_blank><FONT color=#97591c>激情</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=财富&orderby=pubdate desc" target=_blank><FONT color=#dba0bd>财富</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=人生&orderby=pubdate desc" target=_blank><FONT color=#ca1762>人生</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=理财&orderby=pubdate desc" target=_blank><FONT color=#c1cd63>理财</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=职业&orderby=pubdate desc" target=_blank><FONT color=#9732d6>职业</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=规划&orderby=pubdate desc" target=_blank><FONT color=#b12765>规划</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=项目&orderby=pubdate desc" target=_blank><FONT color=#ebc054>项目</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=健康&orderby=pubdate desc" target=_blank><FONT color=#9edd4>健康</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=经济&orderby=pubdate desc" target=_blank><FONT color=#a4535d>经济</FONT></A> 

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
					<img src="images/loading.gif" />
			</DIV>
		</DIV>
	</DIV>
	<!--推荐内容结束-->
	
	<!--本月热点开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>本月热点</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=click desc">更多热点</A></H2>
		<DIV class=con>
			<DIV id="top_article">
					<img src="images/loading.gif" />
			</DIV>
		</DIV>
	</DIV>
	<!--本月热点结束-->

	<!--手机论坛开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>创业圈日志</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }">更多内容</A></H2>
		<DIV class=con id="home_blog"><IFRAME height=120 src="" frameBorder=0 width=260 scrolling=no></IFRAME></DIV>
	</DIV>
	<!--手机论坛结束-->
	
	<DIV class=report>
		<A href="javascript:win_open_bug();">
			<IMG title=如有问题或建议，请点击这里提交 alt=如有问题或建议，请点击这里提交 src="../images/report.jpg" width=281 height=75>
		</A> 
	</DIV>
	
</DIV>