<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>创业同路人 - 学习库 - 全力打造创业者学习和交流平台</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="css/supev.css">
	
	<SCRIPT src="js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT src="js/openDiv.js" charset="gb2312"></SCRIPT>	
	

		
	








<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>

<SCRIPT>
	var jsenv = new Array();
	jsenv['THEME_PATH'] = './theme/zh-cn/';
	jsenv['TPL_RES_PATH'] = 'tpl/zh-cn/res/';
	jsenv['TPL_IMG_PATH'] = 'tpl/zh-cn/res/img';
	jsenv['cookie_pre'] = 'WF9_';
	jsenv['SUPEV_ROOT'] = 'http://localhost/SupeV/upload/';
	jsenv['accessing_time'] = '450000';
	jsenv['charset'] = 'utf-8';
</SCRIPT>
	
<c:set var="index" value="article"></c:set>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->
<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->
<!--主结构开始-->

<DIV id=wrapper>
	
	<script type="text/javascript">
 function SetCwinHeight(){
  var bobo=document.getElementById("bobo"); //iframe id
  if (document.getElementById){
   if (bobo && !window.opera){
    if (bobo.contentDocument && bobo.contentDocument.body.offsetHeight){
     bobo.height = bobo.contentDocument.body.offsetHeight;
    }else if(bobo.Document && bobo.Document.body.scrollHeight){
     bobo.height = bobo.Document.body.scrollHeight;
    }
   }
  }
 }
</script>

	<iframe width="100%" id="bobo" onload="Javascript:SetCwinHeight()" height="1" frameborder="0" src="http://localhost/uc/bbs/index.php"></iframe>
	
	<!-- 
		<IFRAME id="xmshowmain" border=0 name="xmshowmain" marginWidth=0 frameSpacing=0 marginHeight=0 frameBorder=0 src="http://www.netos.cn"   onload="this.style.height=this.document.body.scrollHeight;this.style.;"></IFRAME>
	 -->

</DIV>

<!--主结构结束-->
<!--footer开始-->
<!--footer开始-->
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
