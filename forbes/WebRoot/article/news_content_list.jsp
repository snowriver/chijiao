<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	<META content="text/html;charset=GBK" http-equiv="Content-Type">
	<META name="GENERATOR" content="MSHTML 8.00.6001.18241">
	
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="css/article_view.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	<LINK rel=stylesheet type=text/css href="css/article_content_list.css">
	
	<STYLE type="text/css" media=all>
		@import url( css/article_list.css );
	</STYLE>
	
	
	
	<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>

	<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="NewsContentSearch.do?act=list&id=${param.id}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:10,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			listLoginForm();
			}
			
		);
		
		function listLoginForm(){
			$.ajax({
				url: 'login_form_two.jsp',
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
		
		
		function sendJS() {	//��������
			
			if($("#content").val().length <1) {
				alert("����д��������.");
			}
			if($("#content").val().length >1000) {
				alert("���ݹ����������ܳ�1000����.");
			}
			else{
					$.ajax({
							url: 'NewsContentAdd.do',
							type: 'post',
							dataType: 'html',
							data:"id=${NEWS.id}&content=" + $("#content").val(),
							timeout: 10000,
							error: function(){
								alert("����ʧ����Ո������ԇ");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("���۳ɹ�!");								
									//listComments($("#id").val(), "commentinfoDiv1");
									//$("#login").html("");
									//showUserInfo();
									location.reload();
								}
								else if(result == 'ALREADY'){
									alert("���Ѿ����۹���!");
									//$("#login").html("");
									//showUserInfo();
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
		
		function delCommentInfo(id) {	//��������
			
					$.ajax({
							url: 'ContentDelete.do',
							type: 'post',
							dataType: 'html',
							data:"id=" + id,
							timeout: 10000,
							error: function(){
								alert("ɾ��ʧ�ܣ����Ժ�����");
							},
							success: function(rsHtml){
								var result = rsHtml.replace(/(^\s*)|(\s*$)/g,""); 
								//alert(result);
								if(result == 'SUCCESS') {
									alert("ɾ���ɹ�!");								
									//listComments($("#id").val(), "commentinfoDiv1");
									//$("#login").html("");
									//showUserInfo();
									location.reload();
								}
								else {
									alert("ɾ��ʧ�ܣ�������!");								
									//listGuestBook(1);ALREADY
								}								
							}
						});
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
	
	<DIV class=left id=main_left>
<DIV class=pk_ctn>
<DIV class=pk_ctn_top>
<DIV class=pk_ctn_btm><!--comment:title_start-->
<DIV class=current1>
	�����ڵ�λ�ã� 
	<A href="../index.jsp" target=_blank>�����</A> &gt;&gt; 
	<A href="#" target=_blank>��������</A> &gt;&gt; 
	<A href="NewsSearch.do?act=view&id=${NEWS.id }" target=_blank>${NEWS.title }</A>
</DIV><!--admin buttons start-->

<DIV><SPAN id=delbuttonDiv></SPAN></DIV><!--admin buttons end-->

<H5 class=title_1>ԭ�����ӣ�<SPAN class=color_brown><A href="NewsSearch.do?act=view&id=${NEWS.id }" target=_blank>${NEWS.title }</A></SPAN></H5><!--comment:title_end-->
<FORM name=delForm><!--comment:itemlist_start-->


<c:forEach items="${NEWS_CONTENT_LIST}" var="content"> 
<TABLE class=comt_tb id=commentinfo_1738 cellSpacing=0 cellPadding=0 border=0>
	<TBODY>
	<TR>
    	<TD class=comt_title>
    		<SPAN class="comt_boy left"><a target="_blank" href="${UC_HOME_URL }/space.php?uid=${content.user.uid }">${content.username }</a></SPAN>
    		<SPAN class="comt_info left">&nbsp;&nbsp;${content.pubdate }</SPAN> 
    		<SPAN class="alarm right" id=itemId_1738>[<A onclick="window.open('#','_blank','width=480,height=350')" href="javascript:;">�ٱ�</A>] </SPAN>
    		<c:if test="${ sessionScope.CLIENT.uid == content.user.uid || not empty sessionScope.ADMIN }">
    			<SPAN class="del right" id=itemId_1738><A onClick="delCommentInfo('${content.id }')" href="javascript:void(0);">ɾ��</A></SPAN>
    		</c:if>
    		<!-- <SPAN class="quote right" id=itemId_1738><A onclick=javascript:fz(1738) href="#">����</A></SPAN> -->
    		<SPAN id=itemId_1738></SPAN>&nbsp; 
    	</TD>
    </TR>
	<TR>
    	<TD class=comt_ctn><BR>
	    	<!-- 
	    		<SCRIPT>
      			doStr("<div class=\"defind\"><span class=\"defindword\">����&nbsp;������û�&nbsp;���������: </span><br /><div class=\"defindinfo\">${content.content }</div></div>");
      		</SCRIPT>
	    	 -->
      		
      		${content.content }
      		<BR>
      	</TD>
	</TR>
	</TBODY>
</TABLE><!--/���� ѭ��-->
</c:forEach>

<!--comment:itemlist_end--><!--comment:itemlist_end--></FORM><BR><BR>
	<DIV class="pagescroll" class="quote right">			     
		<DIV id="Pagination" class="pagination right"></DIV>
	</DIV> 
<!--comment:page_start-->
<DIV class=pagetext style="MARGIN: auto" align=center>

				 

</DIV><!--comment:page_end--><!--comment:public_start-->
<DIV class=content_4>
<H5 class=title_3>�����ҵĹ۵�</H5>

<DIV id="login_form">
				<img src="images/loading.gif" />
			</DIV>

</DIV><!--comment:public_end-->
<DIV class=clear></DIV></DIV></DIV></DIV></DIV>
	
	<!--��Ѷ����-->

<!--�ұ�����ʼ-->
	
	
	
	<DIV id=sidebar>
	
	<!--�����ȵ㿪ʼ-->
	<DIV class=sidebox>
		<H2><SPAN class=left>�������</SPAN></H2>
		<DIV class=con>
			<DIV id="article_type">
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<c:forEach items="${ARTICLE_TYPE.articleTypes}" var="type" begin="0"> 
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
