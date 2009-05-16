<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' />
<title>栏目选择</title>

<link type="text/css" rel="stylesheet" href="css/dtree.css" />
<script language="javascript" src="admin/include/dedeajax2.js"></script>
<script language="javascript" type="text/javascript" src="js/dtree.js"></script>
<script language="javascript" type="text/javascript" src="js/op.js"></script>
<script language="javascript" src="js/jquery/jquery-1.2.6.min.js"></script>

<script language="javascript">

function ReSel(tid){
	
	if( tid != 0) {
		var s = $("#selid"+tid);
		window.opener.document.all.${TYPEID}.value=tid;
		window.opener.document.all.${SELBTN}.value=s.val();
	}
	else {
		window.opener.document.all.${TYPEID}.value='';
		window.opener.document.all.${SELBTN}.value="请选择";
	}
	if(document.all) 
		window.opener=true;
  	window.close();
  	
}


</script>

</head>

<body bgcolor="#007400">
<table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>
  <tr> 
    <td height='24' background='img/mtbg1.gif'  style='border-left: 1px solid #2FA1DB; border-right: 1px solid #2FA1DB;'>
		　<strong>√请在要选择的栏目打勾</strong>
	  <input type='checkbox' name='nsel' id='selid0' class='np' onclick="ReSel(0)" value="请选择" />不限栏目
	</td>
  </tr>
  <tr> 
    <td height='24' >
	</td>
  </tr>
  <tr align="center"> 
    <td height='24' background='img/mtbg1.gif'  style='border-left: 1px solid #2FA1DB; border-right: 1px solid #2FA1DB;'>
		　<input type="button" value="全部展开" onclick="javascript: d.openAll();" /> | <input type="button" value="全部收缩" onclick="javascript: d.closeAll();" />
	  
	</td>
  </tr>
  <tr bgcolor='#EEFAFE'> 
    <td align='center' bgcolor="#eefef0" id='items1'> 

			<table width="100%" cellpadding="0" cellspacing="0" summary="" border="1"> 
                <tr valign="top" align="left"> 
          	      <td>
          	        <script type="text/javascript">
					
					  d = new dTree('d');
					  d.config.folderLinks = true;
					  //id, pid, name, url, title, target, icon, iconOpen, open		
					  d.add(0,-1,'代理點管理','','easydone','_self');
					  <c:forEach items="${VIDEO_TYPE_LIST}" var="atl" varStatus="is">
						    d.add(${atl.id}, ${atl.pid},"<a href='javascript:void(0);' onclick='ReSel(${atl.id});'>  ${atl.name} </a><input type='checkbox' name='type' id='selid${atl.id}' value='${atl.name}' onclick='ReSel(${atl.id});' >", "#", "${atl.name}", "_self");
					  </c:forEach>
					  document.write(d);
					 
				    </script>
			      </td>
                </tr> 
              </table> 
              
	</td>
  </tr>
</table>


</body>
</html>
