<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' /> 
<title>�鿴��Ա</title> 
<link href="css_body.css" rel="stylesheet" type="text/css" /> 
<script language='javascript'src='area.js'></script> 
<script> 
function checkSubmit()
{
  if(document.form2.email.value=="")
  {
    document.form2.email.focus();
    alert("Email����Ϊ�գ�");
    return false;
  }
  if(document.form2.uname.value=="")
  {
    document.form2.uname.focus();
    alert("�û��ǳƲ���Ϊ�գ�");
    return false;
  }
}
</script> 
</head> 
<body> 
 
<div class="bodytitle"> 
	<div class="bodytitleleft"></div> 
	<div class="bodytitletxt">��Ա����</div> 
</div> 
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;"> 
  <tr> 
    <td height="19" bgcolor="#EDF9D5"><a href='member_main.php'><b>��Ա����</b></a>&gt;&gt;�鿴��Ա</td> 
</tr>

<tr>
	<td height="200" bgcolor="#FFFFFF" valign="top">
		<table width="98%" border="0" cellspacing="0" cellpadding="0" > 
        	<tr> 
          		<td colspan="2" height="10" ></td> 
        	</tr>
          	<tr> 
            <td width="17%" height="25" align="right" >�û�����</td> 
            <td width="83%" height="25" > 
              admin            </td> 
          </tr> 
          
          <tr> 
            <td height="25" align="right" >�û����룺</td> 
            <td height="25" > 
              21232f297a57a5a743894a0e4a801fc3<br /> 
              �����룺<input name="newpwd" type="text" id="newpwd" value="" style="width:150px" /> 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�û��ǳƣ�</td> 
            <td height="25" > 
              <input name="uname" type="text" id="uname" value="��������" style="width:150px" /> 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��Ա�ȼ���</td> 
            <td height="25" > 
			<select name='membertype' style='width:100px'> 
<option value='0'>δ��˻�Ա</option> 
<option value='10' selected>ע���Ա</option> 
<option value='50'>�м���Ա</option> 
<option value='100'>�߼���Ա</option> 
<option value='1000'>������Ա</option> 
</select> 
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >����ʱ�䣺</td> 
            <td height="25"> 
			<input name="uptime" type="text" id="uptime" value="1970-01-01 08:00:00" style="width:200px"> 
			�������Ҫ������Ա���������ô�ʱ��Ϊ��ǰʱ�䣩
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��Ա������</td> 
            <td height="25"> 
			<input name="exptime" type="text" id="exptime" value="0" style="width:100px"> 
			�������Ҫ������Ա����Ա�����������0��
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��Ա��ң�</td> 
            <td height="25"> 
			<input name="money" type="text" id="money" value="0" style="width:100px"> 
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��Ա���֣�</td> 
            <td height="25"> 
			<input name="scores" type="text" id="scores" value="1000" style="width:100px"> 
			</td> 
          </tr> 
          <tr bgcolor="#F9FDEA"> 
            <td height="25" align="right" bgcolor="#EDF9D5" >�ռ���Ϣ��</td> 
            <td height="25" bgcolor="#EDF9D5" > 
              <table width="90%" border="0" cellspacing="0" cellpadding="0"> 
                <tr> 
                  <td height="22" style="border-bottom:1px solid #999999">�����£�
                    (
                    0                    ) ͼ���� (
                    0                    ) ������ (
                    0                    ) </td> 
                </tr> 
                <tr> 
                  <td height="22" style="border-bottom:1px solid #999999">���ռ�չʾ������
                    (
                    0                    ) �ĵ��ܵ���� (
                    0                    ) </td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >ע��ʱ�䣺</td> 
            <td height="25" > 
              2008-09-20 09:59:58              ���ɣУ�
              127.0.0.1            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�����¼ʱ�䣺</td> 
            <td height="25" > 
              2008-09-20 12:16:00              ���ɣУ�
              127.0.0.1            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�������䣺</td> 
            <td height="25" ><input name="email" type="text" id="email" value="service@chijiao.org" style="width:150;height:20" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�ǡ��ƣ�</td> 
            <td height="25" ><input name="uname" type="text" value="��������" id="uname" size="20" style="width:150;height:20" ></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�ԡ���</td> 
            <td height="25" > <input type="radio" name="sex"  value="��" checked> 
              �� &nbsp; <input type="radio" name="sex"  value="Ů"> 
              Ů </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�Ƽ�����</td> 
            <td height="25" > 
            	<input name="matt" type="text" id="matt" value="1" size="10"></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >���գ�</td> 
            <td height="25" > 
            	<input name="birthday" type="text" id="birthday" size="20" value="0000-00-00" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >���ͣ�</td> 
            <td height="25" > <select name="weight" > 
                <option value='0'> 
                0                </option> 
                <option value='ƽ��'>ƽ��</option> 
                <option value='����/��ϸ'>����/��ϸ</option> 
                <option value='��׳'>��׳</option> 
                <option value='����'>����</option> 
                <option value='����'>����</option> 
              </select> &nbsp;��ߣ�
              <input name="height" value="0" type="text" id="height" size="5" > 
              ����</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >ְҵ��</td> 
            <td height="25" > <input type="radio"  name="job" value="ѧ��" > 
              ѧ��
              <input type="radio"  name="job" value="ְԱ" > 
              ְԱ
              <input type="radio"  name="job" value="����" > 
              ����
              <input type="radio"  name="job" value="ʧҵ��" > 
              ʧҵ�� </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >����������</td> 
            <td height="25" > 
            	<select name="province" size="1" id="province" width="4" onChange="javascript:selNext(this.document.form2.city,this.value)" style="width:85"> 
                <option value="0">--����--</option> 
                <option value='1'>������</option> 
<option value='2'>�Ϻ���</option> 
<option value='3'>�����</option> 
<option value='4'>������</option> 
<option value='5'>�㶫ʡ</option> 
<option value='6'>����ʡ</option> 
<option value='7'>�㽭ʡ</option> 
<option value='8'>����ʡ</option> 
<option value='9'>ɽ��ʡ</option> 
<option value='10'>����ʡ</option> 
<option value='11'>����ʡ</option> 
<option value='12'>�Ĵ�ʡ</option> 
<option value='13'>����ʡ</option> 
<option value='14'>����ʡ</option> 
<option value='15'>����ʡ</option> 
<option value='16'>�ӱ�ʡ</option> 
<option value='17'>ɽ��ʡ</option> 
<option value='18'>���ɹ�</option> 
<option value='19'>����ʡ</option> 
<option value='20'>������</option> 
<option value='21'>����ʡ</option> 
<option value='22'>����ʡ</option> 
<option value='23'>������</option> 
<option value='24'>����ʡ</option> 
<option value='25'>����ʡ</option> 
<option value='26'>����ʡ</option> 
<option value='27'>������</option> 
<option value='28'>����ʡ</option> 
<option value='29'>������</option> 
<option value='30'>�ຣʡ</option> 
<option value='31'>�½���</option> 
<option value='32'>�����</option> 
<option value='33'>������</option> 
<option value='35'>̨��ʡ</option> 
              </select> &nbsp;���У�
              <select id="city" name="city" width="4" style="width:85" > 
                <option value="0">--����--</option> 
                              </select> </td> 
          </tr> 
          <tr align="center"> 
            <td height="25" colspan="2" > <hr width="80%" size="1" noshade> </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >OICQ���룺</td> 
            <td height="25" ><input name="oicq" type="text" value="" id="oicq" size="20" style="width:150;height:20" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��ϵ�绰��</td> 
            <td height="25" ><input name="tel" type="text" value="" id="tel" size="20" style="width:150;height:20" > 
              &nbsp;[��վ��Ա����ϵ�绰һ�ɶ��Ᵽ��]</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >������ҳ��</td> 
            <td height="25" ><input name="homepage" value="" type="text" id="homepage" size="25" ></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >��ϵ��ַ��</td> 
            <td height="25" > <input name="address" value="" type="text" id="address" size="25" > 
            </td> 
          </tr> 
          <tr> 
            <td height="70" align="right" >���ҽ��ܣ�</td> 
            <td height="70" > <textarea name="myinfo" cols="40" rows="3" id="textarea3" ></textarea></td> 
          </tr> 
          <tr> 
            <td height="71" align="right" >����ǩ����</td> 
            <td height="71" > <textarea name="mybb" cols="40" rows="3" id="textarea4" ></textarea></td> 
          </tr> 
          <tr align="center"> 
            <td height="25" colspan="2" > <hr width="80%" size="1" noshade> </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >�ռ����ƣ� </td> 
            <td height="25" ><input name="spacename" type="text" id="spacename" size="35" value=""></td> 
          </tr> 
          <tr> 
            <td height="130" align="right" >�ռ乫�棺</td> 
            <td height="130" ><textarea name="news" cols="50" rows="8" id="textarea7" ></textarea></td> 
          </tr> 
          <tr> 
            <td height="130" align="right" >��ϸ���ϣ�</td> 
            <td height="130" ><textarea name="fullinfo" cols="50" rows="8" id="textarea8" ></textarea> 
            </td> 
          </tr> 
          <tr> 
            <td height="67" align="right" >&nbsp;</td> 
            <td height="67" > <input type="submit" name="Submit" value="ȷ���޸�" class="inputbut" /> 
              &nbsp;&nbsp; <input type="reset" name="Submit22" value="����" class="inputbut" /> </td> 
          </tr> 
        </form> 
      </table> </td> 
</tr> 
</table> 
</body> 
</html>