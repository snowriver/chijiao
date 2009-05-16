<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*,java.util.*" %>

<%
	String cpt = request.getContextPath();
	String cp = cpt.substring(1);
	//System.out.println(cp);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Jsp File Manger Version0.5</title>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
	<meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT" />
    <script language="javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
	<style>
		td,select,input,body {
		  font-size:9pt;
		}
		A { TEXT-DECORATION: none }
	</style>
	
	<script language="javascript">

		function ReSel(url){
			alert(url);
			//if( tid != 0) {
				//var s = $("#selid"+tid);
				window.opener.document.all.litpicurl.value = url;
				window.opener.document.all.picview.src = "../"+url;
			//}
			//else {
				//window.opener.document.all.typeid.value='';
				//window.opener.document.all.selbtn.value="请选择";
			//}
			if(document.all) 
				window.opener=true;
		  	window.close();
		}
	</script>

</head>
<body>	

<%

	request.setCharacterEncoding("utf-8");
	String strDir = request.getRealPath("/") + "UploadFile";
	int fileCnt   = 0;

	if(!new java.io.File(strDir).isDirectory())
		new java.io.File(strDir).mkdirs(); 

 	if (request.getParameter("path")!=null )
		strDir = request.getParameter("path");

	StringBuffer sb     = new StringBuffer("");
	StringBuffer sbFile = new StringBuffer("");
	
	try {
 		out.println("<table border=1 width='100%' bgcolor='#E1ECC8'><tr><td width='30%'>当前目录： <b>"+strDir+"</b> </td></tr></table><br>\r\n");
 		File objFile = new File(strDir);
 		File list[]  = objFile.listFiles();
 		fileCnt      = list.length;
 		if(objFile.getAbsolutePath().length()>3) {
  			sb.append("<tr><td >&nbsp;</td><td align='left'><img src='../images/dir2.gif' /><a href='?path="+objFile.getParentFile().getAbsolutePath()+"'>");
  			sb.append("上级目录</a><br>- - - - - - - - - - - - - - - - -</td></tr>\r\n");
 		}
 		for(int i=0; i<list.length; i++) {
  			if(list[i].isDirectory()) {
      			sb.append("<tr><td >&nbsp;</td><td align='left'>");
   				sb.append("<img src='../images/dir.gif' /><a href='?path="+list[i].getAbsolutePath()+"'>"+list[i].getName()+"</a>");
   				sb.append("</td></tr>");
      			//sb.append("</td></tr></table>\r\n");
      			//System.out.println("ss"+list[i].getAbsolutePath());
  			} else {
  				
  				//System.out.println(list[i].getAbsolutePath());
  				//int index = list[i].getAbsolutePath().indexOf(cp);
  				System.out.println(list[i].getAbsolutePath().substring(list[i].getAbsolutePath().indexOf(cp)+7));
  				String url = "'" + list[i].getAbsolutePath().substring(list[i].getAbsolutePath().indexOf(cp)+7) + "'";
  				url = url.replace("\\", "/"); //去掉引号
  				
				String strLen = "";
   				String strDT = "";
   				long lFile = 0;
   				lFile = list[i].length();
   
		   		if(lFile>1000000) {
		    		lFile = lFile/1000000;
		    		strLen = "" + lFile + " M";
		   		}
		   		else if(lFile>1000) {
		    		lFile = lFile/1000;
		    		strLen = "" + lFile + " K";
		   		} else {
		    		strLen = "" + lFile + " Byte";
		   		}
		   		Date dt = new Date(list[i].lastModified());
		   		strDT = dt.toLocaleString();
		   		sbFile.append("<tr bgcolor='#F9FBF0'><td align='left'>");
		   		sbFile.append(""+list[i].getName());
			   	sbFile.append("</td><td>");
			   	sbFile.append(""+strLen);
			   	sbFile.append("</td><td>");
			   	sbFile.append(""+strDT);
			   	sbFile.append("</td><td align='center'>");
			   	sbFile.append(" <a href='javascript:void(0);' onclick=ReSel(" + url + ")>选择</a> ");
			   	sbFile.append("</td></tr>\r\n");
		      	//sbFile.append("</td></tr></table>");
			}
		}
		//out.println(sb.toString()+sbFile.toString());
	} catch(Exception e) {
		 out.println("<font color=red>操作失败： "+e.toString()+"</font>");
	}
%>



<table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
	<tr>
		<td width="25%" align="center" valign="top">
			<table width="98%" border="0" cellspacing="0" cellpadding="3">
				<tr>
					<td>
						<%=sb%>
     				</td>
				</tr>
			</table>
		</td>
		<td width="81%" align="center" valign="top">
		
			<table width="98%" border="1" cellspacing="1" cellpadding="4" bordercolorlight="#cccccc" bordercolordark="#FFFFFF">
       			<tr bgcolor="#E1ECC8">
                	<td width="26%">文件名称</td>
                	<td width="19%" align="center">文件大小</td>
          			<td width="29%" align="center">修改时间</td>
                	<td width="15%" align="center">文件操作</td>
              	</tr>
 
            	<%=sbFile%>
            	
            	<tr align="center"> 
                	<td colspan="4"><br />总计文件个数：<font color="#FF0000"><%=fileCnt %></font>	</td>
              	</tr>
			</table>
			
		</td>
	</tr>
</table>


<table width='100%'>
	<tr valign="middle">
		<td bgcolor="#99CC00" style="clear:all">
			<form action="select_images_post.jsp?path=<%=strDir %>" method="post" enctype="multipart/form-data" name='myform'>
  				&nbsp;上　传： <input type='file' name='imgFile' style='width:200px' style="clear:all" />
  				&nbsp;<input type='checkbox' name='resize' value='1' class='np' style="clear:all" />自动缩小
  				宽：<input type='text'  name='iwidth' size='5' value='200' />
  				高：<input type='text'  name='iheight' size='5' value='200' />
  				<input type='submit' name='sb' value='确定' />
  			</form>
		</td>
	</tr>

	<tr valign="middle">
  		<td bgcolor='#66CC00'> 
  			<form action='select_images_mkdir.jsp?path=<%=strDir %>' method='post' name='myform2'>
  				&nbsp;新目录： <input type='text' name='dirname' value='' style='width:150' />
  				<input type='submit' name='sb2' value='创建' style='width:40' />
  			</form>
		</td>
	</tr>

</table>


</body>
</html>
