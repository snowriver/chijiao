<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<TITLE>����� - ѧϰ�� - ȫ�����촴ҵ��ѧϰ�ͽ���ƽ̨</TITLE>

		<LINK rel=stylesheet type=text/css href="css/ask_main.css">
		<LINK rel=stylesheet type=text/css href="base.css">
		<LINK rel=stylesheet type=text/css href="../css/supev.css">
		<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />

		<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>
		<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js"
			charset="gb2312"></script>

		<SCRIPT language="javascript" type="text/javascript">
  
		function pageselectCallback(page_id, jq){
		 
		  window.location="AskSearch.do?act=search&typeid=${PARA['typeid']}&status=${PARA['status']}&keyword=${PARA['keyword']}&flag=${PARA['flag']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
	      //$('#Searchresult').text("Showing search results "+((page_id*10)+1)+"-"+((page_id*10)+10));
	    }
		
		$(window).bind("load", function(){
			$("#Pagination").pagination(${PAGER.totoalCnt}, 
			{   
				current_page:${PAGER.curPage-1},
				items_per_page:5,
				num_edge_entries: 1,
				num_display_entries: 8,
				callback: pageselectCallback
			});
			}
		);
	</SCRIPT>


		<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	</HEAD>
	<BODY>
		<c:set var="index" value="ask"></c:set>

		<!--�ֻ�Ƶ��ͨ��ͷ����ʼ-->

		<!--�ֻ�Ƶ��ͨ��ͷ������-->
		<!--header��ʼ-->
		<%@ include file="include/header.jsp"%>

		<!--header����-->
		<!--���ṹ��ʼ-->


		<DIV class=clear></DIV>

		<DIV class=wapper>
			<!--���ݿ�ʼ-->
			<DIV id=main>
				<DIV class=list_left>
					<!--����������ʼ-->
					<DIV class=sub_nav>

						<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
								<TR>
									<TD class=sub_nav_tit_left></TD>
									<TD class=sub_nav_tit_main>
										<DIV class=sub_nav_ico>
											<A href="index.jsp">��ҳ</A>
										</DIV>
									</TD>
									<TD class=sub_nav_tit_right></TD>
								</TR>
							</TBODY>
						</TABLE>

						<DIV class=sub_nav_main>

							<TABLE class=class_td width="95%" align=center>
								<TBODY>
									<TR>
										<TD>
											<A class=linktext
												href="AskSearch.do?act=search&status=0_1&typeid=5&orderby=expiredTime desc">��ҵ�ʴ�</A>
										</TD>
										<TD>
											<A class=linktext
												href="AskSearch.do?act=search&status=0_1&typeid=6&orderby=expiredTime desc">�ۺ��ʴ�</A>
										</TD>
										<TD>
											<A class=linktext
												href="AskSearch.do?act=search&status=0_1&typeid=1&orderby=expiredTime desc">Ͷ���ʴ�</A>
										</TD>
										<TD>
											<A class=linktext
												href="AskSearch.do?act=search&status=0_1&typeid=3&orderby=expiredTime desc">�����ʴ�</A>
										</TD>
										<TD>
											<A class=linktext
												href="AskSearch.do?act=search&status=0_1&typeid=4&orderby=expiredTime desc">����ʴ�</A>
										</TD>

									</TR>
								</TBODY>
							</TABLE>
						</DIV>
					</DIV>
					<!--������������-->

					<!--�����б�ʼ-->
					<DIV class=list_main>
						<DIV class=list_main_tit_1 id=tabmenu1>
							<UL>
								<LI <c:if test="${PARA['flag'] == 'newest' }">class=on</c:if>>
									<A
										href="AskSearch.do?act=search&status=0_1&keyword=&flag=newest&orderby=expiredTime desc">��������</A>
								</LI>
								<LI <c:if test="${PARA['flag'] == 'hard' }">class=on</c:if>>
									<A
										href="AskSearch.do?act=search&status=0&keyword=&flag=hard&orderby=expiredTime desc">���������</A>
								</LI>
								<LI <c:if test="${PARA['flag'] == 'reward' }">class=on</c:if>>
									<A
										href="AskSearch.do?act=search&status=0_1&keyword=&flag=reward&orderby=reward desc">�߻�������</A>
								</LI>
								<!-- 
						<LI <c:if test="${PARA['flag'] == 'vote' }">class=on</c:if>><A href="AskSearch.do?act=search&status=0_1&keyword=&flag=vote&orderby=expiredTime desc">ͶƱ</A> </LI>
						 -->
								<LI <c:if test="${PARA['flag'] == 'resolved' }">class=on</c:if>>
									<A
										href="AskSearch.do?act=search&status=1&keyword=&flag=resolved&orderby=expiredTime desc">�ѽ������</A>
								</LI>
							</UL>
							<DIV class=clear></DIV>
						</DIV>

						<DIV class=tabmain id=tabmains1>
							<UL class=block>
								<LI>
									<DIV class=list_con>
										<DIV class=list_main_tit_2>
											<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
												<TBODY>
													<TR>
														<TD width="5%">
															&nbsp;
														</TD>
														<!--<td width="13%">״̬</td>-->
														<TD width="67%">
															����
														</TD>
														<TD width="8%">
															�ش�
														</TD>
														<TD width="10%">
															����
														</TD>
														<TD width="10%">
															����ʱ��
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</DIV>
										<DIV class=list_con_all>
											<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
												<TBODY>
													<c:forEach items="${ASK_LIST}" var="ask">
														<TR>
															<!--<td width="7%" class="wrong_ico">&nbsp;</td>-->
															<TD width="20%">
																<A class=type href="#">[${fn:substring(ask.askType.name,
																	0, 5)}]</A>
															</TD>
															<TD>
																<DIV
																	style="OVERFLOW: hidden; WIDTH: 340px; LINE-HEIGHT: 30px; HEIGHT: 30px">
																	<A title=${ask.title } href="AskView.do?id=${ask.id }">${fn:substring(ask.title,
																		0, 30)}</A>
																</DIV>
															</TD>
															<TD width="7%">
																${ask.answerCnt }
															</TD>
															<TD class=xuanshang_ico width="12%">
																${ask.reward}
															</TD>
															<TD width="9%">
																<fmt:formatDate value='${ask.expiredTime}'
																	pattern='MM-dd' />
															</TD>
														</TR>
													</c:forEach>
												</TBODY>
											</TABLE>
										</DIV>
										<DIV class=list_page>
											<BR>
											<DIV class="pagescroll">
												<DIV id="Pagination" class="pagination"></DIV>
											</DIV>
										</DIV>
										<DIV class=list_search>

											<FORM name=searchask2 method=post
												action="AskSearch.do?act=search&orderby=expiredTime desc">
												<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
													<TBODY>
														<TR>
															<TD class=list_search_img width="13%">
																&nbsp;
															</TD>
															<TD width="36%">
																<INPUT class=list_search_input size=45 name=keyword>
															</TD>
															<TD width="16%">
																<SELECT class=input onchange=ac() name=status>
																	<OPTION value=1 selected>
																		�ѽ������
																	</OPTION>
																	<OPTION value=0>
																		δ�������
																	</OPTION>
																</SELECT>
															</TD>
															<TD width="17%">
																<INPUT class=list_search_btn_1 type=submit
																	src="images/list_search_btn_1.gif" value=" ">
															</TD>
															<TD width="18%">
																<INPUT class=list_search_btn_2
																	onClick="window.open('ask.jsp')" type=button value=" ">
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</FORM>
										</DIV>
									</DIV>
								</LI>
							</UL>
							<!--<ul><div class="list_con">����ͶƱ���б�</div></ul>
			 		<ul><div class="list_con">���Ǹ߷��б�</div></ul>
			 		<ul><div class="list_con">������ش��б�</div></ul>
			 		<ul><div class="list_con">�����ѽ���б�</div></ul>
			 		<ul><div class="list_con">����ȫ���б�</div></ul>-->
						</DIV>
						<DIV class=list_btm></DIV>
					</DIV>
					<!--�����б����-->
				</DIV>


				<!--�ұ����ݿ�ʼ-->
				<DIV class=list_right>
				<%@ include file="include/siderbar.jsp"%>
				</DIV>
				<!--�ұ����ݽ���-->


				<DIV class=clear></DIV>
			</DIV>
			<!--���ݽ���-->




			<!--���ṹ����-->
			<!--footer��ʼ-->
			<!--footer��ʼ-->
			<div id="ask_footer">
				<script language="javascript" type="text/javascript"
					src="js/foot.js" charset="gb2312"></script>
			</div>
			<!--footer����-->
			<!--footer����-->
	</BODY>
</HTML>
