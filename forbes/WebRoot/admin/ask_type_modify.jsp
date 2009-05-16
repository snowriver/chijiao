<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<title>问答管理</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
<script language="javascript">
var channelArray = new Array();
channelArray[-2] = "info";
channelArray[1] = "article";
channelArray[2] = "image";
channelArray[3] = "soft";
channelArray[4] = "flash";
channelArray[5] = "product";

function SelectTemplets(fname){
   var posLeft = window.event.clientY-200;
   var posTop = window.event.clientX-300;
   window.open("../include/dialog/select_templets.php?f="+fname, "poptempWin", "scrollbars=yes,resizable=yes,statebar=no,width=600,height=400,left="+posLeft+", top="+posTop);
}

function ShowHide(objname){
  var obj = document.getElementById(objname);
  if(obj.style.display == "block" || obj.style.display == "")
	   obj.style.display = "none";
  else
	   obj.style.display = "block";
}

function ShowObj(objname){
   var obj = document.getElementById(objname);
	 obj.style.display = "block";
}

function HideObj(objname){
  var obj = document.getElementById(objname);
	obj.style.display = "none";
}

function ShowItem1(){
  ShowObj('head1'); ShowObj('needset'); HideObj('head2'); HideObj('adset');
}

function ShowItem2(){
  ShowObj('head2'); ShowObj('adset'); HideObj('head1'); HideObj('needset');
}

function ShowSonList(){
   if(document.form1.needson.checked){
      ShowObj('sonlist');
   }else{
      HideObj('sonlist');
   }
}

function CheckTypeDir(){
  var upinyin = document.getElementById('upinyin');
  var tpobj = document.getElementById('typedir');
  if(upinyin.checked) tpobj.style.display = "none";
  else tpobj.style.display = "block";
}

function ParTemplet(obj)
{
  var sevvalue = channelArray[obj.value];
  var tempindex = document.getElementsByName('tempindex');
  var templist = document.getElementsByName('templist');
  var temparticle = document.getElementsByName('temparticle');
  var dfstyle = document.getElementsByName('dfstyle');
  var dfstyleValue = dfstyle[0].value;
  tempindex[0].value = dfstyleValue+"/index_"+sevvalue+".htm";
  templist[0].value = dfstyleValue+"/list_"+sevvalue+".htm";
  temparticle[0].value = dfstyleValue+"/article_"+sevvalue+".htm";
}

function checkSubmit()
{
   if(document.form1.typename.value==""){
		  alert("问答名称不能为空！");
		  return false;
	 }
	 return true;
}

function CheckPathSet()
{
	var surl = document.getElementById("siteurl");
	var sreid = document.getElementById("reID");
	var mysel = document.getElementById("truepath3");
	if(surl.value!=""){
		if(sreid.value=="0" || sreid.value==""){
			mysel.checked = true;
		}
	}
}

</script>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<body leftmargin='15' topmargin='10'>
<form name="form1" action="AdminManageAskType.do?act=modify&returnUrl=${RETURN_URL }" method="post" onsubmit="return checkSubmit();">
<input type="hidden" name="id" id="id" value="${ASK_TYPE.id }" />
<input type="hidden" name="pid" id="pid" value="${ASK_TYPE.pid }" />
  
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
  <tr>
    <td width="100%" height="20" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30">&nbsp;<a href="AdminManageAskType.do?act=list"><u>问答管理</u></a>&gt;&gt;增加问答类型</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;">
  <tr>
  
  
      <td height="95" align="center" bgcolor="#FFFFFF">
    <table width="100%" border="0" cellspacing="0" id="head2" cellpadding="0" style="display:none">
          <tr>
            <td colspan="2" align="left" bgcolor="#EDF9D5">
<table width="168" height="24" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84" align="center" bgcolor="#006600"><a href="#" onClick="ShowItem1()" class="STYLE1">
                  	<u>常规选项</u></a>&nbsp;</td>
                  <td width="84" align="center" bgcolor="#FFFFFF">高级选项&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
       </table>
	    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="htable" id="head1">
          <tr>
            <td colspan="2" align="left" bgcolor="#EDF9D5">
            <table width="168" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84" height="24" align="center" bgcolor="#FFFFFF">&nbsp;常规选项&nbsp;</td>
                  <td width="84" align="center" bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem2()"><u>高级选项</u></a></td>
                </tr>
            </table></td>
          </tr>
        </table>
	    <table width="98%" border="0"  id="needset" cellspacing="0" cellpadding="0">
          <tr>
            <td width="120" height="26" align="left" class='bline'>是否支持投稿：</td>
          <td align="left" class='bline'>
           	  <input type='radio' name='issend' value='0' class='np' />不支持&nbsp;
              <input type='radio' name='issend' value='1' class='np'  checked />支持
          </td>
          </tr>
      
          <tr>
            <td height="26" align="left" class='bline'>类型名称：</td>
            <td align="left" class='bline'><input name="name" type="text" id="name" size="30" value="${ASK_TYPE.name }" /></td>
          </tr>
          <tr>
            <td height="26" align="left" class='bline'> 排列顺序： </td>
            <td align="left" class='bline'><input name="disorder" size="6" type="text" value="${ASK_TYPE.disorder }" /> （由低 -&gt; 高） </td>
          </tr>

          

        </table>
	    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="adset" style="display:none">
   
          <tr>
            <td height="65" align="left">关键字：</td>
            <td align="left"> <textarea name="keywords" cols="40" rows="3" id="keywords">${ASK_TYPE.keywords }</textarea>
            </td>
          </tr>
          <tr>
            <td height="65" align="left">类型描述：</td>
            <td height="65" align="left"> <textarea name="description" cols="40" rows="3" id="description">${ASK_TYPE.description }</textarea></td>
          </tr>
        </table>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
            <td height="50">
				<input name="imageField" type="submit" class="inputbut" value="确定" />&nbsp;&nbsp;&nbsp;
            	<input type="button" name="button" id="button" value="返回" class="inputbut" onclick="javascript:location='AdminManageAskType.do?act=list'" />
			</td>
            </tr>
      </table></td>
    
  </tr>
</table>

</form>
</body>
</html>