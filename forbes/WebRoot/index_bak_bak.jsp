<%@page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="include/gloable.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>${WEB_TITLE }</TITLE>
	
	<META name="GENERATOR" content="MSHTML 8.00.6001.18241">
	<META http-equiv="Content-Type" content="text/html;charset=gbk">
	
	<link type="text/css" rel="stylesheet" href="css/index_global.css" />
	<link type="text/css" rel="stylesheet" href="css/index_style.css" />	 
	<link type="text/css" rel="stylesheet" href="css/index_top.css" />
	


	<SCRIPT type="text/javascript" src="js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<script type="text/javascript" src="js/index_flash.js"></script>
	
	<script type="text/javascript">
		window.onerror=function(){return true;}
		
	    //����һ��n��m֮��k������ͬ��ֵ
	    function randomKdiffer(n,m,k){
	    	arrayK = [];
	    	var i = 0;
	    	var a,m,n,k;
	    	while (i < k) {
	    		a = Math.round(Math.round(Math.random()*(m-n))+n)
	    	 	for (var j = 0; j < i; j++) {
	    	  		if (a == arrayK[j]) {
	    	    		break;
	    	  		}
				}
		    	if (j == i) {
		   			arrayK[i] = a;
		    	  	i++;
		    	}
			}
	    	return arrayK;
	    }
	    
	    function enu(o) {
	    	var tagNode = o ;
	    	cleanWhitespace(tagNode);
	    	var bm = tagNode.childNodes[tagNode.childNodes.length-1];
	    	if (bm.nodeName!="DIV") {
	    	var obj = document.createElement("div");
	    	obj.className="sas";
	    	obj.style.width="120px";
	    	obj.style.height="90px";
	    	tagNode.appendChild(obj);
	    	obj.onmouseout = function() {
	    		    out(o);
	    		}
	    	}
	    }
	    
	    /* ɾ�������� */
	    function out(o) {
	    	var tagNode = o;
	    	cleanWhitespace(tagNode);
	    	var bm = tagNode.childNodes[tagNode.childNodes.length-1];
	    	if (bm.nodeName=="DIV") {
	    		tagNode.removeChild(bm);
	    	}
	    }
	
	 	/* ����հ׽�� */
	    function cleanWhitespace(element) {
	        for (var i = 0;i<element.childNodes.length;i++) {
	        	var node = element.childNodes[i];
	        	if (node.nodeType ==3 && !/\S/.test(node.nodeValue))
	        	node.parentNode.removeChild(node);
	        }
	    }
	
		function listHotVideos(){
			
			$.ajax({
				url: 'IndexVideoList.do',
				type: 'post',
				dataType: 'html',
				data:"act=commend",
				timeout: 10000,
				error: function(){
					$('#ch_30').html("����ʧ�ܣ���ˢ��");
				},
				success: function(rsHtml){					
					$('#ch_30').html(rsHtml);
				}
			});
			
		}
		
		function listNewVideos(){
			
			$.ajax({
				url: 'IndexVideoList.do',
				type: 'post',
				dataType: 'html',
				data:"act=newly",
				timeout: 10000,
				error: function(){
					$('#ch_31').html("����ʧ�ܣ���ˢ��");
				},
				success: function(rsHtml){
					$('#ch_31').html(rsHtml);
				}
			});
			
		}
					
		function listCommendArticles(type, divid){
				$.ajax({
					url: 'IndexArticleList.do',
					type: 'post',
					dataType: 'html',
					data:"act=commend&typeid=" + type,
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
			//listHotVideos();
			//listNewVideos();
			//listCommendArticles(5, "ch_35");
			
			//listCommendArticles(1, "ch_35"); //��ҵ�׶�
			//listCommendArticles(26, "ch_37"); //��ҵͶ��
			
			//listCommendArticles(5, "ch_39"); //��ҵ����
			//listCommendArticles(11, "ch_41"); //���ý���
			
			//listCommendArticles(17, "ch_43"); //��ƹ滮
			//listCommendArticles(10, "ch_45"); //�Ƹ�����
			
			//listCommendArticles(42, "ch_47"); //�ɹ�����
			//listCommendArticles(49, "ch_49"); //��������
			
			//listCommendArticles(35, "ch_51"); //ְ������
			//listCommendArticles(16, "ch_53"); //��������
			
			
			
			//listHotMtag();
			
			//$('#paihang_index').load('GetTopCdbForums.do');
			//$('#hot_mtag').load('GetTopUchomeMtag.do');
			//$('#ch_27').load('GetTopCdbThreads.do');
			
			//$('#scrolltext').load('GetTopUchomeDoing.do');
			
			//$('#ch_21').load('GetTopUchomeBlog.do');
			//$('#ch_23').load('IndexAskList.do?act=hot');
			//$('#ch_11').load('IndexNewsList.do?act=top');
			//$('#ch_9').load('IndexNewsList.do?act=first');
			
			//$('#ch_22').load('IndexArticleList.do?act=hot');
			
	        }
		);
		
		

			
			
			
			
			
	
	</script>
	






</HEAD>
<body class="bodybg">


<!--header��ʼ-->
<%@ include file="include/header.jsp"%>

<!--header����-->

<div style="position: absolute; top: 0px; left: 0px; z-index: 9999;" id="_webim_elems_container_20070814"><div>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" id="soundSWF" align="middle" height="1" width="1">			
	<param name="allowScriptAccess" value="sameDomain">			
	<param name="movie" value="flash/sound.swf">			
	<param name="quality" value="high">			
	<param name="wmode" value="transparent">			
	<param name="bgcolor" value="#A4B6C8">			
	<embed src="flash/sound.swf" quality="high" bgcolor="#A4B6C8" swliveconnect="true" id="soundSWF" name="soundSWF" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" align="middle" height="1" width="1">			
</object></div></div>
<!-- ��׼ͷ��ʼ -->


<div class="area" id="contentA">
	<div class="layoutLeft">
		<div class="blank10b"></div>
		<div class="flashFocus">
			<div class="tt"></div>
			<div>
				<div id="focus_01">
					<embed type="application/x-shockwave-flash" src="flash/focus.swf" id="focus_01" name="focus_01" quality="high" wmode="opaque" flashvars="pics=ad/01.jpg|ad/02.jpg|ad/03.jpg|ad/04.jpg|ad/05.jpg&amp;links=${UC_HOME_URL}|article/index.jsp|video/VideoShow.do?id=5|video/index.jsp|ask/index.jsp&amp;texts=�Ͽ���봴ҵȦ����Ҫ���Ĵ�ҵ���|��ҵ��ѧ|Ӯ���й�|��ҵ��Ƶ|��ҵ����&amp;pic_width=250&amp;pic_height=260&amp;show_text=0&amp;txtcolor=0000ff&amp;bgcolor=DDDDDD&amp;button_pos=2&amp;stop_time=5000" height="260" width="250">
				</div>
				<%@ include file="include/ad.jsp"%>
			</div>
		</div>
	<!--
		<div class="txtBlock">
					</div>-->
		<div class="blank5b"></div>
		<div id="ch_6">
			<a href="${UC_HOME_URL }" target="_blank"><img src="images/index/b.gif" border="0" /></a>		</div>
		<div class="blank5b"></div>

		<div class="videoFocus" id="ch_7">
			<h2><span>����Ⱥ��</span></h2>

<div class="onlineCOM list12" id="hot_mtag">
				<c:set var="img" value="4"></c:set>
				<c:set var="mtag_width" value="98"></c:set>
				
				<table border="0" cellpadding="0" cellspacing="0" width="230">
					<col width="40"><col width="80"><col width="45"><col width="85">
					<tbody>
						<c:forEach items="${UC_HOME_MTAG_LIST}" var="mtag" varStatus="is">
						<c:choose> 
							<c:when test="${is.index == 0}"> 
								<c:set var="img" value="2"></c:set>
							</c:when>
							<c:when test="${is.index == 1}"> 
								<c:set var="img" value="3"></c:set>
							</c:when> 
							<c:otherwise> 
								<c:set var="img" value="4"></c:set>
							</c:otherwise>
						</c:choose>
						<tr>
							<td><span class="numa${is.index + 1 }"></span></td>
							<td><a href="${UC_HOME_URL }/space.php?do=mtag&tagid=${mtag.tagid }" target="_blank">${mtag.tagname }</a></td>
							<td>${mtag.membernum }</td>
							<td><img src="images/index/plan0${img }.gif" alt="" height="5" width="${mtag_width - is.index * 7 }%"></td>
						</tr>
					
						</c:forEach>
					</tbody>
				</table>
</div>		</div>

	</div>
	<div class="layoutCenter">
		<div class="tt" style="cursor: pointer;" onclick="javascript:window.open('home/index.jsp')"></div>
		<div class="newsFocus" id="ch_8">

	<h1><a href=# target="_blank">�μ��������ѻ������Ӯ�������</a></h1>
	<p>[<a href="#" target="_blank">����2008,2009�����Ǿ�"������"</a>][<a href="#" target="_blank">������õ�09��ʮ��"ţ��"</a>]</p>		</div>
		<div class="lineA"></div><div class="blank8"></div>
		<div class="newsFocus" id="ch_9">
			
			<c:forEach items="${FIRST_NEWS_LIST}" var="news" begin="0">	
				<h1><a href="article/NewsView.do?id=${news.id}" target="_blank"><strong><font color="000000">${fn:substring(news.title, 0, 20)}</font></strong></a></h1>		
				<p><a href="article/NewsView.do?id=${news.id}" target="_blank">${fn:substring(news.description, 0, 30)}<BR>${fn:substring(news.description, 31, 60)}</a></p>
			</c:forEach>
		</div>
		<div class="lineA"></div><div class="blank8"></div>
		<div class="newsFocus" id="ch_10">
			

		<div class="listBlock">
			<div class="list14" id="ch_11">
				<ul>
					<c:forEach items="${TOP_NEWS_LIST}" var="news" begin="0"> 
					<li>
						[<a href="article/NewsSearch.do?act=list&orderby=pubdate desc" target="_blank">������Ѷ</a>]
						<a href="article/NewsView.do?id=${news.id}" target="_blank">${fn:substring(news.title, 0, 20)}</a>
					</li>
					
					</c:forEach>
				</ul>
			</div>
			<div class="lineA"></div>
			<div class="list14" id="ch_22">
				<ul>
					<c:forEach items="${HOT_ARTICLE_LIST}" var="article" begin="0"> 
					<li>
						<div style="float:left">
							[<a href="article/ArticleSearch.do?act=list&keyword=&orderby=pubdate desc" target="_blank">��ҵ��ѧ</a>]
							<a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 20)}</a>
						</div>
						<div style="float:right">
							<span align="right"><a href="http://localhost/uc/home/space.php?uid=${article.user.uid}" target="_blank">${fn:substring(article.username, 0, 5)}</a></span>
						</div>
					</li>					
					</c:forEach>
				</ul>
			</div>
			<div class="lineA"></div>
			<div class="list14" id="ch_23">
				<ul>
					<c:forEach items="${ASK_LIST}" var="ask" begin="0"> 
						<li>
							<div style="float:left">
								[<a href="ask/AskSearch.do?act=search&status=0_1&keyword=&flag=newest&orderby=expiredTime%20desc" target="_blank">��ҵ����</a>]<a href="ask/AskView.do?id=${ask.id }" target="_blank">${fn:substring(ask.title, 0, 20)}</a>
							</div>
							<div style="float:right">
								<span><a href="#" target="_blank">${fn:substring(ask.username, 0, 5)}</a></span>
							</div>
						</li>
					
					</c:forEach>
				</ul>
			</div>
		</div>


	  </div>
	</div>
	<div class="layoutRight">
		<div class="blank10b"></div>
		<div class="ppFocus">
			<div id="ch_11">
				<div class="ppselecter" style="position: absolute; display: none;">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr><td style="" class="ppseltit">��ѡ�������û��ʺ�����</td></tr>
							<tr><td height="2"></td></tr>
							<tr><td></td></tr>
						</tbody>
					</table>
				</div>
				<div style="display: none;"></div>
				
				<div class="passportc">
					<iframe frameborder=0 height="100%" marginheight=1 marginwidth=1 src="include/passport.jsp" width="589" bordercolor="#000000" name="I4" noresize scrolling=no>
			</iframe>
			</div>
				<!-- 
				
			-->
				<!-- 	
					<div class="passportc">
					<form method="post" onsubmit="return PassportSC.doLogin();" name="loginform">
						<div class="pptitle"><b>ͬ·��ͨ��֤</b></div>
						<div class="ppcontent" id="ppcontid">
							<ul class="card">
								<div class="error" id="pperrmsg"></div>
								<li>�û��� <input name="email" class="ppinput" autocomplete="off" disableautocomplete="" type="text"></li>
								<li>�ܡ��� <input name="password" class="ppinput" autocomplete="off" disableautocomplete="" type="password"></li><dt>
								<span><input name="persistentcookie" value="1" type="checkbox">��ס����</span>
								<input class="sign" value="�� ¼" onfocus="this.blur()" src="images/index/spacer.gif" alt="�� ¼" type="submit"></dt><dl>
								<a href="#" target="_blank">ע�����û�</a><a href="#" target="_blank">��������</a><a href="#" target="_blank">��������</a></dl>
							</ul>
						</div>
					</form>
					</div>
				-->	
				
			</div>
			
		</div>
		<div class="blank10b"></div>

		<div class="ad260x70">
			<div id="ch_13" class="picCommend">
				<h2><span>Ѱ�Ҵ�ҵ���<img src="images/index/hot.gif" alt="" height="11" width="27"></span><a href="${UC_HOME_URL}/network.php?ac=space" target="_blank">����&gt;&gt;</a></h2>
				<form method="get" target="_blank" action="${UC_HOME_URL}/network.php">
					<BR><p>
					�Ա�<input type="radio" name="sex" value="0" checked> �����Ա�
					<input type="radio" name="sex" value="1"> ˧��
					<input type="radio" name="sex" value="2"> ��Ů
					</p><BR>
					<p>
					����<script type="text/javascript" src="${UC_HOME_URL}/source/script_common.js"></script>
					<script type="text/javascript" src="${UC_HOME_URL}/source/script_city.js"></script>
					<script type="text/javascript">
					<!--
					showprovince('resideprovince', 'residecity', '');
					showcity('residecity', '');
					//-->
					</script>	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="ac" value="space" />
					<input type="hidden" name="searchmode" value="1" /><BR><BR>
					<input type="submit" name="findsubmit" value="Ѱ�Ҵ�ҵ���" class="submit" />
					</p>
				</form>
			</div>
		</div>

		<div class="active" id="ch_14">
			<h2><span>�����</span><a href="#" target="_blank">����&gt;&gt;</a></h2>
			<div class="pt">
				<a href="#" target="_blank"><img src="images/index/log01.jpg" alt="" height="79" width="115"></a>
				<p><a href="${UC_HOME_URL }" target="_blank">�������������һ�仰��¼��ҵ�еĵ��εΣ������ݵط�����־���ϴ�ͼƬ���������һ�������Ϣ�����۸���Ȥ�Ļ��⡣����������</a></p>
			</div>
			<div class="layoutRightx" id="new_user">
					
				<div class="pp">
					<div class="pp">
						<c:forEach items="${USER_LIST}" var="user">
						<LI>
							<a href="${UC_HOME_URL }/space.php?uid=${user.uid }" target="_blank">
								<img src="${UC_CENTER_URL }/avatar.php?uid=${user.uid }&size=small&type=virtual" border="0" height="48" width="48">
							</a>
							<span><a href="${UC_HOME_URL }/space.php?uid=${user.uid }" target="_blank">${user.username }</a></span>						  	
						</LI>
						</c:forEach>
					</div>
				</div>
 	
 			</div>
		</div>
	</div>
	<div class="footer"></div>
</div>

<div class="area" id="contentB">
	<div class="layoutLeft">
		<div class="onlineCOM">
			<h2><span>��̳��������</span><a href="${UC_BBS_URL }" target="_blank">����&gt;&gt;</a></h2>
			<div id="ch_15">
				<div id="paihang_index">
					<c:set var="pic_num" value="4"></c:set>
					<c:set var="width" value="98"></c:set>
					
					<table border=0 cellpadding=0 cellspacing=0 width=230>
						<col width="40"><col width="80"><col width="45"><col width="85">
						<tbody>
							<c:forEach items="${UC_BBS_FORUM_LIST}" var="forum" varStatus="is">
							
								<c:choose>
					       			<c:when test="${is.index == 0}"><c:set var="pic_num" value="2"></c:set></c:when>
									<c:when test="${is.index == 1}"><c:set var="pic_num" value="3"></c:set></c:when>
									<c:otherwise><c:set var="pic_num" value="4"></c:set></c:otherwise>
								</c:choose>
					
								<tr>
									<td><span class=numa${is.index + 1}></span></td>
									<td><a href="${UC_BBS_URL }/forumdisplay.php?fid=${forum.fid }" target="_blank">${forum.name }</a></td>
									<td>${forum.threads }</td>
									<td><img src="images/index/plan0${pic_num }.gif" height="5" width="${width - is.index * 7 }%"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	        	</div>
			</div>

		</div>
	
	</div>
	<div class="layoutCenter">
		<div class="schoolForum">
			<h2><span>�����Ӫ</span></h2>
			<div class="list14" id="ch_21">
				<ul>
				<c:forEach items="${UC_HOME_BLOG_LIST}" var="blog" varStatus="is">						
					<li><a href="${UC_HOME_URL }/space.php?uid=${blog.uid}&do=blog&id=${blog.blogid}" target="_blank">${fn:substring(blog.subject, 0, 20)}</a><span><a href="${UC_HOME_URL }/space.php?uid=${blog.uid}" target="_blank">${fn:substring(blog.username, 0, 5)}</a></span></li>
				</c:forEach>
				</ul>
			</div>
		</div>
				

	</div>
	<div class="layoutRight">

	    <div class="picCommend">
          <h2><span>24Сʱ��̳��������<img src="images/index/hot.gif" alt="" height="11" width="27"></span><a href="${UC_BBS_URL }" target="_blank">����&gt;&gt;</a></h2>
            <div class="list12" id="ch_27">
                <ul>
				<c:forEach items="${UC_BBS_THREAD_LIST}" var="thread" varStatus="is">
					<li><a href="${UC_BBS_URL }/viewthread.php?tid=${thread.tid}" target="_blank">${fn:substring(thread.subject, 0, 15)}</a><span>${thread.views}</span></li> 
				</c:forEach>
				</ul>
            </div>
        </div>

		</div>
	<div class="footer"></div>
</div>

<div class="ad950x120 area" id="adA">



<div id="ADAREA"><div></div></div>



</div>

<div class="area" id="contentC">
	<div class="header" id="ch_29">
		<a href="video/VideoSearch.do?act=search&typeid=1" target="_blank">��ҵ�ɹ�ѧ</a> | 
		<a href="video/VideoSearch.do?act=search&typeid=5" target="_blank">��ҵ��ѧԺ</a> | 
		<a href="video/VideoSearch.do?act=search&typeid=8" target="_blank">Ͷ�����</a> | 
		<a href="video/VideoSearch.do?act=search&typeid=12" target="_blank">ְ������</a> | 
		<a href="video/VideoSearch.do?act=search&typeid=16" target="_blank">��������</a> | &nbsp;	</div>
	<div class="layoutLeft">
		<div class="pp" id="ch_30">
			<UL>
				<c:forEach items="${HOT_VIDEO_LIST}" var="video"> 
				<LI>
					<a href="video/VideoShow.do?id=${video.id}" target="_blank">
						<img src="${video.litpic}" alt="" border="0" height="90" width="120">
					</a>
					<span><a href="video/VideoShow.do?id=${video.id}" target="_blank" id="clubindex_17190">${video.shorttitle}</a></span>
					  	
				</LI>
				</c:forEach>
			</UL>
		</div>
	</div>
	<div class="layoutRight">
		<h2><span>����������Ƶ�Ƽ�</span></h2>
		<div class="list12" id="ch_31">
			<ul>
				<c:forEach items="${NEW_VIDEO_LIST}" var="video" begin="0">
					<li><a href="#" target="_blank">${video.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<!--
<div class="ad950x120 area" id="adB">
	<div>
		<img src="#" width="950" height="120" alt="" />	</div>
</div>
-->

<div class="area" id="sogouFocus">
	<div class="search" id="ch_32">
		<div class="sogou"><a href="#" target="_blank">�ѹ�</a></div>
		<form name="search_sogou" action="#" method="get" target="_blank">
		<input class="tx" name="keywords" type="text"><input name="ok" value="ok" type="hidden">
		<input class="btn" onclick="search_sogou.submit()" type="button">
		</form>
	</div>
	<div class="hotWord" id="ch_33">
	<dl>
		<dt>�����ȴʣ�</dt>
			<dd> <a href="#" target="_blank"><u>��¹</u></a> <a href="#" target="_blank"><u>������</u></a> </dd>
		</dl>

	</div>
</div>

<div class="area" id="contentD">
	<div class="header"></div>
	<div class="contentD clear">
		<div class="titleA">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate desc" target="_blank">��ҵ�׶�</a>��
				<a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc" target="_blank">��ҵͶ��</a>				
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=2&keyword=&orderby=pubdate desc" target="_blank">��ҵ��ѿ�׶�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=3&keyword=&orderby=pubdate desc" target="_blank">��ҵ׼���׶�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=4&keyword=&orderby=pubdate desc" target="_blank">��ҵ���н׶�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=27&keyword=&orderby=pubdate desc" target="_blank">��ҵ����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=28&keyword=&orderby=pubdate desc" target="_blank">��ҵ����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=29&keyword=&orderby=pubdate desc" target="_blank">��ҵ����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=30&keyword=&orderby=pubdate desc" target="_blank">��ҵ��Ŀ</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_34">
				<a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_business.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate desc" target="_blank">��ҵ�׶�</a></span>
			</div>
			<div class="list12" id="ch_35">
				<ul>
					<c:forEach items="${ARTICLE_01_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_36">
				<a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_investment.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc" target="_blank">��ҵͶ��</a></span>
			</div>
			<div class="list12" id="ch_37">
				<ul>
					<c:forEach items="${ARTICLE_26_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	
	
	<div class="contentD clear">
		<div class="titleB">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc" target="_blank">��ҵ����</a>��
				<a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate desc" target="_blank">���ý���</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=6&keyword=&orderby=pubdate desc" target="_blank">�г�Ӫ��</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=7&keyword=&orderby=pubdate desc" target="_blank">�������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=31&keyword=&orderby=pubdate desc" target="_blank">��ҵ�Ļ�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=32&keyword=&orderby=pubdate desc" target="_blank">������Դ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=33&keyword=&orderby=pubdate desc" target="_blank">����Ԣ��</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=34&keyword=&orderby=pubdate desc" target="_blank">������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=57&keyword=&orderby=pubdate desc" target="_blank">�Ŷӽ���</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=12&keyword=&orderby=pubdate desc" target="_blank">��������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=13&keyword=&orderby=pubdate desc" target="_blank">�̽羫Ӣ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=55&keyword=&orderby=pubdate desc" target="_blank">���ù۲�</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_38">
				<a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_enterprise.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc" target="_blank">��ҵ����</a></span>
			</div>
			<div class="list12" id="ch_39">
				<ul>
					<c:forEach items="${ARTICLE_05_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_40">
				<a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_economy.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate desc" target="_blank">���ý���</a></span>
			</div>
			<div class="list12" id="ch_41">
				<ul>
					<c:forEach items="${ARTICLE_11_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	
	<div class="contentD clear">
		<div class="titleC">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc" target="_blank">��ƹ滮</a>��
				<a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc" target="_blank">�Ƹ�����</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=18&keyword=&orderby=pubdate desc" target="_blank">��ƹ���</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=19&keyword=&orderby=pubdate desc" target="_blank">��Ʋ�Ʒ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=23&keyword=&orderby=pubdate desc" target="_blank">��Ʊ֤ȯ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=24&keyword=&orderby=pubdate desc" target="_blank">�������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=25&keyword=&orderby=pubdate desc" target="_blank">��Ƽ���</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=14&keyword=&orderby=pubdate desc" target="_blank">�Ƹ�����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=15&keyword=&orderby=pubdate desc" target="_blank">�������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=41&keyword=&orderby=pubdate desc" target="_blank">����֮��</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc" target="_blank">��ʷ����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=54&keyword=&orderby=pubdate desc" target="_blank">�Ƹ�����</a>				
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_42">
				<a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_financing.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc" target="_blank">��ƹ滮</a></span>
			</div>
			<div class="list12" id="ch_43">
				<ul>
					<c:forEach items="${ARTICLE_17_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_44">
				<a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_fortunelife.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc" target="_blank">�Ƹ�����</a></span>
			</div>
			<div class="list12" id="ch_45">
				<ul>
					<c:forEach items="${ARTICLE_10_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	
	
	<div class="contentD clear">
		<div class="titleD">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc" target="_blank">�ɹ�����</a>��
				<a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc" target="_blank">��������</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=44&keyword=&orderby=pubdate desc" target="_blank">��������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=46&keyword=&orderby=pubdate desc" target="_blank">�ɹ�������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=47&keyword=&orderby=pubdate desc" target="_blank">����ѧ��ɹ�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=48&keyword=&orderby=pubdate desc" target="_blank">��־�ػ�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=50&keyword=&orderby=pubdate desc" target="_blank">���ʹ�ͨ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=51&keyword=&orderby=pubdate desc" target="_blank">ʱ�����</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=52&keyword=&orderby=pubdate desc" target="_blank">��������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=53&keyword=&orderby=pubdate desc" target="_blank">�ݽ�̸��</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_46">
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_winning.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc" target="_blank">�ɹ�����</a></span>
			</div>
			<div class="list12" id="ch_47">
				<ul>
					<c:forEach items="${ARTICLE_42_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_48">
				<a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_ability.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc" target="_blank">��������</a></span>
			</div>
			<div class="list12" id="ch_49">
				<ul>
					<c:forEach items="${ARTICLE_43_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>


	<div class="contentD clear">
		<div class="titleE">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc" target="_blank">ְ������</a>��
				<a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc" target="_blank">��������</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=36&keyword=&orderby=pubdate desc" target="_blank">ְ������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=37&keyword=&orderby=pubdate desc" target="_blank">��ְ��ҵ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=38&keyword=&orderby=pubdate desc" target="_blank">ְ������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=39&keyword=&orderby=pubdate desc" target="_blank">��������</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=56&keyword=&orderby=pubdate desc" target="_blank">ְҵ�滮</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=20&keyword=&orderby=pubdate desc" target="_blank">������ʶ</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=21&keyword=&orderby=pubdate desc" target="_blank">�����˶�</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=22&keyword=&orderby=pubdate desc" target="_blank">ʳ��ҩ��</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_50">
				<a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_promotion.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc" target="_blank">ְ������</a></span>
			</div>
			<div class="list12" id="ch_51">
				<ul>
					<c:forEach items="${ARTICLE_35_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_52">
				<a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc" target="_blank"><img src="images/index/ico_healthiness.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc" target="_blank">��������</a></span>
			</div>
			<div class="list12" id="ch_53">
				<ul>
					<c:forEach items="${ARTICLE_16_LIST}" var="article"> 
					<li>
						��<a href="article/${article.id}.html" target="_blank">
							<c:choose> 
								<c:when test="${fn:length(article.title) > 18}"> 
									<c:out value="${fn:substring(article.title, 0, 17)}" />
								</c:when> 
								<c:otherwise> 
									<c:out value="${article.title}" /> 
								</c:otherwise>
							</c:choose>       
						</a>
						<span>[<a href="article/ArticleSearch.do?act=list&typeid=${article.articleType2.id }&keyword=&orderby=pubdate desc" target="_blank">${article.articleType2.name }</a>]</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
</div>
<div id="ch_58">
<div class="area" id="contentE">
	
</div>
</div>

<div class="area" id="contentF">
	<div id=ch_59>
	<p>
		[<a href=http://www.cyease.com.cn target=_blank>��ҵ����վ</a>]  
		[<a href=http://www.beidouweb.com target=_blank>�����ɹ���</a>]  
		[<a href=http://www.ssol.net target=_blank>�ɹ�������</a>]  
		[<a href=http://www.wabei.com target=_blank>�ڱ���</a>]  
		[<a href="javascript:void(0);" target=_blank>������������</a>] 
		[<a href="javascript:void(0);" target=_blank>Ǣ̸����</a>]</p>
 </div>
</div>








<div class="area">
	<%@ include file="include/foot.jsp"%>
	
</div>
<div id="infoBox1" class="popdown" style="display: none;"></div>








</body></html>