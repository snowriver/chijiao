<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<%
	
    com.forbes.ajax.ArticleTypeSelector ss = new com.forbes.ajax.ArticleTypeSelector();
	java.util.List topTypes = ss.getTopArticleType();
	request.setAttribute("TOP_ARTICLE_TYPE_LIST", topTypes);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��������</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />

<script language='javascript' src='main.js' charset="gb2312"></script>
<script type="text/javascript" src="../js/jquery/jquery-1.3.1.min.js"></script>

<script type="text/javascript" src="../fckeditor/fckeditor.js"></script>

<script language="javascript">	


	function onSelectTopArticleType(obj){
		$.post(
			"../ajax/ArticleTypeSelector.jsp",
		    {				
				pid:""+obj.value
		    },
		    updateSelectTopArticleType
		);
	}
	
	function updateSelectTopArticleType(response){
		var arr = new Array();
		arr = response.replace(/(^\s*)|(\s*$)/g,"").split("#");
		var op = new Array();
		$("#typeid").empty();
        $("<option value='0'>��ѡ������</option>").appendTo("#typeid");
		for( var i = 0; i < arr.length-1; i++ ){
			op = arr[i].split("&");
			$("<option value='" + op[0] + "'>" + op[1] + "</option>").appendTo("#typeid");
		}
		
	}
	
	function onSelectType(obj){
		$("#typeid").val(obj.value);
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
	<div class="bodytitletxt">����ά��</div>
</div>

<form name="form1" action="AdminUpdateArticle.do?act=bmod&arcID=${param.arcID }&returnUrl=${param.returnUrl }" method="post" onsubmit="return CS_ArchivesAdd();">
 
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr> 
 		<td height="30">&nbsp;<a href="AdminUpdateArticle.do?act=list"><u>�����б�</u></a>&gt;&gt;�����޸�����</td>
      	<td width="10%">&nbsp;<a href="AdminUpdateArticleType.do?act=list">[<u>��Ŀ����</u>]</a> </td>
      	<td width="1%">&nbsp;</td>
    </tr>
</table>

<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
	<tr>
		<td bgcolor="#FFFFFF">
  			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="head1" class="htable" style="border-bottom:1px solid #99CC33">
    			<tr> 
      				<td colspan="2" bgcolor="#E2F5BC">
      					<table border="0" cellpadding="0" cellspacing="0">
          					<tr> 
            					<td width="84" height="24" align="center" bgcolor="#FFFFFF">&nbsp;��������&nbsp;</td>
            					<td width="84" align="center" bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem2()"><u>��������</u></a></td>
          					</tr>
        				</table>
        			</td>
    			</tr>
  			</table>
  			
  			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="head2" style="border-bottom:1px solid #99CC33;display:none">
		    	<tr> 
		      		<td colspan="2" bgcolor="#E2F5BC">
		      			<table height="24" border="0" cellpadding="0" cellspacing="0">
		          			<tr> 
		            			<td width="84" align="center" bgcolor="#006600"><a href="#" class="STYLE1" onclick="ShowItem1()"><u>��������</u></a>&nbsp;</td>
		            			<td width="84" align="center" bgcolor="#FFFFFF">��������&nbsp;</td>
		          			</tr>
		        		</table>
		        	</td>
		    	</tr>
		  	</table>
  
        	<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
          		<tr>
            		<td height="2"></td>
          		</tr>
        	</table>
        	
        	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2" id="needset">
          		<tr>
            		<td height="24" class="bline">
            		
            			<table width="800" border="0" cellspacing="0" cellpadding="0">
			                <tr>
			                  	<td width="90">&nbsp;���Ӳ�����</td>
			                  	<td width="350">
									<!-- 
	                  					<input name="iscommend" type="checkbox" id="iscommend" value="1"  />�Ƽ�
	                  				-->
	                    			<input name="isverify" type="checkbox" id="isverify" value="1" checked /> ���
	                    			�Ƽ�ָ��<select name="iscommend">
	                    				<option value="0">���Ƽ� </option>
	                    				<option value="1">1</option>
	                    				<option value="2">2</option>
	                    				<option value="3">3</option>
	                    				<option value="4">4</option>
	                    				<option value="5">5</option>
	                    			</select>
								</td>
			                  	<td width="90"></td>
			                  	<td>
			                  		
			                    </td>
			                </tr>
			            </table>
			   		</td>
          		</tr>
		  		
     			<tr>
            		<td height="24" class="bline">
	            		<table width="800" border="0" cellspacing="0" cellpadding="0">
	                		<tr>
	                  			<td width="90" height="33">&nbsp;������Դ��</td>
	                  			<td width="240" height="33">
	                  				<input name="source" type="text" id="source" style="width:160px" size="16" />
	                      			<input name="selsource" type="button" id="selsource" value="ѡ��" class="inputbut" />
	                      		</td>
	                  			<td width="90" height="33">�����ߣ�</td>
	                  			<td height="33">
	                  				<input name="writer" type="text" id="writer" style="width:120px" />
	                      			<input name="selwriter" type="button" id="selwriter" value="ѡ��" class="inputbut" />
	                  			</td>
	                		</tr>
	              		</table>
	              		<script language='JavaScript' type="text/javascript">InitPage();</script>
                	</td>
          		</tr>
	 			
          <tr>
            <td height="24" class="bline"><table width="800" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90">&nbsp;��������Ŀ��</td>
                  <td width="300">
            			<select id="maintypeid" name="maintypeid" style="width:240px" onchange="onSelectTopArticleType(this)">
            				<option value="0">��ѡ��������</option>
            				<c:forEach items="${TOP_ARTICLE_TYPE_LIST}" var="at" varStatus="is">
            					<option value="${at.id }">${at.name }</option>
            				</c:forEach>
            				
            			</select>

                  </td>
                  <td width="90" height="33">&nbsp;����Ŀ��</td>
		           <td height="33">
		           		<!-- 
			           	<input type="button" name="selbtn" value="��ѡ������..." 
			           		style="height:21px;width:150px;border:0px;background-image:url(img/ctbg.gif);padding-top:2px; background-color: transparent" 
							onclick="SelectArticleType('typeid', 'selbtn');" />
						<input type="hidden" id="typeid" name="typeid" value="" />
						 -->
						<select id="typeid" name="typeid" style="width:240px" onchange="onSelectType(this)">
            				<option value="0">��ѡ������</option>            				
            			</select>
					</td>
                </tr>
            </table></td>
          </tr>
          
           <tr>
            <td width="100%" height="24" class="bline"><table width="800" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90">&nbsp;��ҳ��ʽ��</td>
                  <td>
                  	<input type="radio" name="sptype" value="hand" checked />����ҳ
                    <input type="radio" name="sptype" value="auto" />�Զ���ҳ���Զ���ҳ��С��
                    <input type="text" name="spsize" value="3" id="spsize" size="6" /> (K) 
                  </td>
                </tr>
            </table></td>
          </tr>
          
    
    
          <tr>
            <td height="2"></td>
          </tr>
          
          <tr>
            <td height="6"></td>
          </tr>
        </table>
        
		<table width="98%" border="0" align="center" cellpadding="2" cellspacing="2" id="adset" style="display:none">
         
       
    
	<tr> 
    <td height="24" class="bline">
	  <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90">&nbsp;����ʱ�䣺</td>
            <td> 
               <%
               	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               	java.util.Date now = new java.util.Date();
               	
               %>
				<input name="pubdate" value="<%=formatter.format(now) %>" type="text" id="pubdate" style="width:200px" />
	          </td>
            
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="24" class="bline"> <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90" height="22">&nbsp;�ĵ�����</td>
            <td width="240"> <select name="sortup" id="sortup" style="width:150px">
                <option value="0" selected>Ĭ������</option>
                <option value="7">�ö�һ��</option>
                <option value="30">�ö�һ����</option>
                <option value="90">�ö�������</option>
                <option value="180">�ö�����</option>
                <option value="360">�ö�һ��</option>
              </select> </td>
            <td width="90">������ɫ��</td>
            <td>
            	<input name="color" type="text" id="color" style="width:120px" /> 
                <input name="modcolor" type="button" id="modcolor" value="ѡȡ" onclick="ShowColor()" class="inputbut" />            
            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="24" class="bline"><table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90">&nbsp;�Ķ�Ȩ�ޣ�</td>
            <td width="240">
				<select name="arcrank" id="arcrank" style="width:150px">
                	<option value='X'>X</option>
              	</select> 
            </td>
            <td width="90">����ѡ�</td>
            <td>
				<input type="radio" name="ishtml" value="1" checked /> ����HTML 
                <input type="radio" name="ishtml" value="0" /> ����̬���</td>
          </tr>
        </table></td>
    </tr>
	
	<tr>
	  <td height="76" class="bline">
	  	<table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="90" height="51">&nbsp;�ؼ��֣�</td>
          <td width="446"><textarea name="keywords" rows="3" id="keywords" style="width:80%">${TAG }</textarea></td>
          <td>�ÿո�ֿ�<br/>
              <input type="button" name="Submit" value="���..." style="width:56px;height:20" onclick="SelectKeywords('form1.keywords');" class="inputbut" /></td>
        </tr>
      </table>
      </td>
    </tr>
    <tr>
	  <td height="76" class="bline">
	  <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90">&nbsp;����ĵ���</td>
            <td width="446">
            	<textarea name="likeid" rows="3" id="likeid" style="width:80%;"></textarea>
            </td>
            <td>
            	���ĵ�ID���ö��š�,���ֿ�<br/>
                <input name="lsel" type="button" id="lsel" class="nbt" style="width:150px" onchange="" value="���ѷ����ĵ���ѡȡ..." onclick="SelectArcListA();" />
            </td>
          </tr>
        </table>
       </td>
    </tr>
</table>       
 <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="56"><table width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                  <td width="17%">&nbsp;</td>
                  <td width="83%"><table width="214" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="115" height="35"><input name="imageField" type="submit" class="inputbut" value="ȷ��" /></td>
                        <td width="99" height="35"><a href="#">
                          <input name="button" type="reset" class="inputbut" id="button" value="����"/>
                        </a></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  </form>
</body>
</html>