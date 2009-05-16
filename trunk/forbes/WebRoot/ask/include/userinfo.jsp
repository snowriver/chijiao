<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

			<!--header start-->
			<c:if test="${ not empty sessionScope.CLIENT }">
			
				<ul style="color:#FFFFFF;">
				<li class="myname" style="background:none;"><a href="../client/ClientMain.jsp">${sessionScope.CLIENT.username}</a></li>
				<li class="myspace"><h3><a href="./vspacecp.php?mid=1" onmouseover="hide($(\'myvspace\'), \'\');" >我的</a></h3>
				<div class="myspace_on myspece_on_l" style="display:none;" id="myvspace" onmouseover="hide($(\'myvspac), \'\');" onmouseout="hide($(\'myvspace\'), \'none\');">
					<a href="./vspacecp.php?script=video&action=list">我的视频</a>
					<a href="./vspacecp.php?script=specials&action=list">我的专辑</a>
					<a href="./vspacecp.php?script=favs&action=list">我的收藏</a>
					<a href="./vspacecp.php?script=subs&action=list">我的订阅</a>
					<a href="./vspacecp.php?script=comments&action=list">我的评论</a>
					<a href="./vspace.php?mid=1">我的空间</a>
				</div>
				</li>
				<li><a href="../client/ClientLogout.do?act=logout">退出</a></li>
				<li><a href="#" onclick="pmwin(\'open\')">短消息</a></li>
				
				<li class="myspace">
				<h3><a href="#" onmouseover="hide($(\'applist\'), \'\');hide($(\'showiframe\'), \'\');">应用导航</a></h3>
				<iframe class="myspace_on_iframebg" name="showiframe" id="showiframe" style="display:none;" frameborder="0" scrolling="no"></iframe>
				<div class="myspace_on myspece_on_r"  style="display:none;" id="applist" onmouseover="hide($(\'applist\'), \'\');hide($(\'showiframe\'), \'\');"  onmouseout="hide($(\'applist\'), \'none\'); hide($(\'showiframe\'), \'none\');"><a href="http://localhost/upload/home" title="���˿ռ�" target="_blank">���˿ռ�</a><a href="http://localhost/upload/bbs" title="Discuz! Board" target="_blank">Discuz! Board</a></div>
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
