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
	<DIV class=logo><A href="index.jsp"><IMG alt=����� src="images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A class=toolnav_on href="../index.jsp">��ҳ</A> 
		<A href="../article/index.jsp">��ҵ��ѧ</A> 
		<A href="../video/index.jsp">ѧϰ��Ƶ</A> 
		<!-- <A href="#">��Ŀ�ڱ�</A> -->
		<A href="../ask/index.jsp">��ҵ����</A> 
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
			
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>
		
		<UL>
	  		<LI style="BACKGROUND: none transparent scroll repeat 0% 0%">
	  		<A title=""  href="JavaScript:void(0);">ϣ�� ��������� ��Ϊ���ҽύ�����ѵ���أ������һ�����ƽ̨��������֪ʶ��������ĵ÷���Ĵ�ҵ����վ��������һ���㣡</A> </LI>

			<!-- 
			<LI><A title="" href="#">��Ŀ</A> </LI>
		  	<LI><A title="" href="#">��Ŀ</A> </LI>
		  	<LI><A title="" href="#">��Ŀ</A> </LI>
		  	 -->
		</UL>

		
	</DIV>
</DIV>
<!--header end-->