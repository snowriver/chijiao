<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<title>�ĵ�����</title>
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="js/context_menu.js"></script>
	<script language="javascript" src="js/ieemu.js"></script>
	<script type="text/javascript" src="main.js"></script>
	<script type="text/javascript" src='js/newslist.js' charset="gb2312"></script>
	
	<script type="text/javascript">	
		function selectOnchange(pageNo, url) {
			var gotoUrl = url + "&pno=" +  pageNo;
		    self.location= gotoUrl;
		}
	
		function deleteConfirm(gotoUrl, returnUrl, alertInfo) {
			var url = gotoUrl + "&returnUrl=" + returnUrl;
			if (confirm(alertInfo) ) {
				location.href = url;
			}
			return false;
		}
		
		function modifyConfirm(id, returnUrl) {
			var name     = document.getElementById("names[" + id + "]").value;
			var disorder = document.getElementById("disorders[" + id + "]").value;
			
			var gotoUrl = "AdminUpdateSector.do?act=modify&id=" + id + "&name=" + name +"&disorder=" + disorder + "&returnUrl=" + returnUrl;
		    self.location= gotoUrl;
		}
		
		
		
	</script>
</head>

<body onLoad="ContextMenu.intializeContextMenu()">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">��Ѷά��</div>
</div>

<table width='96%' border='0' cellpadding='0' cellspacing='0' align="center" class="tbtitle">
	<tr>
		<td align='center' valign='top'>
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" style="background:#E2F5BC;">
				<tr>
    				<td height="26">
    					<table width="98%" border="0" cellspacing="0" cellpadding="0">
     						<tr>
     							<td align="center" style="padding-top:6px">
  									<input type='button' onclick="location='news_add.jsp?&returnUrl=|AdminManageNews.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|';" value='�����Ѷ' class='inputbut' />
  									<c:if test="${empty PARA['userid'] || PARA['userid'] == '' }">
  										<input type='button' onclick="location='AdminUpdateNew.do?act=list&userid=${sessionScope.ADMIN.uid }';" value='�ҵ��ĵ�' class='inputbut' />
  									</c:if>
								  	<c:if test="${not empty PARA['userid'] && PARA['userid'] != '' }">
  										<input type='button' onclick="location='AdminUpdateNew.do?act=list';" value='ȫ���ĵ�' class='inputbut' />
  									</c:if>
  									
									<input type='button' onclick="location='catalog_do.php?channelid=1&cid=0&dopost=listArchives&arcrank=-1&gurl=content_list.php';" value='������' class='inputbut' /> 
									<input type='button' onclick="location='AdminUpdateNewType.do?act=list';" value='������' class='inputbut' />
									<input type='button' onclick="location='makehtml_list.php?cid=0';" value='�����б�' class='inputbut' name='bb1' />
									<input type='button' onclick="location='makehtml_archives.php?cid=0';" value='�����ĵ�' class='inputbut' name='bb2' />
									<input type='button' onclick="location='AdminUpdateNew.do?act=list&deleteFlag=Y';" value='����վ' class='inputbut' name='bb2' />
       							</td>
     						</tr>
    					</table>
    				</td>
    			</tr>
  			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr bgcolor="#FFFFFF">
					<td height="4"></td>
				</tr>
			</table>
			<form method="post" name="form2" action="#">
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
				<tr>
					<td height="24" colspan="10" align="left">
							������Ѷ���� &gt; ��Ѷ�б� &nbsp;(ʹ������Ҽ����г��ò���)
					</td>
				</tr>
				<tr align="center" bgcolor="#F8FBFB" height="22">
					<td width="4%">ID</td>
					<td width="4%">ѡ��</td>
					<td width="26%">��Ѷ����</td>
					<td width="8%">¼��ʱ��</td>				
					<td width="5%">���</td>
					<td width="5%">HTML</td>
					<td width="8%">Ȩ��</td>
					<td width="12%">¼����Ա</td>
					<td width="8%">����</td>
				</tr>

				<c:forEach items="${NEWS_LIST}" var="news" varStatus="is">
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td>${news.id }</td>
					<td><input name="arcID" type="checkbox" id="arcID" value="${news.id }" /></td>
					<td align='left'>
						<a href="javascript:editNews(${news.id }, '|AdminUpdateNew.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" oncontextmenu="ShowMenu(this,3,'CB')">
							<u>${news.shorttitle }
								<font color='blue'>
									<c:if test="${ news.iscommend == 1 }">(��)</c:if>	
								</font>
							</u>
						</a>
					</td>
					<td><fmt:formatDate value='${news.pubdate }' type='date'/></td>
					<td>${news.click }</td>
					<td>������</td>
					<td>�������</td>
					<td>
						
					</td>
					<td>
						<a href="javascript:editNews(${news.id }, '|AdminManageNews.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')">�༭</a> |
						<a href="javascript:viewNews(3)">Ԥ��</a>
					</td>
				</tr>
				</c:forEach>


				<tr bgcolor="#F8FBFB">
					<td height="28" colspan="10" align="left" style="padding-left:6px;padding-top:8px">
						<a href="javascript:selAll()" class="inputbutx">ȫѡ</a>
						<a href="javascript:noSelAll()" class="inputbutx">ȡ��</a>
						<a href="javascript:updateNews(0)" class="inputbutx">����</a>
						<a href="javascript:editNews(0)" class="inputbutx">�༭</a>
						<a href="javascript:adNews('|AdminManageNews.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">�Ƽ�</a>
						<a href="javascript:delNews('|AdminManageNews.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">ɾ��</a>
					</td>
				</tr>

				<tr align="right" bgcolor="#eaf8ce">
					<td height="20" colspan="10" align="center">
						�� ${PAGER.totoalPage} ҳ&nbsp;&nbsp;${PAGER.totoalCnt} ����¼&nbsp;&nbsp;
						<A href="AdminManageNews.do?act=list&pno=1&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AdminManageNews.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageNews.do?act=list&&${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminManageNews.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AdminManageNews.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">ĩҳ</A>&nbsp;&nbsp;
	
					</td>
				</tr>
			</table>
			</form>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
				<tr>
					<td height="4"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #525252;" height="26">
				
				 		<form name="form3" action="AdminManageNews.do?act=list" method="post">
				 			 
							<table width='100%'  border='0' cellpadding='0' cellspacing='1'>
				   				<tr>
				 					<td>
				 						<table border='0' cellpadding='0' cellspacing='0'>
									  		<tr>
									   			
									  			<td width='70'>�ؼ��֣�</td>
									    		<td width='160'><input type='text' name='keyword' value='' style='width:150' /></td>
									    		<td width='110'>
											    	<select name="orderby" style='width:80'>
											            <option value='id'>����...</option>
											            <option value='senddate'>¼��ʱ��</option>
											            <option value='pubdate'>����ʱ��</option>
											            <option value='sortrank'>�ö�Ȩֵ</option>
											            <option value='click'>�����</option>
											            <option value='postnum'>���۴���</option>
											            <option value='lastpost'>�������</option>
											      	</select>
									      		</td>
									     		<td style='padding-top:5px;'><input name="imageField" type="submit" class="inputbut" value="����" /></td>
									    	</tr>
										</table>
									</td>       
	        					</tr>
							</table>
						</form>
	
					</td>
				</tr>
				<tr><td colspan="2" height="4"></td></tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>