<%@ page contentType="text/html; charset=gbk" %>

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
						<h3><a href="../client/ClientMain.jsp" onmouseover="show('myvspace', 'Y');">�ҵ�</a></h3>
						<div class="myspace_on myspece_on_l" style="display:none;" id="myvspace"  onclick="show('myvspac', 'N');" onmouseover="show('myvspac', 'Y');"  onmouseout="show('myvspac', 'N');">
							<a href="../client/ClientManageArticle.do?act=list">�ҵ�����</a>
							<a href="../client/ClientManageAsk.do?act=all&status=0_1">�ҵ�����</a>
							<a href="../client/ClientManageArticleFavorite.do?act=list">�ҵ��ղ�</a>
							<a href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid } " target="_blank">�ҵĿռ�</a>
							<a href="#">�ҵ�����</a>
							<a href="javascript:void(0);" onclick="show('myvspace', 'N');">�ر�</a>
						</div>
					</li>
					<li><a href="../client/ClientLogout.do?act=logout">�˳�</a></li>
					<li><a href="javascript:void(0);" onclick="openDIV('����Ϣ����','../client/ClientListNewsFeeds.do?act=in&go=open','800','500');">����Ϣ</a></li>
				
					<li class="myspace">
						<h3><a href="javascript:void(0);" onmouseover="show('applist', 'Y');">Ӧ�õ���</a></h3>
				
						<div class="myspace_on myspece_on_r"  style="display:none;" id="applist" onmouseover="show('applist', 'Y');"  onmouseout="show('applist', 'N');">
							<a href="${UC_HOME_URL }/index.php" title="��ҵȦ��" target="_blank">��ҵȦ��</a>
							<a href="${UC_BBS_URL }/index.php" title="��ҵ��̳" target="_blank">��ҵ��̳</a>
						</div>
					</li>
					<li><a href="./help.php">����</a></li>
				</ul>

			</c:if>
			<c:if test="${ empty sessionScope.CLIENT }">
			
				<ul>					
					<li style="background:none;"><a href="javascript:void(0);" id="loginx" onclick="openDIV('��¼','../client/ClientReLogin.jsp','500','350');">��¼</a></li>			
					<li><a href="../client/ClientRegister.jsp">ע��</a></li>				
					<li><a href="./help.php">����</a></li>					
				</ul>
		
			</c:if>