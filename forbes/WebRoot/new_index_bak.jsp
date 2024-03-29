<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="include/gloable.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>${WEB_TITLE }</title>
<script type="text/javascript" src="js/index_flash_1.js"></script>
<link type="text/css" rel="stylesheet" href="css/new_index_global.css" />
<link type="text/css" rel="stylesheet" href="css/new_index_style.css" />
<link type="text/css" rel="stylesheet" href="css/index_top.css" />
 
 
</head>
<body>

<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->

<script type="text/javascript" id="dynamicSrc"></script>


<!-- 标准头开始 -->
<style>  
.Area {width:950px;}
</style>
<!-- 标准头结束 -->
<div class="area" id="contentA">
	<div class="left">
		<div id="flashcontent01"></div>
		<%@ include file="include/new_ad.jsp"%>
		<div class="blank5 whiteBg"></div>
		<div class="box clear">
			<div class="blank5"></div>
			<div class="l">
				<div class="boxA clear">
					<h2><img src="images/pic05.gif" width="74" height="16" alt="" /></h2>
					<table border="0" cellpadding="0" cellspacing="0">
					
					<c:set var="mtag_width" value="98"></c:set>
					<c:forEach items="${UC_HOME_MTAG_LIST}" var="mtag" begin="0" varStatus="is"> 
					
					<tr>					
					<td width="35"><img src="images/number0${is.index+1 }.gif" width="20" height="16" alt="" /></td>
					<td width="60"><a href="${UC_HOME_URL }/space.php?do=mtag&tagid=${mtag.tagid }" target="_blank">${mtag.tagname }</a></td>
					<td width="42">${mtag.membernum }</td>
					<td width="101"><span><img src="images/pic06.gif" width="${mtag_width - is.index * 7 }%" height="4" alt="" /></span></td>
					</tr>
					</c:forEach>
					</table>					
					<div class="line"></div>
				</div>				
				<div class="blank5"></div>				
				<div class="boxB">
					<h2 class="h2BgD"><img src="images/pic07.gif" width="59" height="16" alt="" /></h2>
					<p>
						<c:forEach items="${BULLETIN_LIST}" var="bulletin">
						<a href="javascript:void(0)" 
						onclick="window.open('BulletinView.do?id=${bulletin.id }', 'newwindow', 'height=400,width=600,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')">${bulletin.title }</a><br />
						</c:forEach>
					</p>
					<div class="blank5"></div>
					<div class="lineB"></div>
				</div>
			</div>
			<div class="r">
				<div class="boxA">
					<c:forEach items="${FIRST_NEWS_LIST}" var="news" begin="0">	
					<h1><a href="article/NewsView.do?id=${news.id}" target="_blank"><font COLOR="#FF8A07"><b>${fn:substring(news.title, 0, 20)}</b></font></a></h1>
					<p>[<a href="article/NewsView.do?id=${news.id}" target="_blank"><font color=red>${fn:substring(news.description, 0, 28)}...</font></a>]  </p>				
					</c:forEach>
				</div>
				<div class="boxB">
					<ul>
						<c:forEach items="${TOP_NEWS_LIST}" var="news" begin="0"> 
							<li><span>[<a href="article/NewsSearch.do?act=list&keyword=&orderby=pubdate%20desc" target="_blank">最新资讯</a>]</span><a href="article/NewsView.do?id=${news.id}" target="_blank"><font color=red>${fn:substring(news.title, 0, 16)}</font></a>&nbsp;</li>
						</c:forEach>
					</ul>
					<div class="line"></div>
					<ul>
						<c:forEach items="${HOT_ARTICLE_LIST}" var="article" begin="0"> 
							<li><span>[<a href="article/ArticleSearch.do?act=list&keyword=&orderby=pubdate%20desc" target="_blank">创业大学</a>]</span><a href="article/ArticleView.do?id=${article.id}" target="_blank"><font color=red>${fn:substring(article.title, 0, 16)}</font></a> <a href="${UC_HOME_URL }/space.php?uid=${article.userid}" target="_blank"><span style="font-size:12px;color:#8D4B07;font-family:'宋体'">${fn:substring(article.username, 0, 5)}</span></a></li>
						</c:forEach>
					</ul>
					<div class="line"></div>
					<ul>
						<c:forEach items="${ASK_LIST}" var="ask" begin="0"> 
							<li><span>[<a href="ask/AskSearch.do?act=search&status=0_1&keyword=&flag=newest&orderby=expiredTime%20desc" target="_blank">创业百问</a>]</span><a href="ask/AskView.do?id=${ask.id }" target="_blank"><font color=red>${fn:substring(ask.title, 0, 16)}</font></a> <a href="ask/UserView.do?act=ask&uid=${ask.userId}" target="_blank"><span style="font-size:12px;color:#8D4B07;font-family:'宋体'">${fn:substring(ask.username, 0, 5)}</span></a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="right">
		<iframe src='client/ClientLogin.do?act=select' width=280 height=160 frameborder=0 marginheight=0 marginwidth=0 scrolling=no></iframe>
 
		<div class="blank5 whiteBg"></div><div class="blank5 whiteBg"></div>
		<h2><img src="images/pic03.gif" width="132" height="18" alt="" /></h2>
		<ul>
			<c:forEach items="${UC_HOME_BLOG_LIST}" var="blog" begin="0" varStatus="is"> 
				<li><span>${blog.viewnum }</span><em><img src="images/top0${is.index + 1 }.gif" width="30" height="9" alt="" /></em><a href="${UC_HOME_URL }/space.php?uid=${blog.uid}&do=blog&id=${blog.blogid}" target="_blank">${fn:substring(blog.subject, 0, 20)}</a></li>
			</c:forEach>
			
			</ul>
		<div class="line"></div>
		<div class="blank5 whiteBg"></div><div class="blank5 whiteBg"></div>
		<h2 class="h2BgB"><img src="images/pic04.gif" width="161" height="21" alt="" /></h2>
		<div class="pt">
		<div class="pic"><a href="${UC_HOME_URL }" target="_blank"><img src="images/index/log01.jpg" width="100" height="120" alt="创业圈子" /></a></div>
			<p>
				在这里，您可以用一句话记录创业中的点点滴滴，方便快捷地发布日志、上传图片，与好友们一起分享创业信息、讨论感兴趣的创业话题...
			</p>		
		</div>
	</div>
	<div class="line"></div>
</div>
<div class="area blank5"></div><div class="area blank5"></div>
<div class="area" id="contentB">
	<h2><a name="picture"><img src="images/pic08.gif" width="134" height="18" alt="" border="0" /></a></h2>
	<div class="pp">
		<ul>
			<c:forEach items="${HOT_VIDEO_LIST}" var="video" begin="0"> 
				<li>
					<a href="video/VideoShow.do?id=${video.id }" target="_blank">
						<img src="${video.litpic}" width="170" height="117" alt="" />
					</a>
					<a href="video/VideoShow.do?id=${video.id }" target="_blank"><font color=red>${video.title}</font></a>
				</li>
			</c:forEach>
			
		</ul>
	</div>
	<div class="line"></div>
</div>
<div class="area blank5"></div><div class="area blank5"></div>
<div class="area" id="contentC">
	<h2><img src="images/pic09.gif" width="180" height="19" alt="" /></h2>
	<div class="box clear">
		<div>
			<h3><span>创业阶段</span><a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_01_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<h3><span>创业投资</span><a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_26_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
 
		<div>
			<h3><span>企业管理</span><a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_05_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
 
		<div>
			<h3><span>理财规划</span><a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_17_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
		<span class="lineB"></span>
	</div>
	<div class="box clear">
		<div>
			<h3><span>财富人生</span><a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_10_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<h3><span>成功激励</span><a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_42_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<h3><span>能力提升</span><a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_49_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>	
			</ul>
		</div>
 
		<div>
			<h3><span>职场规划</span><a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate%20desc" target="_blank">更多&gt;&gt;</a></h3>
			<ul>
				<c:forEach items="${ARTICLE_35_LIST}" var="article" begin="0"> 
					<li><a href="article/ArticleView.do?id=${article.id}" target="_blank">${fn:substring(article.title, 0, 15)}</a></li>
				</c:forEach>
			</ul>
		</div>
 
		<span class="lineB"></span>
	</div>
	<div class="line"></div>
</div>
<div class="area blank5"></div><div class="area blank5"></div>
<div class="area" id="contentD">
<div class="turn">
		<span class="now" id="lm1_1" onmouseover="turn(1,7,1)">校园杂谈</span>
		<span id="lm1_2" onmouseover="turn(2,8,1)">华北校园</span>
		<span id="lm1_3" onmouseover="turn(3,8,1)">东北校园</span>
		<span id="lm1_4" onmouseover="turn(4,8,1)">西北校园</span>
		<span id="lm1_5" onmouseover="turn(5,8,1)">华中校园</span>
		<span id="lm1_6" onmouseover="turn(6,8,1)">西南校园</span>
		<span id="lm1_7" onmouseover="turn(7,8,1)">华南校园</span>
		<span id="lm1_8" onmouseover="turn(8,8,1)">华东校园</span>
  </div>
	<div id="content1_1">		
		<p>
			<a href="#" target="_blank">魅力新生</a><br />
			<a href="#" target="_blank">社团联合会</a><br />
		</p>
	</div>
	<div id="content1_2" style="display:none">		
		<p>
			<a href="#" target="_blank">中央音乐学院</a><br />
			<a href="#" target="_blank">北京外国语</a><br />			
		</p>
	</div>
	<div id="content1_3" style="display:none">		
		<p>
			<a href="#" target="_blank">辽宁学生会</a><br />
			<a href="#" target="_blank">黑大</a><br />
			<a href="#" target="_blank">东北财经</a>
		</p>
	</div>
	<div id="content1_4" style="display:none">		
		<p>
			<a href="#" target="_blank">西安欧亚学院</a><br />
			<a href="#" target="_blank">西安外事学院</a><br />
			<a href="#" target="_blank">西安工大</a>
		</p>
	</div>
	<div id="content1_5" style="display:none">		
		<p>
			<a href="#" target="_blank">国防科大</a><br />
			<a href="#" target="_blank">河南工大</a>
		</p>
	</div>
	<div id="content1_6" style="display:none">		
		<p>
			<a href="#" target="_blank">贵州学生会</a><br />
			<a href="#" target="_blank">云南大学</a><br />
			<a href="#" target="_blank">重庆大学</a>
		</p>
	</div>
	<div id="content1_7" style="display:none">		
		<p>
			<a href="#" target="_blank">广东药学院</a><br />
			<a href="#" target="_blank">星海音乐学院</a><br />
			<a href="#" target="_blank">华南农业大学</a>
		</p>
	</div>
	<div id="content1_8" style="display:none">
		
		<p>
			<a href="#" target="_blank">浙江长征职院</a><br />
			<a href="#" target="_blank">浙江学生会</a><br />
			<a href="#" target="_blank">江苏学生会</a><br />
			<a href="#" target="_blank">山东学生会</a><br />
			<a href="#" target="_blank">安徽学生会</a>
		</p>
	</div>	<script type="text/javascript">
	function $(obj) {
		return (document.getElementById(obj))
	}
	function turn(n,m,x){
		for(i=1;i<=m;i++){
			if(i==n){
				$('lm'+x+'_'+i).className="now"
				$('content'+x+'_'+i).style.display=""
			}else{
				$('lm'+x+'_'+i).className=""
				$('content'+x+'_'+i).style.display="none"
			}
		}
	}
	</script>
	<div class="line"></div>
</div>
<div class="area blank5"></div><div class="area blank5"></div>
<div class="area" id="contentE">
	<span class="lineA"></span>
	<div class="boxA">
		<div class="boxB clear">
<h2>友情连接</h2>
			<ul>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			<li><a href="http://www.cyease.com.cn" target="_blank">创业加油站</a></li>
			</ul>		</div>		
	</div>
	<span class="lineB"></span>
</div>
<div class="area blank5"></div><div class="area blank5"></div>

<!-- 标准尾 -->
<div class="area">
<!--start 公司NEWVIEW统计代码-->

<%@ include file="include/foot.jsp"%>

</div>
 
<!-- START WRating v1.0-->

<!-- END WRating v1.0 -->
 
</body>
</html>