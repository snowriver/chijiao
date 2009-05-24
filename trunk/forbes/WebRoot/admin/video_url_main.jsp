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

		function UpdateUrl(vid, returnUrl){
			var title   = $("#title"+vid).val();
			var url     = $("#url"+vid).val();
			var fromweb = $("#fromweb"+vid).val();
			//alert(kw);
			
			window.location="AdminUpdateVideoUrl.do?act=modify&id=" + vid + "&title=" + title +"&url=" + url + "&fromweb=" + fromweb +"&returnUrl=" + returnUrl;
			
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
	<div class="bodytitletxt">视频URL管理--${VIDEO.title }</div>
</div>

<div class="main">
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="35" colspan="8" valign="bottom" bgcolor="#EDF9D5">
        <table width="96%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="20%" style="padding-top:6px"><strong>&nbsp;搜索视频维护</strong></td>
            <td width="60%" style="padding-top:6px">
            	<form action="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }" name="form1" method="post">            	
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
			<br />
			</td>
          </tr>
        </table>
		</td>
    </tr>
	<tr>
      <td height="36" colspan="8" align="center" bgcolor="#F7FAEB" style="padding-right:3px">
      	<form action="AdminUpdateVideoUrl.do?act=add&videoid=${PARA['videoid'] }&returnUrl=|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" method="post" name="addkeyword">
	    <table border='0' cellpadding='1' cellspacing='1'>
        <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">标题：</td>
          <td width="180" colspan="3" bgcolor="#EFFAC9" align="left">
          	<input name='title' style="width:350px" type='text' id='title' value='' class='ininput' /></td>
          
          
          <td width="72" bgcolor="#EFFAC9">来源：</td>
          <td width="80" bgcolor="#EFFAC9" colspan="2">
          	<select id="fromweb" name="fromweb">
            	<option value="0">请选择</option>
            	<option value="youku">优酷网</option>
            	<option value="tudou">土豆网</option>
            	<option value="6">六间房</option>
            	<option value="56">56网</option>
            	<option value="sina">新浪播客</option>
            	<option value="ku6">酷6视频</option>
            	<option value="youtube">YouTube</option>
            	
           	</select>
          </td>
         
        </tr>
        <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">URL：</td>
          <td width="180" bgcolor="#EFFAC9" colspan="6" align="left">
          
          	<textarea name="url" cols="50" rows="6" id="url" style="width:500px;height:75px;float:left;margin-right:10px"></textarea>
          </td>
          
        </tr>
       <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">&nbsp;</td>
          <td width="180" bgcolor="#EFFAC9" colspan="6" align="left">
          	<input type="submit" name="Submit" value="添加" class="inputbut" />
          	
          </td>
          
        </tr>
      </table>
      </form>
      </td>
    </tr>
    
    <tr>
      <td height="35" colspan="8" valign="bottom" bgcolor="#EDF9D5">
        <table width="96%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%" style="padding-top:6px"><strong>&nbsp;批量添加</strong></td>
            <td width="90%" style="padding-top:6px">
            	<form action="AdminBatchAddVideoUrl.do?act=url&videoid=${PARA['videoid'] }" name="form1" method="post">            	
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<td align="center" width="20%">
                   		来源：
                   		<select id="fromweb" name="fromweb">
			            	<option value="0">请选择</option>
			            	<option value="youku">优酷网</option>
			            	<option value="tudou">土豆网</option>
			            	<option value="6">六间房</option>
			            	<option value="56">56网</option>
			            	<option value="sina">新浪播客</option>
			            	<option value="ku6">酷6视频</option>
			            	<option value="youtube">YouTube</option>			            	
			           	</select>
                   	</td>
                    <td align="center" width="60%">
                   		URL：<input name="url" type="text" id="url" style="width:80%" value="" />
                   		<input name="page" type="text" id="page" style="width:5%" value="" />页
                   		<input name="returnUrl" type="hidden" value="|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" />
                   	</td>
                    <td width="39%"> <input type="submit" name="Submit" value="添加" class="inputbut" /> </td>
                  </tr>
            	</table>
            	</form>
   			</td>
            <td width="20%" align="right" style="padding-top:6px">
			<br />
			</td>
          </tr>
        </table>
		</td>
    </tr>
	</table>
	
	
	<form action="AdminUpdateVideoUrl.do?act=batchdelete&returnUrl=|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" method="post">
	<span id='rslist'>
    <table width='96%' border='0' cellpadding='1' cellspacing='1' bgcolor='#E2F5BC' style='margin-bottom:3px' align='center'>
    <tr align='center' bgcolor='' height='24'>
      <td width='6%' height='28'><a href="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=id"><u>ID</u></a></td>
      <td width='20%'><a href="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=title"><u>标题</u></a></td>
      <td width='50%'>URL</td>
      <td width='6%'><a href="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=title"><u>来源</u></a></td>
      <td width='6%'>选择</td>
      <td>管理</td>
    </tr>
    
    <c:forEach items="${VIDEO_URL_LIST}" var="vu" varStatus="is">
    <tr align='center' bgcolor='#FFFFFF' onmousemove="javascript:this.bgColor='#FCFEDA';" onmouseout="javascript:this.bgColor='#FFFFFF';">
      <td height='50'>${vu.id }</td>
      <td><input name='title' type='text' id='title${vu.id }' value='${vu.title }' class='ininput' style="width:200px"/></td>
      <td align='center'>
      	<textarea id='url${vu.id }' name="url" cols="50" rows="3" id="url" style="width:500px;height:35px;float:left;margin-right:10px">${vu.url }</textarea>
      </td>
      <td>
      	${vu.fromweb }</td>
      <td><input type='checkbox' id='vus${vu.id }' name='vus' class='np' value='${vu.id }' /></td>
      <td>
      	<a href="#" onclick="UpdateUrl(${vu.id }, '|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|');">更新</a> |
      	<a href="AdminUpdateVideoUrl.do?act=delete&id=${vu.id }&returnUrl=|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" name="addkeyword">删除</a>
      </td>
    </tr>
    </c:forEach>
    
    </table>
    </span>
    <center>
 		 <input type="submit" name="submit" value="删除选中的视频" />
	</center> 
    
    </form>
    
     
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr align="center">
      <td height="35" colspan="8" bgcolor="#F9FCF1">
      <span id='pagelist'></span>
      			共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminUpdateVideoUrl.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminUpdateVideoUrl.do?act=list${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
      </td>
    </tr>
</table>


</div>
</body>
</html>