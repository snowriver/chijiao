<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<title>管理员帐号</title> 
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
				alert('请输入原创始人密码');
				theform.oldpw.focus();
				return false;
			}
			if(theform.newpw.value == '') {
				alert('请输入新密码');
				theform.newpw.focus();
				return false;
			}
			if(theform.newpw2.value == '') {
				alert('请重复输入新密码');
				theform.newpw2.focus();
				return false;
			}
			if(theform.newpw.value != theform.newpw2.value) {
				alert('两次输入的密码不一致');
				theform.newpw2.focus();
				return false;
			}
			if(theform.newpw.value.length < 6 && !confirm('您的密码太短，可能会不安全，您确定设定此密码吗？')) {
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
	<div class="bodytitletxt">系统帐号管理</div> 
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
								<td width="15%" align="center">用户名:</td>
								<td width="85%"><input type="text" name="addname" class="txt" /></td>
							</tr>
							<tr>
								<td valign="top" align="center">权　限:</td>
								<td>
									<input type="checkbox" name="allowadminsetting" value="1" class="checkbox" checked="checked" />允许改变设置
									<input type="checkbox" name="allowadminapp" value="1" class="checkbox" />允许管理应用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="allowadminuser" value="1" class="checkbox" />允许管理用户
									<input type="checkbox" name="allowadminbadword" value="1" class="checkbox" checked="checked" />允许管理词语过滤<BR />
									<input type="checkbox" name="allowadmintag" value="1" class="checkbox" checked="checked" />允许管理TAG 
									<input type="checkbox" name="allowadminpm" value="1" class="checkbox" checked="checked" />允许管理短消息&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="allowadmincredits" value="1" class="checkbox" checked="checked" />允许管理积分
									<input type="checkbox" name="allowadmindomain" value="1" class="checkbox" checked="checked" />允许管理域名解析<BR />
									<input type="checkbox" name="allowadmindb" value="1" class="checkbox" />允许管理数据
									<input type="checkbox" name="allowadminnote" value="1" class="checkbox" checked="checked" />允许管理数据列表
									<input type="checkbox" name="allowadmincache" value="1" class="checkbox" checked="checked" />允许管理缓存
									<input type="checkbox" name="allowadminlog" value="1" class="checkbox" checked="checked" />允许查看日志
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="submit" name="addadmin" value="提 交" class="btn" />
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
          			<td width="24%"><b>&nbsp;管理员帐号</b> </td> 
          			<td width="76%" align="right"><b> 
          				<a href="sys_admin_user_add.php"><u>增加管理员</u></a> |
          				<a href="sys_group.php"><u>用户组管理</u></a> </b> 
          			</td> 
        		</tr> 
      		</table> 
    	</td> 
  	</tr> 
	<tr bgcolor="#FFFFFF"> 
    	<td height="24" colspan="7">　§为了防止错误操作，系统不允许在管理界面删除超级管理员，如果确实要删除，请自行在数据表中删除。</td> 
  	</tr> 
  	<tr bgcolor="#ECF8FF"  height="40">
  		<td width="5%" height="24" align="center" bgcolor="#EEF5D3">ID</td>  
    	<td width="12%" height="24" align="center" bgcolor="#EEF5D3">登录名</td> 
    	<td width="13%" align="center" bgcolor="#EEF5D3">Email</td> 
    	<td width="14%" align="center" bgcolor="#EEF5D3">级别</td> 
    	<td width="10%" align="center" bgcolor="#EEF5D3">频道</td> 
    	<td width="25%" align="center" bgcolor="#EEF5D3">最近登录</td> 
    	<td align="center" bgcolor="#EEF5D3">管理项</td> 
  	</tr> 
   
	<c:forEach items="${USER_LIST}" var="user" varStatus="is">
  	<tr bgcolor="#FFFFFF" align="center" onmousemove="javascript:this.bgColor='#EDF7D0';" onmouseout="javascript:this.bgColor='#FFFFFF';"> 
    	<td>${user.uid }</td> 		
    	<td>${user.username }</td> 
    	<td>${user.username }</td> 
    	<td>超级管理员</td> 
    	<td>请查看详细</td> 
    	<td>
			xx
		</td> 
    	<td> 
	   		<a href='sys_admin_user_edit.php?ID=1&dopost=edit'><u>更改</u></a> | 
     		<a href="#" onclick="return deleteConfirm('AdminUpdateUser.do?act=deladmin&id=${user.uid}','|AdminListUser.do|act=admin|pno=${PAGER.curPage}|keyWord=${PARA['keyWord'] }|','此操作 无法恢复！！！请慎重！！！\n\n确定要删除该用户吗？');"><u>删除</u></a> |
     		<a href='content_list.php?adminid=1'><u>文档</u></a> |
     		<a href='sys_admin_user_tj.php?ID=1'><u>详细统计</u></a>　　
    	</td> 
	</tr>
	

	</c:forEach>
	
	<tr bgcolor="#ECF8FF"> 
		<td height="40" colspan="7" align="center" valign="middle" bgcolor="#EEF5D3"> 
    		
    		
    		共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
			<A href="AdminListUser.do?act=admin&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
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
                  
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        	<A href="AdminListUser.do?act=admin&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
        	
    	</td> 
	</tr> 
</table> 
</body> 
</html>