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
			//listComments("commentinfoDiv1");
			//listLikes("news_about_list");
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
							url: 'ArticleCommentAdd.do',
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
									listComments("commentinfoDiv1");
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
			<UL class=news_con_tit>	<LI><H1>错误信息</H1></LI></UL><br />
			<UL class=news_info>
				<LI>
					
				</LI>
			</UL>
			
			<UL class=news_con_main>
  				<LI>
  					您访问的文章不存在或者已经被删除！
  					  					
  					<!-- <P align=right>&nbsp;<A target=_blank href="#">进入论坛</A></P> -->
  				</LI>
  			</UL>
  			
  			
  			<div class="viewbox">
  			<div class="boxoff">
				<strong>------分隔线----------------------------</strong>			
            </div>
			
			</div>
			
			<br />
  			
  			
			
		
  			
  			
  		</DIV>
  		
  		
	</DIV>
</DIV>

<!--资讯结束-->

<!--右边栏开始-->

<DIV id=sidebar>
	
  	
  	
  
	
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
