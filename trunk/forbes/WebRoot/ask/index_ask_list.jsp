<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	
    com.forbes.ajax.AskTypeSelector as = new com.forbes.ajax.AskTypeSelector();
    request.setAttribute("ASK_TYPE_LIST", as.getTopAskType());
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/feedback.js"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function listAsks(status, orderby, divid){
			$.ajax({
				url: '../ask/AskSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=index&status=" + status + "&orderby=" + orderby,
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
		
	
		
		
		function listPopAsks(status, orderby, divid){
			$.ajax({
				url: '../ask/AskSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=pop&status=" + status + "&orderby=" + orderby,
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
				//showUserInfo();
				//listNews("newslist");
				listAsks("0", "expiredTime desc", "not_solve_question");
				listAsks("0_1", "reward desc", "height_solve_question");
				listAsks("1", "expiredTime desc",  "already_solve_question");
				listPopAsks("0_1", "views desc", "pop_question");
				//listArticles(7, "fortune_life");
				//listArticles(7, "economy_finance");
				//listComps();
        	}
		);
	</SCRIPT>


<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="index" value="ask"></c:set>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->
<!--header��ʼ-->
<%@ include file="include/header.jsp"%>

<!--header����-->
<!--���ṹ��ʼ-->


<DIV class=clear></DIV>

<DIV class=wapper><!--���ݿ�ʼ-->
	<DIV id=main>
		<DIV class=main_left>
			<!--���濪ʼ-->
			<DIV class=notice>
				<DIV class="notice_tit tit_1">վ�㹫��</DIV>
				<DIV class=notice_main>
					����
				</DIV>
				<DIV class=notice_btm></DIV>
			</DIV>
			<!--�������-->
			
			<!--����ר�ҿ�ʼ-->
			<!-- 
			<DIV class=jifen>
				<DIV class="question_tit tit_1">�����Ƽ�ר��</DIV>
				<DIV class=jifen_main>
					<TABLE class=f12 border=0 cellSpacing=0 cellPadding=0 width="81%" align=center>
						<TBODY>
				  			<TR><TD height=10></TD></TR>
				  			<TR>
				  				<TD height=70 vAlign=center align=middle>
				  					<A target=_blank href="��"><IMG border=0 align=middle src="images/a.gif" width=128 height=128></A>
				  				</TD>
				  			</TR>
				  			<TR><TD height=20 align=middle><A target=_blank href="#">ѧ�û��ʹ</A></TD></TR>
				  			<TR><TD height=20 align=middle><A target=_blank href="#">�ó�����ѧ���ͷ֡�</A></TD></TR>
				  			<TR><TD height=20 align=right><A target=_blank  href="#">�����Ƽ�ר��</A></TD></TR>
				  		</TBODY>
				  	</TABLE>
				</DIV>
			</DIV>
			 -->
			<!--����ר�ҽ���-->
			
			<!--������࿪ʼ-->
			<DIV class=question>
				<DIV class="question_tit tit_1">�������</DIV>
				<DIV class=question_main>
					<TABLE class=question_main_table border=0 cellSpacing=0 cellPadding=0 width="100%">
			  			<TBODY>
			  				<c:forEach items="${ASK_TYPE_LIST}" var="at" varStatus="is">
			  				<TR>
								<TD>
									<TABLE class=question_con border=0 cellSpacing=0 cellPadding=0 width="100%">
							        	<TBODY>
							        		<TR><TD class=question_main_tit><A href="AskSearch.do?act=search&typeid=${at.id }&orderby=expiredTime desc">${at.name }</A></TD></TR>
							        		<TR>
							          			<TD class=question_main_list>
							          				<c:forEach items="${at.askTypes}" var="att" varStatus="iss">
							          				<A href="AskSearch.do?act=search&status=0_1&typeid=${att.id }&orderby=expiredTime desc">${att.name }</A>
							            			</c:forEach>
							          			</TD>
							          		</TR>
							          	</TBODY>
							      	</TABLE>
								</TD>
							</TR>
							</c:forEach>
							
							
						</TBODY>
					</TABLE>
				</DIV>
				<DIV class=question_btm></DIV>
			</DIV>
			<!--����������-->
			
			<!--�Ƽ���ʼ--><!--<div class="commend">
		     <div class="commend_top"></div>
			 <div class="commend_center">
			   <table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td class="commend_img" valign="top"><a href="#"><img src="#" border="0" /></a></td>
					<td valign="top"><a href="#">Bet</a><br />
					���<br />
					<a href="#" class="view_more"></a>
					</td>
					<td width="20">&nbsp;</td>
				  </tr>
				</table>
			 </div>
			 <div class="commend_btm"></div>
		  </div>--><!--�Ƽ�����--><!--�����ʼ-->
<DIV class=suggest>
<DIV class=suggest_top></DIV>
<DIV class=suggest_center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD class=suggest_img></TD></TR>
  <TR>
    <TD class=suggest_btn align=right><A 
      href="javascript:win_open_bug();">���������ύ</A></TD></TR></TBODY></TABLE></DIV>
<DIV class=suggest_btm></DIV></DIV><!--�������--></DIV>
<DIV class=main_center><!--�м䶥����ʼ-->
<DIV class=center_top>
<DIV class=center_top_main>
<UL>
  <LI class=top_main_a>���������ڴ�ҵ���ڴ�ҵ�Ĺ������Ƿ���Щ���ý�������⣿���Ե�����Ѱ�Ҵ𰸡� 
  <LI class=top_main_b>���Ǵ�ҵ�ĸ����𣿻ش����⡢����֪ʶ���������͡���û��֡���ȡ������Ʒ��
</LI></UL></DIV></DIV><!--�м䶥������-->





<DIV align="center">
<FORM id=searchask1 method=post name=searchask1 action="AskSearch.do?act=search&orderby=expiredTime desc">
<INPUT size=30 type=text name=keyword>
<SELECT id=select1 class=input name=status> 
	<OPTION selected value=1>�ѽ������</OPTION> 
	<OPTION value=0>δ�������</OPTION>
</SELECT>
  <INPUT type=submit title=������ value=" ������ ">
  <INPUT title=��Ҫ���� onclick="location='ask.jsp';" value=" ��Ҫ���� " type=button>
  
</FORM>
</DIV>




<!--�����б�ʼ-->
<DIV class=question_list>
<DIV class=question_list_tit>
	<A href="AskSearch.do?act=search&status=0&keyword=&flag=hard&orderby=expiredTime desc">���������</A>|
	<A href="AskSearch.do?act=search&status=0_1&keyword=&flag=reward&orderby=reward desc">�߻�������</A>|
	<A href="AskSearch.do?act=search&status=1&keyword=&flag=resolved&orderby=expiredTime desc">�ѽ������</A></DIV>
<DIV class=question_list_main><!--��������⿪ʼ-->
<DIV class=question_list_con>
<DIV class=center_tit1>
<UL>
  <LI class=center_ico_1><SPAN class=orange>���������</SPAN> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=0&keyword=&flag=hard&orderby=expiredTime desc">��������</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

<DIV id="not_solve_question">

<img src="../images/loading.gif" />

</DIV>

</DIV></DIV><!--������������--><!--�߻������⿪ʼ-->
<DIV class=question_list_con>
<DIV class=center_tit2>
<UL>
  <LI class=center_ico_2><A href="AskSearch.do?act=search&status=0&keyword=&flag=reward&orderby=reward desc"><SPAN 
  class=blue>�߻�������</SPAN></A> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=0&keyword=&flag=reward&orderby=reward desc">��������</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

	<DIV id="height_solve_question">

	<img src="../images/loading.gif" />
	
	</DIV>

</DIV></DIV><!--�߻����������--><!--�ѽ�����⿪ʼ-->
<DIV class=question_list_con>
<DIV class=center_tit2>
<UL>
  <LI class=center_ico_3><SPAN class=green>�ѽ������</SPAN> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=1&keyword=&flag=resolved&orderby=expiredTime desc">��������</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

<DIV id="already_solve_question">

<img src="../images/loading.gif" />

</DIV>

</DIV></DIV><!--ͶƱ���������--></DIV>
<DIV class=question_list_btm></DIV></DIV><!--�����б����--></DIV>








<!--�������п�ʼ-->	
<DIV class=main_right>
	<DIV class=jifen>
		<DIV class="jifen_tit tit_1">��������</DIV>
		<DIV style="LINE-HEIGHT: 22px; PADDING-LEFT: 10px" class="jinji_main hottop">
			<DIV id="pop_question">

				<img src="../images/loading.gif" />
			
			</DIV>
		</DIV>
		<DIV class=jinji_btm></DIV>
	</DIV>
<!--�������н���-->



<!--�ұ����ݿ�ʼ-->
<%@ include file="include/siderbar.jsp"%>
<!--�ұ����ݽ���-->


<DIV class=clear></DIV></DIV><!--���ݽ���-->




<!--���ṹ����-->
<!--footer��ʼ-->
<!--footer��ʼ-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer����-->
<!--footer����-->
</BODY></HTML>
