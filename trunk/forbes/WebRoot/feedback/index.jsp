<%@ page language="java" pageEncoding="gbk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>BUG�ύҳ</title>
<style type="text/css">
<!--
	*{ font:normal 12px "����"; color:#fff; text-align:center; line-height:20px; padding:0; margin:0; }
	body{ background-image:url(images/bug_body_bg.gif); margin:20px; }
	ul{ list-style-type:none; }
	div{ float:left; }
	img{ border:0; }
	.preloadPic{ position:absolute; left:0; top:0; width:1px; height:1px; overflow:hidden; }
	.cbr{ line-height:0; clear:both; }
	.lineDiv, .lineDivM5, .lineDivM2{ width:88%; float:none; margin:0 auto; }
		.lineDivM5{ margin:8px auto; }
		.lineDivM2{ margin:2px auto; }
	.input1{ border:1px solid #555; background:#fff url(images/bug_input_bg.gif) repeat-x top; color:#333; text-align:left; margin:0 auto; }	
	.btn1{ width:120px; height:25px; border:0; color:#333; font-size:12px; line-height:25px; background-image:url(images/bug_btn_bg1.gif); background-color:transparent; cursor:pointer; }
	.bug_input{ text-align:left; } .btn_div input{ margin:0 5px; }
	.bug_con1{ width:430px; float:none; margin:0 auto; }
		.bug_con1_l{ width:220px; }
			.bug_con1_l li{ margin:4px 0; width:185px; height:74px; background-image:url(images/bug_con1_btnbg1.gif); font:bold 16px "����"; line-height:74px; text-align:left; padding-left:20px; cursor:pointer; }
		.bug_con1_r img{ margin-top:20px; }
	.bug_con2{ width:453px; float:none; margin:0 auto; }
		.bug_con2 h1{ width:100%; background-image:url(images/bug_con2_top.gif); height:133px; overflow:hidden; font:bold 14px "����"; color:#ff0; line-height:240px; }
		.bug_con2 h2{ text-align:left; padding-left:10px; color:#ff0; background:url(images/bug_icon1.gif) no-repeat left 4px; float:left; }
		.bug_con2 h3{ float:left; margin-left:15px; }
			.bug_con2 h3 span{ color:#ff0; }
		.bug_con2_con{ width:100%; background-image:url(images/bug_con2_bg1.gif); }
		.bug_con2_con2{ width:100%; background-image:url(images/bug_con2_bg2.gif); }
	.ie8bm{ line-height:0; }
-->
</style>

<script type="text/javascript">
<!--
	function Page(){
		Page.ImgUrl = "images/"; //ͼƬ��ַ
		//ͼƬԤ��
		Page.PreLoadPics = [
			{ name:"", pic:Page.ImgUrl + "bug_con1_btnbg2.gif" },
			{ name:"", pic:Page.ImgUrl + "bug_btn_bg2.gif" }
		];
		Page.BugPage = "http://chi-jiao/FAQ/Default.jsp"; //���ⷴ��ҳ��ַ
		Page.EmailExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		Page.radioPage = [ "���ϳ���", "ҳ��������", "ͼƬ����", "���ӳ���" ];
	}Page();
	//���ö����л�Ч��
	Page.SetSwap = function(objArray, img, swapImg){
		function mouseover(){ this.style.backgroundImage = "url(" + swapImg + ")"; }
		function mouseout(){ this.style.backgroundImage = "url(" + img + ")"; }
		for(var i = 0; i < objArray.length; i++){ objArray[i].onmouseover = mouseover;objArray[i].onmouseout = mouseout; }
	}
	//������ҳ�л���ť
	Page.SetTab = function(){
		var form1 = $id("form1"), form2 = $id("form2"), con1 = $id("con1"), items = $id("index_tab").getElementsByTagName("li"), lis = $id("bug_radios").getElementsByTagName("label"), title = $id("bug_title"), inputs = $id("bug_radios").getElementsByTagName("input");
		Page.SetSwap(items, Page.ImgUrl + "bug_con1_btnbg1.gif", Page.ImgUrl + "bug_con1_btnbg2.gif");
		Page.SetTab.Return = function(){ con1.style.display = "block"; form1.style.display = "none"; form2.style.display = "none"; }
		function mouseclick(){ $id("qq").value = this.innerText;  }
		function inputclick(){ $id("qq").value = this.parentNode.getElementsByTagName("label")[0].innerText; }
		for(var i = 0; i < lis.length; i++){ lis[i].onclick = mouseclick; inputs[i].onclick = inputclick; }
		function form1Display(){ con1.style.display = "none"; form1.style.display = "block"; form2.style.display = "none"; }
		items[0].onclick = function(){ title.innerText = "���ύҳ�����"; Page.SetRadioTxt(false); $id("name").value =  $id("tellnumber").value = "ҳ������ύ"; form1Display(); }
		items[1].onclick = function(){ con1.style.display = "none"; form1.style.display = "none"; form2.style.display = "block"; }
	 }
	//���õ�ѡ����
	Page.SetRadioTxt = function(isMobile){
		var items = $id("bug_radios").getElementsByTagName("label");
		for(var i = 0; i < items.length; i++) items[i].innerHTML = (isMobile) ? Page.radioMobile[i] : Page.radioPage[i];
	}
	//���ð�ť��ʽ
	Page.SetBtn = function(){ Page.SetSwap($cl("btn1", "input"), Page.ImgUrl + "bug_btn_bg1.gif", Page.ImgUrl + "bug_btn_bg2.gif"); }
	//ͼƬԤ��
	Page.PreLoadPic = function(){
		for(var i = 0; i < Page.PreLoadPics.length; i++ ) document.writeln("<div class=\"preloadPic\"><img src=\"" + Page.PreLoadPics[i].pic + "\" alt=\"" + Page.PreLoadPics[i].name + "\" title=\"" + Page.PreLoadPics[i].name + "\" \/><\/div>");
	}
	//��֤�ؼ�
	Page.SetInputCheck = function(obj, checkType, inputName, express){
		var str = "", isSelect = false;
		switch(checkType){
			case 1: if(obj.value.length < 1){ str = inputName + "���ݲ���Ϊ�գ�\n"; } break;
			case 2: for(var i = 0; i < obj.length; i++) if(obj[i].checked){ isSelect = true; break; } str = (isSelect) ? "" : "��ѡ��" + inputName + "\n"; break;
			case 3: str = (obj.value.length > 0 && !express.test(obj.value)) ? "����ȷ����" + inputName + "\n" : ""; break;
		}
		if(str && !(obj.length)){ obj.focus(); }
		 return str;
	}
	//��ʼ��ҳ��
	Page.Init = function(){ 
		var temp = getUrl("errUrl");
		var url = (temp != null) ? temp.replace('��','?').replace('��','&') : "";
		var errNum = getUrl("errNum")
		$id("url").value = url;
		try{ document.getElementsByName("type")[parseInt(errNum) - 1].click(); } catch(e){ }
	}
	//�����
	Page.FormCheck = function(){
		$id("form1").onsubmit = function(){
			var message = Page.SetInputCheck($id("url"), 1, "����ҳ���ַ") + Page.SetInputCheck(document.getElementsByName("type"), 2, "��������") + Page.SetInputCheck($id("info"), 1, "������������") + Page.SetInputCheck($id("email"), 1, "E-mail") + Page.SetInputCheck($id("email"), 3, "E-mail", Page.EmailExp);if(message){ alert(message); return false; }
		}
		$id("form2").onsubmit = function(){
			var message = Page.SetInputCheck($id("idea"), 1, "������������") + Page.SetInputCheck($id("iemail"), 1, "E-mail") + Page.SetInputCheck($id("iemail"), 3, "E-mail", Page.EmailExp);if(message){ alert(message); return false; }
		}
	}
	//����������ʽ
	Page.SetLinks = function() {
		if (!document.getElementsByTagName) return;
		var anchors = document.getElementsByTagName("a"); 
		for(var i=0; i<anchors.length; i++){ var anchor = anchors[i]; if (anchor.getAttribute("href") && anchor.getAttribute("rel") == "external") anchor.target = "_blank"; }
	}
	//��ȡID����
	function $id(id){ return document.getElementById(id); }
	//��ȡclass���Զ�����ʽ��������ʽ�Ķ���tagName��������
	var $cl = function(cl, objName, parentNodeObj) {
		var retnode = [], myclass = new RegExp('\\b' + cl + '\\b'), elem = (parentNodeObj == null) ? document.getElementsByTagName(objName) : parentNodeObj.getElementsByTagName(objName);
		for (var j = 0; j < elem.length; j++) { var classes = elem[j].className; if (myclass.test(classes)) retnode.push(elem[j]); }
		return retnode;
	}
	//��ȡURL����
	function getUrl(name){
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r!=null) return unescape(r[2]);return "";
	}
-->
</script>
</head>
<body>
	<script type="text/javascript">Page.PreLoadPic();</script>
	<div class="bug_con1" id="con1">
		<div class="bug_con1_l">
			<img src="images/bug_con1_title.gif" alt="��ѡ���������" title="��ѡ���������" />
			<ul id="index_tab">
				<li>��ҳ������</li>
				<li>��������</li>
			</ul>
		</div>
		<div class="bug_con1_r"><img src="images/bug_con1_pic.gif" alt="" /></div>
	</div>
	<p class="cbr"></p>
	<form action="SubmitFeedBack.do?act=error" method="post" id="form1" style="display:none">
	<div class="bug_con2">
		<h1 id="bug_title">���ύҳ�����</h1>
		<div class="bug_con2_con">
			<div class="lineDivM5">
				<h2>ҳ���ַ��</h2>
				<div class="bug_input"><input type="text" name="url" id="url" class="input1" style="width:320px;" /></div>
			</div><br class="cbr" />
			<div class="lineDivM2" style="margin-top:5px">
				<h2 id="bug_title2">�������ͣ�</h2>
			</div><br class="cbr" />
			<div class="lineDivM2" style="margin-bottom:5px">
				<div class="bug_input" id="bug_radios">
					<input type="radio" name="type" id="type1" value="1" /><label for="type1">���ϳ���</label>
					<input type="radio" name="type" id="type2" value="2" /><label for="type2">ҳ��������</label>
					<input type="radio" name="type" id="type3" value="3" /><label for="type3">ͼƬ����</label>
					<input type="radio" name="type" id="type4" value="4" /><label for="type4">���ӳ���</label>					
				</div>
			</div><br class="cbr" />
			<div class="lineDivM5">
				<h2>��������������<span>�����</span></h2>
			</div><br class="cbr" />
			<div class="lineDivM5">
				<textarea rows="1" cols="1" class="input1" style="width:380px; height:150px; padding:5px;" name="info" id="info"></textarea>
				<input type="hidden" name="name" id="name" value="�ֻ������ύ" />
				<input type="hidden" name="tellnumber" id="tellnumber" value="�ֻ������ύ" />
				<input type="hidden" name="qq" id="qq" value="qq" /></div>
			<div class="lineDivM5">
				<h2>�û���Ϣ�������� * Ϊ�����</h2>
			</div><br class="cbr" />
			<div class="lineDivM5">
				<h3><span>*</span> E-Mail��</h3>
				<div class="bug_input"><input type="text" name="email" id="email" class="input1" style="width:300px;" /></div>
				<br class="cbr" />
			</div>
			<div class="lineDivM5 btn_div">
				<input type="button" class="btn1" value="���ش�������ѡ��" onclick="Page.SetTab.Return();" />
				<input type="submit" class="btn1" value="ȷ���ύ����" /></div>
			<div class="ie8bm"><img src="images/bug_con2_bm1.gif" alt="" /></div>
			<div class="bug_con2_con2"><a href="#" rel="external">
				<img src="images/bug_bm_pic.gif" /></a></div>
			<div class="ie8bm"><img src="images/bug_con2_bm2.gif" alt="" /></div>
		</div>
	</div>
	</form>
	<p class="cbr"></p>
	<form action="SubmitFeedBack.do?act=feed" method="post" id="form2" style="display:none">
	<div class="bug_con2">
		<h1>������������</h1>
		<div class="bug_con2_con">
			<div class="lineDivM5" style="text-align:left;">������ӭ�����ǵ�վ�㽨��������ı���������뽫���Ľ���������д����������ı����С��������������鱻���ɣ����л����������ͳ���Ʒ��</div>
			<br class="cbr" />
			<div class="lineDivM5">
				<h2>�����������ݣ�<span>�����</span></h2>
			</div><br class="cbr" />
			<div class="lineDivM5"><textarea rows="1" cols="1" class="input1" style="width:380px; height:150px; padding:5px;" name="idea" id="idea"></textarea></div>
			<div class="lineDivM5">
				<h2>�û���Ϣ�������� * Ϊ�����</h2>
			</div><br class="cbr" />
			<div class="lineDivM5">
				<h3><span>*</span> E-Mail��</h3>
				<div class="bug_input"><input type="text" name="iemail" id="iemail" class="input1" style="width:300px;" /></div>
				<br class="cbr" />
			</div>
			<div class="lineDivM5 btn_div"><input type="button" class="btn1" value="���ش�������ѡ��" onclick="Page.SetTab.Return();" /><input type="submit" class="btn1" value="ȷ���ύ����" /></div>
			<div class="ie8bm"><img src="images/bug_con2_bm1.gif" alt="" /></div>
			<div class="bug_con2_con2"><a href="#" rel="external"><img src="images/bug_bm_pic.gif" /></a></div>
			<div class="ie8bm"><img src="images/bug_con2_bm2.gif" alt="" /></div>
		</div>
	</div>
	</form>
	<script type="text/javascript">Page.SetTab();Page.SetBtn();Page.FormCheck();Page.SetLinks();Page.Init();</script>
</body>
</html>
