<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<title>����Ա�ʺ�</title> 
<link href="css_body.css" rel="stylesheet" type="text/css" /> 
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

<script type="text/javascript">
		function switchbtn(btn) {
			$('addadmindiv').className = btn == 'addadmin' ? 'tabcontentcur' : '' ;
			$('editpwdiv').className = btn == 'addadmin' ? '' : 'tabcontentcur';

			$('addadmin').className = btn == 'addadmin' ? 'tabcurrent' : '';
			$('editpw').className = btn == 'addadmin' ? '' : 'tabcurrent';

			$('addadmindiv').style.display = btn == 'addadmin' ? '' : 'none';
			$('editpwdiv').style.display = btn == 'addadmin' ? 'none' : '';
		}
		function chkeditpw(theform) {
			if(theform.oldpw.value == '') {
				alert('������ԭ��ʼ������');
				theform.oldpw.focus();
				return false;
			}
			if(theform.newpw.value == '') {
				alert('������������');
				theform.newpw.focus();
				return false;
			}
			if(theform.newpw2.value == '') {
				alert('���ظ�����������');
				theform.newpw2.focus();
				return false;
			}
			if(theform.newpw.value != theform.newpw2.value) {
				alert('������������벻һ��');
				theform.newpw2.focus();
				return false;
			}
			if(theform.newpw.value.length < 6 && !confirm('��������̫�̣����ܻ᲻��ȫ����ȷ���趨��������')) {
				theform.newpw.focus();
				return false;
			}
			return true;
		}
	</script>
	
</head> 
<body> 
<div class="bodytitle"> 
	<div class="bodytitleleft"></div> 
	<div class="bodytitletxt">ϵͳ�ʺŹ���</div> 
</div> 

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;"> 
	<tr> 
    	<td height="30" align="left" bgcolor="#FAFCEF"> 
      		<form action="AdminListUser.do?act=admin" name="form1" method="post" onclick="switchbtn('addadmin');"> 
	    	<table border="0" cellspacing="0" cellpadding="0"> 
          		<tr>
          			<td width="100%">
									
						<table width="622">
							<tr>
								<td width="15%" align="center">�û���:</td>
								<td width="85%"><input type="text" name="addname" class="txt" /></td>
							</tr>
							<tr>
								<td valign="top" align="center">Ȩ����:</td>
								<td>
									<input type="checkbox" name="allowadminsetting" value="1" class="checkbox" checked="checked" />����ı�����
									<input type="checkbox" name="allowadminapp" value="1" class="checkbox" />�������Ӧ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="allowadminuser" value="1" class="checkbox" />��������û�
									<input type="checkbox" name="allowadminbadword" value="1" class="checkbox" checked="checked" />�������������<BR />
									<input type="checkbox" name="allowadmintag" value="1" class="checkbox" checked="checked" />�������TAG 
									<input type="checkbox" name="allowadminpm" value="1" class="checkbox" checked="checked" />����������Ϣ&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="allowadmincredits" value="1" class="checkbox" checked="checked" />����������
									<input type="checkbox" name="allowadmindomain" value="1" class="checkbox" checked="checked" />���������������<BR />
									<input type="checkbox" name="allowadmindb" value="1" class="checkbox" />�����������
									<input type="checkbox" name="allowadminnote" value="1" class="checkbox" checked="checked" />������������б�
									<input type="checkbox" name="allowadmincache" value="1" class="checkbox" checked="checked" />���������
									<input type="checkbox" name="allowadminlog" value="1" class="checkbox" checked="checked" />����鿴��־
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" name="addadmin" value="�� ��" class="btn" />
								</td>
							</tr>
						</table>
				

					</td> 
            		
          		</tr> 
        	</table> 
	  		</form> 
    	</td> 
	</tr> 
</table> 

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;"> 
	<tr> 
    	<td height="40" colspan="7" bgcolor="#EDF9D5"> 
   	  		<table width="96%" border="0" cellspacing="1" cellpadding="1"> 
        		<tr> 
          			<td width="24%"><b>&nbsp;����Ա�ʺ�</b> </td> 
          			<td width="76%" align="right"><b> 
          				<a href="sys_admin_user_add.php"><u>���ӹ���Ա</u></a> |
          				<a href="sys_group.php"><u>�û������</u></a> </b> 
          			</td> 
        		</tr> 
      		</table> 
    	</td> 
  	</tr> 
	<tr bgcolor="#FFFFFF"> 
    	<td height="24" colspan="7">����Ϊ�˷�ֹ���������ϵͳ�������ڹ������ɾ����������Ա�����ȷʵҪɾ���������������ݱ���ɾ����</td> 
  	</tr> 
  	<tr bgcolor="#ECF8FF"  height="40">
  		<td width="5%" height="24" align="center" bgcolor="#EEF5D3">ID</td>  
    	<td width="12%" height="24" align="center" bgcolor="#EEF5D3">��¼��</td> 
    	<td width="13%" align="center" bgcolor="#EEF5D3">Email</td> 
    	<td width="14%" align="center" bgcolor="#EEF5D3">����</td> 
    	<td width="10%" align="center" bgcolor="#EEF5D3">Ƶ��</td> 
    	<td width="25%" align="center" bgcolor="#EEF5D3">�����¼</td> 
    	<td align="center" bgcolor="#EEF5D3">������</td> 
  	</tr> 
   
	<c:forEach items="${USER_LIST}" var="user" varStatus="is">
  	<tr bgcolor="#FFFFFF" align="center" onmousemove="javascript:this.bgColor='#EDF7D0';" onmouseout="javascript:this.bgColor='#FFFFFF';"> 
    	<td>${user.uid }</td> 		
    	<td>${user.username }</td> 
    	<td>${user.username }</td> 
    	<td>��������Ա</td> 
    	<td>��鿴��ϸ</td> 
    	<td>
			xx
		</td> 
    	<td> 
	   		<a href='sys_admin_user_edit.php?ID=1&dopost=edit'><u>����</u></a> | 
     		<a href="#" onclick="return deleteConfirm('AdminUpdateUser.do?act=deladmin&id=${user.uid}','|AdminListUser.do|act=admin|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|','�˲��� �޷��ָ������������أ�����\n\nȷ��Ҫɾ�����û���');"><u>ɾ��</u></a> |
     		<a href='content_list.php?adminid=1'><u>�ĵ�</u></a> |
     		<a href='sys_admin_user_tj.php?ID=1'><u>��ϸͳ��</u></a>����
    	</td> 
	</tr>
	

	</c:forEach>
	
	<tr bgcolor="#ECF8FF"> 
		<td height="40" colspan="7" align="center" valign="middle" bgcolor="#EEF5D3"> 
    		
    		
    		�� ${PAGER.totoalPage} ҳ&nbsp;&nbsp;${PAGER.totoalCnt} ����¼&nbsp;&nbsp;
			<A href="AdminListUser.do?act=admin&pno=1&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.prePage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminListUser.do?act=admin&&${PARA['parameter'] }')"> 
				<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
	        		<c:if test="${PAGER.curPage == i}">
				        <OPTION value=${i} selected>${i}</OPTION>
				   	</c:if>
					<c:if test="${PAGER.curPage != i}">
						<OPTION value=${i}>${i}</OPTION>
					</c:if>
				</c:forEach>
 			</SELECT>&nbsp;&nbsp;
                  
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.nextPage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.totoalPage}&${PARA['parameter'] }">ĩҳ</A>&nbsp;&nbsp;
        	
    	</td> 
	</tr> 
</table> 
</body> 
</html>