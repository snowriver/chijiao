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
	<DIV class=logo><A href="../index.jsp"><IMG alt=����� src="../images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A href="../">��ҳ</A> 
		<A href="../article/" class=toolnav_on>��ҵ��ѧ</A> 
		<A href="../video/">ѧϰ��Ƶ</A> 
		<A href="../ask/">��ҵ����</A> 
		<A target="_blank" href="${UC_HOME_URL }/index.php">��ҵȦ��</A> 
		<!-- <A target="_blank" href="${UC_BBS_URL }/index.php">��ҵ��̳</A>   -->
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
				<FIELDSET><LEGEND>����</LEGEND>
					<INPUT size=15 name=keyword> 
					<SELECT name=stype> 
	  					<OPTION value="news">��Ѷ</OPTION>
	  					<OPTION value="article">����</OPTION>
	  				</SELECT>
	  				<BUTTON name=search type=submit value="true">����</BUTTON> 
  				</FIELDSET> 
  			</FORM>
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>
		
		
		<UL>
	  		<LI style="BACKGROUND: none transparent scroll repeat 0% 0%"><A title="" href="index.jsp">��ҳ</A></LI>
			<LI><A title="" href="ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate desc">��ҵ�׶�</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc">��ҵ����</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc">��ҵͶ��</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">��ƹ滮</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate desc">���ý���</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc">�ɹ�����</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc">��������</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">�Ƹ�����</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc">��������</A> </LI>
		  	<LI><A title="" href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc">ְ������</A> </LI>
		  	
		</UL>
		
	</DIV>
</DIV>
<!--header end-->