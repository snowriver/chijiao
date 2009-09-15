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
					$("#" + divid +"").html("导入失败，请刷新");
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
					$("#" + divid +"").html("导入失败，请刷新");
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

<!--积分排行开始-->
<DIV style="WIDTH: 250px" class=daren>
	<DIV class=daren_tit>
		<UL>
			<LI class=tit_1>
				积分排行
			</LI>
		</UL>
	</DIV>

	<DIV class=daren_main_tit>

		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
			<TBODY>
				<TR>
					<TD width="21%">
						名次
					</TD>
					<TD width="45%" align=left>
						昵称
					</TD>
					<TD width="34%">
						问积分
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
<!--积分排行结束-->

<!--晋级公告开始-->
<DIV style="WIDTH: 250px" class=jinji>
	<DIV class="jinji_tit tit_1">
		晋级公告
	</DIV>
	<DIV class=jinji_main id="user_promotions">
		<!--等级排行列表开始-->

		<img src="../images/loading.gif" />
		<!--等级排行列表结束-->
	</DIV>
	<DIV class=jinji_btm></DIV>
</DIV>
<!--晋级公告结束-->