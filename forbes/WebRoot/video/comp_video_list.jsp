<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<DIV class=siderB_box>
	<DIV class=siderI_box>
		<DIV id=right_1 class=sider_right><!-- 右侧1 -->
			<DIV class=top></DIV>
			<DIV class=mid>
				<DIV class=title><SPAN class="c_grey2 f14 b">热门排行</SPAN></DIV>
				<UL>
					<c:forEach items="${HOT_VIDEO_LIST}" var="video" varStatus="is">
  					<LI>
  						<DIV class=numb><IMG src="images/num${is.index+1 }.jpg" width=14 height=11></DIV>
  						<DIV class=bt><A title="" target=_blank href="VideoShow.do?id=${video.id }">${video.shorttitle }</A></DIV>
  						<DIV class=tjl><DIV align=right><SPAN class=c_grey2><IMG alt=上升 src="images/ico_up.gif" width=9 height=9></SPAN></DIV></DIV>
  					</c:forEach>
  					</LI>
  				</UL>
				<DIV class=clear></DIV>
			</DIV>
			<DIV class=bot1></DIV>
		</DIV>
	</DIV>
	<DIV class=clear></DIV>
	<DIV style="HEIGHT: 10px"></DIV>
	
	
	<DIV class=siderI_box>
		<DIV id=right_2 class=sider_right><!-- 右侧2 -->
			<DIV class=top></DIV>
			<DIV class=mid>
				<DIV class=title><SPAN class="c_grey2 f14 b">推荐排行</SPAN></DIV>
				<UL>
					<c:forEach items="${COMP_VIDEO_LIST}" var="video" varStatus="is">
  					<LI>
  						<DIV class=numb><IMG src="images/num${is.index + 1 }.jpg" width=14 height=11></DIV>
  						<DIV class=bt><A title="" target=_blank href="VideoShow.do?id=${video.id }">${video.shorttitle }</A></DIV>
  						<DIV class=tjl><DIV align=right><SPAN class=c_grey2><IMG alt=上升 src="images/ico_up.gif" width=9 height=9></SPAN></DIV></DIV>
  					</c:forEach>
  					</LI>
  				</UL>
				<DIV class=clear></DIV>
			</DIV>
			<DIV class=bot1></DIV>
		</DIV>
	</DIV>
	<DIV class=clear></DIV>
	<DIV id=right_3>
		<!-- 右侧3 -->
		<!-- 广告 开始 -->
		<DIV class=siderK_box><SCRIPT language=JavaScript1.1 src=""></SCRIPT></DIV>
		<DIV class=clear></DIV>
		<DIV class=siderK_box><SCRIPT language=JavaScript1.1 src=""></SCRIPT></DIV>
		<!-- 广告 结束 -->
	</DIV>
</DIV>