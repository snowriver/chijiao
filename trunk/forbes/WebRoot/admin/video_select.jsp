<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>选择文章</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="main.js"></script>

<script language="javascript">
//获得选中文件的文件名
function getCheckboxItem()
{
	var allSel="";
	if(document.form2.arcID.value) return document.form2.arcID.value;
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(document.form2.arcID[i].checked)
		{
			if(allSel=="")
				allSel = document.form2.arcID[i].value;
			else
				allSel = allSel+","+document.form2.arcID[i].value;
		}
	}
	return allSel;	
}
function selAll()
{
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(!document.form2.arcID[i].checked)
		{
			document.form2.arcID[i].checked=true;
		}
	}
}
function noSelAll()
{
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(document.form2.arcID[i].checked)
		{
			document.form2.arcID[i].checked=false;
		}
	}
}
function ReturnValue()
{
	if(window.opener.document.all.likeid.value==""){
		window.opener.document.all.likeid.value = getCheckboxItem();
	}
	else{
		window.opener.document.all.likeid.value += ","+getCheckboxItem();
	}
	alert("成功增加你选中的ID，你可以继续增加");
	//window.opener=true;
  //window.close();
}
</script>
</head>
<body>


<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">视频维护</div>
</div>
<form name="form2">
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
<tr> 
<td height="24" colspan="9" bgcolor="#EDF9D5">
<strong> §视频列表</strong></td>
</tr>
<tr align="center" bgcolor="#F8FBFB" height="22"> 
<td width="6%">ID</td>
<td width="4%">选择</td>
<td width="40%">视频标题</td>
<td width="20%">录入时间</td>
<td width="20%">类目</td>
<td>图片</td>
</tr>


<c:forEach items="${VIDEO_LIST}" var="video" varStatus="is">
<tr align='center' bgcolor="#FFFFFF"  onMouseMove="javascript:this.bgColor='#EFEFEF';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"> 
<td>${video.id}</td>
<td>
	<input name="arcID" type="checkbox" id="arcID" value="${video.id }" class="np" /></td>
<td align='left'>
<a href='archives_do.php?aid='>
	<u>${video.shorttitle }</u></a></td>
<td><fmt:formatDate value='${video.pubdate }' type='date'/></td>
<td>
	<c:if test="${not empty video.videoType }">  ${video.videoType.name } </c:if>
	<c:if test="${ empty video.videoType }"> 未分类 </c:if>
</td>
<td>
	<c:if test="${ not empty video.litpic }"> <font color="red">(图)</font> </c:if>
</td>
</tr>
</c:forEach>

<tr bgcolor="#F8FBFB"> 
<td height="24" colspan="6" style="padding-top:6px">
&nbsp;
<a href="javascript:selAll();" class="inputbutx">全选</a> 
&nbsp;
<a href="javascript:noSelAll();" class="inputbutx">取消</a> 
&nbsp;
<a href="javascript:ReturnValue();" class="inputbutx">把选定值加到列表</a></td>
</tr>

<tr align="right" bgcolor="#eaf8ce"> 
<td height="20" colspan="6" align="center" bgcolor="#EDF9D5">
	
						共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminUpdateVideo.do?act=select&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideo.do?act=select&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminUpdateVideo.do?act=select&&${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminUpdateVideo.do?act=select&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideo.do?act=select&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
        				
</tr>
</table>
</form>


<form name='form3' action="AdminUpdateVideo.do?act=select" method="post">
<table bgcolor="#FFFFFF" width="96%" border="0" align="center" cellpadding="1" cellspacing="1">
<tr> 
<td height="4"></td>
</tr>
<tr> 
<td height="26" bgcolor="#FFFFFF" style="border: 1px solid #525252;">


<table width='600' border='0' cellpadding='0' cellspacing='0'>
  <tr>
    <td width='90' align='center'>请选择类目：</td>
    <td width='160'>
		<input type="button" name="selbtn" value="请选择类型..." 
			style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
			onclick="SelectVideoType('typeid','selbtn');" />
		<input type="hidden" id="typeid" name="typeid" value="" />
	</td>
    <td width='70'> 关键字： </td>
    <td width='160'><input type='text' name='keyword' value='' style='width:150' />
    </td>
    <td style="padding-top:6px">
    	<input name="imageField" type="submit" class="inputbut" value="搜索" />
    </td>
  </tr>
</table>

</td>
</tr>
<tr> 
<td colspan="2" height="4"></td>
</tr>
</table>
</form>

</body>
</html>