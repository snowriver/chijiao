<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<%
	com.forbes.util.DictionaryManager  dm = com.forbes.util.DictionaryManager.getInstance();
	request.setAttribute("SERVICE_TPYE",dm.getValList("SERVICE_TPYE"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>增加视频</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../include/dedeajax2.js"></script>
	<script type="text/javascript" src="../js/jquery/jquery-1.3.1.min.js"></script>
	
	<script language='javascript' src='main.js'></script>
	<script language="javascript">
		function onSubmit(){
			if( !notNull( service.serviceName,"服务名不能为空") ){
				return false;
			}
			if( !notNull( service.price,"价格不能为空") ){
				return false;
			}
			if( !notNull( service.discount,"折扣不能为空") ){
				return false;
			}
			if( !isnumeric( service.price,"价格必须是数字") ){
				return false;
			}
			if( !isnumeric( service.discount,"折扣必须是数字") ){
				return false;
			}
			if( !isnumeric( service.serviceCount,"数量必须是数字") ){
				return false;
			}
			if( !notNull( service.dealClass,"处理类不能为空") ){
				return false;
			}
			service.submit();
		}
	</script>



<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<body topmargin="8">
<form name="service" action="AdminManageService.do?act=add" method="post" onsubmit="onSubmit();return false">
<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">服务管理</div>
</div>



<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="30">&nbsp;<a href="AdminManageService.do?act=list"><u>服务列表</u></a>&gt;&gt;添加服务</td>
      <td width="31%" align="right">&nbsp; <br /></td>
      <td width="1%">&nbsp;</td>
    </tr>
</table>

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
	<tr>
		<td bgcolor="#FFFFFF">
			<!-- Tab1 -->
		  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="head1" class="htable">
	        	<tr>
	          		<td colspan="2" bgcolor="#EDF9D5">
	          			<table border="0" cellpadding="0" cellspacing="0">
		          			<tr>
	                			<td width="84" height="28" align="center" bgcolor="#FFFFFF">&nbsp;常规参数&nbsp;</td>	                			
	              			</tr>
	          			</table>
	          		</td>
	        	</tr>
	      	</table>
	      	
	      	
	
	    	<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td height="2"></td></tr></table>
	
	       	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" id="needset">
				<tr>
	           		<td width="100%" height="28" class="bline">
				   		<table width="800" border="0" cellspacing="0" cellpadding="0">
	                		<tr>
	                  			<td width="180">&nbsp;服务名称：</td>
	                  			<td><input name="serviceName" type="text" id="serviceName" style="width:300px" /></td>	                  			
	                		</tr>
	             		</table>
					</td>
				</tr>
	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;服务类型：</td>
	             				<td>
									<input name="serviceCount" type="text" value="1" size="5" />
					                <select name="serviceType">
					                  <c:forEach  items="${SERVICE_TPYE}" var="v">
					                    <option value="${v.dvalue}">${v.dvalueDescCh}</option>
					                  </c:forEach>
					            	</select>
								</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;价格：</td>
	             				<td>
									<input type="text" name="price" /> 元 (如果是按实际情況收费输入0)
								</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;是否显示给客户订购：</td>
	             				<td>
	             					<select type="select" name="serviceDisp">
						                <option value="Y">是</option>
						                <option value="N">否</option>
						            </select>
            					</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;服务分类：</td>
	             				<td>
	             					<select type="select" name="serviceUser">
						                <option value="0">所有</option>
						                <option value="1">代理</option>
						                <option value="2">客户</option>
						            </select>
	             				 </td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;扣款是否需要确认：</td>
	             				<td>
	             					<select type="select" name="needConfirm">
						                <option value="N">不需要</option>
						                <option value="Y">需要</option>
						            </select>
	             				</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;是否需要客服提供该服务：</td>
	             				<td>
	             					<select type="select" name="needCsDeal">
						                <option value="N">不需要</option>
						                <option value="Y">需要</option>
						            </select>
	             				</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;折扣：</td>
	             				<td><input type="text" name="discount" /> %</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;处理类：</td>
	             				<td><input name="dealClass" type="text" id="dealClass" style="width:300px" value="" /> </td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;服务详细介绍：</td>
	             				<td><textarea name="serviceDescs" cols="50" rows="8"></textarea></td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="180">&nbsp;扣费提示说明：</td>
	             				<td><textarea name="chargeNote" cols="50" rows="8"></textarea></td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	
	        	
	  		</table>
		</td>
	</tr>



	<tr><td height="28" bgcolor="#FFFFFF" class="bline2" align=center>&nbsp;<input type="submit" name="Submit" value=" 添加 " /></td></tr>
	
</table>



	
  

   

  </form>

</body>
</html>