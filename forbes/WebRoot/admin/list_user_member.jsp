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
</head> 
<body> 
<div class="bodytitle"> 
	<div class="bodytitleleft"></div> 
	<div class="bodytitletxt">团队成员管理</div> 
</div> 

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;"> 
	<tr> 
    	<td height="30" align="center" bgcolor="#FAFCEF"> 
      		<form action="AdminListUser.do?act=admin" name="form1" method="post"> 
	    	<table border="0" cellspacing="0" cellpadding="0"> 
          		<tr>
          			<td>&nbsp;关键字：</td> 
            		<td width="110" align="center"> 
            			<input name="keyword" type="text" id="keyword" size="12" style="width:100" value="${PARA['keyword'] }" /> 
            		</td>             		
            		<td width="100" align="center">
            			<input name="imageField" type="submit" class="inputbut" value="搜索" /> 
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
          			<td width="24%"><b>&nbsp;团队成员帐号</b> </td> 
          			<td width="76%" align="right"><b> 
          				<a href="sys_admin_user_add.php"><u>增加管理员</u></a> |
          				<a href="sys_group.php"><u>用户组管理</u></a> </b> 
          			</td> 
        		</tr> 
      		</table> 
    	</td> 
  	</tr> 
	
  	<tr bgcolor="#ECF8FF"  height="40">
  		<td width="5%" height="24" align="center" bgcolor="#EEF5D3">ID</td>  
    	<td width="12%" height="24" align="center" bgcolor="#EEF5D3">登录名</td> 
    	<td width="13%" align="center" bgcolor="#EEF5D3">名字</td> 
    	<td width="14%" align="center" bgcolor="#EEF5D3">级别</td> 
    	<td width="10%" align="center" bgcolor="#EEF5D3">频道</td> 
    	<td width="25%" align="center" bgcolor="#EEF5D3">最近登录</td> 
    	<td align="center" bgcolor="#EEF5D3">管理项</td> 
  	</tr> 
   
	<c:forEach items="${USER_LIST}" var="user" varStatus="is">
  	<tr bgcolor="#FFFFFF" align="center" onmousemove="javascript:this.bgColor='#EDF7D0';" onmouseout="javascript:this.bgColor='#FFFFFF';"> 
    	<td>${user.id }</td> 		
    	<td>${user.loginName }</td> 
    	<td>${user.name }<br> </td> 
    	<td>超级管理员</td> 
    	<td>请查看详细</td> 
    	<td>
			登录时间：<fmt:formatDate value='${user.lastLoginTime }' type='both' pattern="yyyy-MM-dd HH:mm"/><br />
			IP：${user.lastLoginIp }
		</td> 
    	<td> 
	   		<a href='sys_admin_user_edit.php?ID=1&dopost=edit'><u>更改</u></a> | 
     		<a href="#" onclick="return deleteConfirm('AdminUpdateUser.do?act=delete&id=${user.id}','|AdminListUser.do|act=member|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|','此操作 无法恢复！！！请慎重！！！\n\n确定要删除该用户吗？');"><u>删除</u></a> |
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