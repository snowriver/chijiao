<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>����Ϣ����</TITLE>
	<META content="text/html; charset=gbk" http-equiv=Content-Type>
	<META name=keywords content="">
	<META name=description content="">
	<META name=MSSmartTagsPreventParsing content=TRUE>
	<META content=Yes http-equiv=MSThemeCompatible>
	<META name=GENERATOR content="MSHTML 8.00.6001.18241">
	<LINK rel=stylesheet type=text/css href="css/message_box.css">
</HEAD>

<body>

<div id="append"></div>
<div class="ucbody">
	<h1>����Ϣ����</h1>
	<script type="text/javascript">
		function checkall(form, prefix, checkall) {
			var checkall = checkall ? checkall : 'chkall';
			for(var i = 0; i < form.elements.length; i++) {
				var e = form.elements[i];
				if(e.name && e.name != checkall && (!prefix || (prefix && e.name.match(prefix)))) {
					e.checked = form.elements[checkall].checked;
				}
			}
		}

		function toggle_collapse(objname, ctrlobj) {
			var obj = document.getElementById(objname);
			if(obj.style.display == '') {
				obj.style.display = 'none';
				ctrlobj.innerHTML = '<img src="images/default/spread.gif" />';
			} else {
				obj.style.display = '';
				ctrlobj.innerHTML = '<img src="images/default/shrink.gif" />';
			}
		}

		function ctlent(event) {
			if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
				document.getElementById('postpmform').saveoutbox.value = 0;
				document.getElementById('postpmform').submit();
			}
		}
	</script>

	<div class="ucnav">
		<a class="ucontype" href="ClientListNewsFeeds.do?act=in">�ռ���<strong>[1]</strong></a>
		<a href="index.php?m=pm_client&a=ls&folder=inbox&filter=announcepm">������Ϣ[1]</a>
		<a href="index.php?m=pm_client&a=ls&folder=outbox">������</a>
		<a  class="sendpm" href="index.php?m=pm_client&a=send">���Ͷ���Ϣ</a>

		<span class="navinfo">
			<img src="images/default/newpm.gif" />
			<strong>1</strong> <a href="index.php?m=pm_client&a=ls&folder=newbox">��δ����Ϣ</a>
		</span>
	</div>
	
	<div class="ucinfo">
		<form method="post" action="index.php?m=pm_client&a=delete&folder=inbox&filter=&extra=page%3D">
			<input type="hidden" name="formhash" value="26064ca43ca77b1e" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pmlist">
				<tbody>
				<tr class="ctrlbar">
					<td class="sel"><input type="checkbox" name="chkall" onclick="checkall(this.form, 'delete')" /></td>
					<td class="ava"><button name="pmsend" type="submit">ɾ��</button></td>
					<td class="pef"></td>
					<td class=""></td>
				</tr>
				<tr class="onset">
					<td class="sel"><input type="checkbox" name="delete[]" value="8" /></td>
					<td class="ava"><img src="avatar.php?uid=2&size=small" /></td>
					<td class="per">xushaomin<p>����  15:49</p></td>
					<td class="title">
						<h2><a class="boldtext" href="index.php?m=pm_client&a=view&pmid=8&folder=inbox&filter=&extra=page%3D" id="pm_view_8">admin</a></h2>
						<p>admin</p>
					</td>
				</tr>
				</tbody>
				<tfoot>
				<tr class="ctrlbar">
					<td class="sel"><input type="checkbox" onclick="this.form.chkall.click()" /></td>
					<td class="ava"><button onclick="this.form.pmsend.click()" type="button">ɾ��</button></td>
					<td class="pef"></td>
					<td class=""></td>
				</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
</body>

</HTML>
