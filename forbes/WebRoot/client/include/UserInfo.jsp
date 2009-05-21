<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script type="text/javascript">
	
	function show(obj, showFlag) {
		if(showFlag == "Y") {
			$("#"+obj).show();			
		}
		else {
			$("#"+obj).hide();
		}
		return false;
	}
</script>
			
			<!--header start-->
			<c:if test="${ not empty sessionScope.CLIENT }">
			
				<ul style="color:#FFFFFF;">
					<li class="myname" style="background:none;"><a href="../client/ClientMain.jsp">${sessionScope.CLIENT.username}</a></li>
					<li class="myspace">
						<h3><a href="../client/ClientMain.jsp" onmouseover="show('myvspace', 'Y');">我的</a></h3>
						<div class="myspace_on myspece_on_l" style="display:none;" id="myvspace"  onclick="show('myvspac', 'N');" onmouseover="show('myvspac', 'Y');"  onmouseout="show('myvspac', 'N');">
							<a href="../client/ClientManageArticle.do?act=list">我的文章</a>
							<a href="../client/ClientManageAsk.do?act=all&status=0_1">我的提问</a>
							<a href="../client/ClientManageArticleFavorite.do?act=list">我的收藏</a>
							<a href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid } " target="_blank">我的空间</a>
							<a href="#">我的评论</a>
							<a href="javascript:void(0);" onclick="show('myvspace', 'N');">关闭</a>
						</div>
					</li>
					<li><a href="../client/ClientLogout.do?act=logout">退出</a></li>
					<li><a href="javascript:void(0);" onclick="openDIV('短消息中心','../client/ClientListNewsFeeds.do?act=in&go=open','800','500');">短消息</a></li>
				
					<li class="myspace">
						<h3><a href="javascript:void(0);" onmouseover="show('applist', 'Y');">应用导航</a></h3>
				
						<div class="myspace_on myspece_on_r"  style="display:none;" id="applist" onmouseover="show('applist', 'Y');"  onmouseout="show('applist', 'N');">
							<a href="${UC_HOME_URL }/index.php" title="创业圈子" target="_blank">创业圈子</a>
							<a href="${UC_BBS_URL }/index.php" title="创业论坛" target="_blank">创业论坛</a>
						</div>
					</li>
					<li><a href="./help.php">帮助</a></li>
				</ul>

			</c:if>
			<c:if test="${ empty sessionScope.CLIENT }">
			
				<ul>					
					<li style="background:none;"><a href="javascript:void(0);" id="loginx" onclick="openDIV('登录','../client/ClientReLogin.jsp','500','350');">登录</a></li>			
					<li><a href="../client/ClientRegister.jsp">注册</a></li>				
					<li><a href="./help.php">帮助</a></li>					
				</ul>
		
			</c:if>