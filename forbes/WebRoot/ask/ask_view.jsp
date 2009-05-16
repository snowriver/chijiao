<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ��ҵ���� - ${ASK.title }</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	<SCRIPT type="text/javascript" src="../js/feedback.js"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function listAnswers(id, divid){
			$.ajax({
				url: 'AskAnswerSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top&id=" + id,
				timeout: 10000,
				error: function(){
					//alert('System error');
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
			listAnswers(${ASK.id }, "reply_answer_div");
			listPopAsks("0_1", "views desc", "pop_question");
	    });
    
    	

	    function sendJS() {	//���ʹ�

			if($("#content").val().length <1) {
				alert("�����ݲ���Ϊ�գ�");
			}
			else{
				
					$.ajax({
							url: 'AnswerQuestion.do',
							type: 'post',
							dataType: 'html',
							data:"id=" + $("#id").val() + "&content=" + $("#content").val()+ "&referto=" + $("#referto").val(),
							timeout: 10000,
							error: function(){
								alert("�ش�ʧ�ܣ����Ժ���ʵ��");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("�ش�ɹ�!");								
									listAnswers($("#id").val(), "reply_answer_div");
								}
								else if(result == 'ALREADY') {
									alert("�Բ�������������Ѿ��ش����!");
								}
								else if(result == 'SELF') {
									alert("�Բ����㲻�ܻش��Լ�������!");
								}
								else {
									alert("�Բ����ύʧ�ܣ������³���!");								
									//listGuestBook(1);
								}
								
							}
						});
			}
		}
		
		
		function Digg() {	//��������
	    	//openDIV('��¼','../client/ClientReLogin.jsp','500','350');
			//alert($("#loginName").val());
			
			
			
				//if($("#userid").val().length <1) {
					//openDIV('��¼','../client/ClientReLogin.jsp','500','350');
				//}
				//alert("Digg");
					$.ajax({
							url: 'ArticleDigg.do',
							type: 'post',
							dataType: 'html',
							data:"id=" + $("#id").val(),
							timeout: 10000,
							error: function(){
								alert("����ʧ����Ո������ԇ");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								$("#diggshow").html(result);
								//$("#digg").attr("disabled","true"); 
								$("#digg").empty();
								$("#digg").append("<center>������</center>");
								
							}
						});
			
		}
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
		


		<DIV class=list_left>
			<!--����������ʼ-->
			<DIV class=sub_nav>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  					<TBODY>
  						<TR>
    						<TD class=sub_nav_tit_left></TD>
    						<TD class=sub_nav_tit_main>
    							<DIV class=sub_nav_ico>
    								
    								<A href="index.jsp">��ҳ</A>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
    								<A href="AskSearch.do?act=search&status=0_1&typeid=${ASK.askType.id }&orderby=expiredTime desc">${ASK.askType.name }</A>&nbsp;&nbsp;&gt;&nbsp;&nbsp;
    								<A href="AskSearch.do?act=search&status=0_1&typeid=${ASK.askType2.id }&orderby=expiredTime desc">${ASK.askType2.name }</A>
    								
    							</DIV>
    						</TD>
    						<TD class=sub_nav_tit_right></TD>
    					</TR>
    				</TBODY>
    			</TABLE>
    		</DIV>
    		<!--������������-->
    		
    		<!--�ʴ����ݿ�ʼ-->
			<DIV class=reply><!--����������⿪ʼ-->
				<DIV class=reply_question>
					<DIV class=reply_tit_1><DIV class=Unsolved><SPAN>�� ${ASK.title }</SPAN></DIV></DIV>

					<DIV class=reply_main_1>
					
						<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  							<TBODY>
  								<TR><TD class=reply_main_1_1>�������ݣ�${ASK.content }�� <BR>${ASK.extra }</TD></TR>
  								<TR>
  									<TD class=reply_main_1_2>
  										�����ߣ� <A target=_blank href="UserView.do?act=ask&uid=${ASK.userId }">${ASK.username }</A> | 
  										�ش���: <SPAN id=askresultSpan>0</SPAN> &nbsp;�����: <SPAN id=hitsnumDiv></SPAN>
      									${ASK.views }
    								</TD>
    							</TR>
    							
    							<TR>
    								<TD>
    								
    									<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        									<TBODY>
        										<TR>
          											<TD class=" reply_main_1_3 xuanshang_ico" width="38%">
          												<SPAN id=askscoreSpan>���ͷ֣�${ASK.reward }</SPAN> 
          												<SPAN style="COLOR: #333; FONT-SIZE: 12px; FONT-WEIGHT: normal" id=asktime></SPAN>
          											</TD>
         											<TD id=show_answer_button class=reply_solve_btn width="16%">
         												<c:if test="${not empty sessionScope.CLIENT}">
         													<INPUT id=answerflag onclick="document.answerForm.content.focus();" src="images/solve_btn.gif" type=image name="">
         												</c:if>
         												<c:if test="${empty sessionScope.CLIENT}">
         													<INPUT id=answerflag onclick="openDIV('��¼','../client/ClientReLogin.jsp','500','350');" src="images/btn_login.gif" type=image name="" value="dddfdf">
         												</c:if>
         											</TD>
										          	<TD style="PADDING-LEFT: 5px" width="20%">
										            	<DIV id=viewvoteresult>
										            		<!-- 
										            		<c:if test="${not empty sessionScope.CLIENT}">
										            			<INPUT style="CURSOR: pointer" class=s_button onclick="ShowDialog('')" value=" " src="images/view_vote_btn.gif" type=image name=button1>
										            		</c:if>
										            		 -->
										            		<c:if test="${empty sessionScope.CLIENT}">
										            			<INPUT style="CURSOR: pointer" class=s_button onclick="window.open('../client/ClientRegister.jsp');" value=" " src="images/btn_reg.gif" type=image name=button1>
										            		</c:if>
										            	 </DIV>
										            </TD>
										          	<TD width="26%" align=right>
										          		<c:if test="${not empty sessionScope.CLIENT && sessionScope.CLIENT.uid == ASK.userId}">
										          			<SPAN id=asknewcon><A onclick="openDIV('�������','ManageAnswer.do?act=getAsk&id=${ASK.id }','650','450');" href="javascript:void(0);">�������</A> | </SPAN>
										          		</c:if>
										          		<SPAN id=askjb><A href="javascript:void(0);" onclick="openDIV('��¼','UserReport.do?act=getask&id=${ASK.id }','700','500');">�ٱ�</A></SPAN>
										           	</TD>
										     	</TR>
										    </TBODY>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</DIV>
				</DIV>
				<!--��������������-->
				
				<!--rightanswer:start-->

<c:if test="${not empty BEST_ASK_ANSWER}">
<DIV class=reply_best id=show_rightanswer>
<DIV class=reply_tit_3>
<DIV class=reply_tit_best_ico>��Ѵ�</DIV></DIV>
<TABLE cellPadding=8 width="100%" border="0">
  <TBODY>
  <TR>
  	<TD class=linktext bgColor=#e4eef3 width=10>&nbsp;</TD>
    <TD class=linktext bgColor=#e4eef3 height=40 bordercolor="#e4eef3">
    	�ش��ߣ�<A target=_blank href="UserView.do?act=ask&uid=${BEST_ASK_ANSWER.userId }"><STRONG>${BEST_ASK_ANSWER.loginName }</STRONG></A>&nbsp;&nbsp;&nbsp;${BEST_ASK_ANSWER.pubdate }
    </TD>
    
  </TR>
  <TR>
  	 <TD bgColor=#fafeff class=text01>&nbsp;</TD>
    <TD bgColor=#fafeff class=text01>
    	&nbsp;${BEST_ASK_ANSWER.content }
      	<c:if test="${not empty BEST_ASK_ANSWER.referTo }"><BR><BR>&nbsp;�ο����ϣ�${BEST_ASK_ANSWER.referTo }</c:if>
      	
      <DIV class=linktext align=right><SPAN id=righterror><A href="#" target=_blank>��������</A> | </SPAN>
     
      <SPAN id=rightjb><A href="javascript:void(0);" onclick="openDIV('��¼','UserReport.do?act=getanswer&id=${BEST_ASK_ANSWER.id }','700','500');">�ٱ�</A>&nbsp;&nbsp;&nbsp;&nbsp;</SPAN>
    
       </DIV></TD>
   
  </TR></TBODY></TABLE>
<TABLE cellPadding=8 width="100%" border=0>
  <TBODY>
  <TR>
  	 <TD bgColor=#e4eef3 height="30">&nbsp;</TD>
    <TD style="FONT-WEIGHT: bold" bgColor=#e4eef3 height="30">������ݣ�</TD></TR>
  <TR>
  	<TD class=reply_best_about></TD>
    <TD class=reply_best_about>
    	<BR>
	</TD>
</TR></TBODY></TABLE></DIV>

</c:if>
					
				<!--rightanswer:end-->
				
				

<!--�ش�ʼ-->






<DIV class=reply_answer id=show_answerlist>
<DIV class=reply_tit_2>
<DIV class=reply_tit_answer_ico>�ش�</DIV></DIV>
<DIV class=reply_main_1>


<DIV id=reply_answer_div><img src="../images/loading.gif" /></DIV>


<!--answerlist:end--></DIV></DIV>
       
       
       
       
       
       
       
<!--�ش����-->

<DIV style="DISPLAY: none" id=newanswerDiv>
<TABLE class=fontv11 border=0 cellSpacing=0 cellPadding=0 width="100%" 
align=center>
  <TBODY>
  <TR>
    <TD height=30>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR class=showask_bg>
          <TD height=30 align=middle>
            <TABLE class=fontv11 border=0 cellSpacing=0 cellPadding=0 
            width="98%">
              <TBODY>
              <TR>
                <TD height=24><IMG align=absMiddle src="" width=12 height=12> 
                  Questioner:<SPAN id=newansweruserDiv></SPAN>&nbsp;&nbsp;<IMG 
                  align=absMiddle src="" width=12 height=12> <SPAN>
                  <SCRIPT>date = new Date();document.write(date.getYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());</SCRIPT>
                  </SPAN></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=wordwrap height=22>
      <DIV id=newanswerconDiv></DIV></TD></TR>
  <TR>
    <TD class=wordwrap height=22><SPAN 
  id=newanswerreferDiv></SPAN></TD></TR></TBODY></TABLE></DIV>
<DIV id=show_operation class=linktext>
<TABLE border=0 cellSpacing=1 cellPadding=5 width="100%">
  <TBODY>
  <TR>
    <TD class=bt01 bgColor=#fafeff align=middle>
    	<c:if test="${not empty sessionScope.CLIENT && sessionScope.CLIENT.uid == ASK.userId}">
    	<A name=op></A>
    	<IMG align=absMiddle src="images/wt_twz.gif" width=12 height=12>
    	����:&nbsp;&nbsp;    	
    	<A href="ManageAnswer.do?act=repeal&id=${ASK.id }">��������</A> 
    	<!-- 
    	<A target=_blank href="#">��߻���</A> | 
    	| <A target=_blank href="#">û������Ĵ� </A>
      	| <A target=_blank href="#">����ͶƱ</A> 
      	-->
      </c:if>
       </TD></TR></TBODY></TABLE></DIV><!--�����ش�ʼ-->
<DIV style="BACKGROUND: #f2f2f2" id=show_answer class=reply_me><A 
name=answer></A>
<DIV class=reply_tit_4>
<DIV class=reply_tit_me_ico>�����ش�</DIV></DIV>
<DIV class=reply_main_2>

<c:if test="${not empty sessionScope.CLIENT}">
<FORM id=answerForm method=post name=answerForm>
<INPUT id=id type=hidden name=id value="${ASK.id }">

<TABLE id=answerTable border=0 cellSpacing=0 cellPadding=0 width="100%">
	<TBODY>
  		<TR>
    		<TD width=70>&nbsp;</TD>
    		<TD class=reply_main_2_tit>${ASK.title }<BR></TD>
    	</TR>
  		<TR>
    		<TD class=reply_me_cankao>��&nbsp;&nbsp;&nbsp;��</TD>
    		<TD><TEXTAREA id=content rows=10 cols=60 name=content></TEXTAREA> </TD>
    	</TR>
		<TR>
    		<TD>&nbsp;</TD>
    		<TD class=reply_note>�ش𼴿ɵ�2�֣��ش𱻲����������ͷ��Լ�����${ASK.reward }�֡� <A target=_blank href="#">���ֹ���</A><BR>�ش�������10000������ </TD>
  		</TR>
  		<TR>
    		<TD class=reply_me_cankao>�ο�����</TD>
    		<TD class=reply_me_cankao_input><INPUT id=referto maxLength=30 size=55 type=text name=referto></TD>
    	</TR>
		<TR>
    		<TD>&nbsp;</TD>
    		<TD>�����Ļش��Ǵ������ط����ã������������������30������ </TD>
    	</TR>
		<TR>
    		<TD class=reply_me_submit colSpan=2>
      <DIV id=show_answer_msg class=help1 align=left></DIV><INPUT style="CURSOR: pointer" class=s_button onClick="sendJS();" value="" type=button> 
      <INPUT id=classid value=31 type=hidden name=classid> <INPUT id=answerid value=3645 type=hidden name=answerid> <INPUT id=backUrl type=hidden 
      name=backUrl> <INPUT id=Work value=AddAnswer type=hidden name=Work> <INPUT 
      id=loginuser type=hidden name=loginuser> </TD></TR></TBODY></TABLE>
      </FORM>
 </c:if>     
 <c:if test="${empty sessionScope.CLIENT}">
 
 	<DIV style="TEXT-ALIGN: center; LINE-HEIGHT: 50px; HEIGHT: 50px" id=show_login>
		<a href="javascript:void(0);" id="loginx" onclick="openDIV('��¼','../client/ClientReLogin.jsp','500','350');" style="CURSOR: pointer">
			<FONT style="TEXT-DECORATION: underline" color=#ff6600>���ȵ�¼��������</FONT>
		</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<A style="CURSOR: pointer" target="_blank" href="../client/ClientRegister.jsp">
			<FONT style="TEXT-DECORATION: underline" color=#ff6600>��Ҫע��</FONT>
		</A>
	</DIV>


 </c:if>
 
 
      
      </DIV>


<DIV style="TEXT-ALIGN: right; PADDING-BOTTOM: 10px; PADDING-LEFT: 0px; PADDING-RIGHT: 10px; PADDING-TOP: 0px">
	<A href="../index.jsp">��ҳ</A>| 
	<A style="CURSOR: hand" onclick=history.back() href="javascript:void(0);">����</A> | 
	<A style="CURSOR: hand; TEXT-DECORATION: none" onclick=scroll(0,0) href="AskSearch.do?act=view&id=${ASK.id }#null">����</A> | 
	<A href="javascript:win_open_bug();">����</A></DIV></DIV>

<!--�����ش����--></DIV><!--�ʴ����ݽ���--></DIV>








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
