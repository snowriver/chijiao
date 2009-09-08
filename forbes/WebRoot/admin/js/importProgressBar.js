
var startTime;
$(document).ready(function () {
	$("#importButton").click(function () {
		var myDate = new Date();
		startTime = myDate.getTime();
		$(this).attr("disabled", true);
		$("#importForm").submit();
		$("#progress").show();
		window.setTimeout("getImportProgressBar()", 1000);
	});
	$("#close").click(function(){$("#progress").hide();});
});
function getImportProgressBar() {
	var timestamp = (new Date()).valueOf();
	var bytesReadToShow = 0;
	var contentLengthToShow = 0;
	var bytesReadGtMB = 0;
	var contentLengthGtMB = 0;
	$.getJSON("AdminImportArticleProgress.do", {"t":timestamp}, function (json) {
		var currentCnt = parseInt(json.currentCnt);
		var totalCnt = parseInt(json.totalCnt);
		var failCnt = parseInt(json.failCnt);
		var repeatCnt = parseInt(json.repeatCnt);
		var importCnt = parseInt(json.importCnt);
		
		$("#info").html("�ܹ�:" + totalCnt + "��, �Ѿ�����:" + importCnt + '�����ظ���' + repeatCnt + "����ʧ�ܣ�" + failCnt + "������ǰ��" + currentCnt);
		
		if( failCnt + repeatCnt + importCnt == totalCnt ){
			window.clearTimeout(interval);
			$("#uploaded").css("width", "300px");
			$("#close").show();
		}
		else {
			var percent = Math.floor((currentCnt / totalCnt) * 100) + "%";
			$("#uploaded").css("width", percent);			
		}
		
	});
	var interval = window.setTimeout("getImportProgressBar()", 500);
}

