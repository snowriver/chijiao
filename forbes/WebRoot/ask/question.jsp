<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%

	com.forbes.ajax.AskTypeSelector as = new com.forbes.ajax.AskTypeSelector();
	java.util.List topAskTypes = as.getTopAskType();
	
	request.setAttribute("TOP_ASK_TYPE_LIST", topAskTypes);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>
	
	<LINK rel=stylesheet type=text/css href="css/ask_main.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function getAskType2(obj){
			$.post(
				"../ajax/AskTypeSelector.jsp",
			    {				
					pid:""+obj.value
			    },
			    updateAskTypesList
			);
		}
		function updateAskTypesList(response){
			var arr = new Array();
			arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
			var op = new Array();
			
			
			$("#typeid2").empty();
	        $("<option value='-1'>��ѡ��</option>").appendTo("#typeid2");
			for( var i = 0; i < arr.length-1; i++ ){
				op = arr[i].split("&");
				$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#typeid2");
			}
			
		}
	</SCRIPT>


	<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="index" value="ask"></c:set>

<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

<!--�ֻ�Ƶ��ͨ��ͷ������-->
<!--header��ʼ-->
<%@ include file="include/header.jsp"%>

<!--header����-->
<!--���ṹ��ʼ-->


<DIV class=clear></DIV>




<div class="wapper">

	<!--���ݿ�ʼ-->
	<div id="main">
		<div class="list_left">

			<!--����������ʼ-->
			<div class="sub_nav">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="sub_nav_tit_left"></td>
						<td class="sub_nav_tit_main"><div class="sub_nav_ico"><a href="#">�ֻ�</a>>><a href="#">iPhone</a></div></td>
						<td class="sub_nav_tit_right"></td>
					</tr>
				</table>
			</div>

		  	<!--������������-->

		  	<!--����ҳ�濪ʼ-->

		  	<div class="ask">
				<div class="reply_me">
			    	<div class="reply_tit_4">
				   		<div class="reply_tit_me_ico">����</div>
					</div>
					<div class="ask_main" style="padding-top:10px;">
				    	<div class="ask_main_tit" style="color:#434343;">
				    		<span>1. ��������:&nbsp;<input type="text" name="ai_question" id="ai_question" value="${KEY_WORD }" style="width:270px; height:20px; border:1px solid #D0D0D0; line-height:20px;"></span>
				    	</div>
					</div>
				</div>

				<!--��2����ʼ-->
				<div class="ask_main" style="padding-top:10px;">
					<div class="ask_main_tit"><span>2. ���������ʡ�${KEY_WORD }����ص��ѽ�����⣺</span>����鿴�����Ƿ��ܽ����������)</div>
					<div>
					
					
						
						<iframe id="main" name="main" src="AskQuestion.do?act=search&keyword=${KEY_WORD}" width="100%" scrolling=no frameborder="no"></iframe> 
						
				<!-- 
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
							<c:forEach items="${ASK_LIST}" var="ask"> 
						  		<TR onmouseover="this.className='highlight'" onmouseout="this.className=''">
						    		<TD><A target=_blank href="ArticleSearch.do?act=view&id=${ask.id}">${fn:substring(ask.title, 0, 30)}</A></TD>
						    		<TD><fmt:formatDate value='${article.expiredTime}' pattern='MM-dd' /></TD>
						    	</TR>
					    	</c:forEach>
							<tr>
								<c:if test="${empty ASK_LIST}">
									<td>
							   			����ص��ѽ������
									</td>
								</c:if>
							</tr>
	 				
						</table>
						 -->
					</div>
				</div>

				<!--��2������-->

				<!--��3����ʼ-->
				<div class="ask_tiwen">
					<form id="question" name="question" method=post action="AskQuestion.do?act=second">
						<input type=hidden id=typename name=typename value="" />
						<input type=hidden id=typename2 name=typename2 value="" />					
						<table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
							<tr><td colspan="4" class="ask_tiwen_tit">3. �����û���ҵ����ʵĻش���������ʣ�</td></tr>
				  			<tr>
								<td width="100" class="ask_tiwen_list pb20" valign="top">���ʱ���</td>
								<td colspan="3" class="ask_tiwen_input pb20">
									<input name="title" type="text" id="title" value="${KEY_WORD }" size="35" maxlength="48"/><br />
									�����������ó���48����
								</td>
				  			</tr>
							<tr>
				    			<td class="ask_tiwen_list">��������</td>
								<td colspan="3" class="ask_tiwen_textarea"><textarea name="content" cols="35" rows="8" id="content"></textarea></td>
				  			</tr>
				  			<tr>
				    			<td>&nbsp;</td>
								<td colspan="3" class="pb40">����˵��Խ��ϸ���ش�Ҳ��Խ׼ȷ��<a href="# target="_blank">�μ��������</a></td>
				  			</tr>
							<tr>
				    			<td class="ask_tiwen_list">�������</td>
								<td colspan="3">
									
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="25%">
												<select name="typeid" onChange="getAskType2(this);" style="width:130px;">
													<option value="${-1}">��ѡ��</option>
													<c:forEach items="${TOP_ASK_TYPE_LIST}" var="at"> 
														<option value="${at.id}">${at.name}</option>
													</c:forEach>
												</select>
											</td>				
											<td width="25%">
												<select id="typeid2" name="typeid2" style="width:130px;" >
													<option value="-1">��ѡ��</option>
												</select>
											</td>
											<td width="50%"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="3" class="pb15">��������ѡ����࣬������඼����ѡ���Ա��������⾡��õ����</td>
							</tr>
							<tr>
								<td class="ask_tiwen_list">���ͷ�</td>
								<td width="90" class="ask_xuanshang_input">
									<select name="score" style="width:50px;">
										<option value=0>0</option>
										<option value=2>2</option>
										<option value=5>5</option>
										<option value=10>10</option>
										<option value=15>15</option>
										<option value=20>20</option>
										<option value=30>30</option>
										<option value=40>40</option>
										<option value=50>50</option>
										<option value=70>70</option>
										<option value=100>100</option>
									</select>
								</td>
								<td width="469" class="xuanshang_ico ask_jifen "><span>���Ŀ��û���${BANLANCE }</span></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="3" class="pb15 ask_jifen_note">���ͷ�Խ�ߣ����������Խ�ܹ�ע���Ӷ��õ����Ѵ𰸡�</td>
							</tr>
				
							<!--<tr>
								<td class="ask_tiwen_list">�����趨��</td>
								<td colspan="3" class="ask_niming"><input name="" type="checkbox" value="" />�����Զ������趨������������Ҫ��������<span>10</span>�֡�</td>
							</tr>-->
				
							<tr>
								<td colspan="4" class="ask_tiwen_submit">				
									<div class="help1" id="show_ask_msg" align="center"></div>				
				                    <div class="help1" id="show_ask_msg1" align="center"></div>				
									<input type="submit" value=" " id="submitimg"/>
									<input name="classid" type="hidden" id="classid" />
									<input name="Work" type="hidden" id="Work" value="AddQuestion" />
									<!--
									<input name="loginuser" type="hidden" id="loginuser" value="854505431">				
									<input name="userscore" type="hidden" id="userscore" value="20" />
									-->
					           </td>
							</tr>
						</table>
					</form>
				</div>
			
			<!--��3������-->
			</div> 
			
		</div>

		<!--����ҳ�����-->

	</div>


<!--�ұ����ݿ�ʼ-->
<%@ include file="include/siderbar.jsp"%>
<!--�ұ����ݽ���-->


<DIV class=clear></DIV></DIV><!--���ݽ���-->




<!--���ṹ����-->
<!--footer��ʼ-->
<!--footer��ʼ-->
<div id="ask_footer"><script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script></div>
<!--footer����-->
<!--footer����-->
</BODY></HTML>
