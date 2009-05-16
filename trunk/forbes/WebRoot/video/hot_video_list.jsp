<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>


			<DIV class=left></DIV>
				<DIV class=mid>
				
					<!-- 播放器 开始 -->
					<DIV id=play_swf class=swf>
						<DIV pn="-1"><!-- 大图 --></DIV>
						<DIV style="DISPLAY: none"><!-- 播放器 --></DIV>
					</DIV>
					<!-- 播放器 结束 -->
					
					<DIV class=js>
						<DIV class=js_top></DIV>
						<DIV class=js_mid>
							<DIV class=title1>
								<A class="f14 b c_white" href="http://www.openv.com/">精彩推荐</A> 
								<DIV id=M_L_0_UL_C class=fy>
									<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,-1)" align=absMiddle src="images/js_jian1.jpg" width=8 height=16> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',0)" align=absMiddle src="images/ico_2.jpg" width=8 height=8> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',1)" align=absMiddle src="images/ico_3.jpg" width=8 height=8> 
									<IMG class=M_L onClick="M_L_Move('M_L_0_UL',2)" align=absMiddle src="images/ico_3.jpg" width=8 height=8> 
									<IMG class=hand onClick="M_L_Move('M_L_0_UL',0,1)" align=absMiddle src="images/js_jian2.jpg" width=8 height=16> 
								</DIV>
							</DIV>
							<DIV class=list_img>
								<UL id=M_L_0_UL px="492">
									<c:set var="count" value="1"></c:set>
									<c:forEach items="${VIDEO_LIST}" var="video">
									
	  								<LI>
	  									<DIV class=img name="chborder">
	  										<A title="${video.shorttitle }" target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html" 
	  											content="${video.description }" view="javascript:playerInner('${video.firstVideoUrl }','${video.shorttitle }')" 
	  											b_pic="../${video.litpic }">
	  											<IMG alt=${video.shorttitle } src="../${video.litpic }" width=124 height=97>
	  										</A>
	  										<DIV class=bg><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="images/gif.gif"></A></DIV>
	  										<DIV class=bf><A title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html"><IMG src="images/ico_4.gif" width=10 height=19></A></DIV>
	  									</DIV>
	  									
	  									<DIV class=height><A class=c_white title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">${video.shorttitle }&nbsp;</A></DIV>
	  									
	  									<DIV class=height1><SPAN class=c_grey>主讲：</SPAN><A class=c_green target=_blank href="http://t.openv.com/zj/show.php?pid=finance_2008_1906">${video.writer }</A></DIV>
	  									<DIV><SPAN class=c_grey></SPAN> </DIV>
	  									<DIV>
	  										<A class=c_grey href="javascript:playerInner('dvdprogramme_20081024_6826943','${video.shorttitle }')">
	  											<IMG align=absMiddle src="images/ico_5.gif" width=13 height=13>&nbsp;&nbsp;预览 
	  										</A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  										<A class=c_grey title=${video.shorttitle } target=_play href="http://www.openv.com/play/dvdprogramme_20081024_6826943_0.html">完整播放</A>
	  									</DIV>
	  									<DIV class=line></DIV>
	  							
	  								</LI>
	  								
	  								
	  								
	  								<c:set var="count" value="${count + 1}"></c:set>
	  								</c:forEach>
								</UL>
							
								<SCRIPT>
						       		getPlaycount(); //获取播放数
						       		chBord();       //边框变色
						       		b_imgchangeauto(); //大图切换
					     		</SCRIPT>
							</DIV>
							
							<DIV class=list_font>
								<UL>
									<LI><A class=c_grey target=_play href="#">[热点]央视经济频道重磅改版</A> 
								  	<LI><A class=c_grey target=_play href="#">[实拍]偷车贼遭围观者暴打</A> 
								  	<LI><A class=c_grey target=_play href="#">[热点]&nbsp;08新剧古灵精探第1集</A> 
								  	<LI><A class=c_grey target=_play href="#">[推荐] CCTV-2直击华尔街金融风暴</A> 
								  	<LI><A class=c_grey target=_play href="#">[热点]&nbsp;08新剧古灵精探第1集</A> 
								  	<LI><A class=c_grey target=_play href="#">[推荐] CCTV-2直击华尔街金融风暴</A> 
								  	
									</LI>
								</UL>
							</DIV>
							
							<DIV class=clear></DIV>
						</DIV>
						
						<DIV class=js_bot></DIV>
					</DIV>
				</DIV>
				
				<DIV class=right></DIV>
				
		