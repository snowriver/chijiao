<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"><head> 
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' /> 
<title>��վ��Ա����</title> 
<link href="css_body.css" rel="stylesheet" type="text/css" />
<link href="../css/confirm.css" rel="stylesheet" rev="stylesheet" type="text/css"/>

<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>


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
	
</script>

<style type="text/css"> 
	.rb{ border-right:1px solid #98CAEF }
	.tb{ border-top:1px solid #98CAEF }
</style> 
</head> 
<body> 
<div class="bodytitle"> 
	<div class="bodytitleleft"></div> 
	<div class="bodytitletxt">��Ա����</div> 
</div> 
 
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;"> 
	<tr> 
    	<td height="30" align="center" bgcolor="#FAFCEF"> 
      		<form action="AdminListUser.do?act=client" name="form1" method="post"> 
	    	<table border="0" cellspacing="0" cellpadding="0"> 
          		<tr>
          			<td>&nbsp;�ؼ��֣�</td> 
            		<td width="110" align="center"> 
            			<input name="keyword" type="text" id="keyword" size="12" style="width:100" value="${PARA['keyword'] }" /> 
            		</td>             		
            		<td width="100" align="center">
            			<input name="imageField" type="submit" class="inputbut" value="����" /> 
            		</td> 
          		</tr> 
        	</table> 
	  		</form> 
    	</td> 
	</tr> 
</table> 

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;"> 
	<tr> 
    	<td height="40" colspan="9" bgcolor="#EDF9D5"> 
    		<table width="99%" border="0" cellspacing="0" cellpadding="0"> 
        		<tr> 
          			<td width="29%"><strong>��վ��Ա����</strong></td> 
          			<td width="71%" align="right"> 
	          			<a href="AdminListUser.do?act=client">���л�Ա</a> | 
	          			<a href="#">δ��˻�Ա</a> 
	            		<a href="#">���Ƽ���Ա</a> | 
	            		<a href="#">��Աҵ�����</a> | 
	            		<a href="#">�㿨����</a>
            		</td> 
        		</tr> 
      		</table>
      	</td> 
	</tr> 
  	<tr bgcolor="#FDFEE9" height="40">
  		<td width="5%" align="center">ID</td> 
	    <td width="17%" align="center">�ʺ�/��¼ʱ��</td> 
	    <td width="14%" align="center">������Ϣ</td> 
	    <td width="5%" align="center">�Ա�</td> 
	    <td width="10%" align="center">��ҳ/���</td> 
	    <td width="13%" align="center">����</td> 
	    <td width="9%" align="center">���</td> 
	    <td width="8%" align="center">����</td> 
	    <td align="center">����</td> 
  	</tr> 
  
	<c:forEach items="${USER_LIST}" var="user" varStatus="is"> 
  	<tr height="26" align="center" bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#EDF7D0';" onmouseout="javascript:this.bgColor='#FFFFFF';"> 
    	<td>${user.uid}</td>
    	<td> 
			<a href="member_view.php?ID=1"><u>${user.username }</u></a> <br /> 
			${user.lastlogintime }
    	</td> 
    	<td> 
    		${user.email }<br /> 
      		
      		<img src='img/adminuserico.gif' width='16' height='15' /><font color='red'>(��)</font>
      	</td> 
    	<td>0</td> 
    	<td> 0/ 0 </td> 
    	<td> ע���Ա </td> 
    	<td> 0 </td> 
    	<td> ${user.userDetail.scores } </td> 
    	<td> 
			<table width="98%" border="0" cellspacing="0" cellpadding="0"> 
        		<tr> 
          			<td align="center" height="25"> 
          				<a href="member_view.php?ID=1">����</a> | 
          				<a href="member_do.php?ID=1&dopost=recommend&matt=1">�Ƽ�</a>
          				<a href="content_list.php?memberid=1" target="_blank"></a> | 
          				<a href="#" onclick="return deleteConfirm('AdminUpdateUser.do?act=delete&id=${user.uid}','|AdminListUser.do|act=client|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|','�˲��� �޷��ָ������������أ�����\n\nȷ��Ҫɾ�����û���');">ɾ��</a>
          			</td> 
        		</tr> 
        		<tr> 
         			<td align="center" height="25" style="border-top:1px solid #cccccc"> 
            			<a href="../include/jump.php?gurl=/member/index.php?uid=admin" target="_blank">�ռ�</a> | 
            			<a href="content_list.php?memberid=1" target="_blank">�ĵ�</a> | 
            			<a href="media_main.php?memberid=1" target="_blank">����</a> 
          			</td> 
        		</tr> 
      		</table>
      	</td> 
	</tr> 
	</c:forEach>
  
	<tr bgcolor="#F8FBFB"> 
		<td height="40" colspan="9" align="center">
    
    		�� ${PAGER.totoalPage} ҳ&nbsp;&nbsp;${PAGER.totoalCnt} ����¼&nbsp;&nbsp;
			<A href="AdminListUser.do?act=client&pno=1&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=client&pno=${PAGER.prePage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminListUser.do?act=client&&${PARA['parameter'] }')"> 
				<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
	        		<c:if test="${PAGER.curPage == i}">
				        <OPTION value=${i} selected>${i}</OPTION>
				   	</c:if>
					<c:if test="${PAGER.curPage != i}">
						<OPTION value=${i}>${i}</OPTION>
					</c:if>
				</c:forEach>
 			</SELECT>&nbsp;&nbsp;
                  
        	<A href="AdminListUser.do?act=client&pno=${PAGER.nextPage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=client&pno=${PAGER.totoalPage}&${PARA['parameter'] }">ĩҳ</A>&nbsp;&nbsp;
   
		</td> 
	</tr> 
</table> 
</body> 
</html>