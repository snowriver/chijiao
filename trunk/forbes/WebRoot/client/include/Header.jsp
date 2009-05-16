<%@ page contentType="text/html; charset=gbk" %>

<SCRIPT language="javascript" type="text/javascript">
	function showUserInfo(){
		$.ajax({
			url: 'ClientLogin.do',
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
	<DIV class=logo><A href="index.jsp"><IMG alt=赤脚网 src="images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A class=toolnav_on href="../index.jsp">首页</A> 
		<A href="../article/index.jsp">创业大学</A> 
		<A href="../video/index.jsp">学习视频</A> 
		<!-- <A href="#">项目挖贝</A> -->
		<A href="../ask/index.jsp">创业百问</A> 
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
			
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>
		
		<UL>
	  		<LI style="BACKGROUND: none transparent scroll repeat 0% 0%">
	  		<A title=""  href="JavaScript:void(0);">希望 “赤脚网” 成为你我结交新朋友的天地！是你我互助的平台！是你我知识，经验和心得分享的创业加油站！让我们一起共勉！</A> </LI>

			<!-- 
			<LI><A title="" href="#">栏目</A> </LI>
		  	<LI><A title="" href="#">栏目</A> </LI>
		  	<LI><A title="" href="#">栏目</A> </LI>
		  	 -->
		</UL>

		
	</DIV>
</DIV>
<!--header end-->