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
	<DIV class=logo><A href="../"><IMG alt=����� src="../images/logo.jpg" width=146 height=38></A> </DIV>
	<DIV class=toolnav>
		<A href="../">��ҳ</A> 
		<A href="../article/">��ҵ��ѧ</A> 
		<A class=toolnav_on href="../video/">ѧϰ��Ƶ</A> 
		<A href="../ask/">��ҵ����</A> 
		<A target="_blank" href="${UC_HOME_URL }/index.php">��ҵȦ��</A> 
		<!-- <A target="_blank" href="${UC_BBS_URL }/index.php">��ҵ��̳</A>   -->
	</DIV>
	<DIV class=topmenu>
		<DIV class=topmenu_tools id="topmenu">
			<!-- 
			<iframe frameborder=0 height=100% marginheight=1 marginwidth=1 src="include/userinfo.jsp" width="589" bordercolor="#000000" name="I4" noresize scrolling=no>
			</iframe>
			<img src="../images/load.gif">		
		 	-->		 	
		</DIV>
		<DIV class=searchtool>
			<FORM method=post name=searchform_header action="VideoSearch.do?act=search">
				<FIELDSET><LEGEND>����</LEGEND>
					<INPUT size=15 name=keyword> 
					<SELECT name=stype> 
	  					<OPTION selected value=0>��Ƶ</OPTION>
	  				</SELECT>
	  				<BUTTON name=search type=submit value="true">����</BUTTON> 
  				</FIELDSET> 
  			</FORM>
  		</DIV>
  	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>		
		<UL>
	  		<LI style="BACKGROUND: none transparent scroll repeat 0% 0%"><A title=""  href="index.jsp">��Ƶ��ҳ</A> </LI>
			<LI><A title="" href="VideoSearch.do?act=search&typeid=1">��ҵ�ɹ�ѧ</A> </LI>
		  	<LI><A title="" href="VideoSearch.do?act=search&typeid=5">��ҵ��ѧԺ</A> </LI>
		  	<LI><A title="" href="VideoSearch.do?act=search&typeid=8">Ͷ�����</A> </LI>
		  	<LI><A title="" href="VideoSearch.do?act=search&typeid=12">רҵ����</A> </LI>
		  	     
		</UL>
	</DIV>
</DIV>
<!--header end-->