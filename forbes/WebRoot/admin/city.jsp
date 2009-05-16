<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>地区管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<link href="css_body.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
<script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>

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
		
		var gotoUrl = "AdminUpdateCity.do?act=modify&id=" + id + "&name=" + name +"&disorder=" + disorder + "&returnUrl=" + returnUrl;
	    self.location= gotoUrl;
	}
</script>

</head>
<body>
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">互动模块</div>
</div>

<form name="form1" action="AdminUpdateCity.do?act=add&returnUrl=|AdminUpdateCity.do|act=list|pno=${PAGER.curPage }|" method="post">

<input type="hidden" name="pid" value="0" />
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
  <tr>
    <td height="20" colspan="2" bgcolor="#EDF9D5">&nbsp;<strong>添加一级地区 </strong></td>
  </tr>
  <tr>
  <td width="150" align="right" bgcolor="#FFFFFF">
   &nbsp;地区名称：</td>
    <td height="35" bgcolor="#FFFFFF"><input type="text" name="name" value="" /></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td height="35" bgcolor="#FFFFFF">&nbsp;
    <input type="submit" name="submit1" value="提交" class="inputbut"/></td>
  </tr>
</table>
</form>

<form name="form2" action="AdminUpdateCity.do?act=add&returnUrl=|AdminUpdateCity.do|act=list|pno=${PAGER.curPage }|" method="post">

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
  <tr>
    <td height="20" colspan="2" bgcolor="#EDF9D5"><strong>&nbsp;添加二级地区</strong></td>
  </tr>
  <tr>
    <td width="150" align="right" bgcolor="#FFFFFF">
	地区名称：</td>
    <td bgcolor="#FFFFFF"><input type="text" name="name" value="" /></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">
    	<select name="pid">
      		<option value="0">所属一级地区</option>
      		<c:forEach items="${ALL_PROVINCE}" var="pro" varStatus="is">
      			<option value="${pro.id }">|- ${pro.name }</option>
      		</c:forEach>
        </select></td>
  </tr>
  <tr>
    <td height="35" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;
    <input type="submit" name="submit2" value="提交" class="inputbut"/></td>
  </tr>
</table>
</form>

<form name="form3" action="area.php" method="post">
<input type="hidden" name="action" value="update" />
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
    <tr>
        <td height="20" bgcolor="#EDF9D5">&nbsp;<strong>编辑地区</strong></td>
    </tr>
      <tr>
        <td bgcolor="#FFFFFF">
<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" style="margin:0px auto" class="tblist">
          <tr>
            <td height="20">编号</td>
            <td height="20">名称</td>
            <td height="20">排序</td>
            <td height="20">管理操作</td>
          </tr>
          <c:forEach items="${PROVINCE_LIST}" var="pro" varStatus="is">
	          <tr bgcolor="#f8f8f7">
	          	<td>${pro.id }</td>
	          	<td><input type="text" id="names[${pro.id }]" name="names[${pro.id }]" value="${pro.name }" /></td>
	          	<td><input type="text" id="disorders[${pro.id }]" name="disorders[${pro.id }]" value="${pro.disorder }" /></td>
	          	<td>
	          		<a href="#" onclick="modifyConfirm('${pro.id}','|AdminUpdateCity.do|act=list|pno=${PAGER.curPage}|');">修改</a> 
	          		<a href="#" onclick="return deleteConfirm('AdminUpdateCity.do?act=delete&id=${pro.id}','|AdminUpdateCity.do|act=list|pno=${PAGER.curPage}|','删除该一级地区，将级联删除该一级地区下的二级地区！！！请慎重！！！\n\n确定要删除该一级地区 吗？');"><u>删除</u></a> 
	          		
	          	</td>
	          </tr>
	          
	          	<c:forEach items="${pro.citys}" var="city" varStatus="is">
	          	<tr>
	          		<td>${city.id }</td>
	          		<td>|-----<input type="text"  id="names[${city.id }]"  name="names[${city.id }]" value="${city.name }" /></td>
          			<td><input type="text" id="disorders[${city.id }]" name="disorders[${city.id }]" value="0" /></td>
          			<td>
          				<a href="#" onclick="modifyConfirm('${city.id}','|AdminUpdateCity.do|act=list|pno=${PAGER.curPage}|');">修改</a> 
          				<a href="#" onclick="return deleteConfirm('AdminUpdateCity.do?act=delete&id=${city.id}','|AdminUpdateCity.do|act=list|pno=${PAGER.curPage}|','此操作不能恢复！！！请慎重！！！\n\n确定要删除该地区吗？');"><u>删除</u></a>
          			</td>
          		</tr>
				</c:forEach>
	          
          
          </c:forEach>
          
          
          
</table></td>
    </tr>
    
    <tr>
        <td height="20" bgcolor="#EDF9D5" align="center" valign="middle">
			共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
			<A href="AdminUpdateCity.do?act=list&pno=1">首页</A>&nbsp;&nbsp;
        	<A href="AdminUpdateCity.do?act=list&pno=${PAGER.prePage}">上页</A>&nbsp;&nbsp;
        
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminUpdateCity.do?act=list')"> 
				<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
	        		<c:if test="${PAGER.curPage == i}">
				        <OPTION value=${i} selected>${i}</OPTION>
				   	</c:if>
					<c:if test="${PAGER.curPage != i}">
						<OPTION value=${i}>${i}</OPTION>
					</c:if>
				</c:forEach>
 			</SELECT>&nbsp;&nbsp;
                  
        	<A href="AdminUpdateCity.do?act=list&pno=${PAGER.nextPage}">下页</A>&nbsp;&nbsp;
        	<A href="AdminUpdateCity.do?act=list&pno=${PAGER.totoalPage}">末页</A>&nbsp;&nbsp;
		</td>
    </tr>
    
      
    </table>
</form>

</body>
</html>