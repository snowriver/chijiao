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
	<TITLE>赤脚网 - 学习库 - 全力打造创业者学习和交流平台</TITLE>
	
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
					$("#" + divid +"").html("导入失败，请刷新");
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
					$("#" + divid +"").html("导入失败，请刷新");
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

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->
<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->
<!--主结构开始-->


<DIV class=clear></DIV>

<DIV class=wapper><!--内容开始-->
	<DIV id=main>
		<DIV class=main_left>
			<!--公告开始-->
			<DIV class=notice>
				<DIV class="notice_tit tit_1">站点公告</DIV>
				<DIV class=notice_main>
					公告
				</DIV>
				<DIV class=notice_btm></DIV>
			</DIV>
			<!--公告结束-->
			
			<!--特邀专家开始-->
			<!-- 
			<DIV class=jifen>
				<DIV class="question_tit tit_1">本周推荐专家</DIV>
				<DIV class=jifen_main>
					<TABLE class=f12 border=0 cellSpacing=0 cellPadding=0 width="81%" align=center>
						<TBODY>
				  			<TR><TD height=10></TD></TR>
				  			<TR>
				  				<TD height=70 vAlign=center align=middle>
				  					<A target=_blank href="＃"><IMG border=0 align=middle src="images/a.gif" width=128 height=128></A>
				  				</TD>
				  			</TR>
				  			<TR><TD height=20 align=middle><A target=_blank href="#">学堂活动大使</A></TD></TR>
				  			<TR><TD height=20 align=middle><A target=_blank href="#">擅长领域【学堂送分】</A></TD></TR>
				  			<TR><TD height=20 align=right><A target=_blank  href="#">更多推荐专家</A></TD></TR>
				  		</TBODY>
				  	</TABLE>
				</DIV>
			</DIV>
			 -->
			<!--特邀专家结束-->
			
			<!--问题分类开始-->
			<DIV class=question>
				<DIV class="question_tit tit_1">问题分类</DIV>
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
			<!--问题分类结束-->
			
			<!--推荐开始--><!--<div class="commend">
		     <div class="commend_top"></div>
			 <div class="commend_center">
			   <table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td class="commend_img" valign="top"><a href="#"><img src="#" border="0" /></a></td>
					<td valign="top"><a href="#">Bet</a><br />
					意见<br />
					<a href="#" class="view_more"></a>
					</td>
					<td width="20">&nbsp;</td>
				  </tr>
				</table>
			 </div>
			 <div class="commend_btm"></div>
		  </div>--><!--推荐结束--><!--意见开始-->
<DIV class=suggest>
<DIV class=suggest_top></DIV>
<DIV class=suggest_center>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD class=suggest_img></TD></TR>
  <TR>
    <TD class=suggest_btn align=right><A 
      href="javascript:win_open_bug();">请点击这里提交</A></TD></TR></TBODY></TABLE></DIV>
<DIV class=suggest_btm></DIV></DIV><!--意见结束--></DIV>
<DIV class=main_center><!--中间顶部开始-->
<DIV class=center_top>
<DIV class=center_top_main>
<UL>
  <LI class=top_main_a>你现在正在创业吗？在创业的过程中是否有些不好解决的问题？可以到这里寻找答案。 
  <LI class=top_main_b>你是创业的高手吗？回答问题、贡献知识、博得赞赏、获得积分、换取积分商品。
</LI></UL></DIV></DIV><!--中间顶部结束-->





<DIV align="center">
<FORM id=searchask1 method=post name=searchask1 action="AskSearch.do?act=search&orderby=expiredTime desc">
<INPUT size=30 type=text name=keyword>
<SELECT id=select1 class=input name=status> 
	<OPTION selected value=1>已解决问题</OPTION> 
	<OPTION value=0>未解决问题</OPTION>
</SELECT>
  <INPUT type=submit title=搜索答案 value=" 搜索答案 ">
  <INPUT title=我要提问 onclick="location='ask.jsp';" value=" 我要提问 " type=button>
  
</FORM>
</DIV>




<!--问题列表开始-->
<DIV class=question_list>
<DIV class=question_list_tit>
	<A href="AskSearch.do?act=search&status=0&keyword=&flag=hard&orderby=expiredTime desc">待解决问题</A>|
	<A href="AskSearch.do?act=search&status=0_1&keyword=&flag=reward&orderby=reward desc">高积分问题</A>|
	<A href="AskSearch.do?act=search&status=1&keyword=&flag=resolved&orderby=expiredTime desc">已解决问题</A></DIV>
<DIV class=question_list_main><!--待解决问题开始-->
<DIV class=question_list_con>
<DIV class=center_tit1>
<UL>
  <LI class=center_ico_1><SPAN class=orange>待解决问题</SPAN> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=0&keyword=&flag=hard&orderby=expiredTime desc">更多问题</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

<DIV id="not_solve_question">

<img src="../images/loading.gif" />

</DIV>

</DIV></DIV><!--待解决问题结束--><!--高积分问题开始-->
<DIV class=question_list_con>
<DIV class=center_tit2>
<UL>
  <LI class=center_ico_2><A href="AskSearch.do?act=search&status=0&keyword=&flag=reward&orderby=reward desc"><SPAN 
  class=blue>高积分问题</SPAN></A> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=0&keyword=&flag=reward&orderby=reward desc">更多问题</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

	<DIV id="height_solve_question">

	<img src="../images/loading.gif" />
	
	</DIV>

</DIV></DIV><!--高积分问题结束--><!--已解决问题开始-->
<DIV class=question_list_con>
<DIV class=center_tit2>
<UL>
  <LI class=center_ico_3><SPAN class=green>已解决问题</SPAN> 
  <LI class=center_tit_more><A href="AskSearch.do?act=search&status=1&keyword=&flag=resolved&orderby=expiredTime desc">更多问题</A> </LI></UL>
<DIV class=clear></DIV></DIV>
<DIV class=question_list_table>

<DIV id="already_solve_question">

<img src="../images/loading.gif" />

</DIV>

</DIV></DIV><!--投票中问题结束--></DIV>
<DIV class=question_list_btm></DIV></DIV><!--问题列表结束--></DIV>








<!--热门排行开始-->	
<DIV class=main_right>
	<DIV class=jifen>
		<DIV class="jifen_tit tit_1">热门排行</DIV>
		<DIV style="LINE-HEIGHT: 22px; PADDING-LEFT: 10px" class="jinji_main hottop">
			<DIV id="pop_question">

				<img src="../images/loading.gif" />
			
			</DIV>
		</DIV>
		<DIV class=jinji_btm></DIV>
	</DIV>
<!--热门排行结束-->



<!--右边内容开始-->
<%@ include file="include/siderbar.jsp"%>
<!--右边内容结束-->


<DIV class=clear></DIV></DIV><!--内容结束-->




<!--主结构结束-->
<!--footer开始-->
<!--footer开始-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
