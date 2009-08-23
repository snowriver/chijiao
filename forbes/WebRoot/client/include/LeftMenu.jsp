<%@ page language="java" pageEncoding="gbk"%>

<DIV class=sidebar>
	<DIV class="side_nav_title <c:if test="${p == 'client_main' }">side_nav_title_on</c:if>">
		<H2><A target=_top href="ClientMain.jsp">管理中心首页</A></H2>
	</DIV>
	<DIV class="side_navbox <c:if test="${p == 'client_modify_info' }">side_navbox_on</c:if>">
		<H3>基本信息</H3>
		<UL><LI <c:if test="${p == 'client_modify_info' }">class="li_page_on"</c:if>><A href="ClientModifyProfile.do?act=getdetail">修改基本信息</A> </LI></UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_daily_plan' 
		|| p == 'client_manage_month_plan' || p == 'client_manage_year_plan' 
		|| p == 'client_manage_month_sumup' || p == 'client_manage_life_aim' }">side_navbox_on</c:if>">
		<H3>成功计划</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_daily_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserDailyPlan.do?act=list">今日计划</A> </LI>
  			<LI <c:if test="${p == 'client_manage_month_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserMonthAimPlan.do?act=list">月度计划表</A> </LI>
  			<LI <c:if test="${p == 'client_manage_month_sumup' }">class="li_page_on"</c:if>><A href="ClientManageUserMonthSumup.do?act=list">月度总结</A> </LI>
  			<LI <c:if test="${p == 'client_manage_year_plan' }">class="li_page_on"</c:if>><A href="ClientManageUserYearAimPlan.do?act=list">年度计划进度表</A> </LI>
  			<LI <c:if test="${p == 'client_manage_life_aim' }">class="li_page_on"</c:if>><A href="ClientManageUserLifeStageAim.do?act=list">人生阶段目标</A> </LI>
  		</UL>
  	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_favorite' || p == 'client_publish_article' || p == 'client_manage_article' }">side_navbox_on</c:if>">
		<H3>管理资料</H3>
		<UL>
			<!-- 
			<LI <c:if test="${p == 'client_publish_article' }">class="li_page_on"</c:if>><A href="ClientPublishArticle.jsp">发布文章</A> 
			<LI <c:if test="${p == 'client_manage_article' }">class="li_page_on"</c:if>><A href="ClientManageArticle.do?act=list">文章管理</A> 
			<LI <c:if test="${p == 'client_manage_favorite' }">class="li_page_on"</c:if>><A href="ClientManageArticleFavorite.do?act=list">收藏管理</A> 
  			<LI><A href="#">订阅管理</A> 
  			<LI><A href="#">评论管理</A> </LI>
			 -->
			
			<LI <c:if test="${p == 'client_manage_favorite' }">class="li_page_on"</c:if>><A href="ClientManageArticleFavorite.do?act=list">收藏管理</A> 
  		</UL>
  	</DIV>
  	
  	<DIV class="side_navbox <c:if test="${p == 'client_manage_friend' }">side_navbox_on</c:if>">
		<H3>好友管理</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_friend' }">class="li_page_on"</c:if>><A target="_blank" href="${UC_HOME_URL }/space.php?uid=${sessionScope.CLIENT.uid }&do=friend">好友管理</A>
		</UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_ask' || p == 'client_ask_question' }">side_navbox_on</c:if>">
		<H3>提问管理</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_ask' }">class="li_page_on"</c:if>><A href="ClientManageAsk.do?act=all&status=0_1">提问管理</A> 
			<LI <c:if test="${p == 'client_ask_question' }">class="li_page_on"</c:if>><A href="../ask/ask.jsp" target="_blank">发布提问</A> </LI>
		</UL>
	</DIV>
	
	<DIV class="side_navbox <c:if test="${p == 'client_manage_msg' || p == 'client_send_msg' }">side_navbox_on</c:if>">
		<H3>短消息中心</H3>
		<UL>
			<LI <c:if test="${p == 'client_manage_msg' }">class="li_page_on"</c:if>><A href="${UC_HOME_URL }/space.php?do=pm" target="_blank">消息管理</A> 
		</UL>
	</DIV>
	
	<!-- 
	<DIV class=side_navbox>
		<H3>其它</H3>
		<UL><LI><A href="#">积分规则</A> </LI></UL>
	</DIV>
	 -->
	

</DIV>