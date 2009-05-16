<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>搜索关键字管理</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
<link href="div.css" rel="stylesheet" type="text/css"/>
<style>
	.nnpp{
	border-bottom:1px solid #98CAEF;
	border-top:1px solid #FFFFFF;
	border-left:1px solid #FFFFFF;
	border-right:1px solid #FFFFFF;
	filter:alpha(opacity=50);
 }
</style>
<script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script language="javascript" src="../include/dedeajax2.js"></script>
<script language='javascript' src='main.js'></script>
<script language="JavaScript">

		function UpdateNote(nid, returnUrl){
			var kw  = $("#keyword"+nid).val();
			var kws = $("#spwords"+nid).val();
			var ct  = $("#count"+nid).val();
			//alert(kw);
			
			window.location="AdminManageSearchKeyword.do?act=update&id=" + nid + "&keyword=" + kw +"&spwords=" + kws + "&count=" + ct +"&returnUrl=" + returnUrl;
			
			//alert("XXXXXXX");
			
			//var listArea = $Obj('rslist');
			//var kw  = $Obj('keyword'+nid).value;
			//var kws = $Obj('spwords'+nid).value;
			//var ct  = $Obj('count'+nid).value;
		
			//var errMsg = "网络通信出错！<br>[<a href=\"javascript:LoadPage('"+pageno+"')\"><u>点击此重新加载列表</u></a>]";
			//var myajax = new DedeAjax(listArea,true,true,"",errMsg,"正在处理...");
		  	//myajax.SendGet("search_keywords_main.php?dopost=update&aid="+nid+"&keyword="+kw+"&spwords="+kws+"&count="+ct+"&pageno="+pageno);
		  	
		}


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
		
		
		
	</script>
</head>
<body>
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">批量管理</div>
</div>

<div class="main">
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="35" colspan="8" valign="bottom" bgcolor="#EDF9D5">
        <table width="96%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="20%" style="padding-top:6px"><strong>&nbsp;搜索关键词维护</strong></td>
            <td width="60%" style="padding-top:6px">
            	<form action="AdminManageSearchKeyword.do?act=list" name="form1" method="post">            	
				<table width="400" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center" width="61%">
                   		关键字：<input name="keyword" type="text" id="keywordse" style="width:150px" value="${PARA['keyword'] }" />
                   	</td>
                    <td width="39%"> <input type="submit" name="Submit" value="搜索" class="inputbut" /> </td>
                  </tr>
            	</table>
            	</form>
   			</td>
            <td width="20%" align="right" style="padding-top:6px">
			<input name="n1" type="button" id="n1" value="文档关键字维护" onclick="location='AdminManageArticleKeyword.do?act=list';" class="inputbut" />
			</td>
          </tr>
        </table>
		</td>
    </tr>
	<tr>
      <td height="36" colspan="8" align="right" bgcolor="#F7FAEB" style="padding-right:3px">
      	<form action="AdminManageSearchKeyword.do?act=add&returnUrl=|AdminManageSearchKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" method="post" name="addkeyword">
	    <table border='0' cellpadding='1' cellspacing='1'>
        <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">关键词：</td>
          <td width="180" bgcolor="#EFFAC9"><input name='keyword' style="width:160px" type='text' id='keyword' value='' class='ininput' /></td>
          <td width="72" bgcolor="#EFFAC9">分词结果：</td>
          <td width="180" bgcolor="#EFFAC9"><input name='spwords' style="width:160px" type='text' id='spwords' value='' class='ininput' /></td>
          <td width="72" bgcolor="#EFFAC9">搜索频率：</td>
          <td width="80" bgcolor="#EFFAC9"><input name='count' style="width:60px" type='text' id='count' value='10' class='ininput' /></td>
          <td bgcolor="#EFFAC9"><input type="submit" name="Submit" value="〖新增一条〗" class="inputbut" /></td>
        </tr>
      </table>
      </form>
      </td>
    </tr>
	</table>
	
	
	<form action="AdminManageSearchKeyword.do?act=batchdelete&returnUrl=|AdminManageSearchKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" method="post">
	<span id='rslist'>
    <table width='96%' border='0' cellpadding='1' cellspacing='1' bgcolor='#E2F5BC' style='margin-bottom:3px' align='center'>
    <tr align='center' bgcolor='' height='24'>
      <td width='6%' height='28'><a href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=id"><u>ID</u></a></td>
      <td width='20%'>关键字</td>
      <td width='25%'>分词结果</td>
      <td width='6%'><a href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=count desc"><u>频率</u></a></td>
      <td width='6%'><a href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=result desc"><u>结果</u></a></td>
      <td width='6%'>选择</td>
      <td width='20%'><a href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=lasttime desc"><u>最后搜索时间</u></a></td>
      <td>管理</td>
    </tr>
    
    <c:forEach items="${SEARCH_KEYWORD_LIST}" var="skl" varStatus="is">
    <tr align='center' bgcolor='#FFFFFF' onmousemove="javascript:this.bgColor='#FCFEDA';" onmouseout="javascript:this.bgColor='#FFFFFF';">
      <td height='28'>${skl.id }</td>
      <td><input name='keyword' type='text' id='keyword${skl.id }' value='${skl.keyword }' class='ininput' /></td>
      <td><input name='spwords' type='text' id='spwords${skl.id }' value='${skl.keyword }' class='ininput' /></td>
      <td><input name='count' type='text' id='count${skl.id }' value='${skl.count }' class='ininput' /></td>
      <td><a href='/plus/search.php?kwtype=0&keyword=nimhao&searchtype=titlekeyword' target='_blank'><u>${skl.result }</u></a></td>
      <td><input type='checkbox' id='kids${skl.id }' name='kids' class='np' value='${skl.id }' /></td>
      <td>${skl.lasttime }</td>
      <td>
      	<a href="#" onclick="UpdateNote(${skl.id }, '|AdminManageSearchKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|');">更新</a> |
      	<a href="AdminManageSearchKeyword.do?act=delete&id=${skl.id }&returnUrl=|AdminManageSearchKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" name="addkeyword">删除</a>
      </td>
    </tr>
    </c:forEach>
    
    </table>
    </span>
    <center>
 		 <input type="submit" name="submit" value="删除选中的关键词" />
	</center> 
    
    </form>
    
     
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr align="center">
      <td height="35" colspan="8" bgcolor="#F9FCF1">
      <span id='pagelist'></span>
      			共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminManageSearchKeyword.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageSearchKeyword.do?act=list${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminManageSearchKeyword.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
      </td>
    </tr>
</table>


</div>
</body>
</html>