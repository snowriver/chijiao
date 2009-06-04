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
					$("#" + divid +"").html("����ʧ�ܣ���ˢ��");
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
	
  	
  	<!--������ʼ-->
	
	<DIV class=search>
		<FORM id=search_form1 name=search_form1 method=post target=_blank>
			<DIV class=left>
				<INPUT class=input id=keyword onblur="if(this.value=='')this.value='������ؼ���'" onfocus="if(this.value=='������ؼ���')this.value=''" value=������ؼ��� name=keyword>
			</DIV>
			<DIV class=left>
				<SELECT id=channel name=channel> 
					<OPTION value="1" selected>��Ѷ</OPTION> 
					<OPTION value="2">����</OPTION>
				</SELECT> 
			</DIV>
			<DIV class=right>
				<INPUT class=search_btn id=button onclick="search_y();" type=button value="�� ��" name=button> 
			</DIV>
			<DIV class=clear></DIV>
		</FORM>
	</DIV>

	<DIV class=searchhot>
		<H2>������Ѷ��ǩ</H2>
		<DIV class=hotkeys>

			<A href="ArticleSearch.do?act=search&keyword=��ҵ&orderby=pubdate desc" target=_blank><FONT color=#d38f64>��ҵ</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=����&orderby=pubdate desc" target=_blank><FONT color=#97591c>����</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=�Ƹ�&orderby=pubdate desc" target=_blank><FONT color=#dba0bd>�Ƹ�</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=����&orderby=pubdate desc" target=_blank><FONT color=#ca1762>����</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=���&orderby=pubdate desc" target=_blank><FONT color=#c1cd63>���</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=ְҵ&orderby=pubdate desc" target=_blank><FONT color=#9732d6>ְҵ</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=�滮&orderby=pubdate desc" target=_blank><FONT color=#b12765>�滮</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=��Ŀ&orderby=pubdate desc" target=_blank><FONT color=#ebc054>��Ŀ</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=����&orderby=pubdate desc" target=_blank><FONT color=#9edd4>����</FONT></A> 
			<A href="ArticleSearch.do?act=search&keyword=����&orderby=pubdate desc" target=_blank><FONT color=#a4535d>����</FONT></A> 

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
					<img src="images/loading.gif" />
			</DIV>
		</DIV>
	</DIV>
	<!--�Ƽ����ݽ���-->
	
	<!--�����ȵ㿪ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�����ȵ�</SPAN><A class="more right" target=_blank href="ArticleSearch.do?act=search&orderby=click desc">�����ȵ�</A></H2>
		<DIV class=con>
			<DIV id="top_article">
					<img src="images/loading.gif" />
			</DIV>
		</DIV>
	</DIV>
	<!--�����ȵ����-->

	<!--�ֻ���̳��ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>��ҵȦ��־</SPAN><A class="more right" target=_blank href="${UC_HOME_URL }">��������</A></H2>
		<DIV class=con id="home_blog"><IFRAME height=120 src="" frameBorder=0 width=260 scrolling=no></IFRAME></DIV>
	</DIV>
	<!--�ֻ���̳����-->
	
	<DIV class=report>
		<A href="javascript:win_open_bug();">
			<IMG title=����������飬���������ύ alt=����������飬���������ύ src="../images/report.jpg" width=281 height=75>
		</A> 
	</DIV>
	
</DIV>