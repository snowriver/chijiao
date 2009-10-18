<%@ page contentType="text/html; charset=gbk"%>

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
	
	
	function search_x(){
		if($("#stype").val() == '2'){
			location.href="ArticleSearch.do?act=search&keyword=" +$("#keyword").val() + "&orderby=pubdate%20desc"; 
		}
		else {
			location.href="NewsSearch.do?act=list&keyword=" +$("#keyword").val() + "&orderby=pubdate%20desc"; 
		}
		
	}

</SCRIPT>

<DIV id=supevbox></DIV>
<!--header start-->
<DIV id=header>
	<DIV class=logo>
		<A href="../index.jsp"><IMG alt=����� src="../images/logo.jpg"
				width=146 height=38>
		</A>
	</DIV>
	<DIV class=toolnav>
		<A href="../">��ҳ</A>
		<A href="../article/" class=toolnav_on>��ҵ��ѧ</A>
		<A href="../video/">ѧϰ��Ƶ</A>
		<A href="../ask/">��ҵ����</A>
		<A target="_blank" href="${UC_HOME_URL }/index.php">��ҵȦ��</A>
		<A href="../client/ClientManageUserDailyPlan.do?act=list">�ɹ��ƻ�</A>
	</DIV>
	<DIV class=topmenu>
		<DIV class=topmenu_tools id="topmenu">

		</DIV>
		<DIV class=searchtool>
			<FORM method=post name=searchform_header>
				<FIELDSET>
					<LEGEND>
						����
					</LEGEND>
					<INPUT size=15 name=keyword id="keyword">
					<SELECT id="stype" name=stype>
						<OPTION value="1">
							��Ѷ
						</OPTION>
						<OPTION value="2">
							����
						</OPTION>
					</SELECT>
					<BUTTON name=search type=button value="true" onclick="search_x();">
						����
					</BUTTON>
				</FIELDSET>
			</FORM>
		</DIV>
	</DIV>
	<DIV class=clear></DIV>
	<DIV class=mainnav>


		<UL>
			<LI style="BACKGROUND: none transparent scroll repeat 0% 0%">
				<A title="" href="index.jsp">��ҳ</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate%20desc">��ҵ�׶�</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate%20desc">��ҵ����</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate%20desc">��ҵͶ��</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate%20desc">��ƹ滮</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate%20desc">���ý���</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc">�ɹ�����</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate%20desc">��������</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate%20desc">�Ƹ�����</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate%20desc">��������</A>
			</LI>
			<LI>
				<A title=""
					href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate%20desc">ְ������</A>
			</LI>

		</UL>

	</DIV>
</DIV>
<!--header end-->