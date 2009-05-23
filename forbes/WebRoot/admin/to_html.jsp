<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<title>视频专辑管理</title>
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="js/context_menu.js"></script>
	<script language="javascript" src="js/ieemu.js"></script>
	<script type="text/javascript" src="main.js"></script>
	
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
		
		
		
		function selAll()
		{
			for(i=0;i<document.form2.serviceID.length;i++)
			{
				if(!document.form2.serviceID[i].checked)
				{
					document.form2.serviceID[i].checked=true;
				}
			}
		}
		function noSelAll()
		{
			for(i=0;i<document.form2.serviceID.length;i++)
			{
				if(document.form2.serviceID[i].checked)
				{
					document.form2.serviceID[i].checked=false;
				}
			}
		}
		
		//»ñµÃÑ¡ÖÐÎÄ¼þµÄÎÄ¼þÃû
		function getCheckboxItem()
		{
			var allSel="";
			if(document.form2.serviceID.value) return document.form2.serviceID.value;
			for(i=0;i<document.form2.serviceID.length;i++)
			{
				if(document.form2.serviceID[i].checked)
				{
					if(allSel=="")
						allSel=document.form2.serviceID[i].value;
					else
						allSel=allSel+"`"+document.form2.serviceID[i].value;
				}
			}
			return allSel;	
		}

		//»ñµÃÑ¡ÖÐÆäÖÐÒ»¸öµÄid
		function getOneItem()
		{
			var allSel="";
			if(document.form2.serviceID.value) return document.form2.serviceID.value;
			for(i=0;i<document.form2.serviceID.length;i++)
			{
				if(document.form2.serviceID[i].checked)
				{
						allSel = document.form2.serviceID[i].value;
						break;
				}
			}
			return allSel;	
		}
		
		function toHtml(){
			var qstr=getCheckboxItem(returnUrl);
			//alert(qstr);
			//if(aid==0) aid = getOneItem();
			if(qstr.length > 0)
				location="AdminManageService.do?act=delete&serviceID="+qstr+"&returnUrl="+returnUrl;
			else
				alert("请选择要静态页面的选项");
		}
	</script>
</head>

<body onLoad="ContextMenu.intializeContextMenu()">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">页面静态化</div>
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
  									<input type='button' onclick="location='service_add.jsp';" value='添加服务' class='inputbut' />
  									
  									<!-- 
									<input type='button' onclick="location='catalog_do.php?channelid=1&cid=0&dopost=listArchives&arcrank=-1&gurl=content_list.php';" value='稿件审核' class='inputbut' /> 
									<input type='button' onclick="location='AdminUpdateVideoType.do?act=list';" value='类别管理' class='inputbut' />
									<input type='button' onclick="location='makehtml_list.php?cid=0';" value='更新列表' class='inputbut' name='bb1' />
									<input type='button' onclick="location='makehtml_archives.php?cid=0';" value='更新视频专辑' class='inputbut' name='bb2' />
									<input type='button' onclick="location='AdminUpdateVideo.do?act=list&deleteFlag=Y';" value='回收站' class='inputbut' name='bb2' />
       								 -->
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
			<form method="post" name="form2" action="AdminTohtml.do">
			<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
				<tr>
					<td height="24" colspan="10" align="left">
						
							所有服务&gt;服务列表 &nbsp;(使用鼠标右键进行常用操作)
						
					</td>
				</tr>
				<tr align="center" bgcolor="#F8FBFB" height="22">
					<td width="5%">选择</td>
					<td width="10%">主页名称</td>
					<td width="10%">生成静态页面</td>
					<td width="4%">操作</td>
				</tr>

				
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td><input name="serviceID" type="checkbox" id="serviceID" value="1" /></td>
					<td>赤脚网主页</td>
					<td></td>
					<td></td>
				</tr>
				
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td><input name="serviceID" type="checkbox" id="serviceID" value="2" /></td>
					<td>创业大学主页</td>
					<td></td>
					<td></td>
				</tr>

				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td><input name="serviceID" type="checkbox" id="serviceID" value="3" /></td>
					<td>学习视频主页</td>
					<td></td>
					<td></td>
				</tr>
				
				<tr align='center' bgcolor="#FFFFFF"  onmousemove="javascript:this.bgColor='#EFEFEF';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22" oncontextmenu="ShowMenu(this,3,'%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB%CB%FB')">
					<td><input name="serviceID" type="checkbox" id="serviceID" value="4" /></td>
					<td>创业百问主页</td>
					<td></td>
					<td></td>
				</tr>
				<tr bgcolor="#F8FBFB">
					<td height="28" colspan="14" align="left" style="padding-left:6px;padding-top:8px">
						<input name="selAll" type="button" class="inputbut" value="全选" onclick="selAll();"/>
						<input name="noSelAll" type="button" class="inputbut" value="取消" onclick="noSelAll();"/>
						<input name="submit" type="submit" class="inputbut" value="生成"/>
						
						
						<!-- 
						<a href="javascript:selAll()" class="inputbutx">全选</a>
						<a href="javascript:noSelAll()" class="inputbutx">取消</a>
						<a href="javascript:updateVideo(0)" class="inputbutx">更新</a>
						<a href="javascript:checkVideo('|AdminUpdateVideo.do|act=list|pno=${PAGER.prePage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">审核</a>
						<a href="javascript:editVideo(0)" class="inputbutx">编辑</a>
						<a href="javascript:adArc('|AdminUpdateVideo.do|act=list|pno=${PAGER.prePage}|deleteFlag=${PARA['deleteFlag'] }|userid=${PARA['userid'] }|typeid=${PARA['typeid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|')" class="inputbutx">推荐</a>
						<a href="javascript:moveVideo(0)" class="inputbutx">移动</a>
					    <a href="javascript:toHtml('|to_html.jsp|">删除</a>
						 -->
						
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
				
				 		<form name="form3" action="AdminManageService.do?act=list" method="post">
				 			 
							<table width='100%'  border='0' cellpadding='0' cellspacing='1'>
				   				<tr>
				 					<td>
				 						<table border='0' cellpadding='0' cellspacing='0'>
									  		<tr>
									  			<!-- 
									   			<td width='80' align='center'>搜索：</td>
									   			<td width='160'>								   
													<input type="button" name="selbtn" value="请选择类型..." style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
														onclick="SelectVideoType('typeid','selbtn');" />
													<input type="hidden" id="typeid" name="typeid" value="" />	
									  			</td>
									  			 -->
									  			<td width='70'>关键字：</td>
									    		<td width='160'><input type='text' name='keyword' value='' style='width:150' /></td>
									    		<!-- 
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
									      		 -->
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