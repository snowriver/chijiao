<%@ page contentType="text/html; charset=gbk" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="include/gloable.jsp"%>

<%
    com.forbes.ajax.CitySelector cs = new com.forbes.ajax.CitySelector();
	java.util.List provinces = cs.getProvinces();
	request.setAttribute("PROVINCE_LIST", provinces);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<HTML>
<HEAD>
	<TITLE>${WEB_TITLE }</TITLE>
	
	<META http-equiv="Content-Type" content="text/html; charset=gbk" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	
	<link type="text/css" rel="stylesheet" href="css/index_global.css" />
	<link type="text/css" rel="stylesheet" href="css/index_style.css" />	 
	<link type="text/css" rel="stylesheet" href="css/index_top.css" />

	<SCRIPT type="text/javascript" src="js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<script type="text/javascript" src="js/index_flash.js"></script>
	
	<script type="text/javascript">
		window.onerror=function(){return true;}
		
	    //产生一个n到m之间k个不相同的值
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
	    
	    /* 删除浮动层 */
	    function out(o) {
	    	var tagNode = o;
	    	cleanWhitespace(tagNode);
	    	var bm = tagNode.childNodes[tagNode.childNodes.length-1];
	    	if (bm.nodeName=="DIV") {
	    		tagNode.removeChild(bm);
	    	}
	    }
	
	 	/* 清除空白结点 */
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
					$('#ch_30').html("导入失败，请刷新");
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
					$('#ch_31').html("导入失败，请刷新");
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
						$("#" + divid +"").html("导入失败，请刷新");
					},
					success: function(rsHtml){
						//alert("#" + divid);
						$("#" + divid +"").html(rsHtml);
					}
				});
			}
					
		$(window).bind("load",function(){
			listHotVideos();
			listNewVideos();
			//listCommendArticles(5, "ch_35");
			
			listCommendArticles(1, "ch_35"); //创业阶段
			listCommendArticles(26, "ch_37"); //创业投资
			
			listCommendArticles(5, "ch_39"); //企业管理
			listCommendArticles(11, "ch_41"); //经济金融
			
			listCommendArticles(17, "ch_43"); //理财规划
			listCommendArticles(10, "ch_45"); //财富人生
			
			listCommendArticles(42, "ch_47"); //成功激励
			listCommendArticles(49, "ch_49"); //能力提升
			
			listCommendArticles(35, "ch_51"); //职场晋级
			listCommendArticles(16, "ch_53"); //健康养生
			
			
			
			//listHotMtag();
			
			$('#paihang_index').load('GetTopCdbForums.do');
			$('#hot_mtag').load('GetTopUchomeMtag.do');
			$('#ch_27').load('GetTopCdbThreads.do');
			
			//$('#scrolltext').load('GetTopUchomeDoing.do');
			
			$('#new_user').load('IndexUserList.do');
			
			$('#ch_21').load('GetTopUchomeBlog.do');
			$('#ch_23').load('IndexAskList.do?act=hot');
			$('#ch_11').load('IndexNewsList.do?act=top');
			$('#ch_9').load('IndexNewsList.do?act=first');
			
			$('#ch_22').load('IndexArticleList.do?act=hot');
			
	        }
		);

	
	</script>


</HEAD>
<body class="bodybg">

<style> 
 
.Area {width:950px;}
</style>

<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->


<div class="area" id="contentA">
	<div class="layoutLeft">
		<div class="blank10b"></div>
		<div class="flashFocus">
			<div class="tt"></div>
			<div>
				<div id="focus_01">
					<embed type="application/x-shockwave-flash" src="flash/focus.swf" id="focus_01" name="focus_01" quality="high" wmode="opaque" flashvars="pics=ad/01.jpg|ad/02.jpg|ad/03.jpg|ad/04.jpg|ad/05.jpg&amp;links=${UC_HOME_URL}|article/index.jsp|video/VideoShow.do?id=5|video/index.jsp|ask/index.jsp&amp;texts=赶快加入创业圈，需要您的创业伙伴|创业大学|赢在中国|创业视频|创业百问&amp;pic_width=250&amp;pic_height=260&amp;show_text=0&amp;txtcolor=0000ff&amp;bgcolor=DDDDDD&amp;button_pos=2&amp;stop_time=5000" height="260" width="250">
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
			<h2><span>热门群组</span></h2>

<div class="onlineCOM list12" id="hot_mtag">
	<img src="video/images/loading.gif" />
</div>		</div>

	</div>
	<div class="layoutCenter">
		<div class="tt" style="cursor: pointer;" onclick="javascript:window.open('home/index.jsp')"></div>
		<div class="newsFocus" id="ch_8">

	<h1><a href="${UC_HOME_URL }/index.php" target="_blank">参加社区交友活动，与好友分享创业点滴！</a></h1>
	<p>[<a href="${UC_HOME_URL }/index.php" target="_blank">在这里，您可以用一句话记录创业中的点点滴滴，方便快捷地发布日志、与好友们一起分享创业信息、讨论感兴趣的创业话题</a>]</p>		</div>
		<div class="lineA"></div><div class="blank8"></div>
		<div class="newsFocus" id="ch_9">
			
			<img src="video/images/loading.gif" />
		</div>
		<div class="lineA"></div><div class="blank8"></div>
		<div class="newsFocus" id="ch_10">
			

		<div class="listBlock">
			<div class="list14" id="ch_11">
				<img src="video/images/loading.gif" />
			</div>
			<div class="lineA"></div>
			<div class="list14" id="ch_22">
				  <img src="video/images/loading.gif" />
			</div>
			<div class="lineA"></div>
			<div class="list14" id="ch_23">
				  <img src="video/images/loading.gif" />
			</div>
		</div>


	  </div>
	</div>
	<div class="layoutRight">
		<div class="blank10b"></div>
		<div class="ppFocus">
			<div id="ch_11">
				
				<iframe frameborder=0 height="100%" marginheight=1 marginwidth=1 src="client/ClientLogin.do?act=select" bordercolor="#000000" name="I4" noresize scrolling=no></iframe>	
				
			</div>
			
		</div>
		
		<div class="blank10b"></div>

		<div class="ad260x70">
			<div id="ch_13" class="picCommend">
				<h2><span>寻找创业伙伴<img src="images/index/hot.gif" alt="" height="11" width="27"></span><a href="${UC_HOME_URL}/network.php?ac=space" target="_blank">更多&gt;&gt;</a></h2>
				<form method="get" target="_blank" action="${UC_HOME_URL}/network.php">
					<BR><p>
					性别：<input type="radio" name="sex" value="0" checked /> 不限性别
					<input type="radio" name="sex" value="1" /> 帅哥
					<input type="radio" name="sex" value="2" /> 美女
					</p><BR>
					<p>
					区域：<script type="text/javascript" src="js/script_common.js"></script>
					<script type="text/javascript" src="js/script_city.js" charset="gb2312"></script>
					<script type="text/javascript">
					<!--
					showprovince('resideprovince', 'residecity', '');
					showcity('residecity', '');
					//-->
					</script>	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="ac" value="space" />
					<input type="hidden" name="searchmode" value="1" /><BR><BR>
					<input type="submit" name="findsubmit" value="寻找创业伙伴" class="submit" />
					</p>
				</form>
			</div>
		</div>

		<div class="active" id="ch_14">
			<h2><span>活动公告</span><a href="#" target="_blank">更多&gt;&gt;</a></h2>
			<div class="pt">
				<a href="${UC_HOME_URL }" target="_blank"><img src="images/index/log01.jpg" alt="" height="79" width="115"  /></a>
				<p><a href="${UC_HOME_URL }" target="_blank">在这里，您可以用一句话记录创业中的点点滴滴，方便快捷地发布日志、上传图片，与好友们一起分享创业信息、讨论感兴趣的创业话题。。。</a></p>
			</div>
			
			<div class="layoutRightx" id="new_user">
					
					<div class="pp">
					
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48"  />
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">1xxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">2xxxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">3xxxxx</a></span>						  	
					</LI>
					
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">4xxxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">5xxxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">6xxxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">7xxxxx</a></span>						  	
					</LI>
					<LI>
						<a href="video/VideoShow.do?id=" target="_blank">
							<img src="http://localhost/uc/ucenter/avatar.php?uid=1&size=small&type=virtual" alt="" border="0" height="48" width="48">
						</a>
						<span><a href="video/VideoShow.do?id=" target="_blank" id="clubindex_17190">8xxxxx</a></span>						  	
					</LI>
					
					<!-- 
					<marquee id="scrolltext" onmouseover="this.stop()" onmouseout="this.start()" 
							 scrollamount="1" scrolldelay="10" direction="up" name="scrolltext" 
							 height="100" width="100%">						
					</marquee>
					 -->
 				</div>
 			
 			</div>
		</div>
	</div>
	<div class="footer"></div>
</div>

<div class="area" id="contentB">
	<div class="layoutLeft">
		<div class="onlineCOM">
			<h2><span>论坛在线排行</span><a href="${UC_BBS_URL }" target="_blank">更多&gt;&gt;</a></h2>
			<div id="ch_15">
				<div id="paihang_index">
					<img src="video/images/loading.gif" />
	        	</div>
			</div>

		</div>
	
	</div>
	<div class="layoutCenter">
		<div class="schoolForum">
			<h2><span>情感阵营</span></h2>
			<div class="list14" id="ch_21">
				<img src="video/images/loading.gif" />


			</div>
		</div>
		
				
	</div>
			
	<div class="layoutRight">

	    <div class="picCommend">
            
<!--follow fun_pics 5788331 0
--><!--1230874796-->
          <h2><span>24小时论坛热贴排行<img src="images/index/hot.gif" alt="" height="11" width="27"></span><a href="${UC_BBS_URL }" target="_blank">更多&gt;&gt;</a></h2>
            <div class="list12" id="ch_27">
                <img src="video/images/loading.gif" />
            </div>
        </div>

		</div>
	<div class="footer"></div>
</div>

<div class="ad950x120 area" id="adA">



<div id="ADAREA"><div></div></div>



</div>
<a name="screen1"></a>
<div class="area" id="contentC">
	<div class="header" id="ch_29">
		<a href="VideoSearch.do?act=search&typeid=1" target="_blank">创业成功学</a> | 
		<a href="VideoSearch.do?act=search&typeid=5" target="_blank">企业商学院</a> | 
		<a href="VideoSearch.do?act=search&typeid=8" target="_blank">投资理财</a> | 
		<a href="VideoSearch.do?act=search&typeid=12" target="_blank">职场人生</a> | 
		<a href="VideoSearch.do?act=search&typeid=16" target="_blank">健康养生</a> | &nbsp;	
	</div>
	<div class="layoutLeft">
		<div class="pp" id="ch_30">
			<img src="video/images/loading.gif" />
		</div>
	</div>
	<div class="layoutRight">
		<h2><span>本周最新视频推荐</span></h2>
		<div class="list12" id="ch_31">
			<img src="video/images/loading.gif" />
		</div>
	</div>
</div>


<div class="ad950x120 area" id="adB">
	<div>
		<img src="images/pic950x120.jpg" width="950" height="120" alt="" />	
		
	</div>
</div>


<!--
<div class="area" id="sogouFocus">
	<div class="search" id="ch_32">
		<div class="sogou"><a href="#" target="_blank">搜狗</a></div>
		<form name="search_sogou" action="#" method="get" target="_blank">
		<input class="tx" name="keywords" type="text"><input name="ok" value="ok" type="hidden">
		<input class="btn" onclick="search_sogou.submit()" type="button">
		</form>
	</div>
	<div class="hotWord" id="ch_33">
	<dl>
		<dt>社区热词：</dt>
			<dd> <a href="#" target="_blank"><u>三鹿</u></a> <a href="#" target="_blank"><u>索马里</u></a> </dd>
		</dl>

	</div>
</div>
-->

<div class="area" id="contentD">
	<div class="header"></div>
	<div class="contentD clear">
		<div class="titleA">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate%20desc" target="_blank">创业阶段</a>、
				<a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate%20desc" target="_blank">创业投资</a>				
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=2&keyword=&orderby=pubdate%20desc" target="_blank">创业萌芽阶段</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=3&keyword=&orderby=pubdate%20desc" target="_blank">创业准备阶段</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=4&keyword=&orderby=pubdate%20desc" target="_blank">创业进行阶段</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=27&keyword=&orderby=pubdate%20desc" target="_blank">创业课堂</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=28&keyword=&orderby=pubdate%20desc" target="_blank">创业故事</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=29&keyword=&orderby=pubdate%20desc" target="_blank">创业融资</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=30&keyword=&orderby=pubdate%20desc" target="_blank">创业项目</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_34">
				<a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_business.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=1&keyword=&orderby=pubdate%20desc" target="_blank">创业阶段</a></span>
			</div>
			<div class="list12" id="ch_35">
				<img src="video/images/loading.gif" />
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_36">
				<a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_investment.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate%20desc" target="_blank">创业投资</a></span>
			</div>
			<div class="list12" id="ch_37">
				<img src="video/images/loading.gif" />
			</div>
		</div>
	</div>

	
	
	<div class="contentD clear">
		<div class="titleB">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate%20desc" target="_blank">企业管理</a>、
				<a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate%20desc" target="_blank">经济金融</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=6&keyword=&orderby=pubdate%20desc" target="_blank">市场营销</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=7&keyword=&orderby=pubdate%20desc" target="_blank">财务管理</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=31&keyword=&orderby=pubdate%20desc" target="_blank">企业文化</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=32&keyword=&orderby=pubdate%20desc" target="_blank">人力资源</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=33&keyword=&orderby=pubdate%20desc" target="_blank">管理寓言</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=34&keyword=&orderby=pubdate%20desc" target="_blank">管理案例</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=57&keyword=&orderby=pubdate%20desc" target="_blank">团队建设</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=12&keyword=&orderby=pubdate%20desc" target="_blank">金融人物</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=13&keyword=&orderby=pubdate%20desc" target="_blank">商界精英</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=55&keyword=&orderby=pubdate%20desc" target="_blank">经济观察</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_38">
				<a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_enterprise.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate%20desc" target="_blank">企业管理</a></span>
			</div>
			<div class="list12" id="ch_39">
				<img src="video/images/loading.gif" />
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_40">
				<a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_economy.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=11&keyword=&orderby=pubdate%20desc" target="_blank">经济金融</a></span>
			</div>
			<div class="list12" id="ch_41">
				<img src="video/images/loading.gif" />
			</div>
		</div>
	</div>

	
	<div class="contentD clear">
		<div class="titleC">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate%20desc" target="_blank">理财规划</a>、
				<a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate%20desc" target="_blank">财富人生</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=18&keyword=&orderby=pubdate%20desc" target="_blank">理财观念</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=19&keyword=&orderby=pubdate%20desc" target="_blank">理财产品</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=23&keyword=&orderby=pubdate%20desc" target="_blank">股票证券</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=24&keyword=&orderby=pubdate%20desc" target="_blank">理财入门</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=25&keyword=&orderby=pubdate%20desc" target="_blank">理财技巧</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=14&keyword=&orderby=pubdate%20desc" target="_blank">财富观念</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=15&keyword=&orderby=pubdate%20desc" target="_blank">人生随感</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=41&keyword=&orderby=pubdate%20desc" target="_blank">修身之道</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc" target="_blank">鉴史增智</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=54&keyword=&orderby=pubdate%20desc" target="_blank">财富故事</a>				
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_42">
				<a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_financing.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate%20desc" target="_blank">理财规划</a></span>
			</div>
			<div class="list12" id="ch_43">
				<img src="video/images/loading.gif" />
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_44">
				<a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_fortunelife.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate%20desc" target="_blank">财富人生</a></span>
			</div>
			<div class="list12" id="ch_45">
				<img src="video/images/loading.gif" />
			</div>
		</div>
	</div>
	
	
	
	<div class="contentD clear">
		<div class="titleD">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc" target="_blank">成功激励</a>、
				<a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate%20desc" target="_blank">能力提升</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=44&keyword=&orderby=pubdate%20desc" target="_blank">格言谚语</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=46&keyword=&orderby=pubdate%20desc" target="_blank">成功人物解读</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=47&keyword=&orderby=pubdate%20desc" target="_blank">心理学与成功</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=48&keyword=&orderby=pubdate%20desc" target="_blank">励志关怀</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=50&keyword=&orderby=pubdate%20desc" target="_blank">交际沟通</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=51&keyword=&orderby=pubdate%20desc" target="_blank">时间管理</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=52&keyword=&orderby=pubdate%20desc" target="_blank">商务礼仪</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=53&keyword=&orderby=pubdate%20desc" target="_blank">演讲谈判</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_46">
				<a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_winning.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate%20desc" target="_blank">成功激励</a></span>
			</div>
			<div class="list12" id="ch_47">
				<img src="video/images/loading.gif" />
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_48">
				<a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_ability.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate%20desc" target="_blank">能力提升</a></span>
			</div>
			<div class="list12" id="ch_49">
				<img src="video/images/loading.gif" />
			</div>
		</div>
	</div>


	<div class="contentD clear">
		<div class="titleE">
			<h2><span>
				<a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate%20desc" target="_blank">职场晋级</a>、
				<a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate%20desc" target="_blank">健康养生</a>
				</span>
				<a href="article/ArticleSearch.do?act=list&typeid=36&keyword=&orderby=pubdate%20desc" target="_blank">职场故事</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=37&keyword=&orderby=pubdate%20desc" target="_blank">求职择业</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=38&keyword=&orderby=pubdate%20desc" target="_blank">职场攻略</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=39&keyword=&orderby=pubdate%20desc" target="_blank">白领生活</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=56&keyword=&orderby=pubdate%20desc" target="_blank">职业规划</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=20&keyword=&orderby=pubdate%20desc" target="_blank">保健常识</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=21&keyword=&orderby=pubdate%20desc" target="_blank">健身运动</a>|
				<a href="article/ArticleSearch.do?act=list&typeid=22&keyword=&orderby=pubdate%20desc" target="_blank">食疗药膳</a>
			</h2>
		</div>
		<div class="layoutLeft">
			<div class="pic" id="ch_50">
				<a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_promotion.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate%20desc" target="_blank">职场晋级</a></span>
			</div>
			<div class="list12" id="ch_51">
				<img src="video/images/loading.gif" />
			</div>
		</div>
		<div class="layoutRight">
			<div class="pic" id="ch_52">
				<a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate%20desc" target="_blank"><img src="images/index/ico_healthiness.jpg" height="178" width="134"></a>
				<span><a href="article/ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate%20desc" target="_blank">健康养生</a></span>
			</div>
			<div class="list12" id="ch_53">
				<img src="video/images/loading.gif" />
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
		[<a href=http://www.cyease.com.cn target=_blank>创业加油站</a>]  
		[<a href=http://www.beidouweb.com target=_blank>北斗成功网</a>]  
		[<a href=http://www.ssol.net target=_blank>成功在线网</a>]  
		[<a href=http://www.wabei.com target=_blank>挖贝网</a>]  
		[<a href="javascript:void(0);" target=_blank>更多友情链接</a>] 
		[<a href="javascript:void(0);" target=_blank>洽谈合作</a>]</p>
 </div>
</div>








<div class="area">
	
<%@ include file="include/foot.jsp"%>

</div>
<div id="infoBox1" class="popdown" style="display: none;"></div>








</body></html>