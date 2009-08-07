<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ��ҵ��ѧ - ${NEWS.title }</TITLE>
	<META content="text/html; charset=GBK" http-equiv=Content-Type>
	<META name="Keywords" content="${NEWS.title }" />
	<META name="Description" content="${NEWS.title }" />
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="css/article_view.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	
	<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/feedback.js"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function listComments(id, divid){
			$.ajax({
				url: 'NewsContentSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top&id=" + id,
				timeout: 10000,
				error: function(){
					//alert('System error');
				},
				success: function(rsHtml){
					//alert("#" + divid);
					//alert(rsHtml);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}

		function listLikes(id, divid){
			$.ajax({
				url: 'NewsSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=like&id=" + id,
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

  		function listLoginForm(){
			$.ajax({
				url: 'login_form.jsp',
				type: 'post',
				dataType: 'html',
				data:"",
				timeout: 10000,
				error: function(){
					//alert('System error');
				},
				success: function(rsHtml){
					$("#login_form").html(rsHtml);
				}
			});
		}
	
		$(window).bind("load",function(){
			listComments(${NEWS.id }, "commentinfoDiv1");
			listLikes(${NEWS.id }, "news_about_list");
			listLoginForm();
	    });
    
    
	    function sendJS() {	//��������
	    	
			if($("#content").val().length <1) {
				alert("�������ݲ���Ϊ�գ�");
			}
			else{
				
					$.ajax({
							url: 'NewsContentAdd.do',
							type: 'post',
							dataType: 'html',
							data:"id=${NEWS.id }&content=" + $("#content").val(),
							timeout: 10000,
							error: function(){
								alert("����ʧ�ܣ����Ժ����ԣ�");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("���۳ɹ�!");
									listComments(${NEWS.id }, "commentinfoDiv1");
									$("#login").html("");
									showUserInfo();
								}
								else if(result == 'ALREADY'){
									alert("���Ѿ����۹���!");
									$("#login").html("");
									showUserInfo();
									//listGuestBook(1);
								}
								else {
									alert("����ʧ��!");								
									//listGuestBook(1);ALREADY
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
							url: 'NewsDigg.do',
							type: 'post',
							dataType: 'html',
							data:"id=${NEWS.id}",
							timeout: 10000,
							error: function(){
								alert("����ʧ�ܣ����Ժ�����");
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
		
		
		function textCounter(obj, maxlimit) {
			var currLen = obj.replace(/[^\x00-\xff]/g,"**").length;
			if (currLen > maxlimit)
			{
				$('#remLen').val("����");
				obj = obj.substring(0, maxlimit);
			}
			else
			{
				$('#remLen').val(maxlimit - currLen);
			}
		}
		
		function copyUserHomeToClipBoard() {
     		var clipBoardContent = document.URL;
    		var clipBoardTitle = $("#news_title").val();
      		window.clipboardData.setData("Text",clipBoardTitle + "  " +clipBoardContent);  
         	alert("���Ƴɹ�����ճ�������QQ/MSN���Ƽ�����ĺ��ѣ�\r\n\r\n�������£�\r\n" + clipBoardTitle + "  " +clipBoardContent);  
        }
</SCRIPT>

</HEAD>

<BODY>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->

<!--header��ʼ-->
<c:set var="index" value="article"></c:set>
<%@ include file="include/header.jsp"%>
<!--header����-->

<!--���ṹ��ʼ-->
<DIV id=wrapper>
	<DIV id=container>
	
	<!--��Ѷ��ʼ-->
	<DIV id=news>
		<DIV class=newsmapbg>
			<DIV class=news_map>
				<A href="NewsSearch.do?act=list&orderby=pubdate desc">������Ѷ</A> &gt; ����
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<UL class=news_con_tit>	<LI><H1>${NEWS.title }</H1></LI></UL>
			<INPUT name="news_title" id="news_title" type="hidden" value="${NEWS.title }" />
			<UL class=news_info>
				<LI>
					<SPAN>����ָ��:<SPAN class=numcolor>${NEWS.click }  </SPAN></SPAN>
					<SPAN>����ʱ��: <fmt:formatDate value='${NEWS.pubdate}' pattern='yyyy-MM-dd' /></SPAN>
					<SPAN>��Ϣ��Դ: ${NEWS.source }</SPAN>
					<SPAN>����: ${NEWS.writer }</SPAN>
				</LI>
			</UL>
			
			<UL class=news_con_main>
  				<LI>
  					${NEWS.content }
  					
  					<P align=center>&nbsp;</P>
  					<!-- <P align=right>&nbsp;<A target=_blank href="#">������̳</A></P> -->
  				</LI>
  			</UL>
  			
  			
  			
  			
  			<div class="viewbox">
  			<div class="boxoff">
				<strong>------�ָ���----------------------------</strong>			
            </div>
			<div class="handle">
				<div id='diggCt' class='digg'>
					<div class="digg_num" title="���֣�2 ������1 ������0" id="diggshow">${NEWS.digg }</div>
					<div class="digg_act" id="digg">
						<a href="javascript:void(0);" onclick="Digg();">��һ��</a>				
                 	</div>
				</div><!-- /digg -->
				<div class="context">
					<ul>
						<li>��һƪ��<c:if test="${empty PRE_NEWS}">û����</c:if> <c:if test="${not empty PRE_NEWS}"><a href="NewsView.do?id=${PRE_NEWS.id}">${PRE_NEWS.title}</a></c:if></li>
						<li>��һƪ��<c:if test="${empty NEXT_NEWS}">û����</c:if> <c:if test="${not empty NEXT_NEWS}"><a href="NewsView.do?id=${NEXT_NEWS.id}">${NEXT_NEWS.title}</a></c:if></li>
					</ul>
				</div><!-- /context -->
				<div class="actbox">
					<ul>
						<li id="act-fav"><a href="javascript:void(0)" onclick="openDIV('�ղ�','../client/ClientManageNewsFavorite.do?act=add&id=${NEWS.id }','500','350')">�ղ�</a></li>
						<li id="act-err"><a href="javascript:win_open_bug();">����</a></li>
						<li id="act-pus"><a href="JavaScript:copyUserHomeToClipBoard();">�Ƽ�</a></li>
						<li id="act-pnt"><a href="javascript:void(0);" onclick="javascript:window.print();">��ӡ</a></li>
					</ul>
				</div><!-- /actbox -->
			</div><!-- /handle -->
			</div>
			
			<br />
			
			
			
			
  			<DIV style="TEXT-ALIGN: center; WIDTH: 100%">
  				<P style="DISPLAY: none"><INPUT value=N96 type=hidden name=getLinkWord> </P>
  			</DIV>
  		</DIV>
  		
  		<DIV class=news_about>
  			<DIV class=news_about_tit><A target=_blank href="NewsContentSearch.do?act=list&id=${NEWS.id }">����/�鿴��������</A>(<STRONG><SPAN id=total_con1>${NEWS.contentCnt }</SPAN></STRONG>)</DIV>
			<DIV class=news_about_con>
				<DIV class=news_about_con_1>
				<!--around this table start-->
				
				<DIV id=commentinfoDiv1><img src="images/loading.gif" /></DIV>
				
			</DIV>
			
			<DIV class=news_about_con_2 id="login_form">
				<img src="images/loading.gif" />
			</DIV>
		</DIV>
	</DIV>
<DIV class=news_about>
<DIV class=news_about_tit>���������� <STRONG>${NEWS.title }</STRONG> ����Ѷ</DIV>
<DIV class=news_about_con>
<DIV class=news_correlation id="news_about_list"><!--�����Ѷ��ʼ-->
	
	<!--�����Ѷ��ʼ-->
	<img src="images/loading.gif" />
	<!--�����Ѷ����-->

</DIV></DIV></DIV></DIV><!--��Ѷ����-->

<!--�ұ�����ʼ-->


<%@ include file="include/siderbar.jsp"%>

<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV><!--���ṹ����--><!--footer��ʼ-->

<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer����-->
</BODY></HTML>
