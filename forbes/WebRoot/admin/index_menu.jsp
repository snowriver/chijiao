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
    		<dt><a href="###" onclick="showHide('items0');" target="_self">��ݲ˵�</a></dt>
    		<dd id="items0" style="display:block;">
				<ul>
					<li><a href='AdminUpdateArticle.do?act=list' target='main'>���������б�</a></li>
					<li><a href='AdminManageNews.do?act=list' target='main'>������Ѷ�б�</a></li>
					<li><a href='AdminUpdateVideo.do?act=list' target='main'>������Ƶ�б�</a></li>
					<li><a href='AdminManageAsk.do?act=list' target='main'>�����ʴ��б�</a></li>
					<li><a href='full_list.php?adminid=1' target='main'>�ҷ������ĵ�</a></li>
					<li><a href='full_list.php?arcrank=-1' target='main'>����˵��ĵ�</a></li>
					<li><a href='full_list.php?ismember=1' target='main'>��ԱͶ���ĵ�</a></li>
					<li><a href='feedback_main.php' target='main'>�ĵ����۹���</a></li>
					<li><a href='media_main.php' target='main'>�������ݹ���</a></li>
					<li><a href='to_html.jsp' target='main'>���ɾ�̬ҳ��</a></li>
	  			</ul>
			</dd>
		</dl>
		<!-- Item 0 End -->
	
	
		<!-- Item 1 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items1');" target="_self">���¹���</a></dt>
		    <dd id="items1" style="display:block;">
				<ul>
					<li><a href='AdminUpdateArticleType.do?act=list' target='main'>�������͹���</a></li>
					<li><a href='AdminUpdateArticle.do?act=list' target='main'>���������б�</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 1 End -->
		
		<!-- Item 2 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items2');" target="_self">��Ƶ����</a></dt>
		    <dd id="items2" style="display:block;">
				<ul>
					<li><a href='AdminUpdateVideoType.do?act=list' target='main'>��Ƶר�����͹���</a></li>
					<li><a href='AdminUpdateVideo.do?act=list' target='main'>������Ƶר���б�</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 2 End -->
		
		
		<!-- Item 3 Strat -->
		<dl>
		    <dt><a href="###" onclick="showHide('items3');" target="_self">��ҵ���ʹ���</a></dt>
		    <dd id="items3" style="display:block;">
				<ul>
					<li><a href='AdminManageUserLevel.do?act=list' target='main'>�û��ȼ�����</a></li>
					<li><a href='AdminManageAskType.do?act=list' target='main'>�ʴ����͹���</a></li>
					<li><a href='AdminManageAsk.do?act=list' target='main'>�����ʴ��б�</a></li>
				</ul>
			</dd>
		</dl>
		<!-- Item 3 End -->
	
<!-- Item 5 Strat -->

<dl>
    <dt><a href="###" onclick="showHide('items4');" target="_self">���ݷ���</a></dt>
    <dd id="items4" style="display:block;">
			<ul>
				<li><a href='catalog_menu.php' target='_self'>������Ŀ�ṹ</a></li>
				<li><a href='AdminUpdateVideoType.do?act=list' target='main'>�������͹���</a></li>
				<li><a href='AdminUpdateVideo.do?act=list' target='main'>���������б�</a></li>
  			</ul>
		</dd>
	</dl><!-- Item 5 End -->
<!-- Item 13 Strat -->

<dl>
    <dt><a href="###" onclick="showHide('items12');" target="_self">�û�����</a></dt>
    <dd id="items12" style="display:block;">
			<ul>
<li><a href='AdminListUser.do?act=admin' target='main'>ϵͳ����Ա����</a></li>
<li><a href='AdminListUser.do?act=client' target='main'>���˻�Ա����</a></li>

  			</ul>
		</dd>
	</dl><!-- Item 13 End -->
<!-- Item 21 Strat -->


<dl>
    <dt><a href="###" onclick="showHide('items5');" target="_self">��������</a></dt>
    <dd id="items12" style="display:block;">
		<ul>
			<li><a href='AdminManageService.do?act=list' target='main'>�������</a></li>
			<li><a href='AdminListUser.do?act=member' target='main'>��������</a></li>
			<li><a href='AdminListUser.do?act=client' target='main'>��������</a></li>
		</ul>
	</dd>
</dl><!-- Item 13 End -->
<!-- Item 21 Strat -->



<dl>
    <dt><a href="###" onclick="showHide('items20');" target="_self">����ģ������</a></dt>
    <dd id="items20" style="display:block;">
			<ul>
				<li><a href='AdminUpdateSector.do?act=list' target='main'>��ҵ����</a></li>
				<li><a href='AdminUpdateCity.do?act=list' target='main'>��������</a></li>
				<li><a href='AdminManageSearchKeyword.do?act=list' target='main'>�ؼ��ʹ���</a></li>
				<li><a href='AdminManageBulletin.do?act=list' target='main'>�������</a></li>
				<!-- <li><a href='sys_passport.php' target='main'>ͨ��֤����</a></li> -->
  			</ul>
		</dd>
	</dl><!-- Item 21 End -->


	<!-- Item 24 Strat -->
	<!-- 
	<dl>
	    <dt><a href="###" onclick="showHide('items23');" target="_self">ϵͳ����</a></dt>
	    <dd id="items23" style="display:block;">
			<ul>
				<li><a href='http://www.dedecms.com/archives/templethelp/help/index.htm' target='_blank'>ģ�����ο�</a></li>
				<li><a href='http://bbs.dedecms.com/' target='_blank'>�ٷ���̳</a></li>
		  	</ul>
		</dd>
	</dl>
	 -->
	 <!-- Item 24 End -->
	</div>
	
</body>
</html>
