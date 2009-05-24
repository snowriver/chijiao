<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


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
	<H1>�޸�����</H1>
	<DIV class=data_opt_title>
		<UL>
  			<LI><A class=ocurmenu href="ClientModifyProfile.do?act=getdetail">������Ϣ</A> </LI>
  			<LI><A class=ocurmenu href="${UC_HOME_URL }/cp.php?ac=avatar" target="_blank">����ͷ��</A> </LI>
  			<LI><A class=curmenu>�޸�����</A> </LI>
  		</UL>
  	</DIV>
  	
  	<DIV style="PADDING-LEFT: 2%">
		<FORM method=post action="ClientModifyProfile.do?act=modifypwd">
			<TABLE class=personal_info_form border=0 cellSpacing=0 cellPadding=0 width="100%">
  				<TBODY>
  					<TR>
					    <TD style="TEXT-ALIGN: right; WIDTH: 200px; HEIGHT:20px"></TD>
					    <TD><font color=red>${MESSAGE_INFO }</font></TD>
					</TR>
  					<TR>
					    <TD style="TEXT-ALIGN: right; WIDTH: 200px">ԭ����:</TD>
					    <TD><INPUT tabIndex=1 size=30 type=password name=oldpassword></TD>
					</TR>
					<TR>
					    <TD align=right>������:</TD>
					    <TD><INPUT tabIndex=2 size=30 type=password name=newpassword></TD>
					</TR>
					<TR>
					    <TD align=right>������:</TD>
					    <TD><INPUT tabIndex=3 size=30 type=password name=renewpassword></TD>
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
<div id="footer">
	<script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
</div>
<!--footer end-->
</BODY></HTML>
