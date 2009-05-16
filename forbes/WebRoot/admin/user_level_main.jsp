<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<title>文档管理</title>
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
	<script language="javascript" src="js/context_menu.js"></script>
	<script language="javascript" src="js/ieemu.js"></script>
	<script type="text/javascript" src="main.js"></script>
	<script type="text/javascript" src='asklist.js' charset="gb2312"></script>
	
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
		
		function UpdateUserLevel(id, returnUrl){
			var level 	   = $("#level"+id).val();
			var startScore = $("#startScore"+id).val();
			var endScore   = $("#endScore"+id).val();
			var title      = $("#title"+id).val();			
			
			window.location="AdminManageUserLevel.do?act=update&id=" + id + "&level=" + level +"&startScore=" + startScore + "&endScore=" + endScore + "&title=" + title + "&returnUrl=" + returnUrl;
			
			//alert("XXXXXXX");
			
			//var listArea = $Obj('rslist');
			//var kw  = $Obj('keyword'+nid).value;
			//var kws = $Obj('spwords'+nid).value;
			//var ct  = $Obj('count'+nid).value;
		
			//var errMsg = "网络通信出错！<br>[<a href=\"javascript:LoadPage('"+pageno+"')\"><u>点击此重新加载列表</u></a>]";
			//var myajax = new DedeAjax(listArea,true,true,"",errMsg,"正在处理...");
		  	//myajax.SendGet("search_keywords_main.php?dopost=update&aid="+nid+"&keyword="+kw+"&spwords="+kws+"&count="+ct+"&pageno="+pageno);
		  	
		}
		
	</script>
</head>

<body onLoad="ContextMenu.intializeContextMenu()">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">用户等级维护</div>
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
     								<form method="post" name="form3" action="AdminManageUserLevel.do?act=add">
     								<input type="hidden" name="returnUrl" value="|AdminManageUserLevel.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|" />
  									级别：
									<input type="text" name="level" style="width:30px" />&nbsp;&nbsp;
									积分：
									<input type="text" name="startScore" />-<input type="text" name="endScore" />&nbsp;&nbsp;
									头衔：
									<input type="text" name="title" />&nbsp;&nbsp;
									<input name="submit" type="submit" value="搜索" />
									</form>
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
							所有用户等级列表 &nbsp;	
					</td>
				</tr>
				<tr align="center" bgcolor="#F8FBFB" height="22">
					<td width="5%">ID</td>
					<td width="5%">选择</td>
					<td width="10%">等级</td>
					<td width="30%">积分</td>
					<td width="20%">头衔</td>
					<td width="10%">操作</td>
				</tr>

				<c:forEach items="${USER_LEVEL_LIST}" var="level" varStatus="is">
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td>${level.id }</td>
					<td><input name="levelID" type="checkbox" id="levelID" value="${level.id }" /></td>
					<td><input type="text" id="level${level.id }" name="level${level.id }" value="${level.level}" style="width:30px" /> 级</td>
					<td><input type="text" id="startScore${level.id }" name="startScore${level.id }" value="${level.startScore }" />-<input type="text" id="endScore${level.id }" name="endScore${level.id }"  value="${level.endScore }" /></td>
					<td><input type="text" id="title${level.id }" name="title${level.id }" value="${level.title }" /></td>
					
					<td>
						<a href="javascript:UpdateUserLevel(${level.id }, '|AdminManageUserLevel.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|')">修改</a> |
						<a href="AdminManageUserLevel.do?act=delete&levelID=${level.id }&returnUrl=|AdminManageUserLevel.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|">删除</a>
					</td>
				</tr>
				</c:forEach>


				<tr bgcolor="#F8FBFB">
					<td height="28" colspan="10" align="left" style="padding-left:6px;padding-top:8px">
						<a href="javascript:selAll()" class="inputbutx">全选</a>
						<a href="javascript:noSelAll()" class="inputbutx">取消</a>
						<a href="javascript:delUserLevel('|AdminManageUserLevel.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|')" class="inputbutx">删除</a>
					</td>
				</tr>

				<tr align="right" bgcolor="#eaf8ce">
					<td height="20" colspan="10" align="center">
						共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminManageUserLevel.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminManageUserLevel.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageUserLevel.do?act=list&&${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminManageUserLevel.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminManageUserLevel.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
	
					</td>
				</tr>
			</table>
			</form>
			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
				<tr>
					<td height="4"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #525252;" height="26">
				
				 		<form name="form3" action="AdminManageUserLevel.do?act=list" method="post">
				 			 
							<table width='100%'  border='0' cellpadding='0' cellspacing='1'>
				   				<tr>
				 					<td>
				 						<table border='0' cellpadding='0' cellspacing='0'>
									  		<tr>
									   			<td width='80' align='center'>搜索：</td>
									   			
									  			<td width='70'>关键字：</td>
									    		<td width='160'><input type='text' name='keyword' value='' style='width:150' /></td>									  
									     		<td style='padding-top:5px;'><input name="imageField" type="submit" class="inputbut" value="搜索" /></td>
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