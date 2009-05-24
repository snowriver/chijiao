<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	com.forbes.hibernate.bean.UcMembers ucMember = (com.forbes.hibernate.bean.UcMembers)request.getSession().getAttribute("CLIENT");
	com.forbes.ajax.ScoreBalanceLoad score = new com.forbes.ajax.ScoreBalanceLoad();
	//Short accountType = com.forbes.util.DictionaryManager.getInstance().getVal("ACCOUNT_TYPE", "2").getDvalue();
	try {
	
		request.setAttribute("BANLANCE", score.getUserBalance(ucMember.getUid().toString()) );
				//accountType.toString()));
	} catch (Exception e ) {
		e.printStackTrace();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>�ҵĹ����̨</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<script type="text/javascript" src="../js/common.js" ></script>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>
<c:set var="p" value="client_main"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>����������ҳ</H1>
	<DIV class=userinfo>
		<DIV class=userface>	
			<IMG src="${UC_CENTER_URL }/avatar.php?uid=${sessionScope.CLIENT.uid }&size=mid&type=virtual">	
			<SPAN><A target="_blank" href="${UC_HOME_URL }/cp.php?ac=avatar">����ͷ��</A></SPAN>
		</DIV>
		
		<DIV class=userdetail>
			<UL>
  				<LI class=useradd>
  					�ҵĿռ��ַ��<A target="_blank" href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }">${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }</A> 
  				</LI>
  				<LI class=usernickname>
  					�ҵ��ǳƣ�<SPAN>${sessionScope.CLIENT.username }</SPAN> <A href="ClientModifyProfile.do?act=getdetail">[�޸Ļ�������]</A> 
  				</LI>
  				<LI class=userintegral>�ҵĻ��֣�<SPAN><PRE>${BANLANCE }</PRE>��</SPAN> <A href="#">[���ֹ���]</A> </LI>
  			</UL>
  		</DIV>
  		
  		<DIV class=useroperate>
  			<A title="�ҵ�����" href="ClientManageArticle.do?act=list">�ҵ�����</A> 
  			<A title="�ҵ�����" href="ClientManageAsk.do?act=all&status=0_1">�ҵ�����</A> 
  			<A title="�ҵ��ղ�" href="ClientManageArticleFavorite.do?act=list">�ҵ��ղ�</A> 
  		</DIV>
  	</DIV>
  	
  	<!-- 
  	
  	<DIV id=user_up class=data_opt_title>
		<UL>
  			<LI><A id=myupload_btn class=curmenu onclick="aj_settab('myupload', 'tab_my', event);">���ϴ�����Ƶ</A> </LI>
  			<LI><A id=mysp_btn class=ocurmenu onclick="aj_settab('mysp', 'tab_my', event);" href="#">�ҵ�ר��</A>  </LI>
  		</UL>
  	</DIV>
  	
  	<DIV style="DISPLAY: block" id=myupload class=data_opt_contentbox><P class="info info_side">û�������Ƶ��</P></DIV>
		<DIV style="DISPLAY: none" id=mysp class=data_opt_contentbox></DIV>
			<DIV id=user_take class=data_opt_title>
				<UL>
		  			<LI><A id=mysubmem_btn class=curmenu onclick="aj_settab('mysubmem', 'tab_other', event);">�Ҷ��ĵ��û�</A> </LI>
		  			<LI><A id=mysubsp_btn class=ocurmenu onclick="aj_settab('mysubsp', 'tab_other', event);" href="#">�Ҷ��ĵ�ר��</A> </LI>
				  	<LI><A id=myfav_btn class=ocurmenu onclick="aj_settab('myfav', 'tab_other', event);" href="#">�ҵ��ղ�</A> </LI>
				  	<LI><A id=myfriend_btn class=ocurmenu onclick="aj_settab('myfriend', 'tab_other', event);" href="#">�ҵĺ���</A> </LI>
				</UL>
			</DIV>
			<DIV style="DISPLAY: block" id=mysubmem class=data_opt_contentbox>
				<P class="info info_side">û������û���</P></DIV>
				<DIV style="DISPLAY: none" id=mysubsp class=data_opt_contentbox></DIV>
				<DIV style="DISPLAY: none" id=myfav class=data_opt_contentbox></DIV>
				<DIV style="DISPLAY: none" id=myfriend class=data_opt_contentbox></DIV>
				<SCRIPT>
					var checkedtab = 'curmenu';
					var uncheckedtab = 'ocurmenu';
					var tab_my = ['myupload', 'mysp'];
					var tab_other = ['mysubmem', 'mysubsp', 'myfav', 'myfriend'];
				</SCRIPT>
			</DIV>
			<!--searchzone start--></DIV>
			<DIV class=clear></DIV>
			<!--searchzone end-->
	 -->

<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
