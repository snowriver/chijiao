<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<c:forEach items="${VIDEO_LIST}" var="video" varStatus="vs"> 
	<c:if test="${vs.index % 2 == 0}">	
		<LI>
  			<DIV class="t mab">
  				<DIV style="DISPLAY: none" id=zjlist_0 class="t mab">
  					<DIV class=tc></DIV>
  					<DIV class=tcc>
  						<DIV class=title>
  							<SPAN class="b c_blue">专辑推荐</SPAN>
  							<DIV class="close c_orange hand" onclick=showzjlist(${vs.index},false);>[&nbsp;关闭&nbsp;]</DIV>
  						</DIV>
  						<DIV class=content1>
  							<c:set var="urlcount" value="0"></c:set>
  							<c:forEach items="${video.videoUrls}" var="url">
  								<c:if test="${urlcount <= 4}">	
  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="#">${video.title}  ${url.title}</A></DIV>
  								</c:if>
  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
  							</c:forEach>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
			
			<DIV class=img>
				<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
					<IMG src="../${video.litpic}" width=180 height=90>
				</A>
			</DIV>
  			<DIV><A class="f14 b" title="${video.title}" target=_play href="#">${video.shorttitle}</A></DIV>
  			<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
  			<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
  			<DIV class=sm>
  				<A class=c_black title="${video.title}" target=_play href="#">
  					<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
  				</A> 
  			</DIV>
  		<LI>
  	</c:if>
  	
  	<c:if test="${vs.index % 2 == 1}">	
  		<DIV class="t mab">
  			<DIV style="DISPLAY: none" id=zjlist_1 class="t mab">
  				<DIV class=tc></DIV>
  				<DIV class=tcc>
  					<DIV class=title><SPAN class="b c_blue">专辑推荐</SPAN>
  						<DIV class="close c_orange hand" onclick=showzjlist(${vs.index},false);>[&nbsp;关闭&nbsp;]</DIV>
  					</DIV>
  					<DIV class=content1>
  						<c:set var="urlcount" value="0"></c:set>
  							<c:forEach items="${video.videoUrls}" var="url">
  								<c:if test="${urlcount <= 4}">	
  									<DIV><A class=c_grey2 title="${video.shorttitle}" target="_play" href="VideoShow.do?id=${video.id}">${video.title}  ${url.title}</A></DIV>
  								</c:if>
  								<c:set var="urlcount" value="${urlcount + 1}"></c:set>
  						</c:forEach>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
  		<DIV class=img>
  			<A title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
  				<IMG src="../${video.litpic}" width=180 height=90>
  			</A>
  		</DIV>
  		<DIV><A class="f14 b" title="${video.shorttitle}" target=_play href="VideoShow.do?id=${video.id}">${video.shorttitle}</A></DIV>
  		<DIV><SPAN class=c_grey3>视频数：</SPAN><SPAN class=c_orange>${fn:length(video.videoUrls)}</SPAN></DIV>
  		<DIV><SPAN class="c_grey1 l18">${fn:substring(video.description, 0, 30)}..</SPAN></DIV>
  		<DIV class=sm>
  			<A class=c_black title="${video.title}" target=_play href="VideoShow.do?id=${video.id}">
  				<IMG align=absMiddle src="images/ico_10.jpg" width=13 height=13> 观 看
  			</A>
  		</DIV>
  	</c:if>
</c:forEach>