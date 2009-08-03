<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<title>回答管理</title>
	<link href="css_body.css" rel="stylesheet" type="text/css" />
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
		
		function updateContent(id, returnUrl) {
			var content = document.getElementById("content[" + id + "]").value;
			alert(content);
			var gotoUrl = "AdminManageAskAnswer.do?act=update&id=" + id + "&content=" + content + "&returnUrl=" + returnUrl;
		    self.location= gotoUrl;
		}
		
	</script>
	
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

	</script>

</head>

<body>
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">回答维护</div>
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
  									<strong>${ASK.title }</strong>
       							</td>
     						</tr>
     						<tr>
     							<td align="left" style="padding-top:6px">
  									${ASK.content }
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
			
			
			
			<form name="form2" action="catalog_do.php?dopost=upRankAll" method="post">
				<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" style="margin:0px auto" class="tblist">
					<tr align="center">
						<td width="7%" class="tbsname">选择</td>
						<td width="6%" class="tbsname">ID</td>
						<td width="40%" class="tbsname">回答内容</td>
						<td width="10%" class="tbsname">回答时间</td>
						<td width="10%" class="tbsname">最佳答案</td>
						<td width="10%" class="tbsname">回复人</td>
						<td width="10%" class="tbsname">管理</td>
					</tr>
				</table>

				<c:forEach items="${ASK_ANSWER_LIST}" var="answer" varStatus="is">
				<table width='100%' border='0' cellpadding='1' cellspacing='0' align='center' style='margin:0px auto' class='tblist2'>
					<tr align='center'>
						<td width='7%'><input name="levelID" type="checkbox" id="levelID" value="${answer.id }" /></td>
						<td width='6%'>${answer.id }</td>
						<td width='40%' align='left'>
							<a href='javascript:void(0);' style='font-size:14px; text-decoration:none;'>${fn:substring(answer.content, 0, 24)}...</a>
							<img style='cursor:hand' onclick="LoadSuns('suns${answer.id }',2);" src='images/class_sopen.gif' width='11' height='15' border='0' align='absmiddle' />  
							
						</td>
						<td width='10%'><fmt:formatDate value='${answer.pubdate }' type='date'/></td>
						<td width='10%'><c:if test="${ASK.bestAnswer == answer.id}">是</c:if></td>
						<td width='10%'><a href="${answer.loginName }">${answer.loginName }</a></td>
						<td width='10%' align='center' style='letter-spacing:1px;'>
							<a href='javascript:void(0);' onclick="updateContent(${answer.id }, '|AdminManageAskAnswer.do|act=list|pno=${PAGER.curPage}|askid=${ASK.id }|');">修改</a>
							| <a href="AdminManageAskAnswer.do?act=delete&levelID=${answer.id }&returnUrl=|AdminManageAskAnswer.do|act=list|pno=${PAGER.curPage}|askid=${ASK.id }|">删除</a>
						</td>
						
					</tr>
				</table>

				<div id='suns${answer.id }' style="display:none">
					<table width='100%' border='0' cellspacing='1' cellpadding='0' align='left' style='margin:0px auto' class='tblist2'>
						<tr align='left' class='trlbg'  oncontextmenu="CommonMenu(this,${answer.id},'|AdminUpdateArticleType.do|act=list|pno=${PAGER.curPage}|')">
							<td width='10%'>
								
							</td>
							<td width='90%'>
								<textarea id="content[${answer.id }]" name="content[${answer.id }]" rows="15" cols="110">${answer.content }</textarea>
								
							</td>
							
						</tr>
					</table>
				</div>

</c:forEach>

</form>


<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" style=" border:1px solid #E2F5BC;line-height:31px;margin:auto;">

	<tr bgcolor="#F8FBFB">
					<td height="28" colspan="11" align="left" style="padding-left:6px;padding-top:8px">
						<a href="javascript:selAll()" class="inputbutx">全选</a>
						<a href="javascript:noSelAll()" class="inputbutx">取消</a>
						<a href="javascript:delAskAnswer('|AdminManageAskAnswer.do|act=list|pno=${PAGER.curPage}|askid=${ASK.id }|')" class="inputbutx">删除</a>
					</td>
				</tr>
				
	<tr>
        <td height="20" bgcolor="#EDF9D5" align="center" valign="middle">
			共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
			<A href="AdminManageAskAnswer.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        	<A href="AdminManageAskAnswer.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageAskAnswer.do?act=list&${PARA['parameter'] }')"> 
				<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
	        		<c:if test="${PAGER.curPage == i}">
				        <OPTION value=${i} selected>${i}</OPTION>
				   	</c:if>
					<c:if test="${PAGER.curPage != i}">
						<OPTION value=${i}>${i}</OPTION>
					</c:if>
				</c:forEach>
 			</SELECT>&nbsp;&nbsp;
                  
        	<A href="AdminManageAskAnswer.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        	<A href="AdminManageAskAnswer.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
		</td>
    </tr>
</table>


			
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
				<tr>
					<td height="4"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #525252;" height="26">
				
				 		<form name="form3" action="AdminManageAsk.do?act=list" method="post">
				 			 
							<table width='100%'  border='0' cellpadding='0' cellspacing='1'>
				   				<tr>
				 					<td>
				 						<table border='0' cellpadding='0' cellspacing='0'>
									  		<tr>
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