<%@ page language="java" pageEncoding="gbk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>menu</title>

	<link href="css_menu.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<base target="main" />

	<SCRIPT language="javascript">

		function getObject(objectId) {
			if(document.getElementById && document.getElementById(objectId)) {
		 	// W3C DOM
		 		return document.getElementById(objectId);
		 	}
		 	else if (document.all && document.all(objectId)) {
		 		// MSIE 4 DOM
		 		return document.all(objectId);
		 	}
		 	else if (document.layers && document.layers[objectId]) {
		 		// NN 4 DOM.. note: this won't find nested layers
		 		return document.layers[objectId];
		 	}
		 	else {
		 		return false;
		 	}
		}
		
		function showHide(objname){
		    var obj = getObject(objname);
		    if(obj.style.display == "none"){
				obj.style.display = "block";
			}else{
				obj.style.display = "none";
			}
		}
	</SCRIPT>

</head>
	



<body>
	<div class="menu">

		<!-- Item 0 Strat -->
		<dl>
    		<dt><a href="###" onclick="showHide('items0');" target="_self">快捷菜单</a></dt>
    		<dd id="items0" style="display:block;">
				<ul>
					<li><a href='AdminUpdateArticle.do?act=list' target='main'>所有文章列表</a></li>
					<li><a href='AdminManageNews.do?act=list' target='main'>所有资讯列表</a></li>
					<li><a href='AdminUpdateVideo.do?act=list' target='main'>所有视频列表</a></li>
					<li><a href='AdminManageAsk.do?act=list' target='main'>所有问答列表</a></li>
					<li><a href='full_list.php?adminid=1' target='main'>我发布的文档</a></li>
					<li><a href='full_list.php?arcrank=-1' target='main'>等审核的文档</a></li>
					<li><a href='full_list.php?ismember=1' target='main'>会员投稿文档</a></li>
					<li><a href='feedback_main.php' target='main'>文档评论管理</a></li>
					<li><a href='media_main.php' target='main'>附件数据管理</a></li>
					<li><a href='to_html.jsp' target='main'>生成静态页面</a></li>
	  			</ul>
			</dd>
		</dl>
		<!-- Item 0 End -->
	
	
		<!-- Item 1 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items1');" target="_self">文章管理</a></dt>
		    <dd id="items1" style="display:block;">
				<ul>
					<li><a href='AdminUpdateArticleType.do?act=list' target='main'>文章类型管理</a></li>
					<li><a href='AdminUpdateArticle.do?act=list' target='main'>所有文章列表</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 1 End -->
		
		<!-- Item 2 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items2');" target="_self">视频管理</a></dt>
		    <dd id="items2" style="display:block;">
				<ul>
					<li><a href='AdminUpdateVideoType.do?act=list' target='main'>视频专辑类型管理</a></li>
					<li><a href='AdminUpdateVideo.do?act=list' target='main'>所有视频专辑列表</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 2 End -->
		
		
		<!-- Item 3 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items3');" target="_self">创业百问管理</a></dt>
		    <dd id="items3" style="display:block;">
				<ul>
					<li><a href='AdminManageUserLevel.do?act=list' target='main'>用户等级管理</a></li>
					<li><a href='AdminManageAskType.do?act=list' target='main'>问答类型管理</a></li>
					<li><a href='AdminManageAsk.do?act=list' target='main'>所有问答列表</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 3 End -->
	
<!-- Item 5 Strat -->

<dl>
    <dt><a href="###" onclick="showHide('items4');" target="_self">内容发布</a></dt>
    <dd id="items4" style="display:block;">
			<ul>
				<li><a href='catalog_menu.php' target='_self'>树形栏目结构</a></li>
				<li><a href='AdminUpdateVideoType.do?act=list' target='main'>文章类型管理</a></li>
				<li><a href='AdminUpdateVideo.do?act=list' target='main'>所有文章列表</a></li>
  			</ul>
		</dd>
	</dl><!-- Item 5 End -->
<!-- Item 13 Strat -->

<dl>
    <dt><a href="###" onclick="showHide('items12');" target="_self">用户管理</a></dt>
    <dd id="items12" style="display:block;">
			<ul>
<li><a href='AdminListUser.do?act=admin' target='main'>系统管理员管理</a></li>
<li><a href='AdminListUser.do?act=client' target='main'>个人会员管理</a></li>

  			</ul>
		</dd>
	</dl><!-- Item 13 End -->
<!-- Item 21 Strat -->


<dl>
    <dt><a href="###" onclick="showHide('items5');" target="_self">订单管理</a></dt>
    <dd id="items12" style="display:block;">
		<ul>
			<li><a href='AdminManageService.do?act=list' target='main'>服务管理</a></li>
			<li><a href='AdminListUser.do?act=member' target='main'>订单管理</a></li>
			<li><a href='AdminListUser.do?act=client' target='main'>订单管理</a></li>
		</ul>
	</dd>
</dl><!-- Item 13 End -->
<!-- Item 21 Strat -->



<dl>
    <dt><a href="###" onclick="showHide('items20');" target="_self">互动模块设置</a></dt>
    <dd id="items20" style="display:block;">
			<ul>
				<li><a href='AdminUpdateSector.do?act=list' target='main'>行业管理</a></li>
				<li><a href='AdminUpdateCity.do?act=list' target='main'>地区管理</a></li>
				<li><a href='AdminManageSearchKeyword.do?act=list' target='main'>关键词管理</a></li>
				<li><a href='AdminManageBulletin.do?act=list' target='main'>公告管理</a></li>
				<!-- <li><a href='sys_passport.php' target='main'>通行证设置</a></li> -->
  			</ul>
		</dd>
	</dl><!-- Item 21 End -->


	<!-- Item 24 Strat -->
	<!-- 
	<dl>
	    <dt><a href="###" onclick="showHide('items23');" target="_self">系统帮助</a></dt>
	    <dd id="items23" style="display:block;">
			<ul>
				<li><a href='http://www.dedecms.com/archives/templethelp/help/index.htm' target='_blank'>模板代码参考</a></li>
				<li><a href='http://bbs.dedecms.com/' target='_blank'>官方论坛</a></li>
		  	</ul>
		</dd>
	</dl>
	 -->
	 <!-- Item 24 End -->
	</div>
	
</body>
</html>
