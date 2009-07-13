<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<%
	
    com.forbes.ajax.VideoTypeSelector vs = new com.forbes.ajax.VideoTypeSelector();
    request.setAttribute("VIDEO_TYPE_LIST", vs.getTopVideoType());
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 学习视频 - 全力打造创业者学习和交流平台</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name="Keywords" content="在线学习视频 ${WEB_KEYWORD }" />
	<META name="Description" content="在线学习视频 ${WEB_DESCRIPTION }" />
	
	<LINK rel=stylesheet type=text/css href="../js/jquery/pagination.css" />
	<LINK rel=stylesheet type=text/css href="css/generl200809.css">
	<LINK rel=stylesheet type=text/css href="css/index200809.css">
	<LINK rel=stylesheet type=text/css href="supev.css">
	<LINK href="css/video_list.css" type=text/css rel=stylesheet>

	<STYLE>
		.M_L {
			CURSOR: pointer
		}
		.hand {
			CURSOR: pointer
		}
	</STYLE>

	<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT type="text/javascript" src="../js/jquery/jquery.pagination.js" charset="gb2312"></script>
	<SCRIPT type="text/javascript" src="../js/openDiv.js" charset="gb2312"></SCRIPT>

	<SCRIPT>
	
		function pageselectCallback(page_id, jq){
		 
		  window.location="VideoSearch.do?act=search&typeid=${PARA['typeid']}&keyword=${PARA['keyword']}&orderby=${PARA['orderby']}&pno=" + (page_id+1);
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
		
		
		function showlist(i){
		  var o = {
		    M:$('#M_'+i),
		    I:$('#I_'+i),
		    L:$('#L_'+i)
		  };
		  
		  if(o.L.is(':hidden')){
		    o.M.attr('style','background:url(images/ico_05.jpg) no-repeat left top;');
		    o.I.attr('src','images/ico_06.jpg');
		    o.L.slideDown("slow");
		  } else {
		    o.L.slideUp("normal" ,function(){
		      o.I.attr('src','images/ico_04.jpg');
		      o.M.attr('style','background:url(images/bg_01.jpg) no-repeat left top;');
		    });
		  }
		}  
		
		function bqclick(o,pc_id,fb){
		  o=$(o);
		  o.parent().children('.hand').each(function(){
		    if($(this).attr('background')){
		      if($(this).attr('tag') == o.attr('tag')){
		        $(this).attr('background','images/bg_02.jpg');
		        getAgoCategoryInfo(pc_id,1,15,2,fb);
		      } else {
		        $(this).attr('background','images/bg_03.jpg');
		      }
		    }
		  });
		}
		
		var tag_num=3;
		openv_Menu_ready = function(){
		  var o=$('#openv_Menu');
		  i=0;
		  $('li',o).each(function(){
		    if(tag_num!=i){
		      $(this).mouseover(function (){
		        $(this).addClass('expli');
		      }).mouseout(function(){
		        $(this).removeClass();
		      });
		    } else {
		      $(this).addClass('expli');
		      $('a:first',this).addClass('expli');
		    }
		    i++;
		  });
		}
		
	
		
		function SP()
	  {
	      var text = document.getElementById("subSearchKey").value;
	      window.open("VideoSearch.do?act=search&keyword="+ text);
	  }
	  
	  function SC()
	  {
	      var text = document.getElementById("subSearchKey").value;
	      window.open("VideoSearch.do?act=search&keyword="+ escape(text));
	  }
	</SCRIPT>

	

</HEAD>
<BODY>

<DIV id=wrapper>

	<!-- 头引用 开始 -->

	<%@ include file="include/header.jsp"%>
	<!-- 头引用 结束 -->
	
	<DIV class=clear></DIV>
	
	<DIV>
		 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td><table width="951" border="0" align="right" cellpadding="0" cellspacing="0">

        <tr>
          <td height="12" colspan="3"></td>
          </tr>
        <tr>
          <td width="179" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            
            
            <tr>
	  <td><table width="179" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td><img src="images/ico_02.jpg" width="179" height="50" /></td>
	      </tr>
	      <tr>
	        <td bgcolor="#616161"><div align="center">

	            <table width="164" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFE">
	            
	              <c:forEach items="${VIDEO_TYPE_LIST}" var="at" varStatus="is">
	              <tr>
	              
	              
		  <td id="M_0" valign="top" style="background:url(images/bg_1.jpg) no-repeat left top;"><div align="center">
		      <table width="90%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td height="12" colspan="2"></td>
		        </tr>
		        <tr class="hand" onClick="showlist(${is.index})">
		          <td width="16%" height="32"><div align="left"><img id="I_0" src="images/ico_4.jpg" width="11" height="10" /></div></td>

		          <td width="84%" class="f14"><div align="left"><a class="c_black">${at.name }</a></div></td>
		        </tr>
		        
		        <tr>
		          <td colspan="2"><div id="L_${is.index}" align="center" style="display:block">
		              <table width="90%" border="0" cellspacing="0" cellpadding="0">
		              	<c:forEach items="${at.videoTypes}" var="a">
		                <tr>
		                  <td width="16%"><img src="images/jt.gif"/></td>
		                  <td width="84%" height="22" align="left">
                            <a href="VideoSearch.do?act=search&typeid=${a.id }" class="c_black">${a.name }</a></td>
		                </tr>
		                </c:forEach>
		              </table>
		          </div></td>
		        </tr>
		      </table>
		   </div></td>
		 </tr>

		</c:forEach>
		
	
	            </table>
	        </div></td>
	      </tr>
	      <tr>
	        <td><img src="images/ico_03.jpg" width="179" height="9" /></td>
	      </tr>
	  </table></td>

	</tr>            <tr>
              <td height="8"></td>
            </tr>
            <tr><td>
           <SCRIPT LANGUAGE="JavaScript1.1" SRC="#"></SCRIPT>
            </td></tr>
             <tr>
              <td height="8"></td>

            </tr>
             <tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td background="#"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="26" class="f14"><strong class="c_grey">最open标签</strong></td>
    </tr>
    <tr>
      <td height="1" bgcolor="#B0B0B0"></td>

    </tr>
    <!--  -->
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="10"></td>
                </tr>
                <tr>
                  <td height="25"><img src="images/ico_7.jpg" width="10" height="7" align="absmiddle" /> <a href="javascript:void(0);" class="c_red"><span class="f14"><strong>名人名家</strong></span></a></td>
                </tr>
                <tr>
                  <td height="1" background="images/line1.jpg"></td>
                </tr>
                <tr>
                  <td height="5"></td>
                </tr>

                <tr>
                  <td background="#">
                  	<a href="VideoSearch.do?act=search&keyword=余世维" target="_blank" class="c_grey">余世维</a>&nbsp;&nbsp;
                  	<a href="VideoSearch.do?act=search&keyword=曾仕强" target="_blank" class="c_grey">曾仕强</a>&nbsp;&nbsp;
                  	<a href="VideoSearch.do?act=search&keyword=陈安之" target="_blank" class="c_grey">陈安之</a>&nbsp;&nbsp;
                  	<a href="VideoSearch.do?act=search&keyword=林伟贤" target="_blank" class="c_grey">林伟贤</a>&nbsp;&nbsp;
                  	<a href="VideoSearch.do?act=search&keyword=马云" target="_blank" class="c_grey">马云</a>&nbsp;&nbsp;</td>
                </tr>
            </table></td>
          </tr>
         
          
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="10"></td>
                </tr>
               
             
            </table></td>

          </tr>
      </table></td>
    </tr>
  </table>    <a href="#" target="_blank" class="c_grey"></a></td>
                </tr>
  </table></td>
          </tr>
  </table></td>

    </tr>
  </table></td>
</tr>          </table></td>
          <td width="7">&nbsp;</td>
          <td width="765" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="98%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td id="category_info">
										

						

						
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
						       	<td width="9"></td>
						       	
						       	<td>
						       	
						       	
						       	
						       	
						       		<DIV class=list_r><!--本类视频开始-->
										<DIV class=list_tit><SPAN class=left>推荐视频</SPAN><A class=more href="VideoSearch.do?act=search">&gt;&gt;更多视频</A></DIV>
										<DIV class=list_con>
										<DIV class=listcon1><!---->
										
											<c:forEach items="${COMMEND_VIDEO_LIST}" var="video">
											<SPAN>
												<UL>
													<LI><A target="_blank" href="VideoShow.do?id=${video.id }"><IMG alt="${video.title }" title="${video.title }" src="../${video.litpic }"></A>
													<LI class=li_name><A href="#">${video.title }</A> </LI>
												</UL>
											</SPAN><!---->
											
											
												
												</c:forEach>
												<DIV class=clear></DIV>
										</DIV>
										<DIV class=listcon2><!---->
										
											<c:forEach items="${VIDEO_LIST}" var="video">
											<DIV class=soft_list>
												<DIV class=listcon_tit>
													<UL>
										  				<LI class=softname><A target="_blank" href="VideoShow.do?id=${video.id }">${video.title }</A> </LI>
										  				<LI>推荐指数： </LI>
										  				<LI>
										  					<DIV class=star>
																<UL>
																	<c:forEach var="iscommend" begin="1" end="${video.iscommend }" step="1">
																    <LI></LI>
																    </c:forEach>
																</UL>
										  						<DIV class=clear></DIV>
										  					</DIV>
										  				</LI>
										  				<LI>&nbsp;&nbsp;&nbsp;更新日期：<SPAN class=c_blue><fmt:formatDate value="${video.pubdate }" pattern="yyyy-MM-dd"/></SPAN>&nbsp;&nbsp;&nbsp;观看次数：<STRONG class=c_red>${video.click }</STRONG> </LI>
										  			</UL>
													<DIV class=clear></DIV>
												</DIV>
												<DIV class=soft_main>
													<UL>
										  				<LI><A target="_blank" href="VideoShow.do?id=${video.id }"><IMG title="${video.title }" src="../${video.litpic }" border=0></A> </LI>
										  				<LI>
										  					<DIV class=soft_info>
										  						<DIV>视频数：${fn:length(video.videoUrls)} </DIV>
															  	<DIV>视频分类：
															  		<c:if test="${not empty video.videoType}"><A class=c_color1 target=_blank href="VideoSearch.do?act=search&typeid=${video.videoType.id }">${video.videoType.name }</A></c:if>
																	<c:if test="${not empty video.videoType2}"> - <A class=c_color1 target=_blank href="VideoSearch.do?act=search&typeid=${video.videoType.id }">${video.videoType2.name }</A></c:if>
															  	</DIV>
															  	<DIV class=soft_text>${fn:substring(video.description, 0, 110)}..</DIV>
															  	<DIV class=soft_btn>
															  		<A class=btn_blue target="_blank" href="VideoShow.do?id=${video.id }">点击播放</A>
															  	</DIV>
															</DIV>
														</LI>
													</UL>
													<DIV class=clear></DIV>
												</DIV>
											</DIV><!---->
											</c:forEach>
											
											<c:if test="${empty VIDEO_LIST}">
												<DIV class=soft_list>
													<BR><BR><BR>
													没有找到您想要视频，请重新搜索！
												</DIV>
											</c:if>
										</DIV>
										
										<!--分页开始-->
										<DIV class=pagess>
											<DIV class="pagescroll">			     
												<DIV id="Pagination" class="pagination"></DIV>
											</DIV> 
										</DIV>
										<!--分页结束-->
									
									</DIV>
									<DIV class=list_btm></DIV>
									
									<!--本类视频结束-->
								</DIV>
						       	
						       	
						       	
						       	</td>
					      	</tr>
					   	</table>





						<table width="100%" border="0" cellspacing="0" cellpadding="0">
           					<tr>
              					<td height="30">&nbsp;</td>
            				</tr>
            				<tr align="center">
								<td>
									<div align="center">
										<DIV class="pagescroll">			     
											<DIV id="PaginationXX" class="pagination"></DIV>
										</DIV>  
									</div>
								</td>
							</tr>
            				<tr>
              					<td height="30">&nbsp;</td>
            				</tr>
          				</table>


                    </td>	
										
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>

     <tr>
      <td height="8"></td>
    </tr>
    <tr>
      <td height="8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="1" bgcolor="#474747"></td>
        </tr>
        <tr>

          <td height="56" bgcolor="#636363"><table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="727">
              	<form id="subSearchForm" name="subSearchForm" target="_blank" method="post" action="VideoSearch.do?act=search">
              	<table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
		
                <tr>
                  <td width="146"><div align="center"><br></div></td>
                  <td width="413"><label><input type="text" id="subSearchKey" name="keyword"  onkeypress=" if (event.keyCode == 13){SP();}"  style="height:18px; border:1px solid #D5D5D5; background-color:#D5D5D5; width:413px; padding-top:3px;"/></label></td>
                  <td width="10">&nbsp;</td>
                  <td width="77"><div align="center"><img src="images/btn_search.gif" width="70" height="26" onclick="SP();" style="cursor:pointer" /></div></td>

                  <td width="13">&nbsp;</td>
				  <td>
					<div align="center"></div>
						</td>
				  <td width="7">&nbsp;</td>
                </tr>
				
              </table>
              </form></td>
              <td bgcolor="#414143"><div align="center">

                <table width="95%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="33%" height="25"><a href="VideoSearch.do?act=search&typeid=2" class="c_grey2">励志创业</a></td>
                      <td width="33%"><a href="VideoSearch.do?act=search&typeid=7" class="c_grey2">经营管理</a></td>
                      <td width="33%"><a href="VideoSearch.do?act=search&typeid=10" class="c_grey2">证券投资</a></td>
                    </tr>
                    <tr>

                      <td width="33%" height="25"><a href="VideoSearch.do?act=search&typeid=11" class="c_grey2">个人理财</a></td>
                      <td width="33%" height="25"><a href="VideoSearch.do?act=search&typeid=3" class="c_grey2">演讲口才</a></td>
                      <td width="33%" height="25"><a href="VideoSearch.do?act=search&typeid=22" class="c_grey2">时间管理</a></td>
                    </tr>
                              </table>
              </div></td>
            </tr>

          </table></td>
        </tr>
        <tr>
          <td height="1" bgcolor="#474747"></td>
        </tr>
        <tr>
          <td height="33" bgcolor="#D5D5D4"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="40">&nbsp;</td>

              <td class="c_grey3 rmss">
               	<strong>热门搜索：</strong>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=赢在中国" target="_blank">赢在中国</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=管理" target="_blank">管理</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=执行" target="_blank">执行</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=经理人" target="_blank">经理人</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=领导" target="_blank">领导</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=沟通" target="_blank">沟通</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=成功" target="_blank">成功</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="VideoSearch.do?act=search&keyword=理财" target="_blank">理财</a>              
				</td>
            </tr>

          </table></td>
        </tr>
        <tr>
          <td height="1" bgcolor="#474747"></td>
        </tr>
      </table></td>
    </tr> 
    <tr>
      <td height="8"></td>

    </tr>
    <tr>
      <td><div align="center">      
         
      </div></td>
    </tr>
  </table>
	</DIV>
	
	<script src="js/zt_foot.js" charset="gb2312"></script>
	<DIV class=clear></DIV>
</DIV>
</BODY></HTML>
