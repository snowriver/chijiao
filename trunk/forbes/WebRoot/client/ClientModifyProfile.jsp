<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
	com.forbes.hibernate.bean.UserDetail detail = (com.forbes.hibernate.bean.UserDetail)request.getAttribute("USER_DETAIL");
    com.forbes.ajax.CitySelector cs = new com.forbes.ajax.CitySelector();
    com.forbes.ajax.SectorSelector ss = new com.forbes.ajax.SectorSelector();
	java.util.List provinces = cs.getProvinces();
	java.util.List homeCitys = null;
	java.util.List liveCitys = null;
	java.util.List sectors = ss.getSectors();
	if(detail.getHomeProvinceId() != null)
		homeCitys	 = cs.getCitys(detail.getHomeProvinceId().toString());
	if(detail.getHomeProvinceId() != null)
		liveCitys	 = cs.getCitys(detail.getLiveProvinceId().toString());
	

	request.setAttribute("PROVINCE_LIST", provinces);
	request.setAttribute("HOME_CITY_LIST", homeCitys);
	request.setAttribute("LIVE_CITY_LIST", liveCitys);
	
	request.setAttribute("SECTOR_LIST", sectors);
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0056)http://localhost/sv/vspacecp.php -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>�ҵĹ����̨</TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=keywords content="">
<META name=description content=" ">

<LINK rel=stylesheet type=text/css href="css/main.css">
<SCRIPT type="text/javascript" src="../js/common.js" ></SCRIPT>
<SCRIPT type="text/javascript" src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>

<script language="javascript" type="text/javascript">
	<!--
	
	
 	function onSelectHomeProvince(obj){
		$.post(
			"../ajax/CitySelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateHomeCityList
		);
	}
	function onSelectLiveProvince(obj){
		$.post(
			"../ajax/CitySelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateLiveCityList
		);
	}
	function updateHomeCityList(response){
		var arr = new Array();
		arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
		var op = new Array();
		$("#homeCityId").empty();
        $("<option value='-1'>��ѡ��</option>").appendTo("#homeCityId");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#homeCityId");
		}
		
	}
	function onSelectHomeCity(){
		alert($("#homeCityId").val())
	}
	function updateLiveCityList(response){
		//alert(response);
		var arr = new Array();
		arr = response.split("#");
		var op = new Array();
		$("#liveCityId").empty();
        $("<option value='-1'>��ѡ��</option>").appendTo("#liveCityId");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#liveCityId");
		}
	}
	
	function onSelectDistrict(obj){
	    if( obj.value == -1 ){
			return ;
		}
		$("#estlist").html("Ո�Ժ� <img src='../image/wait.gif'>");
		$.ajax({
			url: '../ajax/estateselector.jsp',
			type: 'get',
			dataType: 'html',
			data:"type=estate&districtId=" + obj.value,
			timeout: 2000,
			error: function(){
				alert('System error');
			},
			success: showEstateList
		});

		$("#customizeEstInfoDiv").css("display","none");
		$("#est_not_in_list").css("display","block");
		$("#EstateDetailInfo").html("");
		$("#districtId").val(obj.value);
	}
	var varEstList = "";	
	function showEstateList(response){
			$("#estlist").html(response);
			varEstList = response;
			$("#est_not_in_list").css("display","block");
	}
	function reSelectEst(){
	    $("#selectinf").html("");
	    $("#selectdiv").css("display","block");
		$("#customizeEstInfoDiv").css("display","none");

         $("#PostEstateForm").attr("disabled","true");
         $("#submit").attr("disabled","true");
		//document.all["estInfoDiv"].style.display="none";
        $("#est_not_in_list").css("display","block");
		$("#est_not_in_list").css("display","block");
		$("#EstateDetailInfo").html("");
		$("#estlist").html(varEstList);
		
	}
	function selectEst(estid,estname){
		
	    $("#estlist").html("[<a href='javascript:void(0)' onClick='reSelectEst()'>�����x����Է</a>] <span class='estName'>" + estname +"</span> [<a href='javascript:void(0)' onClick='showEstFormNoBlock(" + estid + ",\"" + estname+"\")'>���x������</a>] ") ;
        
		$("#selectdiv").css("display","none");
		$("#EstateDetailInfo").html("Ո�Ժ� <img src='../image/wait.gif'>");
		$("#selectdiv").css("display","block");
		$.ajax({
			url: '../ajax/estateselector.jsp',
			type: 'get',
			dataType: 'html',
			data:"type=stage_block&estid=" + estid,
			timeout: 2000,
			error: function(){
				alert('System error');
			},
			success: showEstateDetail
		});

		$("#customizeEstInfoDiv").css("display","none");

         $("#PostEstateForm").attr("disabled","true");
         $("#submit").attr("disabled","true");
		//document.all["estInfoDiv"].style.display="none";
	}
	function showEstateDetail(response){

			$("#EstateDetailInfo").html(response);
	}
	function showEstFormNoBlock(estId,estName){
	     $("#selectdiv").css("display","none");
	     var disp = "";
		 $("#PostEstateForm").removeAttr("disabled");
         $("#submit").removeAttr("disabled");

	   // document.all["estInfoDiv"].style.display="block";
		$("#EstateDetailInfo").html("");
		$("#estlist").html( $("#estlist").html()+">>" );
		$("#selectinf").html( "[<a href='javascript:void(0)' onClick='reSelectEst()'>�����x����I</a>]<span class='estName'> "
		+ $("#selectdiv .estName").html() +" </span>" );
		$("#estateId").val(estId);
	}
	function showCustomizeEstForm(){
	    $("#selectdiv").css("display","none");
		$("#customizeEstInfoDiv").css("display","block");
		$("#PostEstateForm").removeAttr("disabled");
        $("#submit").removeAttr("disabled");
		//document.all["estInfoDiv"].style.display="block";
		$("#EstateDetailInfo").html("");
		$("#estlist").html("");
		
		$("#blockId").val("");

	}
	function showEstForm( blockid,stageNo,stageName,blockName,blockNo ){
	     $("#selectdiv").css("display","none");
	     var disp = "<div id='standblock'>";
		 if ( stageNo !="null" && stageNo > 0 ){
		 	disp = disp + stageNo + "��";
		 }
		 if ( stageName !="null" && stageName.length > 1){
		 	disp = disp + stageName ;
		 }
		 if( (stageName !="null"&& stageName.length > 1) ||   (stageNo !="null" && stageNo > 0) ){
		 	disp = disp + ">>";
		 }
		 if( blockNo != "null"){
		 	disp = disp + blockNo + "��";
		 }
	     if ( blockName != "null"){
		    disp = disp + " " + blockName;		
		 }
		 disp += "</div>";
		 $("#PostEstateForm").removeAttr("disabled");
         $("#submit").removeAttr("disabled");

		//document.all["estInfoDiv"].style.display="block";
		$("#EstateDetailInfo").html("");
		$("#estlist").html( $("#estlist").html() + ">>" + disp );
		$("#selectinf").html( $("#estlist").html() );
		
		$("#selectinf").html( "[<a href='javascript:void(0)' onClick='reSelectEst()'>�����x����I</a>]<span class='estName'> "
			+ $("#selectdiv .estName").html() +" </span> " + $("#selectdiv #standblock").html());
		$("#blockId").val(blockid);
		
	}
	
	function postEstate(obj){
        //�Լ����Է��Ϣ
		
		if( $("#blockId").val()=="" && $("#estateId").val()==""){
			if( !notNull( $("#estName"),"��I���Q���ܞ��") ){
				return false;
			}
		}
		
		if( $("#floor").val().length > 0 ){
			if( !isnumeric(  $("#floor"),"�ǌӱ����ǔ���") ){
				return false;
			}
		}
	
		if( !notNull(  $("#area"),"��I��e���ܞ��") ){
			return false;
		}
		
		if( !isnumeric( $("#area"),"��I��e�����ǔ���") ){
			return false;
		}
		if( !notNull( $("#sellBuyPrice"),"��I�����ۃr���ܞ��") ){
			return false;
		}
		if( !isnumeric( $("#sellBuyPrice"),"��I�����ۃr�����ǔ���") ){
			return false;
		}
		if(  $("#sellBuyPrice").val() < 50 ){
			if ( confirm("ݔ����ۃrС��50�f���Ƿ�_����")==false ){
				return false;
			}
		}
		if(  $("#sellBuyPrice").val() > 5000 ){
			if ( confirm("ݔ����ۃr����5000�f���Ƿ�_����")==false ){
				return false;
			}
		}
		if(  $("#managementFee").val().length > 0 ){
			if( !isnumeric( $("#managementFee"),"����ѱ����ǔ���") ){
				return false;
			}
		}
		
		$("#regionId").val( $("#regions").val() );
		$("#districtId").val( $("#districts").val() );
		
	}
  
	//-->
</script>

<BODY>
<c:set var="p" value="client_modify_info"></c:set>



<DIV id=supevbox></DIV>
<!--header start-->
<%@ include file="include/Header.jsp"%>
<!--header end-->
<DIV class=pagebody>


<!--sidebar start-->
<%@ include file="include/LeftMenu.jsp"%>
<!--sidebar end-->



<DIV class=mainbody>
	<H1>�޸ĸ�����Ϣ</H1>
	<DIV class=data_opt_title>
		<UL>
  			<LI><A class=curmenu>������Ϣ</A> </LI>
  			<LI><A class=ocurmenu href="${UC_HOME_URL }/cp.php?ac=avatar" target="_blank">����ͷ��</A> </LI>
  			<LI><A class=ocurmenu href="ClientModifyPassword.jsp">�޸�����</A> </LI>
  		</UL>
  	</DIV><!--data_opt_title end-->
  	
  	<DIV style="PADDING-LEFT: 2%">
		<FORM method=post action="ClientModifyProfile.do?act=modifydetail">
			<input type="hidden" id="id" name="id" value="${USER_DETAIL.id }" />
			<input type="hidden" id="homeProvinceName" name="" value="${USER_DETAIL.homeProvinceName }" />
			<input type="hidden" id="homeCityName" name="" value="${USER_DETAIL.homeCityName }" />
			
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  				<TBODY>
  				
  					<TR height="10">
    					<TD align=right>&nbsp;</TD>
    					<TD>&nbsp;&nbsp;<font color=red>${MESSAGE_INFO }</font></TD>
    					<TD></TD>
    				</TR>
    				
    				<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
  					<TR>
    					<TD style="TEXT-ALIGN: right; WIDTH: 200px">�ʺ�:</TD>
    					<TD style="TEXT-ALIGN: left;  WIDTH: 40%">&nbsp;&nbsp;<INPUT name="loginName" value="${sessionScope.CLIENT.username}" size="30" disabled></TD>
    					<TD></TD>
    				</TR>
    				
    				<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				  					
  					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
  					<TR style="HEIGHT: 27px">
    					<TD align=right>�Ա�:</TD>
    					<TD>&nbsp;&nbsp;
    						<INPUT style="VERTICAL-ALIGN: middle" id=sex value=F type=radio name=sex <c:if test="${USER_DETAIL.sex == 'F'}">CHECKED</c:if> />&nbsp;<LABEL>��</LABEL> 
    						<INPUT style="VERTICAL-ALIGN: middle" id=sex value=M type=radio name=sex <c:if test="${USER_DETAIL.sex == 'M'}">CHECKED</c:if> />&nbsp;<LABEL>Ů</LABEL> 
    					</TD>
    					<TD><input type="checkbox" value="Y" name="sexLock" <c:if test="${USER_DETAIL.sexLock == 'Y'}">CHECKED</c:if> />����</TD>
    				</TR>
  
  					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
  					<TR>
    					<TD align=right>����:</TD>
    					<TD>&nbsp;&nbsp;
    						<select id="birthType" name="birthType">
					  			<option value="S" <c:if test="${USER_DETAIL.birthType == 'S'}">selected</c:if>>ũ��</option>
					  			<option value="L" <c:if test="${USER_DETAIL.birthType == 'L'}">selected</c:if>>����</option>
                     		</select> -
    						<select id="birthYear" name="birthYear">
					  			<c:if test="${empty USER_DETAIL.birthYear}">
									<c:forEach var="year" begin="1950" end="2008" step="1">
										<option value="${year}" <c:if test="${year == 1980}">selected</c:if>>${year}</option>
									</c:forEach>
								</c:if>
								<c:if test="${not empty USER_DETAIL.birthYear}">
									<c:forEach var="year" begin="1950" end="2008" step="1">
										<option value="${year}" <c:if test="${USER_DETAIL.birthYear == year}">selected</c:if> >${year}</option>									
									</c:forEach>
								</c:if>
                     		</select> ��
                     		<select id="birthMonth" name="birthMonth">
					  			<c:if test="${empty USER_DETAIL.birthMonth}">
									<c:forEach var="month" begin="1" end="12" step="1">
	                         			<option value="${month}">${month}</option>
									</c:forEach>
								</c:if>
								<c:if test="${not empty USER_DETAIL.birthMonth}">
									<c:forEach var="month" begin="1" end="12" step="1">
										<option value="${month}" <c:if test="${USER_DETAIL.birthMonth == month}">selected</c:if>>${month}</option>
									</c:forEach>
								</c:if>
                     		</select> ��
                     		<select id="birthDay" name="birthDay">
					  			<c:if test="${empty USER_DETAIL.birthDay}">
									<c:forEach var="day" begin="1" end="31" step="1">
	                         			<option value="${day}">${day}</option>
									</c:forEach>
								</c:if>
								<c:if test="${not empty USER_DETAIL.birthDay}">
									<c:forEach var="day" begin="1" end="31" step="1">
										<option value="${day}" <c:if test="${USER_DETAIL.birthDay == day}">selected</c:if> >${day}</option>
									</c:forEach>
								</c:if>
                     		</select> ��
						</TD>
    					<TD><input type="checkbox" value="Y" name="birthLock" <c:if test="${USER_DETAIL.birthLock == 'Y'}">CHECKED</c:if> />����</TD>
    				</TR>
    				
    				<TR>
    					<TD align=right>&nbsp;</TD>
    					<TD>&nbsp;&nbsp;* �����Լ������յ�ϰ���趨����ũ���ľ�ѡ��ũ����
    						
    						
						</TD>
    					<TD>&nbsp;</TD>
    				</TR>
  					
  					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
  					<TR>
					    <TD align=right>����:</TD>
					    <TD>&nbsp;&nbsp;
							<select id="homeProvinceId" name="homeProvinceId" onChange="onSelectHomeProvince(this)">
								<c:if test="${empty USER_DETAIL.homeProvinceId}">
									<option value="-1" selected>��ѡ��</option>
									<c:forEach items="${PROVINCE_LIST}" var="pro"> 
	                         			<option value="${pro.id}">${pro.name}</option>
									</c:forEach>
								</c:if>
                         		<c:if test="${not empty USER_DETAIL.homeProvinceId}">
                         			<option value="-1">��ѡ��</option>
	                         		<c:forEach items="${PROVINCE_LIST}" var="pro"> 
	                         			<option value="${pro.id}" <c:if test="${USER_DETAIL.homeProvinceId == pro.id}">selected</c:if> >${pro.name}</option>	     
									</c:forEach>
								</c:if>
							</select> ʡ&nbsp;
                     		<select id="homeCityId" name="homeCityId" onChange="onSelectHomeCity()">
                     			<c:if test="${empty USER_DETAIL.homeCityId}">
									<option value="-1" selected>��ѡ��</option>
									<c:forEach items="${HOME_CITY_LIST}" var="city"> 
	                         			<option value="${city.id}">${city.name}</option>
									</c:forEach>
								</c:if>
                         		<c:if test="${not empty USER_DETAIL.homeCityId}">
                         			<option value="-1">��ѡ��</option>
	                         		<c:forEach items="${HOME_CITY_LIST}" var="city"> 
	                         			<option value="${city.id}" <c:if test="${USER_DETAIL.homeCityId == city.id}">selected</c:if> >${city.name}</option>	     
									</c:forEach>
								</c:if>
					  			
                     		</select> ��
						</TD>
						<TD><input type="checkbox" value="Y" name="homeLock" <c:if test="${USER_DETAIL.homeLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>�־ӵ�:</TD>
					    <TD>&nbsp;&nbsp;
							<select id="liveProvinceId" name="liveProvinceId" onChange="onSelectLiveProvince(this)">
								<c:if test="${empty USER_DETAIL.homeProvinceId}">
									<option value="-1" selected>��ѡ��</option>
									<c:forEach items="${PROVINCE_LIST}" var="pro"> 
	                         			<option value="${pro.id}">${pro.name}</option>
									</c:forEach>
								</c:if>
                         		<c:if test="${not empty USER_DETAIL.liveProvinceId}">
                         			<option value="-1">��ѡ��</option>
	                         		<c:forEach items="${PROVINCE_LIST}" var="pro"> 	                         			
	                         			<option value="${pro.id}" <c:if test="${USER_DETAIL.liveProvinceId == pro.id}">selected</c:if> >${pro.name}</option>	                         			
									</c:forEach>
								</c:if>
							</select> ʡ&nbsp;
                     		<select id="liveCityId" name="liveCityId">
					  			<c:if test="${empty USER_DETAIL.liveCityId}">
									<option value="-1" selected>��ѡ��</option>
									<c:forEach items="${LIVE_CITY_LIST}" var="city"> 
	                         			<option value="${city.id}">${city.name}</option>
									</c:forEach>
								</c:if>
                         		<c:if test="${not empty USER_DETAIL.liveCityId}">
                         			<option value="-1">��ѡ��</option>
	                         		<c:forEach items="${LIVE_CITY_LIST}" var="city"> 
	                         			<option value="${city.id}" <c:if test="${USER_DETAIL.liveCityId == city.id}">selected</c:if> >${city.name}</option>	     
									</c:forEach>
								</c:if>
                     		</select> ��


						</TD>
						<TD><input type="checkbox" value="Y" name="liveLock" <c:if test="${USER_DETAIL.liveLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>QQ:</TD>
					    <TD>&nbsp;&nbsp;<INPUT size=30 name=qq value="${USER_DETAIL.qq}"></TD>
					    <TD><input type="checkbox" value="Y" name="qqLock" <c:if test="${USER_DETAIL.qqLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>MSN:</TD>
					    <TD>&nbsp;&nbsp;<INPUT size=30 name=msn value="${USER_DETAIL.msn}"></TD>
					    <TD><input type="checkbox" value="Y" name="msnLock" <c:if test="${USER_DETAIL.msnLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>�ֻ�:</TD>
					    <TD>&nbsp;&nbsp;<INPUT size=30 name=mobile value="${USER_DETAIL.mobile}"></TD>
					    <TD><input type="checkbox" value="Y" name="mobileLock" <c:if test="${USER_DETAIL.mobileLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>�̻�/С��ͨ:</TD>
					    <TD>&nbsp;&nbsp;<INPUT size=30 name=phone value="${USER_DETAIL.phone}"></TD>
					    <TD><input type="checkbox" value="Y" name="phoneLock" <c:if test="${USER_DETAIL.phoneLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD align=right>��ҵ:</TD>
					    <TD>&nbsp;&nbsp;
					    	<select id="calling" name="calling">
								<c:if test="${empty USER_DETAIL.calling}">
									<option value="-1" selected>��ѡ��</option>
									<c:forEach items="${SECTOR_LIST}" var="pro"> 
	                         			<option value="${pro.id}">${pro.name}</option>
									</c:forEach>
								</c:if>
                         		<c:if test="${not empty USER_DETAIL.calling}">
                         			<option value="-1">��ѡ��</option>
	                         		<c:forEach items="${SECTOR_LIST}" var="pro"> 	                         			
	                         			<option value="${pro.id}" <c:if test="${USER_DETAIL.calling == pro.id}">selected</c:if> >${pro.name}</option>	                         			
									</c:forEach>
								</c:if>
							</select>
						</TD>
					    <TD><input type="checkbox" value="Y" name="callingLock" <c:if test="${USER_DETAIL.callingLock == 'Y'}">CHECKED</c:if> />����</TD>
					</TR>
			
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
					
					<TR>
					    <TD align=right>����˵��:</TD>
					    <TD>&nbsp;&nbsp;<TEXTAREA style="WIDTH: 250px" name=description>${USER_DETAIL.description}</TEXTAREA></TD>
					    <TD></TD>
					</TR>
					
					<TR height="10">
    					<TD colspan="3"></TD>    					
    				</TR>
    				
					<TR>
					    <TD></TD>
					    <TD class=padding_top8>
					    	<BUTTON class=add_del name=submit_btn type=submit value="true">�ύ</BUTTON>
					    	<BUTTON class=add_del name=reset_btn type=reset value="true">����</BUTTON>
					   	</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</DIV>
</DIV>
      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<%@ include file="include/Footer.jsp"%>
<!--footer end-->
</BODY></HTML>
