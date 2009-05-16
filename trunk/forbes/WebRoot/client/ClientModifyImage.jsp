<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>我的管理后台</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
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
        $("<option value='-1'>请选择</option>").appendTo("#homeCityId");
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
        $("<option value='-1'>请选择</option>").appendTo("#liveCityId");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#liveCityId");
		}
	}
	
	function onSelectDistrict(obj){
	    if( obj.value == -1 ){
			return ;
		}
		$("#estlist").html("請稍候 <img src='../image/wait.gif'>");
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
		
	    $("#estlist").html("[<a href='javascript:void(0)' onClick='reSelectEst()'>重新選擇屋苑</a>] <span class='estName'>" + estname +"</span> [<a href='javascript:void(0)' onClick='showEstFormNoBlock(" + estid + ",\"" + estname+"\")'>不選擇期座</a>] ") ;
        
		$("#selectdiv").css("display","none");
		$("#EstateDetailInfo").html("請稍候 <img src='../image/wait.gif'>");
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
		$("#selectinf").html( "[<a href='javascript:void(0)' onClick='reSelectEst()'>重新選擇物業</a>]<span class='estName'> "
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
		 	disp = disp + stageNo + "期";
		 }
		 if ( stageName !="null" && stageName.length > 1){
		 	disp = disp + stageName ;
		 }
		 if( (stageName !="null"&& stageName.length > 1) ||   (stageNo !="null" && stageNo > 0) ){
		 	disp = disp + ">>";
		 }
		 if( blockNo != "null"){
		 	disp = disp + blockNo + "座";
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
		
		$("#selectinf").html( "[<a href='javascript:void(0)' onClick='reSelectEst()'>重新選擇物業</a>]<span class='estName'> "
			+ $("#selectdiv .estName").html() +" </span> " + $("#selectdiv #standblock").html());
		$("#blockId").val(blockid);
		
	}
	
	function postEstate(obj){
        //自己填寫屋苑信息
		
		if( $("#blockId").val()=="" && $("#estateId").val()==""){
			if( !notNull( $("#estName"),"物業名稱不能為空") ){
				return false;
			}
		}
		
		if( $("#floor").val().length > 0 ){
			if( !isnumeric(  $("#floor"),"樓層必须是數字") ){
				return false;
			}
		}
	
		if( !notNull(  $("#area"),"物業面積不能為空") ){
			return false;
		}
		
		if( !isnumeric( $("#area"),"物業面積必须是數字") ){
			return false;
		}
		if( !notNull( $("#sellBuyPrice"),"物業期望售價不能為空") ){
			return false;
		}
		if( !isnumeric( $("#sellBuyPrice"),"物業期望售價必须是數字") ){
			return false;
		}
		if(  $("#sellBuyPrice").val() < 50 ){
			if ( confirm("輸入的售價小于50萬，是否確定？")==false ){
				return false;
			}
		}
		if(  $("#sellBuyPrice").val() > 5000 ){
			if ( confirm("輸入的售價大于5000萬，是否確定？")==false ){
				return false;
			}
		}
		if(  $("#managementFee").val().length > 0 ){
			if( !isnumeric( $("#managementFee"),"管理费必须是數字") ){
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
	<H1>更换头像</H1>
	<DIV class=data_opt_title>
	<UL>
  		<LI><A class=ocurmenu href="ClientModifyProfile.do?act=getdetail">个人信息</A> </LI>
  		<LI><A class=curmenu>更换头像</A> </LI>
  		<LI><A class=ocurmenu href="ClientModifyPassword.jsp">修改密码</A> </LI>
  	</UL>
</DIV><!--data_opt_title end-->

<DIV style="PADDING-LEFT: 2%">
	<FORM method=post action="">
		<TABLE class=personal_info_form border=0 cellSpacing=0 cellPadding=0 width="100%">
  			<TBODY>
  				<TR>
    				<TD align=middle>
      					<OBJECT id=mycamera 
      						codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9" 
      						classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=447 height=477>
							<PARAM NAME="movie" VALUE="../images/camera.swf?inajax=1&amp;appid=2&amp;input=6e5eFtiZgOwes2R4GgWfsfgSCG2%2FGKzSAdbDe9x0%2F1sN7pNjTQGJ0oER6BiYHDotPnAiaDGO6K8nZkvxQRI80fvyROfQjizDIe7DC2o4jFwHraX6SSZi0co&amp;agent=3966578c4b48dea3525f3bae651936e5&amp;ucapi=http%3A%2F%2Flocalhost%2Fucenter">
							<PARAM NAME="quality" VALUE="high">
							<PARAM NAME="menu" VALUE="false">
      						<embed 
      							src="../images/camera.swf?inajax=1&appid=2&input=6e5eFtiZgOwes2R4GgWfsfgSCG2%2FGKzSAdbDe9x0%2F1sN7pNjTQGJ0oER6BiYHDotPnAiaDGO6K8nZkvxQRI80fvyROfQjizDIe7DC2o4jFwHraX6SSZi0co&agent=3966578c4b48dea3525f3bae651936e5&ucapi=http%3A%2F%2Flocalhost%2Fucenter" 
      							quality="high" menu="false"  width="447" height="477" 
						      	type="application/x-shockwave-flash" 
						      	pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
						      	name="mycamera" 
								swLiveConnect="true">
							</embed>
						</OBJECT>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</DIV></DIV>
					      

<!--searchzone start--></DIV>
<DIV class=clear></DIV>
<!--searchzone end-->


<!--footer start-->
<div id="footer">
	<script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
</div>
<!--footer end-->
</BODY></HTML>
