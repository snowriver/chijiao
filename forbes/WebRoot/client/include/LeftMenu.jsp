<%@ page language="java" pageEncoding="gbk"%>

<DIV class=sidebar>
	<DIV class="side_nav_title <c:if test="${p == 'client_main' }">side_nav_title_on</c:if>">
		<H2><A target=_top href="ClientMain.jsp">����������ҳ</A></H2>
	</DIV>
	<DIV class="side_navbox <c:if test="${p == 'client_modify_info' }">side_navbox_on</c:if>">
		<H3>������Ϣ</H3>
		<UL><LI <c:if test="${p == 'client_modify_info' }">class="li_page_on"</c:if>><A href="ClientModifyProfile.do?act=getdetail">�޸Ļ�����Ϣ</A> </LI></UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_daily_plan' 
		|| p == 'client_manage_month_plan' || p == 'client_manage_year_plan' 
		|| p == 'client_manage_month_sumup' || p == 'client_manage_life_aim' }">side_navbox_on</c:if>">
		<H3>�ɹ��ƻ�</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_daily_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserDailyPlan.do?act=list">���ռƻ�</A> </LI>
  			<LI <c:if test="${p == 'client_manage_month_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserMonthAimPlan.do?act=list">�¶ȼƻ���</A> </LI>
  			<LI <c:if test="${p == 'client_manage_month_sumup' }">class="li_page_on"</c:if>><A href="ClientManageUserMonthSumup.do?act=list">�¶��ܽ�</A> </LI>
  			<LI <c:if test="${p == 'client_manage_year_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserYearAimPlan.do?act=list">��ȼƻ����ȱ�</A> </LI>
  			<LI <c:if test="${p == 'client_manage_life_aim' }">class="li_page_on"</c:if>><A href="ClientManageUserLifeStageAim.do?act=list">�����׶�Ŀ��</A> </LI>
  		</UL>
  	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_favorite' || p == 'client_publish_article' || p == 'client_manage_article' }">side_navbox_on</c:if>">
		<H3>��������</H3>
		<UL>
			<!-- 
			<LI <c:if test="${p == 'client_publish_article' }">class="li_page_on"</c:if>><A href="ClientPublishArticle.jsp">��������</A> 
			<LI <c:if test="${p == 'client_manage_article' }">class="li_page_on"</c:if>><A href="ClientManageArticle.do?act=list">���¹���</A> 
			<LI <c:if test="${p == 'client_manage_favorite' }">class="li_page_on"</c:if>><A href="ClientManageArticleFavorite.do?act=list">�ղع���</A> 
  			<LI><A href="#">���Ĺ���</A> 
  			<LI><A href="#">���۹���</A> </LI>
			 -->
			
			<LI <c:if test="${p == 'client_manage_favorite' }">class="li_page_on"</c:if>><A href="ClientManageArticleFavorite.do?act=list">�ղع���</A> 
  		</UL>
  	</DIV>
  	
  	<DIV class="side_navbox <c:if test="${p == 'client_manage_friend' }">side_navbox_on</c:if>">
		<H3>���ѹ���</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_friend' }">class="li_page_on"</c:if>><A target="_blank" href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }&do=friend">���ѹ���</A>
		</UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_ask' || p == 'client_ask_question' }">side_navbox_on</c:if>">
		<H3>���ʹ���</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_ask' }">class="li_page_on"</c:if>><A href="ClientManageAsk.do?act=all&status=0_1">���ʹ���</A> 
			<LI <c:if test="${p == 'client_ask_question' }">class="li_page_on"</c:if>><A href="../ask/ask.jsp" target="_blank">��������</A> </LI>
		</UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_msg' || p == 'client_send_msg' }">side_navbox_on</c:if>">
		<H3>����Ϣ����</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_msg' }">class="li_page_on"</c:if>><A href="${UC_HOME_URL }/space.php?do=pm" target="_blank">��Ϣ����</A> 
		</UL>
	</DIV>
	
	<!-- 
	<DIV class=side_navbox>
		<H3>����</H3>
		<UL><LI><A href="#">���ֹ���</A> </LI></UL>
	</DIV>
	 -->
	

</DIV>