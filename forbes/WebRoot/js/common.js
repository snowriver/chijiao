var member = new Array();
var userAgent = navigator.userAgent.toLowerCase();

function get_browser() {
	var b;
	if (window.ActiveXObject) {
		v = userAgent.substr(userAgent.indexOf('msie') + 5, 3);
		b = 'ie';
	} else if (userAgent.indexOf("firefox") != - 1) {
		v = userAgent.substr(userAgent.indexOf('gecko/') + 6, 8);
		b = 'firefox';
	} else if (userAgent.indexOf("safari") != - 1) {
		v = -1;
		b = 'safari';
	} else if (userAgent.indexOf("opera") != - 1) {
		v = opera.version();
		b = 'opera';
	} else {
		v = -1;
		b = -1;
	}

	return {
		name : b,
		version: v
	};
}

var browser = get_browser();

/*类库区
*****************************************/
function trim(s){return s.replace(/(^[ \t|???]*)|([ \t|???]*$)/g, "");}	//去掉首尾空格。
function $(s){return document.getElementById(s);}	//获取id为s的元素
function $$(s){return document.frames?document.frames[s]:$(s).contentWindow;}	//获取frame或iframe
function $c(s){return document.createElement(s);}	//创建新元素
function swap(s,a,b,c){$(s)[a]=$(s)[a]==b?c:b;}
function exist(s){return $(s)!=null;}	//结束
function removeNode(s){if(exist(s)){$(s).innerHTML = '';$(s).removeNode?$(s).removeNode():$(s).parentNode.removeChild($(s));}}	//去掉元素

function acc(s, n){	//对 id 为 s 的容器计数累加
	if(empty(n)) {
		n = 1;
	}
	$(s).innerHTML = parseInt($(s).innerHTML) + n;
}

function isset(variable) {return (typeof variable != 'undefined');}
function empty(variable) {
	if (!variable || variable == '') {
		return true;
	} else {
		return false;
	}
}
function in_array(needle, haystack) {
	if(typeof needle == 'string') {
		for(var i in haystack) {
			if(haystack[i] == needle) {
					return true;
			}
		}
	}
	return false;
}

//取标签的绝对位置
function getoffset(e) {
	var t = e.offsetTop;
	var l = e.offsetLeft;
	var w = e.offsetWidth;
	var h = e.offsetHeight-2;

	while(e=e.offsetParent)
	{
		t+=e.offsetTop;
		l+=e.offsetLeft;
	}
	return {
		top : t,
		left : l,
		width : w,
		height : h
	}
}

//取标签的绝对位置
function getpos(tag) {
	obj = $(tag);
	var t = obj.offsetTop;
	var l = obj.offsetLeft;
	var w = obj.offsetWidth;
	var h = obj.offsetHeight-2;

	while(obj=obj.offsetParent)
	{
		t+=obj.offsetTop;
		l+=obj.offsetLeft;
	}
	return {
		t : t,
		l : l,
		w : w,
		h : h
	}
}

function strlen(str) {
	var len = 0;
	for(var i = 0; i < str.length; i++) {
		len += str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255 ? (jsenv['charset'] == 'utf-8' ? 3 : 2) : 1;
	}
	return len;
}

function dw(s){document.write(s);} //输出
function hide(obj, d, e) {
	if(d == 'auto') {
		obj.style.display = obj.style.display == '' ? 'none' : '';
	} else {
		obj.style.display = d;
	}

	if(isset(e)) {
		doane(e);
	}

	return false;
}

function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
	var expires = new Date();
	expires.setTime(expires.getTime() + seconds);
	document.cookie = escape(jsenv['cookie_pre'] + cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '/')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '');
}

function getcookie(name) {	/*需要载入cookiepre*/
	name = jsenv['cookie_pre']+name;
	var cookie_start = document.cookie.indexOf(name);
	var cookie_end = document.cookie.indexOf(";", cookie_start);
	return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length)));
}

function doane(event) {
	e = event ? event : window.event;
	if(browser.name == 'ie') {
		e.returnValue = false;
		e.cancelBubble = true;
	} else if(e) {
		e.stopPropagation();
		e.preventDefault();
	}
}


function hideList(_sId,_sStr,_iBegin,_iEnd,_sShow){for(var i = _iBegin; i <= _iEnd; i++)if(exist(_sId + i)){$(_sId + i).style.display = _sStr;_sStr == 'none' ? $(_sShow + i).className = 'down' : $(_sShow + i).className = 'up'}}
function commentSubmit(_sVid){$("src_title" + _sVid).value = $("commentText" + _sVid).innerHTML;$("src_uname" + _sVid).value = AUTHOR;$('form' + _sVid).submit();}
function output(_sHtml, _box){var oOutput = typeof(_box) == "object" ? _box : $(_box);oOutput.innerHTML = _sHtml;}//alert(_sHtml);}
function setCopy(_sTxt){try{clipboardData.setData('Text',_sTxt)}catch(e){}}


function onfocus(s){var _sStr; if(exist(s)){_sStr=$(s).value;}else{return;}$(s).focus();if(_sStr!=""){$(s).select();}}

function stripscript(s) {
	return s.replace(/<script.*?>.*?<\/script>/ig, '');
}

//得到一个定长的hash值， 依赖于 stringxor()
function hash(string, length) {
	var length = length ? length : 32;
	var start = 0;
	var i = 0;
	var result = '';
	filllen = length - string.length % length;
	for(i = 0; i < filllen; i++){
		string += "0";
	}
	while(start < string.length) {
		result = stringxor(result, string.substr(start, length));
		start += length;
	}
	return result;
}

//note 封装函数参数
function newfunction(func){
	var args = new Array();
	for(var i=1; i<arguments.length; i++) args.push(arguments[i]);
	return function(event){
		doane(event);
		window[func].apply(window, args);
		return false;
	}
}

//debug 将两个字符串进行异或运算，结果为英文字符组合
function stringxor(s1, s2) {
	var s = '';
	var hash = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var max = Math.max(s1.length, s2.length);
	for(var i=0; i<max; i++) {
		var k = s1.charCodeAt(i) ^ s2.charCodeAt(i);
		s += hash.charAt(k % 52);
	}
	return s;
}

function preg_replace(search, replace, str) {
	var len = search.length;
	for(var i = 0; i < len; i++) {
		re = new RegExp(search[i], "ig");
		str = str.replace(re, typeof replace == 'string' ? replace : (replace[i] ? replace[i] : replace[0]));
	}
	return str;
}



function _attachEvent(obj, evt, func) {
	if(obj.addEventListener) {
		obj.addEventListener(evt, func, false);
	} else if(obj.attachEvent) {
		obj.attachEvent("on" + evt, func);
	}
}

function help(tag) {

}

function setHome(){try{window.external.AddFavorite(window.document.location,window.document.title)}catch(e){};}
function read(_sUid,_sDate){get('/sns/service.php?m=aListByDate&uid=' + _sUid + '&date=' + _sDate,'/xsl/feeds.xsl','feeds','output','box_2');}

function updateseccode(id) {
	type = seccodedata[2];
	var rand = Math.random();
	var targ = $('seccodeimage');
	if(type < 2) {
		targ.innerHTML = '<img id="seccode" onclick="updateseccode()" width="' + seccodedata[0] + '" height="' + seccodedata[1] + '" src="seccode.php?update=' + rand + '" class="absmiddle" alt="" />';
	} else {
		targ.innerHTML = '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="' + seccodedata[0] + '" height="' + seccodedata[1] + '" align="middle">'
			+ '<param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="seccode.php?update=' + rand + '" /><param name="quality" value="high" /><param name="wmode" value="transparent" /><param name="bgcolor" value="#ffffff" />'
			+ '<embed src="seccode.php?update=' + rand + '" quality="high" wmode="transparent" bgcolor="#ffffff" width="' + seccodedata[0] + '" height="' + seccodedata[1] + '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>';
	}
}

/*
全选所有的复选框
*/
function checkall(form, prefix, checkall) {
	var checkall = checkall ? checkall : 'chkall';
	for(var i = 0; i < form.elements.length; i++) {
		var e = form.elements[i];
		if(e.name != checkall && (!prefix || (prefix && e.name.match(prefix)))) {
			e.checked = form.elements[checkall].checked;
		}
	}
}

function tpl(tplid, tpldata) {
	var h = '';
	h = $(tplid).innerHTML;
	var r = new Array();
	var p = new Array();
	for(i in tpldata) {
		r[i] = '\%'+tpldata[i][0];
		p[i] = [tpldata[i][1]];
	}
	h = preg_replace(r, p, h);
	$(tplid).innerHTML = h;
}

/**
 * 自动隐藏的 alert 替代 menu 函数
 * @author xkxmud.li
 * @param String msg
 * @param String objid
 * @param Int Timeout ms
 */
function alertmenu(str, ctrlid, click) {
	obj = $(ctrlid + '_menu');
	if(empty(obj)) {
		obj = $c('div');
		obj.id = ctrlid + '_menu';
		$('supevbox').appendChild(obj);
	}
	obj.className = 'ajax_msg';
	obj.innerHTML = str;
	showMenu(ctrlid, true, 3);
}

/**
 * 代入分数返回得分字符串
 * @author xkxmud.li
 * @param int score
 */
function getgradestar(score) {
	score = Math.ceil(score);
	var scorestr = '';
	for(i = 1; i <= 5; i ++) {
		if(i > score) {
			scorestr = scorestr + '<img alt="score" src="' + jsenv['THEME_PATH'] + 'res/star0.gif">';
		} else {
			scorestr = scorestr + '<img alt="score" src="' + jsenv['THEME_PATH'] + 'res/star1.gif">';
		}
	}
	if(typeof(targetid) == 'undefined') {
 		dw(scorestr);
	} else {
		$(targetid).innerHTML = scorestr;
	}
}

/**
 * 对活动用户操作进行激活
 * @author xkxmud.li
 */
function accessingactive() {
	var time = new Date();
	aj_send(jsenv['SUPEV_ROOT'] + 'ajax.php?script=accessing&time=' + escape(time));
	setTimeout('accessingactive()', jsenv['accessing_time']);
}

function showsubmit(st) {
	if(st == false) {
		$('submitbtn').disabled = true;
		$('submitbtn').value = '请选择操作';
		$('submitbtn').className = 'button_disabled';
	} else {
		$('submitbtn').disabled = '';
		$('submitbtn').value = '提交';
		$('submitbtn').className = 'button';
	}
}

function submitcheck(obj) {
	if(is_confirm == true) {
		if(confirm('确认操作请选择 [ 是 ]。')) {
			return true;
		} else {
			return false;
		}
	}
}

function swapopside(item, depth, obj) {
	if(obj.value == '') {
		showsubmit(false);
	} else {
		showsubmit(true);
	}
	if(obj.value == 'del') {
		is_confirm = true;
	} else {
		is_confirm = false;
	}
	var i = depth;
	var str = '';
	while(!empty($('bselect_'+i))) {
		$('bselect_'+i).innerHTML = '';
		i++;
	}
	if(empty($(item))) {
		return;
	}
	var reg=new RegExp("name=__","gi"); //创建正则RegExp对象
	str = $(item).innerHTML.replace(reg, 'name=');
	var reg=new RegExp("name=\"__","gi"); //创建正则RegExp对象
	str = str.replace(reg, 'name="');
	$('bselect_'+depth).innerHTML = str;
}

/*
function auth() {
	member['mid'] = empty(member['mid']) ? (empty(getcookie('member[mid]')) ? 0 : parseInt(getcookie('member[mid]'))) : member['mid'];
	member['username'] = empty(member['username']) ? getcookie('member[username]') : member['username'];
	member['admgid'] = empty(member['admgid']) ? getcookie('member[admgid]') : member['admgid'];
	return (member['mid'] > 0 && member['username'] != '') ? true : 0;
}*/




function show_waiting(oshow, display, loading, w, h) {
	var _loading = empty(loading) ? 'Loading...' : loading;
	var _w = empty(w) ? 120 : w;
	var _h = empty(h) ? 20 : h;
	var owait = $(oshow.id + 'waiting');
	if(empty(owait)) {
		var objoffset = getoffset(oshow);
		var iDiv = document.createElement("div");
		iDiv.id= oshow.id + 'waiting';
		iDiv.className = "ajaxblock ajaxloading";
		iDiv.style.position = "absolute";
		iDiv.style.top=objoffset.top + 20 + "px";
		iDiv.style.left=objoffset.left + "px";
		iDiv.innerHTML = '<img src="'+jsenv['THEME_PATH']+'res/loading.gif"> ' + _loading;
		$('supevbox').appendChild(iDiv);
		owait = $(oshow.id + 'waiting');
	}

	var _display = empty(display) ? 'none' : 'block';
	hide(owait, _display);
}


function CopyText(id) {
	$(id).select();
	copy($(id).value);
	menu_msg(id, '复制成功');
}

function menu_msg(tag, msg) {
	div = $c('div');
	div.id = tag + '_btn_menu';
	div.style.display = 'none';
	div.className = 'ajaxsuccess ajaxblock';
	div.innerHTML = '<p>' + msg + '</p>';
	$('supevbox').appendChild(div);
	showMenu(tag + '_btn');
}

function copy(text2copy) {
	if (window.clipboardData) {
		window.clipboardData.setData("Text",text2copy);
	} else {
		var flashcopier = 'flashcopier';
		if(!$(flashcopier)) {
		var divholder = document.createElement('div');
		divholder.id = flashcopier;
		document.body.appendChild(divholder);
		}

		$(flashcopier).innerHTML = '';
		var divinfo = '<embed src="./lib/clipboard.swf" FlashVars="clipboard='+escape(text2copy)+'" width="0" height="0" type="application/x-shockwave-flash"></embed>';//这里是关键
		$(flashcopier).innerHTML = divinfo;

	}
}

function copyToClipboard(meintext) {
if (window.clipboardData) {
	alertmenu("ie");
	window.clipboardData.setData("Text", meintext);

} else if (window.netscape) {
	netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
	var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
	if (!clip) return;
	alertmenu("mozilla");
	var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
	if (!trans) return;
	trans.addDataFlavor('text/unicode');
	var str = new Object();
	var len = new Object();
	var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
	var copytext=meintext;
	str.data=copytext;
	trans.setTransferData("text/unicode",str,copytext.length*2);
	var clipid=Components.interfaces.nsIClipboard;
	if (!clip) return false;
	clip.setData(trans,null,clipid.kGlobalClipboard);
}
	alertmenu("Following info was copied to your clipboard:\n\n" + meintext);
	return false;
}

/**
 * 设置Tab
 * @param e 元素事件
 * @param tabs_id 属性页
 * @param cur_id 内容页
 */
function settab(e, cur, tabs_label) {



	ocur = $(cur);
	ocur_btn = $(cur+'_btn');

	eval('var tabs='+tabs_label);

	var l = tabs.length;

	for(i = 0;  i < l; i++) {
		$(tabs[i]+'_btn').className="sep";
		$(tabs[i]).style.display = 'none';
	}

	ocur.style.display = '';
	ocur_btn.className = 'purple';
	ocur_btn.blur();

	doane(e);

}

function bodyonload() {
	//loadSelect($('searchselect_footer'));
	//loadSelect($('searchselect_header'));

}

function setsmile(s) {
	$('comment_message').value += s;
}

function relatekw() {
	var message = $('descriptionid').value;
	message = message.substr(0, 500);
	message = message.replace(/&/ig, '', message);
	aj_load('./ajax.php?script=relatekw&subjectenc=' + $('subject').value + '&messageenc=' + message, 'tagselect');
}

var hiddenobj = new Array();
function pmwin(action, param) {
	var objs = $("video_player_div");
	if(action == 'open') {
		//for(i = 0;i < objs.length; i ++) {
			if(objs!=null && objs.style.visibility != 'hidden') {
				objs.setAttribute("oldvisibility", objs.style.visibility);
				objs.style.visibility = 'hidden';
			}
		//}
		var clientWidth = document.body.clientWidth;
		var clientHeight = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight;
		var scrollTop = document.body.scrollTop ? document.body.scrollTop : document.documentElement.scrollTop;
		var pmwidth = 800;
		var pmheight = clientHeight * 0.9;
		if(!$('pmlayer_bg')) {
			div = document.createElement('div');div.id = 'pmlayer_bg';
			div.style.position = 'absolute';
			div.style.left = div.style.top = '0px';
			div.style.width = '100%';
			div.style.height = (clientHeight > document.body.scrollHeight ? clientHeight : document.body.scrollHeight) + 'px';
			div.style.backgroundColor = '#000';
			div.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=80,finishOpacity=100,style=0)';
			div.style.opacity = 0.8;
			div.style.zIndex = '9998';
			$('supevbox').appendChild(div);
			div = document.createElement('div');div.id = 'pmlayer';
			div.style.width = pmwidth + 'px';
			div.style.height = pmheight + 'px';
			div.style.left = ((clientWidth - pmwidth) / 2) + 'px';
			div.style.position = 'absolute';
			div.style.zIndex = '9999';
			$('supevbox').appendChild(div);
			$('pmlayer').innerHTML = '<div style="width: 800px; background: #666666; margin: 5px auto; text-align: left;">' +
				'<div style="width: 800px; height: ' + pmheight + 'px; padding: 1px; background: #FFFFFF; border: 1px solid #7597B8; position: relative; left: -6px; top: -3px;">' +
				'<a href="###" onclick="pmwin(\'close\')"><img style="position: absolute;right: 20px;top: 15px" src="' + jsenv['THEME_PATH'] +'/res/close.gif" title="关闭" /></a>' +
				'<iframe id="pmframe" name="pmframe" style="width:' + pmwidth + 'px;height:100%" allowTransparency="true" frameborder="0"></iframe></div></div>';
		}
		$('pmlayer_bg').style.display = '';
		$('pmlayer').style.display = '';
		$('pmlayer').style.top = ((clientHeight - pmheight) / 2 + scrollTop) + 'px';
		if(!param) {
			pmframe.location = 'pm.php';
		} else {
			pmframe.location = 'pm.php?' + param;
		}
		document.body.style.overflow = "hidden";
		document.body.scroll = "no";
	} else if(action == 'close') {
		///for(i = 0;i < objs.length; i ++) {
			if(objs!=null && objs.attributes['oldvisibility']) {
				objs.style.visibility = objs.attributes['oldvisibility'].nodeValue;
				objs.removeAttribute('oldvisibility');
			}
		//}
		hiddenobj = new Array();
		$('pmlayer').style.display = 'none';
		$('pmlayer_bg').style.display = 'none';
		document.body.style.overflow = "auto";
		document.body.scroll = "auto";
	}
}

<!-- 选项卡 -->
function  secBoard(obj, listname, n) {
	var lia = document.getElementById(obj).getElementsByTagName("a");
	var lialen=lia.length
	for(i=0; i<lialen; i++){
		lia[i].className = "ocurmenu";
	}
	lia[n-1].className = "curmenu";

	for (var i = 1, j; j = document.getElementById(listname + "_"+i); i++){
			j.style.display = "none";
	}
	document.getElementById(listname + "_"+n).style.display = "block";
}

function isDigit(s) {
	var partn=/^[0-9]+$/;
	if(!partn.exec(s)) {
		return false;
	} else {
		return true;
	}
}

function swfGetById(swfId){
	if (navigator.appName.indexOf("Microsoft") > -1) {
		return window[swfId];
	} else {
		return document[swfId];
	}
}