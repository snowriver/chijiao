<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>关键字管理</title>
<script language="javascript">
//获得选中文件的文件名
function SelKw(kw)
{
	//alert(kw);
 	document.form2.keywords.value += " "+kw;
}
function ReturnValue()
{
	//alert(f);
	window.opener.document.${F}.value += document.form2.keywords.value;
	window.opener=true;
  	window.close();
}
function showHide(objname)
{
   var obj = document.getElementById(objname);
   if(obj.style.display=="none") obj.style.display = "block";
   else obj.style.display="none";
}
function AddNewKw()
{
   showHide("addnew");
}
</script>
<link href="css_body.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main"> 
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
   
    <tr id="addnew" style="display:none"> 
        <td width="100%" height="24" colspan="2" align="center" bgcolor="#009900">
          <form name='form1' method="post" action="AdminManageArticleKeyword.do?act=add&returnUrl=|AdminManageArticleKeyword.do|act=select|f=${F}|">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="60" align="center">关键字：</td>
              <td width="140"><input name="keyword" type="text" id="keyword" style="width:130" /></td>
              <td width="40">链接：</td>
              <td width="140"><input name="rpurl" type="text" id="rpurl" style="width:130" /></td>
              <td width="40">频率：</td>
              <td width="50"><input name="rank" type="text" id="rank" style="width:30" value="30" /></td>
              <td width="80"><input type="submit" name="Submit" value="保存" /></td>
            </tr>
          </table>
          </form>
		</td>
     </tr>
	 
	
      <tr> 
        <td width="100%" height="26" colspan="2" bgcolor="#EDF9D5">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td width="31%"><strong>选择关键字</strong></td>
              <td width="69%" align="right">
                <input type="button" name="kwa" value="新增关键字" onclick="AddNewKw()" class="inputbut" />
                <input type="button" name="kwm" value="关键字管理" onclick="location='AdminManageArticleKeyword.do?act=list';" class="inputbut" />
                </td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td bgcolor="#FFFFFF" style="line-height:180%">
        	<c:forEach items="${ARTICLE_KEYWORD_LIST}" var="akl" varStatus="is">
        	 <a href='javascript:SelKw("${akl.keyword }")'><u>${akl.keyword }</u></a> 
          	</c:forEach>
          </td>
      </tr>
      <tr> 
        <td height="24" bgcolor="#EDF9D5" style="line-height:180%">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="120">已选的关键字：</td>
              <td width="400">
              	<form name='form2'>
              	<input name="keywords" type="text" id="keywords" size="55" value="" />
              	</form>
              	</td>
              <td width="93"><input type="button" name="Submit" value="选用" onclick="ReturnValue()" class="inputbut" /></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr align="center"> 
        <td height="24" bgcolor="#F8FBF0">
         	总共 ${ fn:length(ARTICLE_KEYWORD_LIST) } 个关键词
         	
         </td>
      </tr>
    
  </table>
  <div class="tbbottom" style="text-align:right;width:99%" align="left"></div>
</div>
</body>
</html>