<%@ page contentType="text/html; charset=gbk"%>


<SCRIPT language="javascript" type="text/javascript">
		
		function listTopUsers(divid){
			$.ajax({
				url: '../ask/UserSearch.do',
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
		
		function listUserPromotions(divid){
			$.ajax({
				url: '../ask/UserSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=promot",
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
				listTopUsers("top_score_users");
				listUserPromotions("user_promotions");
        	}
		);
	</SCRIPT>

<!--�������п�ʼ-->
<DIV style="WIDTH: 250px" class=daren>
	<DIV class=daren_tit>
		<UL>
			<LI class=tit_1>
				��������
			</LI>
		</UL>
	</DIV>

	<DIV class=daren_main_tit>

		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
			<TBODY>
				<TR>
					<TD width="21%">
						����
					</TD>
					<TD width="45%" align=left>
						�ǳ�
					</TD>
					<TD width="34%">
						�ʻ���
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>

	<DIV class=daren_main id="top_score_users">
		<img src="../images/loading.gif" />
	</DIV>

	<DIV class=daren_btm></DIV>
</DIV>
<!--�������н���-->

<!--�������濪ʼ-->
<DIV style="WIDTH: 250px" class=jinji>
	<DIV class="jinji_tit tit_1">
		��������
	</DIV>
	<DIV class=jinji_main id="user_promotions">
		<!--�ȼ������б�ʼ-->

		<img src="../images/loading.gif" />
		<!--�ȼ������б����-->
	</DIV>
	<DIV class=jinji_btm></DIV>
</DIV>
<!--�����������-->