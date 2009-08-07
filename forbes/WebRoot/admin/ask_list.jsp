<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<title>文档管理</title>
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="js/context_menu.js"></script>
	<script language="javascript" src="js/ieemu.js"></script>
	<script type="text/javascript" src="main.js"></script>
	<script type="text/javascript" src='arclist.js' charset="gb2312"></script>
	
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
		
		
		function manageAskAnswer(askid){
			
		   window.open("AdminManageAskAnswer.do?act=list&askid="+typeid, "popUpSelCWin", "scrollbars=yes,resizable=yes,statebar=no,width=450,height=300,left=200, top=200");
		}
	</script>
</head>

<body onLoad="ContextMenu.intializeContextMenu()">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">文章维护</div>
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
  									<input type='button' onclick="location='AdminEditArticle.do?act=gettype&op=add&returnUrl=|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|';" value='添加文章' class='inputbut' />
  									<c:if test="${empty PARA['userid'] || PARA['userid'] == '' }">
  										<input type='button' onclick="location='AdminUpdateArticle.do?act=list&userid=${sessionScope.ADMIN.uid }';" value='我的文档' class='inputbut' />
  									</c:if>
								  	<c:if test="${not empty PARA['userid'] && PARA['userid'] != '' }">
  										<input type='button' onclick="location='AdminUpdateArticle.do?act=list';" value='全部文档' class='inputbut' />
  									</c:if>
  									
									<input type='button' onclick="location='AdminUpdateArticle.do?act=list&isverify=0';" value='稿件审核' class='inputbut' /> 
									<input type='button' onclick="location='AdminUpdateArticleType.do?act=list';" value='类别管理' class='inputbut' />
									<input type='button' onclick="location='makehtml_list.php?cid=0';" value='更新列表' class='inputbut' name='bb1' />
									<input type='button' onclick="location='AdminCreateArticleHtml.do?act=all&returnUrl=|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|';" value='更新文档' class='inputbut' name='bb2' />
									<input type='button' onclick="location='AdminUpdateArticle.do?act=list&deleteFlag=Y';" value='回收站' class='inputbut' name='bb2' />
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
						<c:if test="${empty PARA['deleteFlag'] || PARA['deleteFlag'] == '' || PARA['deleteFlag'] == 'N' }">
							所有普通文章&gt;文章列表 &nbsp;(使用鼠标右键进行常用操作)
						</c:if>
						<c:if test="${not empty PARA['deleteFlag'] && PARA['deleteFlag'] == 'Y' }">
							所有普通文章&gt;回收站列表 &nbsp;(使用鼠标右键进行常用操作)
						</c:if>
					</td>
				</tr>
				<tr align="center" bgcolor="#F8FBFB" height="22">
					<td width="4%">ID</td>
					<td width="4%">选择</td>
					<td width="30%">问题标题</td>
					<td width="10%">提问时间</td>
					<td width="10%">问题所属类型</td>
					<td width="5%">点击</td>
					<td width="5%">悬赏</td>
					<td width="5%">状态</td>
					<td width="5%">回复数</td>
					<td width="12%">提问人</td>
					<td width="8%">操作</td>
				</tr>

				<c:forEach items="${ASK_LIST}" var="ask" varStatus="is">
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'x')">
					<td>${ask.id }</td>
					<td><input name="arcID" type="checkbox" id="arcID" value="${ask.id }" /></td>
					<td align='left'>
						<a href="javascript:editArc(${ask.id }, '|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" oncontextmenu="ShowMenu(this,3,'CB')">
							<u>${ask.title }</u>
						</a>
					</td>
					<td><fmt:formatDate value='${ask.expiredTime }' type='date'/></td>
					<td>						
						<c:if test="${not empty ask.askType }">  ${ask.askType.name } </c:if>
						<c:if test="${ empty ask.askType }"> 未分类 </c:if>
					</td>
					<td>${ask.views }</td>
					<td>${ask.reward }</td>
					<td>
						<c:if test="${ask.status == 1}"><img src="../ask/images/Solved_ico.gif" title="已经解决" /></c:if>
			    		<c:if test="${ask.status == 0}"><img src="../ask/images/UnSolved_ico.gif" title="等待处理" /></c:if>
					</td>
					<td><a href="javascript:void(0);" onclick="javascript:var win=window.open('AdminManageAskAnswer.do?act=list&askid=${ask.id }','回答管理','width=853,height=550,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()">${ask.answerCnt }</a></td>
					<td>${ask.username }</td>
					<td>
						<a href="javascript:editArc(${ask.id }, '|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')">编辑</a> |
						<a target="_blank" href="../ask/AskView.do?id=${ask.id }">查看</a>
					</td>
				</tr>
				</c:forEach>


				<tr bgcolor="#F8FBFB">
					<td height="28" colspan="11" align="left" style="padding-left:6px;padding-top:8px">
						<a href="javascript:selAll()" class="inputbutx">全选</a>
						<a href="javascript:noSelAll()" class="inputbutx">取消</a>
						<a href="javascript:updateArc(0)" class="inputbutx">更新</a>
						<a href="javascript:checkArc('|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">审核</a>
						<a href="javascript:editArc(0)" class="inputbutx">编辑</a>
						<a href="javascript:adArc('|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">推荐</a>
						<a href="javascript:moveArc(0)" class="inputbutx">移动</a>
						<a href="javascript:delArc('|AdminUpdateArticle.do|act=list|pno=${PAGER.curPage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">删除</a>
					</td>
				</tr>

				<tr align="right" bgcolor="#eaf8ce">
					<td height="20" colspan="10" align="center">
						共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminManageAsk.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminManageAsk.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageAsk.do?act=list&&${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminManageAsk.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminManageAsk.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
	
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
				
				 		<form name="form3" action="AdminManageAsk.do?act=list" method="post">
				 			 
							<table width='100%'  border='0' cellpadding='0' cellspacing='1'>
				   				<tr>
				 					<td>
				 						<table border='0' cellpadding='0' cellspacing='0'>
									  		<tr>
									   			<td width='80' align='center'>搜索：</td>
									   			<td width='160'>								   
													<input type="button" name="selbtn" value="请选择类型..." style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
														onclick="SelectArticleType('typeid','selbtn');" />
													<input type="hidden" id="typeid" name="typeid" value="" />	
									  			</td>
									  			<td width='70'>关键字：</td>
									    		<td width='160'><input type='text' name='keyword' value='' style='width:150' /></td>
									    		<td width='110'>
											    	<select name="orderby" style='width:80'>
											            <option value='id'>排序...</option>
											            <option value='senddate'>录入时间</option>
											            <option value='pubdate'>发布时间</option>
											            <option value='sortrank'>置顶权值</option>
											            <option value='click'>点击量</option>
											            <option value='postnum'>评论次数</option>
											            <option value='lastpost'>最后评论</option>
											      	</select>
									      		</td>
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