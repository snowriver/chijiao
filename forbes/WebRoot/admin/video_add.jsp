<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<%
	
    com.forbes.ajax.VideoTypeSelector vs = new com.forbes.ajax.VideoTypeSelector();
    
	java.util.List topTypes = vs.getTopVideoType();
	
	request.setAttribute("TOP_VIDEO_TYPE_LIST", topTypes);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>增加视频</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../include/dedeajax2.js"></script>
	<script type="text/javascript" src="../js/jquery/jquery-1.3.1.min.js"></script>
	
	<script language='javascript' src='main.js'></script>
	<script language="javascript">
	<!--
	function checkSubmit()
	{
   		
   		if(document.form1.title.value==""){
	   		alert("视频标题不能为空！");
	   		return false;
   		}
   		if(document.form1.maintypeid.value==0){
	   		alert("请选择视频的主类别！");
	   		return false;
   		}
   		
  		return true;
	}
	-->
	</script>

<script language="javascript">

	
	function SelectPicType(type) {
	
		if(type == 1){
			document.all.litpictype1.style.display="block";
  			document.all.litpictype2.style.display="none";
  			document.all.litpictype3.style.display="none";
  			document.all.litpictype4.style.display="none";
		}
		if(type == 2){
			document.all.litpictype1.style.display="none";
  			document.all.litpictype2.style.display="block";
  			document.all.litpictype3.style.display="none";
  			document.all.litpictype4.style.display="none";
		}
		if(type == 3){
			document.all.litpictype1.style.display="none";
  			document.all.litpictype2.style.display="none";
  			document.all.litpictype3.style.display="block";
  			document.all.litpictype4.style.display="none";
		}
		if(type == 4){
			document.all.litpictype1.style.display="none";
  			document.all.litpictype2.style.display="none";
  			document.all.litpictype3.style.display="none";
  			document.all.litpictype4.style.display="block";
		}
	
	}

	
	function onSelectTopVideoType(obj){
		$.post(
			"../ajax/VideoTypeSelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateSelectTopVideoType
		);
	}
	
	function updateSelectTopVideoType(response){
		var arr = new Array();
		arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
		var op = new Array();
		$("#typeid").empty();
        $("<option value='0'>请选择</option>").appendTo("#typeid");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#typeid");
		}
		
	}
</script>

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<body topmargin="8">

<div class="bodytitle">
	<div class="bodytitleleft"></div>
	<div class="bodytitletxt">视频维护</div>
</div>

<form name="form1" action=AdminEditVideo.do?act=add&returnUrl=${RETURN_URL } enctype="multipart/form-data" method="post" onsubmit="return checkSubmit();">

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="30">&nbsp;<a href="AdminUpdateVideo.do?act=list"><u>视频列表</u></a>&gt;&gt;发布新视频</td>
      <td width="31%" align="right">&nbsp; <a href="AdminUpdateVideoType.do?act=list">[<u>视频栏目管理</u>]</a></td>
      <td width="1%">&nbsp;</td>
    </tr>
</table>

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
	<tr>
		<td bgcolor="#FFFFFF">
			<!-- Tab1 -->
		  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="head1" class="htable">
	        	<tr>
	          		<td colspan="2" bgcolor="#EDF9D5">
	          			<table border="0" cellpadding="0" cellspacing="0">
		          			<tr>
	                			<td width="84" height="28" align="center" bgcolor="#FFFFFF">&nbsp;常规参数&nbsp;</td>
	                			<td width="84" align="center" bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem2()"><u>视频内容</u></a></td>
	              			</tr>
	          			</table>
	          		</td>
	        	</tr>
	      	</table>
	      	
	      	<!-- Tab2 -->
	      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="head2" style="display:none">
	     		<tr>
	            	<td colspan="2" bgcolor="#EDF9D5">
	            		<table height="28" border="0" cellpadding="0" cellspacing="0">
	                		<tr>
	                  			<td width="84" align="center"  bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem1()"><u>常规参数</u></a>&nbsp;</td>
	                  			<td width="84" align="center" bgcolor="#FFFFFF">视频内容&nbsp;</td>
	                		</tr>
						</table>
	            	</td>
	          	</tr>
	      	</table>
	
	    	<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td height="2"></td></tr></table>
	
	       	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" id="needset">
				<tr>
	           		<td width="100%" height="28" class="bline">
				   		<table width="800" border="0" cellspacing="0" cellpadding="0">
	                		<tr>
	                  			<td width="90">&nbsp;作品名称：</td>
	                  			<td width="250"><input name="title" type="text" id="title" style="width:230px" /></td>
	                  			<td width="90">附加参数：</td>
	                  			<td>
	                  				<!-- 
	                  					<input name="iscommend" type="checkbox" id="iscommend" value="1"  />推荐
	                  				-->
	                    			<input name="isverify" type="checkbox" id="isverify" value="1" checked /> 审核
	                    			推荐指数<select name="iscommend">
	                    				<option value="0">不推荐 </option>
	                    				<option value="1">1</option>
	                    				<option value="2">2</option>
	                    				<option value="3">3</option>
	                    				<option value="4">4</option>
	                    				<option value="5">5</option>
	                    			</select>
	                    		</td>
	                		</tr>
	             		</table>
					</td>
				</tr>
	
	        	<tr>
					<td height="28" class="bline">
		       			<table width="800" border="0" cellspacing="0" cellpadding="0">
	           				<tr>
	             				<td width="90">&nbsp;Tag标签：</td>
	             				<td><input name="tag" type="text" id="tag" style="width:300px" value="" /> (用空格或','分开)</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	<tr id="pictable">
	            	<td height="28" class="bline">
				        <table width="800" border="0" cellspacing="0" cellpadding="0">
	                <tr>
	            	<td width="135" height="81">&nbsp;缩略图：</td>
	              	<td width="464">
	              		<table width="100%" border="0" cellspacing="1" cellpadding="1">
	               			<tr>
		            		  	<td height="30">
		                        	<input name="litpictype" value="1" type="radio" onclick="SelectPicType(1);" onselect="SelectPicType(1);" checked="checked"/>无
		                      		<input name="litpictype" value="2" type="radio" onclick="SelectPicType(2);" onselect="SelectPicType(2);" />本地上传
		                          	<input name="litpictype" value="3" type="radio" onclick="SelectPicType(3);" onselect="SelectPicType(3);" />在网站内选择
		                          	<input name="litpictype" value="4" type="radio" onclick="SelectPicType(4);" onselect="SelectPicType(4);" />远程图片
		                        </td>
	                      	</tr>
	                      	<tr>
	                        	<td height="30">
		                        	<div id="litpictype1">无缩略图</div>
		                        	<div id="litpictype2" style="display:none">
		                          		<input name="locallitpic" type="file" id="locallitpic" style="width:200px" onchange="SeePic(document.picview,document.form1.litpic);" />
		                          		本地上传请点击“浏览”按钮
		                          	</div>
		                        	<div id="litpictype3" style="display:none">
		                        		<input name="litpicurl" type="text" id="litpicurl" style="width:250px" />
		                            	<input type="button" name="Submit2" value="在网站内选择" style="width:120px" onclick="SelectImage('form1.picname','small');" class="inputbut" />
		                        	</div>
		                        	<div id="litpictype4" style="display:none">
		                        		<input name="litpicurl2" type="text" id="litpicurl2" style="width:250px" />&nbsp;请填写图片的详细地址
		                        	</div>
	                        	</td>
	                 		</tr>
	            		</table>
	         		</td>
	         		<td width="201" align="left"><img src="img/pview.gif" width="150" id="picview" name="picview" /></td>
	     		</tr>
	  		</table>
		</td>
	</tr>

	<tr>
    	<td height="28" class="bline">
		     <table width="800" border="0" cellspacing="0" cellpadding="0">
          		<tr>
           			<td width="90">&nbsp;影片栏目：</td>
            		<td width="300">
          				<select id="maintypeid" name="maintypeid" style="width:240px" onchange="onSelectTopVideoType(this)">
            				<option value="0">请选择主类型</option>
            				<c:forEach items="${TOP_VIDEO_TYPE_LIST}" var="vt" varStatus="is">
            					<option value="${vt.id }">${vt.name }</option>
            				</c:forEach>
            			</select>
					</td>
             		<td width="90">&nbsp;副栏目：</td>
                  	<td>
                  		<!-- 
                  		<input type="hidden" name="typeid" value="" />
						<input type="button" name="selbtn" value="请选择..." 
							style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
							onclick="SelectVideoType('typeid', 'selbtn');" />
						 -->
						 <select id="typeid" name="typeid" style="width:240px">
            				<option value="0">请选择副类型</option>            				
            			 </select>
					</td>
            	</tr>
			</table>
		</td>
	</tr>

	<tr>
   		<td height="28" class="bline">
   			<table width="800" border="0" cellspacing="0" cellpadding="0">
    			<tr>
          			<td width="90">&nbsp;简略标题：</td>
                  	<td><input name="shorttitle" type="text" id="shorttitle" style="width:150px" /></td>
                </tr>
            </table>
     	</td>
	</tr>

  	<tr>
   		<td height="28" class="bline">
   			<table width="800" border="0" cellspacing="0" cellpadding="0">
           		<tr>
                  	<td width="90" height="33">&nbsp;内容排序：</td>
                  	<td width="240" height="33">
                  		<select name="sortup" id="sortup" style="width:150px">
	                 		<option value="0" selected="selected">默认排序</option>
	                      	<option value="7">置顶一周</option>
	                      	<option value="30">置顶一个月</option>
	                      	<option value="90">置顶三个月</option>
	                      	<option value="180">置顶半年</option>
	                      	<option value="360">置顶一年</option>
                    	</select>
                  	</td>
                  	<td width="90" height="33">标题颜色：</td>
                  	<td height="33">
                  		<input name="color" type="text" id="color" style="width:120px" />
                      	<input name="modcolor" type="button" id="modcolor" value="选取" onclick="ShowColor()" class="inputbut" />
                  	</td>
          		</tr>
         	</table>
    	</td>
	</tr>
	<tr>
    	<td height="28" class="bline">
    		<table width="800" border="0" cellspacing="0" cellpadding="0">
            	<tr>
                  	<td width="90" height="33">&nbsp;阅读权限：</td>
                  	<td width="240" height="33">
                  		<select name="arcrank" id="arcrank" style="width:150px">
                  			<option value='0'>开放浏览</option>
     						<option value='-1'>待审核稿件</option>
						 	<option value='10'>注册会员</option>
							<option value='50'>中级会员</option>
						 	<option value='100'>高级会员</option>
							<option value='1000'>超级会员</option>
                    	</select>
                  	</td>
                  	<td width="90" height="33">发布选项：</td>
                  	<td height="33">
                  		<input name="ishtml" type="radio"  value="1" checked="checked" />生成HTML
                    	<input type="radio" name="ishtml"  value="0" />仅动态浏览
                    </td>
          		</tr>
  			</table>
  		</td>
	</tr>

  	<tr>
		<td height="76" class="bline">
			<table width="800" border="0" cellspacing="0" cellpadding="0">
            	<tr>
              		<td width="90" height="51">&nbsp;简要说明：</td>
                  	<td width="240"><textarea name="description" rows="3" id="description" style="width:200px"></textarea></td>
                  	<td width="90">关键字：</td>
                  	<td width="160"><textarea name="keywords" rows="3" id="keywords" style="width:200px"></textarea></td>
                  	<td width="220" align="left">
                		<input type="button" name="Submit" value="浏览..." style="width:56px;height:20px" onclick="SelectKeywords('form1.keywords');" class="inputbut" />
                  		用空格分开
                  	</td>
               	</tr>
       		</table>
       	</td>
  	</tr>

  	<tr>
   		<td height="28" class="bline">
   			<table width="800" border="0" cellspacing="0" cellpadding="0">
	     		<tr>
	           		<td width="90">&nbsp;发布时间：</td>
	          		<td width="240">
	          			<%
		               		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		               		java.util.Date now = new java.util.Date();
		               	
		               	%>
	          			<input name="pubdate" value="<%=formatter.format(now) %>" type="text" id="pubdate" style="width:200px" />                  </td>
	       			<td width="90" align="center">消费点数：</td>
	         		<td><input name="money" type="text" id="money" value="0" size="10" /></td>
	        	</tr>
            </table>
    	</td>
	</tr>

 	<tr>
		<td height="28" class="bline">
			<table width="800" border="0" cellspacing="0" cellpadding="0">
         		<tr>
               		<td width="90">&nbsp;相关文档：</td>
                  	<td width="330">
				  		<textarea name="likeid" cols="50" rows="6" id="likeid" style="width:320px;height:45px;float:left;margin-right:10px"></textarea>
				  	</td>
                  	<td>
				  		<span style="padding-top:10px;maring:0px;">把文档ID，用逗号“,”分开<br/>
                  			<input name="lsel" type="button" id="lsel" class="inputbut" style="width:150px" onchange="" value="从已发布文档中选取..." onclick="SelectVideoListA('form1.likeid');" />
                  		</span>
				  	</td>
         		</tr>
     		</table>
		</td>
	</tr>

	<tr><td height="28" bgcolor="#FFFFFF" class="bline2">&nbsp;</td></tr>
	
</table>


<!-- adset -->
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td height="2"></td></tr></table>

<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" style="display:none" id="adset">
	<tr>
    	<td width="100%" height="28" class="bline">
			<table width="800" border="0" cellspacing="0" cellpadding="0">
        		<tr>
                  	<td width="90" height="33">&nbsp;影片来源：</td>
                  	<td width="240" height="33"><input name="source" type="text" id="source" style="width:160px" size="16" />
                  		<input name="selsource" type="button" id="selsource" value="选择" class="inputbut" /></td>
                  	<td width="90" height="33">作　者：</td>
                  	<td height="33"><input name="writer" type="text" id="writer" style="width:120px" />
                 		<input name="selwriter" type="button" id="selwriter" value="选择" class="inputbut" />
                  	</td>
                </tr>
      		</table>
       			<script language='JavaScript' type="text/javascript">InitPage();</script>
            </td>
		</tr>

		
    	
    	<tr>
  			<td>视频介绍</td>              
   		</tr>
      	<tr>
     		<td style="padding:0px;"> 
	            <FCK:editor instanceName="content" height="400">
					<jsp:attribute name="value"></jsp:attribute>
				</FCK:editor>     
			</td>
		</tr>
	</table>
	
  	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    	<tr>
       		<td height="56">
       			<table width="100%" border="0" cellspacing="1" cellpadding="1">
                	<tr>
                  		<td width="17%">&nbsp;</td>
                  		<td width="83%">
                  			<table width="214" border="0" cellspacing="0" cellpadding="0">
                      			<tr>
			                        <td width="115" height="35"><input name="imageField" type="submit" class="inputbut" value="确定" /></td>
			                        <td width="99" height="35"><input name="button" type="reset" class="inputbut" id="button" value="重置"/></td>
                      			</tr>
                  			</table>
                  		</td>
                	</tr>
            	</table>
            </td>
    	</tr>
	</table>
</td>
    </tr>
  </table>
  </form>

</body>
</html>