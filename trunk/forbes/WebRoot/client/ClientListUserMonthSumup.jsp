<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�ҵĹ����̨ - �ƻ�����</title>
<meta content="text/html; charset=gbk" http-equiv="Content-Type">
<meta name="keywords" content="">
<meta name="description" content=" ">
<meta name="generator" content="MSHTML 8.00.6001.18241">

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/user_daily_plan.css">
<link rel="stylesheet" type="text/css" href="../js/jquery/jquery.wysiwyg.css" />
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="../js/openPage.js" charset="gb2312"></script>

<script language="javascript" type="text/javascript">
	
		$(function() {
    		$('#aim').wysiwyg();
    		$('#gain').wysiwyg();
    		$('#challenge').wysiwyg();
    		$('#improve').wysiwyg();
    		$('#analyse').wysiwyg();    		
  		});
	
</script>
</head>
<body>
<c:set var="p" value="client_manage_month_sumup"></c:set>
<c:set var="month" value="${PARA['month'] }"></c:set>
<c:set var="url" value="ClientManageUserMonthSumup.do?act=list"></c:set>

<div id=supevbox></div>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<div class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<div class=mainbody>
	<div id="append"></div>
<div class="ucbody">
	<h1>
		<div style="float:left">�¶ȼ��ܽ� [${PARA['year'] }��-${PARA['month']}��]</div>
		<div style="float:right">
			<a href="ClientManageUserMonthSumup.do?act=list&year=${PARA['year']-1 }">��һ��</a>			
			<SELECT onchange="selectOnchange(this.options[this.options.selectedIndex].value)"> 
				<c:forEach var="year" begin="2000" end="2050" step="1" >				
				<option value="${year }" <c:if test="${PARA['year'] == year }">selected</c:if> >${year }</option>
				</c:forEach>
			</select>
			<a href="ClientManageUserMonthSumup.do?act=list&year=${PARA['year']+1 }">��һ��</a>&nbsp;&nbsp;&nbsp;
		</div>
	</h1>		
	<div class="ucnav">
		<%@ include file="include/MonthMenu.jsp"%>		
	</div>
	
	<div>
		<form method="post" name="form2" action="ClientManageUserMonthSumup.do?act=add">
			<INPUT type="hidden" id="id" name="id" value="${USER_MONTH_SUMUP.id }" />
			<INPUT type="hidden" id="year" name="year" value="${PARA['year'] }">
			<INPUT type="hidden" id="month" name="month" value="${PARA['month'] }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
							
		    		<tr class="onset">
		    			<TD colspan="5" align="center">
		    				���Ƿ������ҵ��¶�Ŀ�ꣿ û�д�ɵ�ԭ����ϰ���ʲô�� ���Ժ������Ľ���
		    			</TD>
		    		</tr>
					<tr class="onset">
						<td colspan="5">
							<textarea id="aim" name="aim" rows="11" cols="90" style="width:98%">${USER_MONTH_SUMUP.aim }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">
		    				����£�������Щ�ջ� ����ֵ�ý�����һ������ʲô�� ���ϸ������������Щ�������ұ���Ҫ�Ľ��Ļ�ϰ������Щ���ұ�����ߵ���������Щ��
		    			</TD>
		    		</tr>
					<tr class="onset">	
						<td colspan="5">
							<textarea id="gain" name="gain" rows="11" cols="90" style="width:98%">${USER_MONTH_SUMUP.gain }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">
		    				����£��������������ս��ʲô�� ��Ҫ���Ƶķ�����ʲô�� �ҿ���Ϊ�ҵĹ�˾�ͼ������������ʲô��
		    			</TD>
		    		</tr>
					<tr class="onset">	
						<td colspan="5">
							<textarea id="challenge" name="challenge" rows="11" cols="90" style="width:98%">${USER_MONTH_SUMUP.challenge }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">
		    				�Ҹ��Լ��¸��µĸĽ���ŵ�ǣ�
		    			</TD>
		    		</tr>
					<tr class="onset">	
						<td colspan="5">
							<textarea id="improve" name="improve" rows="11" cols="90" style="width:98%">${USER_MONTH_SUMUP.improve }</textarea> 
						</td>
					</tr>
					
					<tr class="onset">
		    			<TD colspan="5" align="center">
		    				���³ɹ����������Ҽ���
		    			</TD>
		    		</tr>
					<tr class="onset">	
						<td colspan="5">
							<textarea id="analyse" name="analyse" rows="11" cols="90" style="width:98%">${USER_MONTH_SUMUP.analyse }</textarea> 
						</td>
					</tr>
				
				</tbody>
				<tfoot>
				<tr class="onset">
					<td colspan="5"><input type="submit" value="<c:if test='${ empty USER_MONTH_SUMUP }'>���</c:if><c:if test='${ not empty USER_MONTH_SUMUP }'>�޸�</c:if>"></td>
				</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
</div>
      

<!--searchzone start--></div>
<div class=clear></div>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->

<script type="text/javascript">	
	function selectOnchange(year) {
		var gotoUrl = "ClientManageUserMonthSumup.do?act=list&year=" +  year;
	    self.location= gotoUrl;
	}
</script>

</body></html>
