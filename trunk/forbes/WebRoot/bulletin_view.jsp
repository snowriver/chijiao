<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ include file="include/gloable.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="Keywords" content="${WEB_KEYWORD }" />
<meta name="Description" content="${WEB_DESCRIPTION }" />
<title>${WEB_TITLE }</title>
<script type="text/javascript" src="js/index_flash_1.js"></script>
<link type="text/css" rel="stylesheet" href="css/new_index_global.css" />
<link type="text/css" rel="stylesheet" href="css/new_index_style.css" />
<link type="text/css" rel="stylesheet" href="css/index_top.css" />
 

 
</head>
<body>


<table border="0" cellpadding="0" cellspacing="0" width="1%">
	<tbody>
	<tr>
    	<td><img src="images/topa.jpg" height="64" width="652"></td>
  	</tr>
	<tr>
    	<td>
    		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	      		<tbody>
		      		<tr>
		        		<td class="bottomLinka" background="newsInfoa.asp_files/toBg_1.htm" height="31">
		        			<div class="Title2H" align="center"><H1><span style="font-size:24px;font-weight: bold;">${BULLETIN.title }</span></H1></div>
		        		</td>
		      		</tr>
	    		</tbody>
    		</table>
      		<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tbody>
        		<tr>
          			<td class="tdA" align="center" height="25">发布日期：${BULLETIN.pubdate }&nbsp;&nbsp;浏览次数：${BULLETIN.click }</td>
				</tr>
			</tbody>
		</table>
		<table border="0" cellpadding="5" cellspacing="5" width="100%">
			<tbody>
				<tr>
        			<td>
        				<table border="0" cellpadding="0" cellspacing="0" width="100%">
          					<tbody>
          						<tr>
            						<td>
            							<table border="0" cellpadding="2" cellspacing="1" width="100%">
                							<tbody>
                								<tr>
                  									<td colspan="2" class="tdA" style="padding: 8px; line-height: 23px;" align="left">
                  										${BULLETIN.content }
                  									</td>
                								</tr>
            								</tbody>
            							</table>
            						</td>
          						</tr>
        					</tbody>
        				</table>
         			</td>
      			</tr>
    		</tbody>
    	</table>
    </td>
	</tr>
  	<tr>
    	<td><img src="images/bottoma.jpg" height="34" width="652"></td>
  	</tr>
	</tbody>
</table>
 
</body>
</html>