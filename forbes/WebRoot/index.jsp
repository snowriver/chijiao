<%@ page contentType="text/html; charset=gbk"%>
<%@ include file="include/gloable.jsp"%>


<SCRIPT type="text/javascript" src="js/jquery/jquery-1.2.6.min.js"></SCRIPT>
<script type="text/javascript">

		$(document).ready(function(){
      var browser=navigator.appName 
			var b_version=navigator.appVersion 
			var version=b_version.split(";"); 
			var trim_Version=version[1].replace(/[ ]/g,""); 
			
			if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0") { 
				location="NewIndex.do";
			}
			else { 
				location="NewIndex.do";
			}
			
		}); 
</script>
