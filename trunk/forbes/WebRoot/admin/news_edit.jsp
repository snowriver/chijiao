<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<link href="css_body.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/dedeajax2.js"></script>
<script language='javascript' src='main.js' charset="gb2312"></script>


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
	<div class="bodytitletxt">��Ѷά��</div>
</div>

<form name="form1" action="AdminManageNews.do?act=edit&returnUrl=${RETURN_URL }" enctype="multipart/form-data" method="post" onsubmit="return CS_ArchivesAdd();">
<input id="id" name="id" type="hidden" value="${NEWS.id }" />
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="background:#E2F5BC;">
    <tr> 
 		<td height="30">&nbsp;<a href="AdminManageNews.do?act=list"><u>��Ѷ�б�</u></a>&gt;&gt;�޸���Ѷ</td>
      	<td width="10%">&nbsp;</td>
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
			                  	<td width="90">&nbsp;���±��⣺</td>
			                  	<td width="250"><input name="title" type="text" id="title" style="width:230px" value="${NEWS.title }"/></td>
			                  	<td width="90">���Ӳ�����</td>
			                  	<td>
			                  		<c:if test="${ NEWS.iscommend == 0}">
			                  			<input type="checkbox" name="iscommend" id="iscommend" value="0" />�Ƽ�
			                  		</c:if>
			                  		<c:if test="${ NEWS.iscommend != 0}">
			                  			<input type="checkbox" name="iscommend" id="iscommend" value="${ NEWS.iscommend }" checked />�Ƽ�
			                  		</c:if>
			                    </td>
			                </tr>
			            </table>
			   		</td>
          		</tr>
		  		<tr>
		      		<td height="24" class="bline">
			   			<table width="800" border="0" cellspacing="0" cellpadding="0">
		          			<tr> 
		            			<td width="90">&nbsp;Tag��ǩ��</td>
		            			<td><input name="tag" type="text" id="tag" style="width:300px" value="${NEWS.keywords }" /> (�ÿո��','�ֿ�)</td>
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
	                  				<input name="source" type="text" id="source" style="width:160px" size="16" value="${NEWS.source }" />
	                      			<input name="selsource" type="button" id="selsource" value="ѡ��" class="inputbut" value="${NEWS.writer }" />
	                      		</td>
	                  			<td width="90" height="33">�����ߣ�</td>
	                  			<td height="33">
	                  				<input name="writer" type="text" id="writer" style="width:120px" />
	                      			<input name="selwriter" type="button" id="selwriter" value="ѡ��" class="inputbut" />
	                  			</td>
	                		</tr>
	              		</table>
                	</td>
          		</tr>
	 			<tr id="pictable">
            		<td height="24" class="bline"><table width="800" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90" height="81">&nbsp;����ͼ�� </td>
                  <td width="464"><table width="100%" border="0" cellspacing="1" cellpadding="1">
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
                        	<div id="litpictype1">
                        		������ͼ
                        	</div>
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
                  </table></td>
                  <td width="201" align="center">
                  	<c:if test="${empty NEWS.litpic }">
                  		<img src="img/pview.gif" width="150" height="100" id="picview" name="picview" />
                  	</c:if>
                  	<c:if test="${not empty NEWS.litpic }">
                  		<img src="../${NEWS.litpic }" width="150" height="100" id="picview" name="picview" />
                  	</c:if>
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
            <td height="24" bgcolor="#FFFFFF">&nbsp;�������ݣ�</td>
          </tr>
          <tr>
            <td>
	            <FCK:editor instanceName="content" height="500" width="100%">
					<jsp:attribute name="value">${NEWS.content }</jsp:attribute>
				</FCK:editor>
            </td>
          </tr>
          <tr>
            <td height="6"></td>
          </tr>
        </table>
        
		<table width="98%" border="0" align="center" cellpadding="2" cellspacing="2" id="adset" style="display:none">
         <tr>
            <td height="24" width="90" class="bline">
            	<table width="800" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90">&nbsp;���Ա��⣺</td>
                  <td><input name="shorttitle" type="text" id="shorttitle" style="width:150px" value="${NEWS.shorttitle }"/>
                  </td>
                  
                </tr>
            	</table>
            </td>
          </tr>
       
    
	<tr> 
    <td height="24" class="bline">
	  <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90">&nbsp;����ʱ�䣺</td>
            <td>
				<input name="pubdate" value="${NEWS.pubdate }" type="text" id="pubdate" style="width:200px" />
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
            	<input name="color" type="text" id="color" style="width:120px" value="${NEWS.color }"/> 
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
          <td width="90" height="51">&nbsp;�ĵ�ժҪ��</td>
          <td width="446"><textarea name="description" rows="3" id="description" style="width:80%">${NEWS.description }</textarea></td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    </tr>
	<tr>
	  <td height="76" class="bline">
	  	<table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="90" height="51">&nbsp;�ؼ��֣�</td>
          <td width="446"><textarea name="keywords" rows="3" id="keywords" style="width:80%">${NEWS.keywords }</textarea></td>
          <td>�ÿո�ֿ�<br/>
              <input type="button" name="Submit" value="���..." style="width:56px;height:20" onclick="SelectKeywords('form1.keywords');" class="inputbut" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
	  <td height="76" class="bline">
	  <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90">&nbsp;����ĵ���</td>
            <td width="446">
            
            <textarea name="likeid" rows="3" id="likeid" style="width:80%;">${NEWS.likeid }</textarea>             </td>
            <td>
            	���ĵ�ID���ö��š�,���ֿ�<br/>
                <input name="lsel" type="button" id="lsel" class="nbt" style="width:150px" onchange="" value="���ѷ����ĵ���ѡȡ..." onclick="SelectNewsListA();" />
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
                        <td width="99" height="35"><a href="catalog_main.php">
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