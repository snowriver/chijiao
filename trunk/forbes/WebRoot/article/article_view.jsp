<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%@ include file="../include/gloable.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ${ARTICLE.title }</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name="Keywords" content="${ARTICLE.title }" />
	<META name="Description" content="${ARTICLE.title }" />
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
				url: 'ArticleContentSearch.do',
				type: 'post',
				dataType: 'html',
				data:'act=top&id=' + id,
				timeout: 10000,
				error: function(){
					alert('System error');
				},
				success: function(rsHtml){
					//alert(rsHtml);
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}

		function listLikes(id, divid){
			$.ajax({
				url: 'ArticleSearch.do',
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
			listComments(${ARTICLE.id }, "commentinfoDiv1");
			listLikes(${ARTICLE.id }, "news_about_list");
			listLoginForm();
	    });
    
    	$("#loginx").click(function(){
			openDIV('��¼','../client/ClientReLogin.jsp','500','350');
		});

	    function sendJS() {	//��������
			
			if($("#content").val().length <1) {
				alert("����д��������.");
			}
			if($("#content").val().length >1000) {
				alert("���ݹ����������ܳ�1000����.");
			}
			else{
					$.ajax({
							url: 'ArticleContentAdd.do',
							type: 'post',
							dataType: 'html',
							data:"id=${ARTICLE.id}&content=" + $("#content").val(),
							timeout: 10000,
							error: function(){
								alert("����ʧ����Ո������ԇ");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("���۳ɹ�!");								
									listComments($("#id").val(), "commentinfoDiv1");
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
							url: 'ArticleDigg.do',
							type: 'post',
							dataType: 'html',
							data:"id=${ARTICLE.id }",
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
    		var clipBoardTitle = $("#article_title").val();
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
				<A href="ArticleSearch.do?act=list&orderby=pubdate desc">����</A> &gt;
				<c:if test="${not empty ARTICLE.articleType}"><A href="ArticleSearch.do?act=list&typeid=${ARTICLE.articleType.id}&keyword=&orderby=pubdate desc">${ARTICLE.articleType.name}</A> &gt; </c:if>
				<c:if test="${not empty ARTICLE.articleType2}"><A href="ArticleSearch.do?act=list&typeid=${ARTICLE.articleType2.id}&keyword=&orderby=pubdate desc">${ARTICLE.articleType2.name}</A> &gt; </c:if>
				����
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<UL class=news_con_tit>	<LI><H1>${ARTICLE.title }</H1></LI></UL><br />
			<INPUT name="article_title" id="article_title" type="hidden" value="${ARTICLE.title }" />
			<UL class=news_info>
				<LI>
					<SPAN>����ָ��:<SPAN class=numcolor>${ARTICLE.click }  </SPAN></SPAN>
					<SPAN>����ʱ��: <fmt:formatDate value='${ARTICLE.pubdate}' pattern='yyyy-MM-dd' /></SPAN>
					<SPAN>��Ϣ��Դ: ${ARTICLE.source }</SPAN>
					<SPAN>����: ${ARTICLE.writer }</SPAN>
				</LI>
			</UL>
			
			<UL class=news_con_main>
  				<LI>
  					${ARTICLE.content }
  					  					
  					<!-- <P align=right>&nbsp;<A target=_blank href="#">������̳</A></P> -->
  				</LI>
  			</UL>
  			
  			
  			
  			
  			<div class="viewbox">
  			<div class="boxoff">
				<strong>------�ָ���----------------------------</strong>			
            </div>
			<div class="handle">
				<div id='diggCt' class='digg'>
					<div class="digg_num" title="���֣�2 ������1 ������0" id="diggshow">${ARTICLE.digg }</div>
					<div class="digg_act" id="digg">
						<a href="javascript:void(0);" onclick="Digg();">��һ��</a>				
                 	</div>
				</div><!-- /digg -->
				<div class="context">
					<ul>
						<li>��һƪ��<c:if test="${empty PRE_ARTICLE}">û����</c:if> <c:if test="${not empty PRE_ARTICLE}"><a href="ArticleSearch.do?act=view&id=${PRE_ARTICLE.id}">${PRE_ARTICLE.title}</a></c:if></li>
						<li>��һƪ��<c:if test="${empty NEXT_ARTICLE}">û����</c:if> <c:if test="${not empty NEXT_ARTICLE}"><a href="ArticleSearch.do?act=view&id=${NEXT_ARTICLE.id}">${NEXT_ARTICLE.title}</a></c:if></li>
					</ul>
				</div><!-- /context -->
				<div class="actbox">
					<ul>
						<li id="act-fav"><a href="javascript:void(0)" onclick="openDIV('�ղ�','../client/ClientManageArticleFavorite.do?act=add&id=${ARTICLE.id }','500','350')">�ղ�</a></li>
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
  			<DIV class=news_about_tit><A target=_blank href="ArticleContentSearch.do?act=list&id=${ARTICLE.id }">����/�鿴��������</A>(<STRONG><SPAN id=total_con1>${ARTICLE.contentCnt }</SPAN></STRONG>)</DIV>
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
<DIV class=news_about_tit>���������� <STRONG>${ARTICLE.title }</STRONG> ����Ѷ</DIV>
<DIV class=news_about_con>
<DIV class=news_correlation id=news_about_list>

<!--�����Ѷ��ʼ-->
<img src="images/loading.gif" />
<!--�����Ѷ����-->
</DIV></DIV></DIV></DIV>

<!--��Ѷ����-->

<!--�ұ�����ʼ-->

<DIV id=sidebar>
	<!--��������Ϣ��ʼ-->
	<DIV class=ndsoft>
		<H2>����������</H2>
			<DIV class=con>
				<TABLE cellSpacing=0 cellPadding=0 width="100%">
  					<TBODY>
  						<tr>
						    <td rowspan="3" align="center" valign="middle"><img src="${UC_CENTER_URL }/avatar.php?uid=${ARTICLE.user.uid }&size=small&type=virtual" width="52" height="52" /></td>
						    <td colspan="3">&nbsp;${ARTICLE.username }</td>
						  </tr>
						  <tr>
						    <td colspan="3">&nbsp;<a target="_blank" href="${UC_HOME_URL }/space.php?uid=${ARTICLE.user.uid }">�鿴��ϸ����</a></td>
						  </tr>
						  <tr>
						    <td>&nbsp;��������</td>
						    <td colspan="2">&nbsp;
						    	<c:if test="${empty sessionScope.CLIENT}"><a href="javascript:void(0);">��Ϊ����</a></c:if>
						    	<c:if test="${not empty sessionScope.CLIENT}"><a target="_blank" href="${UC_HOME_URL }/cp.php?ac=friend&op=add&uid=${ARTICLE.user.uid }">��Ϊ����</a></c:if>
						    	
						    </td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;�û��ȼ�:</td>
						    <td colspan="3">&nbsp;�߼���Ա</td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;ע��ʱ��:</td>
						    <td colspan="3">&nbsp;${ARTICLE.user.regdate }</td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;����¼:</td>
						    <td colspan="3">&nbsp;${ARTICLE.user.lastlogintime }</td>
						  </tr>
  					</TBODY>
  				</TABLE>
  			</DIV>
  		</DIV>
  	<!--��������Ϣ����-->
  	
  	<!--�����ȵ㿪ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�������</SPAN></H2>
		<DIV class=con>
			<DIV id="article_type">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${ARTICLE.articleType.articleTypes}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
					  		
					  		<c:forEach items="${ARTICLE_TYPE_LIST}" var="type" begin="0"> 
					  		<TR>
								<TD width="10%" align=middle></TD>
					    		<TD class=daren_name><A class=linktext href="ArticleSearch.do?act=list&typeid=${type.id}&keyword=&orderby=pubdate desc">${type.name}</A></TD>
					    	</TR>					    	
					  		</c:forEach>
					  		
						</TBODY>
					</TABLE>
			</DIV>
		</DIV>
	</DIV>
	<!--�����ȵ����-->
	
<%@ include file="include/siderbar.jsp"%>
</DIV>

<!--�ұ�������-->
<DIV class=clear></DIV></DIV></DIV><!--���ṹ����-->
<!--footer��ʼ-->

<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer����-->
</BODY></HTML>
