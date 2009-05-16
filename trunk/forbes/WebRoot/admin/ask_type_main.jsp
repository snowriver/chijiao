<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<title>问答类别管理</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/context_menu.js"></script>
<script language="javascript" src="js/ieemu.js"></script>

<script language="javascript">
function LoadSuns(ctid,tid)
{
	if(document.getElementById(ctid).innerHTML.length < 10){
	  var myajax = new DedeAjax($DE(ctid),false,true,'-','-','...');
	  myajax.SendGet('catalog_do.php?dopost=GetSunLists&cid='+tid);
	  //DedeXHTTP = null;
  }
  else{ showHide(ctid); }
}
function showHide(objname)
{
   if(document.getElementById(objname).style.display=="none") document.getElementById(objname).style.display = "block";
	 else document.getElementById(objname).style.display="none";
}
if(moz) {
	extendEventObject();
	extendElementModel();
	emulateAttachEvent();
}
//普通栏目
function CommonMenu(obj,tid,returnUrl)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("增加内容",function(){ location="catalog_do.php?cid="+tid+"&dopost=addArchives"; }),
    new ContextItem("管理内容",function(){ location="catalog_do.php?cid="+tid+"&dopost=listArchives"; }),
    new ContextSeperator(),
    new ContextItem("预览分类",function(){ window.open("/plus/list.php?tid="+tid); }),
    new ContextItem("更新HTML",function(){ location="makehtml_list.php?cid="+tid; }),
    new ContextItem("获取JS文件",function(){ location="catalog_do.php?cid="+tid+"&dopost=GetJs"; }),
    new ContextSeperator(),
    new ContextItem("增加子类",function(){ location="catalog_add.php?ID="+tid; }),
    new ContextItem("更改栏目",function(){ location="catalog_edit.php?ID="+tid; }),
    new ContextSeperator(),
    new ContextItem("移动栏目",function(){ location='catalog_move.php?job=movelist&typeid='+tid }),
    new ContextItem("删除栏目",function(){ location="AdminUpdateArticleType.do?act=delete&id="+tid+"&returnUrl="+returnUrl; }),
    new ContextSeperator(),
    new ContextItem("向上排前一级",function(){ location="catalog_do.php?cid="+tid+"&dopost=upRank"; })
  ]
  ContextMenu.display(popupoptions)
}
//互动栏目
function CommonMenuWd(obj,tid,returnUrl)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("预览分类",function(){ window.open("/plus/list.php?tid="+tid); } ),
    new ContextSeperator(),
    new ContextItem("增加内容",function(){location="catalog_do.php?cid="+tid+"&dopost=addArchives";}),
    new ContextItem("管理内容",function(){location="catalog_do.php?cid="+tid+"&dopost=listArchives";}),
    new ContextSeperator(),
    new ContextItem("增加子类",function(){location="catalog_add.php?ID="+tid;}),
    new ContextItem("更改栏目",function(){location="catalog_edit.php?ID="+tid;}),
    new ContextSeperator(),
    new ContextItem("移动栏目",function(){location='catalog_move.php?job=movelist&typeid='+tid}),
    new ContextItem("删除栏目",function(){location="AdminUpdateArticleType.do?act=delete&id="+tid+"&returnUrl="+returnUrl;}),
    new ContextSeperator(),
    new ContextItem("向上排前一级",function(){ location="catalog_do.php?cid="+tid+"&dopost=upRank"; })
  ]
  ContextMenu.display(popupoptions)
}
//封面模板
function CommonMenuPart(obj,tid,returnUrl)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("增加内容",function(){top.document.frames['main'].location="catalog_do.php?cid="+tid+"&dopost=addArchives";}),
    new ContextItem("管理内容",function(){location="catalog_do.php?cid="+tid+"&dopost=listArchives";}),
    new ContextSeperator(),
    new ContextItem("预览分类",function(){ window.open("/plus/list.php?tid="+tid); }),
    new ContextItem("更新HTML",function(){ location="makehtml_list.php?cid="+tid; }),
    new ContextItem("获取JS文件",function(){ location="catalog_do.php?cid="+tid+"&dopost=GetJs"; }),
    new ContextSeperator(),
    new ContextItem("增加子类",function(){location="catalog_add.php?ID="+tid;}),
    new ContextItem("更改栏目",function(){location="catalog_edit.php?ID="+tid;}),
    new ContextSeperator(),
    new ContextItem("移动栏目",function(){location='catalog_move.php?job=movelist&typeid='+tid}),
    new ContextItem("删除栏目",function(){location="AdminUpdateArticleType.do?act=delete&id="+tid+"&returnUrl="+returnUrl;}),
    new ContextSeperator(),
    new ContextItem("向上排前一级",function(){ location="catalog_do.php?cid="+tid+"&dopost=upRank"; })
  ]
  ContextMenu.display(popupoptions)
}
//单个页面
function SingleMenu(obj,tid,returnUrl)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("预览页面",function(){ window.open("catalog_do.php?cid="+tid+"&dopost=viewSgPage"); }),
    new ContextItem("编辑页面",function(){ location="catalog_do.php?cid="+tid+"&dopost=editSgPage"; }),
    new ContextItem("编辑模板",function(){ location="catalog_do.php?cid="+tid+"&dopost=editSgTemplet"; }),
    new ContextSeperator(),
    new ContextItem("更改栏目",function(){location="catalog_edit.php?ID="+tid;}),
    new ContextSeperator(),
    new ContextItem("移动栏目",function(){location='catalog_move.php?job=movelist&typeid='+tid}),
    new ContextItem("删除栏目",function(){location="AdminUpdateArticleType.do?act=delete&id="+tid+"&returnUrl="+returnUrl;}),
    new ContextSeperator(),
    new ContextItem("向上排前一级",function(){ window.location="catalog_do.php?cid="+tid+"&dopost=upRank"; })
  ]
  ContextMenu.display(popupoptions)
}
</script>

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

<style>
.coolbg2 {
  border: 1px solid #000000;
  background-color: #F2F5E9;
  height:18px
}
.coolbt2 {
  border-left: 2px solid #EFEFEF;
  border-top: 2px solid #EFEFEF;
  border-right: 2px solid #ACACAC;
  border-bottom: 2px solid #ACACAC;
  background-color: #F7FCDA
}
.bline {border-bottom: 1px solid #BCBCBC;background-color:#F3F6FA;}
.nbline {border-bottom: 1px solid #DEDEDE;background-color:#FFFFFF;}
.bline2 {border-bottom: 1px solid #BCBCBC;background-color:#F8F8F8;}
.bline3 {border-bottom: 1px solid #A3B3BE;background-color:#FFFFF0;}
</style>
</head>
<body leftmargin='8' topmargin='8' onload="ContextMenu.intializeContextMenu()">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">问答类别管理</div>
</div>

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
	<tr>
		<td bgcolor="#EDF9D5" class="tbtitletxt">
			<div style='float:left'><strong>问答类别管理</strong>(在IE浏览器中可使用右键菜单进行操作。)</div>
			<div style='float:right;padding-right:30px'><a href='ask_type_add.jsp?pid=0'><b>↑创建问答类别</b></a></div>
		</td>
	</tr>
</table>

<form name="form1" action="catalog_do.php?dopost=upRankAll" method="post">
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" style="margin:0px auto" class="tblist">
	<tr align="center">
		<td width="7%" class="tbsname">选择</td>
		<td width="6%" class="tbsname">ID</td>
		<td width="27%" class="tbsname">名称</td>
		<td width="10%" class="tbsname">记录数</td>
		<td width="8%" class="tbsname">内容模型</td>
		<td width="8%" class="tbsname">排序</td>
		<td width="34%" class="tbsname">管理</td>
	</tr>
</table>

<c:forEach items="${ASK_TYPE_LIST}" var="at" varStatus="is">
<table width='96%' border='0' cellpadding='1' cellspacing='0' align='center' style='margin:0px auto' class='tblist2'>
	<tr align='center' oncontextmenu="CommonMenu(this,${at.id},'|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|')">
		<td width='7%'><input class='np' type='checkbox' name='tids[]' value='2' /></td>
		<td width='6%'>[ID:${at.id }]</td>
		<td width='27%' align='left'>
			<img style='cursor:hand' onclick="LoadSuns('suns${at.id }',2);" src='images/class_sopen.gif' width='11' height='15' border='0' align='absmiddle' />  
			<a href='catalog_do.php?cid=2&dopost=listArchives' style='font-size:14px; text-decoration:none;'>${at.name }</a>
		</td>
		<td width='10%'>(文档：)</td>
		<td width='8%'>1</td>
		<td width='8%'><label><input name='sortrank2' type='text' id='textfield2' value='${at.disorder }' size='2' maxlength='4' style='text-align:center;' /></label></td>
		<td width='34%' align='center' style='letter-spacing:1px;'>
			<a href='/plus/list.php?tid=2' target='_blank'>预览</a>
			| <a href='catalog_do.php?cid=2&dopost=listArchives'>内容</a>
			| <a href='ask_type_add.jsp?pid=${at.id }'>添加</a>
			| <a href='AdminManageAskType.do?act=get&id=${at.id }&returnUrl=|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|'>修改</a>
			| <a href='AdminManageAskType.do?act=move_get&id=${at.id }&returnUrl=|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|'>移动</a>
			| <a href='＃' onclick="return deleteConfirm('AdminManageAskType.do?act=delete&id=${at.id}','|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|','此操作不能恢复！！！请慎重！！！\n\n确定要删除该问答类型吗？');">删除</a>
		</td>
		
	</tr>
</table>

<div id='suns${at.id }' style="display:none">
<c:forEach items="${at.askTypes}" var="a" varStatus="is">
	<table width='96%' border='0' cellspacing='1' cellpadding='0' align='center' style='margin:0px auto' class='tblist2'>
		<tr align='center' class='trlbg'  oncontextmenu="CommonMenu(this,${a.id},'|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|')">
			<td width='7%'><input class='np' type='checkbox' name='tids[]' value='1' /></td>
			<td width='6%'>[ID:${a.id }]</td>
			<td width='27%' align='left'>　   ├  <a href='catalog_do.php?cid=1&dopost=listArchives' style='font-size:14px; text-decoration:none;'>${a.name }</a> </td>
			<td width='10%'>(文档：)</td>
			<td width='8%'>1</td>
			<td width='8%'>
				<label><input name='sortrank1' type='text' id='textfield2' value='${a.disorder }' size='2' maxlength='4' style='text-align:center;' /></label>
			</td>
			<td width='34%' align='center' style='letter-spacing:1px;'>
				<a href='/plus/list.php?tid=1' target='_blank'>预览</a> | 
				<a href='catalog_do.php?cid=1&dopost=listArchives'>内容</a> | 
				<a href='article_type_add.jsp?pid=${a.id }'>添加</a> | 
				<a href='AdminManageAskType.do?act=get&id=${a.id }&returnUrl=|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|'>修改</a> | 
				<a href='AdminManageAskType.do?act=move_get&id=${a.id }&returnUrl=|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|'>移动</a> | 
				<a href='#' onclick="return deleteConfirm('AdminManageAskType.do?act=delete&id=${a.id}','|AdminManageAskType.do|act=list|pno=${PAGER.curPage}|','此操作不能恢复！！！请慎重！！！\n\n确定要删除该问答类型吗？');">删除</a> 
			</td>
			
		</tr>
	</table>
</c:forEach>
</div>

</c:forEach>

</form>


<table width="96%" border="0" cellpadding="5" cellspacing="1" align="center" style=" border:1px solid #E2F5BC;line-height:31px;margin:auto;">

	<tr>
        <td height="20" bgcolor="#EDF9D5" align="center" valign="middle">
			共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
			<A href="AdminManageAskType.do?act=list&pno=1">首页</A>&nbsp;&nbsp;
        	<A href="AdminManageAskType.do?act=list&pno=${PAGER.prePage}">上页</A>&nbsp;&nbsp;
        
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageAskType.do?act=list')"> 
				<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
	        		<c:if test="${PAGER.curPage == i}">
				        <OPTION value=${i} selected>${i}</OPTION>
				   	</c:if>
					<c:if test="${PAGER.curPage != i}">
						<OPTION value=${i}>${i}</OPTION>
					</c:if>
				</c:forEach>
 			</SELECT>&nbsp;&nbsp;
                  
        	<A href="AdminManageAskType.do?act=list&pno=${PAGER.nextPage}">下页</A>&nbsp;&nbsp;
        	<A href="AdminManageAskType.do?act=list&pno=${PAGER.totoalPage}">末页</A>&nbsp;&nbsp;
		</td>
    </tr>
    
	<tr>
		<td height="35" align="center" style="background:#F9FFE6;padding:7px 6px 6px 10px;" >
			<input type="button" value="增加顶级栏目" class="inputbut" onclick="location='article_type_add.jsp?pid=0';"/>
			<input type="button" value="更新排序" class="inputbut" onclick="document.form1.submit();"/>
			<input type="button" value="获取JS" class="inputbut" onclick="location='makehtml_js.php';"/>
		</td>
	</tr>
</table>

</body>
</html>