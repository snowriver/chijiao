<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%@ include file="../include/gloable.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - ${ARTICLE.title }</TITLE>
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
			openDIV('登录','../client/ClientReLogin.jsp','500','350');
		});

	    function sendJS() {	//发送留言
			
			if($("#content").val().length <1) {
				alert("请填写评论内容.");
			}
			if($("#content").val().length >1000) {
				alert("内容过长，不过能超1000个字.");
			}
			else{
					$.ajax({
							url: 'ArticleContentAdd.do',
							type: 'post',
							dataType: 'html',
							data:"id=${ARTICLE.id}&content=" + $("#content").val(),
							timeout: 10000,
							error: function(){
								alert("留言失敗，請稍後再試");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("评论成功!");								
									listComments($("#id").val(), "commentinfoDiv1");
									$("#login").html("");
									showUserInfo();
								}
								else if(result == 'ALREADY'){
									alert("您已经评论过了!");
									$("#login").html("");
									showUserInfo();
									//listGuestBook(1);
								}
								else {
									alert("评论失败!");								
									//listGuestBook(1);ALREADY
								}								
							}
						});
			}
		}
		
		
		function Digg() {	//发送留言
	    	//openDIV('登录','../client/ClientReLogin.jsp','500','350');
			//alert($("#loginName").val());
			
			
			
				//if($("#userid").val().length <1) {
					//openDIV('登录','../client/ClientReLogin.jsp','500','350');
				//}
				//alert("Digg");
					$.ajax({
							url: 'ArticleDigg.do',
							type: 'post',
							dataType: 'html',
							data:"id=${ARTICLE.id }",
							timeout: 10000,
							error: function(){
								alert("留言失敗，請稍後再試");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								$("#diggshow").html(result);
								//$("#digg").attr("disabled","true"); 
								$("#digg").empty();
								$("#digg").append("<center>顶过了</center>");
								
							}
						});
			
		}
		
		
		function textCounter(obj, maxlimit) {
			var currLen = obj.replace(/[^\x00-\xff]/g,"**").length;
			if (currLen > maxlimit)
			{
				$('#remLen').val("超出");
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
         	alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友！\r\n\r\n内容如下：\r\n" + clipBoardTitle + "  " +clipBoardContent);  
        }
</SCRIPT>


</HEAD>

<BODY>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->

<!--header开始-->
<c:set var="index" value="article"></c:set>
<%@ include file="include/header.jsp"%>
<!--header结束-->

<!--主结构开始-->
<DIV id=wrapper>
	<DIV id=container>
	
	<!--资讯开始-->
	<DIV id=news>
		<DIV class=newsmapbg>
			<DIV class=news_map>
				<A href="ArticleSearch.do?act=list&orderby=pubdate desc">所有</A> &gt;
				<c:if test="${not empty ARTICLE.articleType}"><A href="ArticleSearch.do?act=list&typeid=${ARTICLE.articleType.id}&keyword=&orderby=pubdate desc">${ARTICLE.articleType.name}</A> &gt; </c:if>
				<c:if test="${not empty ARTICLE.articleType2}"><A href="ArticleSearch.do?act=list&typeid=${ARTICLE.articleType2.id}&keyword=&orderby=pubdate desc">${ARTICLE.articleType2.name}</A> &gt; </c:if>
				正文
			</DIV>
		</DIV>
		
		<DIV class=news_content>
			<UL class=news_con_tit>	<LI><H1>${ARTICLE.title }</H1></LI></UL><br />
			<INPUT name="article_title" id="article_title" type="hidden" value="${ARTICLE.title }" />
			<UL class=news_info>
				<LI>
					<SPAN>人气指数:<SPAN class=numcolor>${ARTICLE.click }  </SPAN></SPAN>
					<SPAN>发布时间: <fmt:formatDate value='${ARTICLE.pubdate}' pattern='yyyy-MM-dd' /></SPAN>
					<SPAN>信息来源: ${ARTICLE.source }</SPAN>
					<SPAN>作者: ${ARTICLE.writer }</SPAN>
				</LI>
			</UL>
			
			<UL class=news_con_main>
  				<LI>
  					${ARTICLE.content }
  					  					
  					<!-- <P align=right>&nbsp;<A target=_blank href="#">进入论坛</A></P> -->
  				</LI>
  			</UL>
  			
  			
  			
  			
  			<div class="viewbox">
  			<div class="boxoff">
				<strong>------分隔线----------------------------</strong>			
            </div>
			<div class="handle">
				<div id='diggCt' class='digg'>
					<div class="digg_num" title="积分：2 好评：1 差评：0" id="diggshow">${ARTICLE.digg }</div>
					<div class="digg_act" id="digg">
						<a href="javascript:void(0);" onclick="Digg();">顶一下</a>				
                 	</div>
				</div><!-- /digg -->
				<div class="context">
					<ul>
						<li>上一篇：<c:if test="${empty PRE_ARTICLE}">没有了</c:if> <c:if test="${not empty PRE_ARTICLE}"><a href="ArticleSearch.do?act=view&id=${PRE_ARTICLE.id}">${PRE_ARTICLE.title}</a></c:if></li>
						<li>下一篇：<c:if test="${empty NEXT_ARTICLE}">没有了</c:if> <c:if test="${not empty NEXT_ARTICLE}"><a href="ArticleSearch.do?act=view&id=${NEXT_ARTICLE.id}">${NEXT_ARTICLE.title}</a></c:if></li>
					</ul>
				</div><!-- /context -->
				<div class="actbox">
					<ul>
						<li id="act-fav"><a href="javascript:void(0)" onclick="openDIV('收藏','../client/ClientManageArticleFavorite.do?act=add&id=${ARTICLE.id }','500','350')">收藏</a></li>
						<li id="act-err"><a href="javascript:win_open_bug();">挑错</a></li>
						<li id="act-pus"><a href="JavaScript:copyUserHomeToClipBoard();">推荐</a></li>
						<li id="act-pnt"><a href="javascript:void(0);" onclick="javascript:window.print();">打印</a></li>
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
  			<DIV class=news_about_tit><A target=_blank href="ArticleContentSearch.do?act=list&id=${ARTICLE.id }">发表/查看所有评论</A>(<STRONG><SPAN id=total_con1>${ARTICLE.contentCnt }</SPAN></STRONG>)</DIV>
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
<DIV class=news_about_tit>浏览更多关于 <STRONG>${ARTICLE.title }</STRONG> 的资讯</DIV>
<DIV class=news_about_con>
<DIV class=news_correlation id=news_about_list>

<!--相关资讯开始-->
<img src="images/loading.gif" />
<!--相关资讯结束-->
</DIV></DIV></DIV></DIV>

<!--资讯结束-->

<!--右边栏开始-->

<DIV id=sidebar>
	<!--发布者信息开始-->
	<DIV class=ndsoft>
		<H2>发布者资料</H2>
			<DIV class=con>
				<TABLE cellSpacing=0 cellPadding=0 width="100%">
  					<TBODY>
  						<tr>
						    <td rowspan="3" align="center" valign="middle"><img src="${UC_CENTER_URL }/avatar.php?uid=${ARTICLE.user.uid }&size=small&type=virtual" width="52" height="52" /></td>
						    <td colspan="3">&nbsp;${ARTICLE.username }</td>
						  </tr>
						  <tr>
						    <td colspan="3">&nbsp;<a target="_blank" href="${UC_HOME_URL }/space.php?uid=${ARTICLE.user.uid }">查看详细资料</a></td>
						  </tr>
						  <tr>
						    <td>&nbsp;发送留言</td>
						    <td colspan="2">&nbsp;
						    	<c:if test="${empty sessionScope.CLIENT}"><a href="javascript:void(0);">加为好友</a></c:if>
						    	<c:if test="${not empty sessionScope.CLIENT}"><a target="_blank" href="${UC_HOME_URL }/cp.php?ac=friend&op=add&uid=${ARTICLE.user.uid }">加为好友</a></c:if>
						    	
						    </td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;用户等级:</td>
						    <td colspan="3">&nbsp;高级会员</td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;注册时间:</td>
						    <td colspan="3">&nbsp;${ARTICLE.user.regdate }</td>
						  </tr>
						  <tr>
						    <td align="center">&nbsp;最后登录:</td>
						    <td colspan="3">&nbsp;${ARTICLE.user.lastlogintime }</td>
						  </tr>
  					</TBODY>
  				</TABLE>
  			</DIV>
  		</DIV>
  	<!--发布者信息结束-->
  	
  	<!--本月热点开始-->
	<DIV class=sidebox>
		<H2><SPAN class=left>相关类型</SPAN></H2>
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
	<!--本月热点结束-->
	
<%@ include file="include/siderbar.jsp"%>
</DIV>

<!--右边栏结束-->
<DIV class=clear></DIV></DIV></DIV><!--主结构结束-->
<!--footer开始-->

<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer结束-->
</BODY></HTML>
