<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


<DIV class=left></DIV>
<DIV class=mid>
	
	<DIV class=nojs>
		<DIV class=nojs_top></DIV>
		<DIV class=nojs_mid>
			<DIV class=title1>
				<A class="f14 b c_white" href="http://www.openv.com/">精彩推荐</A> 
				<DIV id=M_L_0_UL_C class=fy>
									
				</DIV>
			</DIV>
			
			<DIV class=list_img>
				<UL id=M_L_0_UL px="920">
					<c:set var="count" value="1"></c:set>
					<c:forEach items="${VIDEO_LIST}" var="video">
									
	  					<LI>
	  						<DIV class=img name="chborder">
	  							<A title="${video.shorttitle }" target=_play href="VideoShow.do?id=${video.id }" 
	  								content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl }','${video.shorttitle }')" 
	  								b_pic="../${video.litpic }">
	  								<IMG alt=${video.shorttitle } src="../${video.litpic }" width=124 height=97>
	  							</A>
	  							<DIV class=bg><A title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }"><IMG src="images/gif.gif"></A></DIV>
	  							<DIV class=bf><A title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }"><IMG src="images/ico_4.gif" width=10 height=19></A></DIV>
	  						</DIV>
	  									
	  						<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="VideoShow.do?id=${video.id }">${video.shorttitle }&nbsp;</A></DIV>
	  									
	  							<DIV class=height1><SPAN class=c_grey>主讲：</SPAN><A class=c_green target=_blank href="VideoSearch.do?act=search&keyword=${video.writer }">${video.writer }</A></DIV>
	  							<DIV><SPAN class=c_grey></SPAN> </DIV>
	  									<DIV>
	  										<A class=c_grey target="_play" href="VideoShow.do?id=${video.id }">
	  											<IMG align=absMiddle src="images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;点击播放 
	  										</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  										
	  									</DIV>
	  									<DIV class=line></DIV>
	  							
	  								</LI>
	  								
	  								
	  								
	  								<c:set var="count" value="${count + 1}"></c:set>
	  								</c:forEach>
								</UL>
							
								
							</DIV>
							
							<DIV class=list_font>
								<UL>
									<c:forEach items="${COMMEND_VIDEO_LIST}" var="video">
									<LI><A class=c_grey target=_play href="VideoShow.do?id=${video.id }">[推荐]${video.title }</A> 
								  	</c:forEach>
									</LI>
								</UL>
							</DIV>
							
							<DIV class=clear></DIV>
						</DIV>
						
						<DIV class=nojs_bot></DIV>
					</DIV>
				</DIV>
				
				<DIV class=right></DIV>
				

			


