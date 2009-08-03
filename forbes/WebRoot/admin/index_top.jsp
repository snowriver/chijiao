<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Top</title>
<link href="css_top.css" rel="stylesheet" type="text/css" />
<script language='javascript'>

function $Nav(){
	if(window.navigator.userAgent.indexOf("MSIE")>=1) return 'IE';
  else if(window.navigator.userAgent.indexOf("Firefox")>=1) return 'FF';
  else return "OT";
}

var preID = 0;

function OpenMenu(cid,lurl,rurl,bid){
   if($Nav()=='IE'){
     if(rurl!='') top.document.frames.main.location = rurl;
     if(cid > -1) top.document.frames.menu.location = 'index_menu.jsp?c='+cid;
     else if(lurl!='') top.document.frames.menu.location = lurl;
     if(bid>0) document.getElementById("d"+bid).className = 'thisclass';
     if(preID>0 && preID!=bid) document.getElementById("d"+preID).className = '';
     preID = bid;
   }else{
     if(rurl!='') top.document.getElementById("main").src = rurl;
     if(cid > -1) top.document.getElementById("menu").src = 'index_menu.jsp?c='+cid;
     else if(lurl!='') top.document.getElementById("menu").src = lurl;
     if(bid>0 && bid!=9) document.getElementById("d"+bid).className = 'thisclass';
     if(preID>0) document.getElementById("d"+preID).className = '';
     preID = bid;
   }
}

var preFrameW = '160,*';
var FrameHide = 0;
function ChangeMenu(way){
	var addwidth = 10;
	var fcol = top.document.all.bodyFrame.cols;
	if(way==1) addwidth = 10;
	else if(way==-1) addwidth = -10;
	else if(way==0){
		if(FrameHide == 0){
			preFrameW = top.document.all.bodyFrame.cols;
			top.document.all.bodyFrame.cols = '0,*';
			FrameHide = 1;
			return;
		}else{
			top.document.all.bodyFrame.cols = preFrameW;
			FrameHide = 0;
			return;
		}
	}
	fcols = fcol.split(',');
	fcols[0] = parseInt(fcols[0]) + addwidth;
	top.document.all.bodyFrame.cols = fcols[0]+',*';
}

function resetBT(){
	if(preID>0) document.getElementById("d"+preID).className = 'bdd';
	preID = 0;
}

</script>
</head>
<body>
<div class="topnav">
	<div class="sitenav">
		<div class="welcome">
			��ã�<span class="username">${sessionScope.ADMIN.username } </span>����ӭʹ�� ����� ��̨����ϵͳ��
		</div>
		<div class="welcome">
			<a href="javascript:ChangeMenu(-1)"><img src='img/frame-l.gif' border='0' alt="��С����" /></a>
    		<a href="javascript:ChangeMenu(0)"><img src='img/frame_on.gif' border='0' alt="����/��ʾ����" /></a>
    		<a href="javascript:ChangeMenu(1)" title="��������"><img src='img/frame-r.gif' border='0' alt="��������" /></a>
    	</div>
		<div class="sitelink">
			<a href="javascript:OpenMenu(9,'','index_main.jsp',0)">������ҳ</a> | 
			<a href="javascript:OpenMenu(0,'index_menu.jsp','',0)">���ܲ˵�</a> | 
			<a href="http://www.dedecms.com/archives/templethelp/help/index.htm" target="_blank">����</a> | 
			<a href="../" target="_blank">��վ��ҳ</a> | 
			<a href="exit.jsp" target="_parent">ע����¼</a>
		</div>
	</div>
	<div class="leftnav">
		<ul>
			<li class="navleft"></li>
			<li id='d1'><a href="javascript:OpenMenu(1,'','catalog_main.php',1)">Ƶ������</a></li>
			<li id='d2'><a href="javascript:OpenMenu(-1,'catalog_menu.php','public_guide.php',2)">���ݷ���</a></li>
			<li id='d3'><a href="javascript:OpenMenu(2,'','content_list.php',3)">����ά��</a></li>
			<li id='d4'><a href="javascript:OpenMenu(3,'','makehtml_homepage.php',4)">HTML����</a></li>
            <li id='d10'><a href="javascript:OpenMenu(10,'','file_manage_main.php?activepath=/templets',10)">ģ�����</a></li>
			<li id='d5'><a href="javascript:OpenMenu(4,'','member_main.php',5)">����ģ��</a></li>
			<li id='d7'><a href="javascript:OpenMenu(6,'','module_main.php',7)">��չģ��</a></li>
			<li id='d6'><a href="javascript:OpenMenu(5,'','plus_main.php',6)">�������</a></li>
			<li id='d8'><a href="javascript:OpenMenu(7,'','sys_info.php',8)">ϵͳ����</a></li>
			<li class="navright"></li>
		</ul>
	</div>
</div>
</body>
</html>
