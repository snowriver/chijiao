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

<!--header start-->
<DIV id=header>
	<DIV class=logo><A href="../index.jsp"><IMG alt=赤脚网 src="../images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A href="../index.jsp">首页</A> 
		<A href="../article/index.jsp">创业大学</A> 
		<A href="../video/index.jsp">学习视频</A> 
		<A class=toolnav_on href="../ask/index.jsp">创业百问</A> 
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
	  					<OPTION selected value=0>问题</OPTION>
	  				</SELECT>
	  				<BUTTON name=search type=submit value="true">搜索</BUTTON> 
  				</FIELDSET> 
  			</FORM>
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>
	
		<UL>
			<LI style="BACKGROUND: none transparent scroll repeat 0% 0%"><A title="" href="index.jsp">百问首页</A> </LI>
			<LI><A title="" href="AskSearch.do?act=search&status=0_1&orderby=expiredTime desc">所有</A> </LI>
		  	<LI><A title="" href="AskSearch.do?act=search&status=0_1&typeid=5&orderby=expiredTime desc">创业问答</A> </LI>
		  	<LI><A title="" href="AskSearch.do?act=search&status=0_1&typeid=6&orderby=expiredTime desc">综合问答</A> </LI>
		  	<LI><A title="" href="AskSearch.do?act=search&status=0_1&typeid=1&orderby=expiredTime desc">投资问答</A> </LI>
		  	<LI><A title="" href="AskSearch.do?act=search&status=0_1&typeid=3&orderby=expiredTime desc">融资问答</A> </LI>
		  	<LI><A title="" href="AskSearch.do?act=search&status=0_1&typeid=4&orderby=expiredTime desc">理财问答</A> </LI>
		  			  	
		</UL>
	
		
	



		
		
		
		
	</DIV>
</DIV>
<!--header end-->