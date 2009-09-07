<%@ page language="java" pageEncoding="gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	
    com.forbes.ajax.ArticleTypeSelector ss = new com.forbes.ajax.ArticleTypeSelector();
	java.util.List topTypes = ss.getTopArticleType();
	request.setAttribute("TOP_ARTICLE_TYPE_LIST", topTypes);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>关键字管理</title>
<link href="div.css" rel="stylesheet" type="text/css" />
<link href="css_body.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/progressBar.css" />
<script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script language="javascript" src="js/progressBar.js"></script>

<style>
	.nnpp{
	border-bottom:1px solid #98CAEF;
	border-top:1px solid #FFFFFF;
	border-left:1px solid #FFFFFF;
	border-right:1px solid #FFFFFF;
	filter:alpha(opacity=50);
 }
</style>

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
		
		function onSelectTopArticleType(obj){
		$.post(
			"../ajax/ArticleTypeSelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateSelectTopArticleType
		);
	}
	
	function updateSelectTopArticleType(response){
		var arr = new Array();
		arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
		var op = new Array();
		$("#typeid").empty();
        $("<option value='0'>请选择副类型</option>").appendTo("#typeid");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#typeid");
		}
		
	}
	
	function onSelectType(obj){
		$("#typeid").val(obj.value);
	}
		
	</script>
	
</head>
<body>
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">批量添加文章</div>
</div>

<div class="main"> 
	<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    
    	
    	<tr> 
      		<td height="26" colspan="6">
      			<table width="100%" border="0" align="center">
          			<tr> 
            			<td width="100%" height="35" align="left"><strong>通过上传Access文件添加文章</strong></td>            
          			</tr>
        		</table>
        	</td>
		</tr>
    
		<tr align="center" bgcolor="#F0FDDB"> 
        	<td width="100%" height="24" colspan="6" bgcolor="#EDF9D5">

						<iframe id='target_upload' name='target_upload' src='' 
							style='display: none'></iframe>
						<form action="AdminBatchAddArticle.do?act=upload" id="uploadForm"
							enctype="multipart/form-data" method="post"
							target="target_upload">
							<input type="file" name="upload" />
							<input type="button" id="subButton" value="上传" />
						</form>
						<div id="progress">
							<div id="title">
								<span id="text">上传进度</span>
								<div id="close">X</div>
							</div>
							<div id="progressBar">
								<div id="uploaded"></div>
							</div>
							<div id="info"></div>
						</div>
			</td>
      	</tr>
      	
		<tr align="center" bgcolor="#F8FBFB" height="24"> 
      		<td width="100%"></td>      
    	</tr>
	</table>
</div>
</body>
</html>