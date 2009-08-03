<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<%
	
    com.forbes.ajax.VideoTypeSelector vs = new com.forbes.ajax.VideoTypeSelector();
    
	java.util.List topTypes = vs.getTopVideoType();
	
	com.forbes.hibernate.bean.Video video = (com.forbes.hibernate.bean.Video)request.getAttribute("VIDEO");
	if(video.getVideoType()!=null)
		request.setAttribute("VIDEO_TYPE_LIST", vs.getVideoTypes(video.getVideoType().getId().toString()) );
	
	request.setAttribute("TOP_VIDEO_TYPE_LIST", topTypes);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>������Ƶ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="css_body.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="../include/dedeajax2.js"></script>
	<script language='javascript' src='main.js'></script>
	<script type="text/javascript" src="../js/jquery/jquery-1.3.1.min.js"></script>
	<script language="javascript">
	<!--
	function checkSubmit()
	{
   		
   		if(document.form1.title.value==""){
	   		alert("��Ƶ���ⲻ��Ϊ�գ�");
	   		return false;
   		}
   		if(document.form1.maintypeid.value==0){
	   		alert("��ѡ����Ƶ�������");
	   		return false;
   		}
   		if(document.form1.videourl.value==""){
	   		alert("��Ƶ��ַ����Ϊ�գ�");
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
        $("<option value='0'>��ѡ��</option>").appendTo("#typeid");
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
	<div class="bodytitletxt">��Ƶά��</div>
</div>

<form name="form1" action=AdminEditVideo.do?act=edit&returnUrl=${RETURN_URL } enctype="multipart/form-data" method="post" onsubmit="return checkSubmit();">
<input name="id" type="hidden" id="id" value="${VIDEO.id }" />

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr>
      <td height="30">&nbsp;<a href="AdminUpdateVideo.do?act=list"><u>��Ƶ�б�</u></a>&gt;&gt;��������Ƶ</td>
      <td width="31%" align="right">&nbsp; <a href="AdminUpdateVideoType.do?act=list">[<u>��Ƶ��Ŀ����</u>]</a></td>
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
	                			<td width="84" height="28" align="center" bgcolor="#FFFFFF">&nbsp;�������&nbsp;</td>
	                			<td width="84" align="center" bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem2()"><u>��Ƶ����</u></a></td>
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
	                  			<td width="84" align="center"  bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem1()"><u>�������</u></a>&nbsp;</td>
	                  			<td width="84" align="center" bgcolor="#FFFFFF">��Ƶ����&nbsp;</td>
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
	                  			<td width="90">&nbsp;��Ʒ���ƣ�</td>
	                  			<td width="250"><input name="title" type="text" id="title" style="width:230px" value="${VIDEO.title }" /></td>
	                  			<td width="90">���Ӳ�����</td>
	                  			<td>
	                  			
	                  				<!-- 
	                  				<c:if test="${ VIDEO.iscommend == 0}">
			                  			<input type="checkbox" name="iscommend" id="iscommend" value="0" />�Ƽ�
			                  		</c:if>
			                  		<c:if test="${ VIDEO.iscommend != 0}">
			                  			<input type="checkbox" name="iscommend" id="iscommend" value="${ VIDEO.iscommend }" checked />�Ƽ�
			                  		</c:if>
			                  		
			                  		 -->
			                  		
			                  		
			                  		<c:if test="${ VIDEO.isverify == 0}">
			                  			<input type="checkbox" name="isverify" id="isverify" value="0" />���
			                  		</c:if>
			                  		<c:if test="${ VIDEO.isverify != 0}">
			                  			<input type="checkbox" name="isverify" id="isverify" value="${ VIDEO.isverify }" checked />���
			                  		</c:if>
			                  		
			                  		�Ƽ�ָ��<select name="iscommend">
	                    				<option value="0" <c:if test="${ VIDEO.iscommend == 0}">selected</c:if>>���Ƽ� </option>
	                    				<option value="1" <c:if test="${ VIDEO.iscommend == 1}">selected</c:if>>1</option>
	                    				<option value="2" <c:if test="${ VIDEO.iscommend == 2}">selected</c:if>>2</option>
	                    				<option value="3" <c:if test="${ VIDEO.iscommend == 3}">selected</c:if>>3</option>
	                    				<option value="4" <c:if test="${ VIDEO.iscommend == 4}">selected</c:if>>4</option>
	                    				<option value="5" <c:if test="${ VIDEO.iscommend == 5}">selected</c:if>>5</option>
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
	             				<td width="90">&nbsp;Tag��ǩ��</td>
	             				<td><input name="tag" type="text" id="tag" style="width:300px" value="" /> (�ÿո��','�ֿ�)</td>
	           				</tr>
	         			</table>
					</td>
	        	</tr>
	        	<tr id="pictable">
	            	<td height="28" class="bline">
				        <table width="800" border="0" cellspacing="0" cellpadding="0">
	                <tr>
	            	<td width="135" height="81">&nbsp;����ͼ��</td>
	              	<td width="464">
	              		<table width="100%" border="0" cellspacing="1" cellpadding="1">
	               			<tr>
		            		  	<td height="30">
		                        	<input name="litpictype" value="1" type="radio" onclick="SelectPicType(1);" onselect="SelectPicType(1);" checked="checked"/>��
		                      		<input name="litpictype" value="2" type="radio" onclick="SelectPicType(2);" onselect="SelectPicType(2);" />�����ϴ�
		                          	<input name="litpictype" value="3" type="radio" onclick="SelectPicType(3);" onselect="SelectPicType(3);" />����վ��ѡ��
		                          	<input name="litpictype" value="4" type="radio" onclick="SelectPicType(4);" onselect="SelectPicType(4);" />Զ��ͼƬ
		                        </td>
	                      	</tr>
	                      	<tr>
	                        	<td height="30">
		                        	<div id="litpictype1">������ͼ</div>
		                        	<div id="litpictype2" style="display:none">
		                          		<input name="locallitpic" type="file" id="locallitpic" style="width:200px" onchange="SeePic(document.picview,document.form1.litpic);" />
		                          		�����ϴ��������������ť
		                          	</div>
		                        	<div id="litpictype3" style="display:none">
		                        		<input name="litpicurl" type="text" id="litpicurl" style="width:250px" />
		                            	<input type="button" name="Submit2" value="����վ��ѡ��" style="width:120px" onclick="SelectImage('form1.picname','small');" class="inputbut" />
		                        	</div>
		                        	<div id="litpictype4" style="display:none">
		                        		<input name="litpicurl2" type="text" id="litpicurl2" style="width:250px" />&nbsp;����дͼƬ����ϸ��ַ
		                        	</div>
	                        	</td>
	                 		</tr>
	            		</table>
	         		</td>
	         		<td width="201" align="left">
						<c:if test="${empty VIDEO.litpic }">
                  			<img src="img/pview.gif" width="150" height="100" id="picview" name="picview" />
                  		</c:if>
                  		<c:if test="${not empty VIDEO.litpic }">
                  			<c:if test="${ VIDEO.litpictype == 2 || VIDEO.litpictype == 3 }">
                  				<img src="../${VIDEO.litpic }" width="150" height="100" id="picview" name="picview" />
                  			</c:if>
                  			<c:if test="${ VIDEO.litpictype == 4 }">
                  				<img src="${VIDEO.litpic }" width="150" height="100" id="picview" name="picview" />
                  			</c:if>
                  		</c:if>
					</td>
	     		</tr>
	  		</table>
		</td>
	</tr>

	<tr>
    	<td height="28" class="bline">
		     <table width="800" border="0" cellspacing="0" cellpadding="0">
          		<tr>
           			<td width="90">&nbsp;ӰƬ��Ŀ��</td>
            		<td width="300">
          				<select id="maintypeid" name="maintypeid" style="width:240px" onchange="onSelectTopVideoType(this)">
            				<option value="0">��ѡ��������</option>
            				<c:forEach items="${TOP_VIDEO_TYPE_LIST}" var="vt" varStatus="is">
            					<c:if test="${VIDEO.videoType.id == vt.id }">
            						<option value="${vt.id }" selected>${vt.name }</option>
            					</c:if>
            					<c:if test="${VIDEO.videoType.id != vt.id }">
            						<option value="${vt.id }">${vt.name }</option>
            					</c:if>
            				</c:forEach>	
            			</select>
					</td>
             		<td width="90">&nbsp;����Ŀ��</td>
                  	<td>
                  		<!--
                  		<c:if test="${empty VIDEO.videoType2 }">
		           			<input type="button" name="selbtn" value="��ѡ������..." 
			           		style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
							onclick="SelectArticleType('typeid', 'selbtn');" />
							<input type="hidden" id="typeid" name="typeid" value="" />
		           		</c:if>
		           		<c:if test="${not empty VIDEO.videoType2 }">
		           			<input type="button" name="selbtn" value="${VIDEO.videoType2.name }" 
			           		style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
							onclick="SelectArticleType('typeid', 'selbtn');" />
							<input type="hidden" id="typeid" name="typeid" value="${VIDEO.videoType2.id }" />
		           		</c:if>
		           		<select id="typeid" name="typeid" style="width:240px">
            				<option value="0">��ѡ������</option>            				
            			 </select>
		           		-->
		           		<select id="typeid" name="typeid" style="width:240px">
                     		<c:if test="${empty VIDEO.videoType}">
								<option value="0" selected>��ѡ��</option>								
							</c:if>
                     		<c:if test="${not empty VIDEO.videoType}">
                     			<c:if test="${empty VIDEO.videoType2}">
									<option value="0">��ѡ��</option>
	                         		<c:forEach items="${VIDEO_TYPE_LIST}" var="type"> 
	                         			<option value="${type.id}">${type.name}</option>	     
									</c:forEach>								
								</c:if>
								<c:if test="${not empty VIDEO.videoType2}">
									<option value="0">��ѡ��</option>
	                         		<c:forEach items="${VIDEO_TYPE_LIST}" var="type"> 
	                         			<option value="${type.id}" <c:if test="${VIDEO.videoType2.id == type.id}">selected</c:if> >${type.name}</option>	     
									</c:forEach>								
								</c:if>
                         		
							</c:if>
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
          			<td width="90">&nbsp;���Ա��⣺</td>
                  	<td><input name="shorttitle" type="text" id="shorttitle" style="width:150px" value="${VIDEO.shorttitle }" /></td>
                </tr>
            </table>
     	</td>
	</tr>

  	<tr>
   		<td height="28" class="bline">
   			<table width="800" border="0" cellspacing="0" cellpadding="0">
           		<tr>
                  	<td width="90" height="33">&nbsp;��������</td>
                  	<td width="240" height="33">
                  		<select name="sortup" id="sortup" style="width:150px">
	                 		<option value="0" selected="selected">Ĭ������</option>
	                      	<option value="7">�ö�һ��</option>
	                      	<option value="30">�ö�һ����</option>
	                      	<option value="90">�ö�������</option>
	                      	<option value="180">�ö�����</option>
	                      	<option value="360">�ö�һ��</option>
                    	</select>
                  	</td>
                  	<td width="90" height="33">������ɫ��</td>
                  	<td height="33">
                  		<input name="color" type="text" id="color" style="width:120px" value="${VIDEO.color }" />
                      	<input name="modcolor" type="button" id="modcolor" value="ѡȡ" onclick="ShowColor()" class="inputbut" />
                  	</td>
          		</tr>
         	</table>
    	</td>
	</tr>
	<tr>
    	<td height="28" class="bline">
    		<table width="800" border="0" cellspacing="0" cellpadding="0">
            	<tr>
                  	<td width="90" height="33">&nbsp;�Ķ�Ȩ�ޣ�</td>
                  	<td width="240" height="33">
                  		<select name="videorank" id="videorank" style="width:150px">
                  			<option value='0'>�������</option>
     						<option value='-1'>����˸��</option>
						 	<option value='10'>ע���Ա</option>
							<option value='50'>�м���Ա</option>
						 	<option value='100'>�߼���Ա</option>
							<option value='1000'>������Ա</option>
                    	</select>
                  	</td>
                  	<td width="90" height="33">����ѡ�</td>
                  	<td height="33">
                  		<input name="ishtml" type="radio"  value="1" checked="checked" />����HTML
                    	<input type="radio" name="ishtml"  value="0" />����̬���
                    </td>
          		</tr>
  			</table>
  		</td>
	</tr>

  	<tr>
		<td height="76" class="bline">
			<table width="800" border="0" cellspacing="0" cellpadding="0">
            	<tr>
              		<td width="90" height="51">&nbsp;��Ҫ˵����</td>
                  	<td width="240"><textarea name="description" rows="3" id="description" style="width:200px">${VIDEO.description }</textarea></td>
                  	<td width="90">�ؼ��֣�</td>
                  	<td width="160"><textarea name="keywords" rows="3" id="keywords" style="width:200px">${VIDEO.keywords }</textarea></td>
                  	<td width="220" align="left">
                		<input type="button" name="Submit" value="���..." style="width:56px;height:20px" onclick="SelectKeywords('form1.keywords');" class="inputbut" />
                  		�ÿո�ֿ�
                  	</td>
               	</tr>
       		</table>
       	</td>
  	</tr>

  	<tr>
   		<td height="28" class="bline">
   			<table width="800" border="0" cellspacing="0" cellpadding="0">
	     		<tr>
	           		<td width="90">&nbsp;����ʱ�䣺</td>
	          		<td width="240">
	          			<input name="pubdate" value="${VIDEO.pubdate }" type="text" id="pubdate" style="width:200px" />
					</td>
	       			<td width="90" align="center">���ѵ�����</td>
	         		<td><input name="money" type="text" id="money" value="0" size="10" /></td>
	        	</tr>
            </table>
    	</td>
	</tr>

 	<tr>
		<td height="28" class="bline">
			<table width="800" border="0" cellspacing="0" cellpadding="0">
         		<tr>
               		<td width="90">&nbsp;����ĵ���</td>
                  	<td width="330">
				  		<textarea name="likeid" cols="50" rows="6" id="likeid" style="width:320px;height:45px;float:left;margin-right:10px">${VIDEO.likeid }</textarea>
				  	</td>
                  	<td>
				  		<span style="padding-top:10px;maring:0px;">���ĵ�ID���ö��š�,���ֿ�<br/>
                  			<input name="lsel" type="button" id="lsel" class="inputbut" style="width:150px" onchange="" value="���ѷ����ĵ���ѡȡ..." onclick="SelectVideoListA('form1.likeid');" />
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
                  	<td width="90" height="33">&nbsp;ӰƬ��Դ��</td>
                  	<td width="240" height="33"><input name="source" type="text" id="source" style="width:160px" size="16" value="${VIDEO.source }" />
                  		<input name="selsource" type="button" id="selsource" value="ѡ��" class="inputbut" /></td>
                  	<td width="90" height="33">�����ߣ�</td>
                  	<td height="33"><input name="writer" type="text" id="writer" style="width:120px" value="${VIDEO.writer }" />
                 		<input name="selwriter" type="button" id="selwriter" value="ѡ��" class="inputbut" />
                  	</td>
                </tr>
      		</table>
       			<script language='JavaScript' type="text/javascript">InitPage();</script>
            </td>
		</tr>

		
    	
  
	
    	<tr>
  			<td>��Ƶ����</td>              
   		</tr>
      	<tr>
     		<td style="padding:0px;"> 
	            <FCK:editor instanceName="content" height="400">
					<jsp:attribute name="value">
						${VIDEO.content }
					</jsp:attribute>
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
			                        <td width="115" height="35"><input name="imageField" type="submit" class="inputbut" value="ȷ��" /></td>
			                        <td width="99" height="35"><input name="button" type="reset" class="inputbut" id="button" value="����"/></td>
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