<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv='Content-Type' content='text/html; charset=gb2312' /> 
<title>查看会员</title> 
<link href="css_body.css" rel="stylesheet" type="text/css" /> 
<script language='javascript'src='area.js'></script> 
<script> 
function checkSubmit()
{
  if(document.form2.email.value=="")
  {
    document.form2.email.focus();
    alert("Email不能为空！");
    return false;
  }
  if(document.form2.uname.value=="")
  {
    document.form2.uname.focus();
    alert("用户昵称不能为空！");
    return false;
  }
}
</script> 
</head> 
<body> 
 
<div class="bodytitle"> 
	<div class="bodytitleleft"></div> 
	<div class="bodytitletxt">会员管理</div> 
</div> 
<table width="96%" border="0" cellpadding="1" cellspacing="1" align="center" class="tbtitle" style="	background:#E2F5BC;"> 
  <tr> 
    <td height="19" bgcolor="#EDF9D5"><a href='member_main.php'><b>会员管理</b></a>&gt;&gt;查看会员</td> 
</tr>

<tr>
	<td height="200" bgcolor="#FFFFFF" valign="top">
		<table width="98%" border="0" cellspacing="0" cellpadding="0" > 
        	<tr> 
          		<td colspan="2" height="10" ></td> 
        	</tr>
          	<tr> 
            <td width="17%" height="25" align="right" >用户名：</td> 
            <td width="83%" height="25" > 
              admin            </td> 
          </tr> 
          
          <tr> 
            <td height="25" align="right" >用户密码：</td> 
            <td height="25" > 
              21232f297a57a5a743894a0e4a801fc3<br /> 
              新密码：<input name="newpwd" type="text" id="newpwd" value="" style="width:150px" /> 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >用户昵称：</td> 
            <td height="25" > 
              <input name="uname" type="text" id="uname" value="天籁孤星" style="width:150px" /> 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >会员等级：</td> 
            <td height="25" > 
			<select name='membertype' style='width:100px'> 
<option value='0'>未审核会员</option> 
<option value='10' selected>注册会员</option> 
<option value='50'>中级会员</option> 
<option value='100'>高级会员</option> 
<option value='1000'>超级会员</option> 
</select> 
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >升级时间：</td> 
            <td height="25"> 
			<input name="uptime" type="text" id="uptime" value="1970-01-01 08:00:00" style="width:200px"> 
			（如果你要升级会员，必须设置此时间为当前时间）
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >会员天数：</td> 
            <td height="25"> 
			<input name="exptime" type="text" id="exptime" value="0" style="width:100px"> 
			（如果你要升级会员，会员天数必须大于0）
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >会员金币：</td> 
            <td height="25"> 
			<input name="money" type="text" id="money" value="0" style="width:100px"> 
			</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >会员积分：</td> 
            <td height="25"> 
			<input name="scores" type="text" id="scores" value="1000" style="width:100px"> 
			</td> 
          </tr> 
          <tr bgcolor="#F9FDEA"> 
            <td height="25" align="right" bgcolor="#EDF9D5" >空间信息：</td> 
            <td height="25" bgcolor="#EDF9D5" > 
              <table width="90%" border="0" cellspacing="0" cellpadding="0"> 
                <tr> 
                  <td height="22" style="border-bottom:1px solid #999999">　文章：
                    (
                    0                    ) 图集： (
                    0                    ) 其它： (
                    0                    ) </td> 
                </tr> 
                <tr> 
                  <td height="22" style="border-bottom:1px solid #999999">　空间展示次数：
                    (
                    0                    ) 文档总点击： (
                    0                    ) </td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >注册时间：</td> 
            <td height="25" > 
              2008-09-20 09:59:58              　ＩＰ：
              127.0.0.1            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >最近登录时间：</td> 
            <td height="25" > 
              2008-09-20 12:16:00              　ＩＰ：
              127.0.0.1            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >电子邮箱：</td> 
            <td height="25" ><input name="email" type="text" id="email" value="service@chijiao.org" style="width:150;height:20" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >昵　称：</td> 
            <td height="25" ><input name="uname" type="text" value="天籁孤星" id="uname" size="20" style="width:150;height:20" ></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >性　别：</td> 
            <td height="25" > <input type="radio" name="sex"  value="男" checked> 
              男 &nbsp; <input type="radio" name="sex"  value="女"> 
              女 </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >推荐级别：</td> 
            <td height="25" > 
            	<input name="matt" type="text" id="matt" value="1" size="10"></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >生日：</td> 
            <td height="25" > 
            	<input name="birthday" type="text" id="birthday" size="20" value="0000-00-00" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >体型：</td> 
            <td height="25" > <select name="weight" > 
                <option value='0'> 
                0                </option> 
                <option value='平均'>平均</option> 
                <option value='苗条/纤细'>苗条/纤细</option> 
                <option value='健壮'>健壮</option> 
                <option value='略胖'>略胖</option> 
                <option value='大型'>大型</option> 
              </select> &nbsp;身高：
              <input name="height" value="0" type="text" id="height" size="5" > 
              厘米</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >职业：</td> 
            <td height="25" > <input type="radio"  name="job" value="学生" > 
              学生
              <input type="radio"  name="job" value="职员" > 
              职员
              <input type="radio"  name="job" value="白领" > 
              白领
              <input type="radio"  name="job" value="失业中" > 
              失业中 </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >所在在区：</td> 
            <td height="25" > 
            	<select name="province" size="1" id="province" width="4" onChange="javascript:selNext(this.document.form2.city,this.value)" style="width:85"> 
                <option value="0">--不限--</option> 
                <option value='1'>北京市</option> 
<option value='2'>上海市</option> 
<option value='3'>天津市</option> 
<option value='4'>重庆市</option> 
<option value='5'>广东省</option> 
<option value='6'>福建省</option> 
<option value='7'>浙江省</option> 
<option value='8'>江苏省</option> 
<option value='9'>山东省</option> 
<option value='10'>辽宁省</option> 
<option value='11'>江西省</option> 
<option value='12'>四川省</option> 
<option value='13'>陕西省</option> 
<option value='14'>湖北省</option> 
<option value='15'>河南省</option> 
<option value='16'>河北省</option> 
<option value='17'>山西省</option> 
<option value='18'>内蒙古</option> 
<option value='19'>吉林省</option> 
<option value='20'>黑龙江</option> 
<option value='21'>安徽省</option> 
<option value='22'>湖南省</option> 
<option value='23'>广西区</option> 
<option value='24'>海南省</option> 
<option value='25'>云南省</option> 
<option value='26'>贵州省</option> 
<option value='27'>西藏区</option> 
<option value='28'>甘肃省</option> 
<option value='29'>宁夏区</option> 
<option value='30'>青海省</option> 
<option value='31'>新疆区</option> 
<option value='32'>香港区</option> 
<option value='33'>澳门区</option> 
<option value='35'>台湾省</option> 
              </select> &nbsp;城市：
              <select id="city" name="city" width="4" style="width:85" > 
                <option value="0">--不限--</option> 
                              </select> </td> 
          </tr> 
          <tr align="center"> 
            <td height="25" colspan="2" > <hr width="80%" size="1" noshade> </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >OICQ号码：</td> 
            <td height="25" ><input name="oicq" type="text" value="" id="oicq" size="20" style="width:150;height:20" > 
            </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >联系电话：</td> 
            <td height="25" ><input name="tel" type="text" value="" id="tel" size="20" style="width:150;height:20" > 
              &nbsp;[本站会员的联系电话一律对外保密]</td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >个人主页：</td> 
            <td height="25" ><input name="homepage" value="" type="text" id="homepage" size="25" ></td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >联系地址：</td> 
            <td height="25" > <input name="address" value="" type="text" id="address" size="25" > 
            </td> 
          </tr> 
          <tr> 
            <td height="70" align="right" >自我介绍：</td> 
            <td height="70" > <textarea name="myinfo" cols="40" rows="3" id="textarea3" ></textarea></td> 
          </tr> 
          <tr> 
            <td height="71" align="right" >个人签名：</td> 
            <td height="71" > <textarea name="mybb" cols="40" rows="3" id="textarea4" ></textarea></td> 
          </tr> 
          <tr align="center"> 
            <td height="25" colspan="2" > <hr width="80%" size="1" noshade> </td> 
          </tr> 
          <tr> 
            <td height="25" align="right" >空间名称： </td> 
            <td height="25" ><input name="spacename" type="text" id="spacename" size="35" value=""></td> 
          </tr> 
          <tr> 
            <td height="130" align="right" >空间公告：</td> 
            <td height="130" ><textarea name="news" cols="50" rows="8" id="textarea7" ></textarea></td> 
          </tr> 
          <tr> 
            <td height="130" align="right" >详细资料：</td> 
            <td height="130" ><textarea name="fullinfo" cols="50" rows="8" id="textarea8" ></textarea> 
            </td> 
          </tr> 
          <tr> 
            <td height="67" align="right" >&nbsp;</td> 
            <td height="67" > <input type="submit" name="Submit" value="确定修改" class="inputbut" /> 
              &nbsp;&nbsp; <input type="reset" name="Submit22" value="重置" class="inputbut" /> </td> 
          </tr> 
        </form> 
      </table> </td> 
</tr> 
</table> 
</body> 
</html>