<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>关键字管理</title>
<link href="div.css" rel="stylesheet" type="text/css" />
<link href="css_body.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>

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
      <td height="26" colspan="6"><table width="96%" border="0" align="center">
          <tr> 
            <td width="25%" height="35" align="left"><strong>关键词维护</strong></td>
            
            <td width="75%" align="left">
            	<form name='form2' action="AdminManageArticleKeyword.do?act=list" method="post">
   	        	搜索：
   	          	<input type='text' name='keyword' size='10' /> 
   	        	<input type='submit' name='sb' value='确定' class="inputbut" />
   	        	</form>
   	        &nbsp;
            <input name="n1" type="button" id="n1" value="分析系统内的关键字" onclick="location='article_keywords_make.php';" class="inputbut" /> 
            &nbsp;
            <input name="n11" type="button" id="n11" value="管理搜索的关键字" onclick="location='AdminManageSearchKeyword.do?act=list';" class="inputbut" />
            </td>
          </tr>
        </table></td>
    </tr>
    
      <tr align="center" bgcolor="#F0FDDB"> 
        <td width="100%" height="24" colspan="6" bgcolor="#EDF9D5">
        	<form name='forma' method="post" action="AdminManageArticleKeyword.do?act=add&returnUrl=|AdminManageArticleKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|">
	       	  <table border="0" cellspacing="0" cellpadding="0">
	            <tr> 
	              <td width="100" align="center">新增关键字：</td>
	              <td width="140"><input name="keyword" type="text" id="keyword" style="width:130" /></td>
	              <td width="100">链接网址：</td>
	              <td width="140"><input name="rpurl" type="text" id="rpurl" style="width:130" /></td>
	              <td width="40">频率：</td>
	              <td width="50"><input name="rank" type="text" id="rank" style="width:30" value="30" /></td>
	              <td width="80"><input type="submit" name="Submit" value="保存" class="inputbut" /></td>
	            </tr>
	          </table>
	         </form>
          </td>
      </tr>
   
    <tr align="center" bgcolor="#F8FBFB" height="24"> 
      <td width="8%">选择</td>
      <td width="25%">关键字</td>
      <td width="35%">链接网址</td>
      <td width="10%"><a href="AdminManageArticleKeyword.do?act=list&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=rank desc"><u>频率</u></a></td>
      <td width="22%">管理</td>
    </tr>
    
    
	<form name='form1' action="AdminManageArticleKeyword.do?act=batchupdate&returnUrl=|AdminManageArticleKeyword.do|act=list|pno=${PAGER.curPage}|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" method="post">
	<c:forEach items="${ARTICLE_KEYWORD_LIST}" var="akl" varStatus="is">
    <tr align="center" bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#EEFAAB';" onmouseout="javascript:this.bgColor='#FFFFFF';"> 
      <td height="24">
      	<input name="aids" type="checkbox" value="${akl.id }"  checked /> 
      </td>
      <td>
      	<input type="hidden" name="keyword_${akl.id }" value="${akl.keyword }" />
      	${akl.keyword }
      </td>
      <td>
      	<input type='hidden' name='rpurlold_${akl.id }' value='${akl.rpurl }' />
      	<input type='text' name='rpurl_${akl.id }' style='width:90%' class='nnpp' value='${akl.rpurl }' />
      </td>
      <td>
      	<input type='text' name='rank_${akl.id }' size='5' class='nnpp' value='${akl.rank }'  />
      </td>
      <td>
      	<input type='hidden' name='staold_${akl.id }' value='${akl.sta }' />
      	<input type='checkbox' name='isnouse_${akl.id }' class='np' value='1' />禁用&nbsp;
      	<input type='checkbox' name='isdel_${akl.id }' class='np' value='1' />删除
      </td>
    </tr>
	</c:forEach>
	
	
     <tr bgcolor="#F0FBBD"> 
       <td height="35" colspan="6" bgcolor="#EDF9D5">
	     &nbsp; <input type="button" name="dl" value="保存更改" onclick="this.form.submit();" class="inputbut" />
	   </td>
	</tr>
	</form>
	
    <tr align="center" bgcolor="#FAFDF0">
      <td height="24" colspan="6">
      		共 ${PAGER.totoalPage} 页&nbsp;&nbsp;${PAGER.totoalCnt} 条记录&nbsp;&nbsp;
						<A href="AdminManageArticleKeyword.do?act=list&pno=1&${PARA['parameter'] }">首页</A>&nbsp;&nbsp;
        				<A href="AdminManageArticleKeyword.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">上页</A>&nbsp;&nbsp;
        
						<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value, 'AdminManageArticleKeyword.do?act=list${PARA['parameter'] }')"> 
							<c:forEach var="i" begin="1" end="${PAGER.totoalPage}" step="1">
				        		<c:if test="${PAGER.curPage == i}">
							        <OPTION value=${i} selected>${i}</OPTION>
							   	</c:if>
								<c:if test="${PAGER.curPage != i}">
									<OPTION value=${i}>${i}</OPTION>
								</c:if>
							</c:forEach>
			 			</SELECT>&nbsp;&nbsp;
                  
        				<A href="AdminManageArticleKeyword.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">下页</A>&nbsp;&nbsp;
        				<A href="AdminManageArticleKeyword.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">末页</A>&nbsp;&nbsp;
      </td>
    </tr>
  </table>
</div>
</body>
</html>