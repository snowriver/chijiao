<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ؼ��ֹ���</title>
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
		
			//var errMsg = "����ͨ�ų���<br>[<a href=\"javascript:LoadPage('"+pageno+"')\"><u>��������¼����б�</u></a>]";
			//var myajax = new DedeAjax(listArea,true,true,"",errMsg,"���ڴ���...");
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
	<div class="bodytitletxt">��ƵURL����--${VIDEO.title }</div>
</div>

<div class="main">
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="35" colspan="8" valign="bottom" bgcolor="#EDF9D5">
        <table width="96%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="20%" style="padding-top:6px"><strong>&nbsp;������Ƶά��</strong></td>
            <td width="60%" style="padding-top:6px">
            	<form action="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }" name="form1" method="post">            	
				<table width="400" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center" width="61%">
                   		�ؼ��֣�<input name="keyword" type="text" id="keywordse" style="width:150px" value="${PARA['keyword'] }" />
                   	</td>
                    <td width="39%"> <input type="submit" name="Submit" value="����" class="inputbut" /> </td>
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
          <td width="66" height='28' bgcolor="#EFFAC9">���⣺</td>
          <td width="180" colspan="3" bgcolor="#EFFAC9" align="left">
          	<input name='title' style="width:350px" type='text' id='title' value='' class='ininput' /></td>
          
          
          <td width="72" bgcolor="#EFFAC9">��Դ��</td>
          <td width="80" bgcolor="#EFFAC9" colspan="2">
          	<select id="fromweb" name="fromweb">
            	<option value="0">��ѡ��</option>
            	<option value="youku">�ſ���</option>
            	<option value="tudou">������</option>
            	<option value="6">���䷿</option>
            	<option value="56">56��</option>
            	<option value="sina">���˲���</option>
            	<option value="ku6">��6��Ƶ</option>
            	<option value="youtube">YouTube</option>
            	
           	</select>
          </td>
         
        </tr>
        <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">URL��</td>
          <td width="180" bgcolor="#EFFAC9" colspan="6" align="left">
          
          	<textarea name="url" cols="50" rows="6" id="url" style="width:500px;height:75px;float:left;margin-right:10px"></textarea>
          </td>
          
        </tr>
       <tr align='center' bgcolor='#ffffff'>
          <td width="66" height='28' bgcolor="#EFFAC9">&nbsp;</td>
          <td width="180" bgcolor="#EFFAC9" colspan="6" align="left">
          	<input type="submit" name="Submit" value="���" class="inputbut" />
          	
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
            <td width="10%" style="padding-top:6px"><strong>&nbsp;�������</strong></td>
            <td width="90%" style="padding-top:6px">
            	<form action="AdminBatchAddVideoUrl.do?act=url&videoid=${PARA['videoid'] }" name="form1" method="post">            	
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<td align="center" width="20%">
                   		��Դ��
                   		<select id="fromweb" name="fromweb">
			            	<option value="0">��ѡ��</option>
			            	<option value="youku">�ſ���</option>
			            	<option value="tudou">������</option>
			            	<option value="6">���䷿</option>
			            	<option value="56">56��</option>
			            	<option value="sina">���˲���</option>
			            	<option value="ku6">��6��Ƶ</option>
			            	<option value="youtube">YouTube</option>			            	
			           	</select>
                   	</td>
                    <td align="center" width="60%">
                   		URL��<input name="url" type="text" id="url" style="width:80%" value="" />
                   		<input name="page" type="text" id="page" style="width:5%" value="" />ҳ
                   		<input name="returnUrl" type="hidden" value="|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" />
                   	</td>
                    <td width="39%"> <input type="submit" name="Submit" value="���" class="inputbut" /> </td>
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
      <td width='20%'><a href="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=title"><u>����</u></a></td>
      <td width='50%'>URL</td>
      <td width='6%'><a href="AdminUpdateVideoUrl.do?act=list&videoid=${PARA['videoid'] }&pno=${PAGER.curPage}&keyword=${PARA['keyword']}&orderby=title"><u>��Դ</u></a></td>
      <td width='6%'>ѡ��</td>
      <td>����</td>
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
      	<a href="#" onclick="UpdateUrl(${vu.id }, '|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|');">����</a> |
      	<a href="AdminUpdateVideoUrl.do?act=delete&id=${vu.id }&returnUrl=|AdminUpdateVideoUrl.do|act=list|pno=${PAGER.curPage}|videoid=${PARA['videoid'] }|keyword=${PARA['keyword'] }|orderby=${PARA['orderby'] }|" name="addkeyword">ɾ��</a>
      </td>
    </tr>
    </c:forEach>
    
    </table>
    </span>
    <center>
 		 <input type="submit" name="submit" value="ɾ��ѡ�е���Ƶ" />
	</center> 
    
    </form>
    
     
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr align="center">
      <td height="35" colspan="8" bgcolor="#F9FCF1">
      <span id='pagelist'></span>
      			�� ${PAGER.totoalPage} ҳ&nbsp;&nbsp;${PAGER.totoalCnt} ����¼&nbsp;&nbsp;
						<A href="AdminUpdateVideoUrl.do?act=list&pno=1&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.prePage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        
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
                  
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.nextPage}&${PARA['parameter'] }">��ҳ</A>&nbsp;&nbsp;
        				<A href="AdminUpdateVideoUrl.do?act=list&pno=${PAGER.totoalPage}&${PARA['parameter'] }">ĩҳ</A>&nbsp;&nbsp;
      </td>
    </tr>
</table>


</div>
</body>
</html>