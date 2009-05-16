var img_path = '../video/';

document.write('\
<style>\
#head_openv { background:url('+ img_path +'images/head_bg.jpg) repeat-x left top; height:82px; padding:0 18px 0 15px;}\
#head_openv .logo { float:left; margin-top:20px;}\
#head_openv .search { float:right; margin-top:5px;}\
#head_openv .search .left { background:url('+ img_path +'images/head_s_left1.gif) no-repeat left top; height:70px; float:left; width:9px;}\
#head_openv .search .mid { background:url('+ img_path +'images/head_s_mid.gif) repeat-x left top; height:57px; float:left; width:391px;*width:391px;_width:384px; padding:13px 0 0 14px;*padding:13px 0 0 14px;_padding:13px 0 0 7px; text-align:left;}\
#head_openv .search .mid .input1 { marign-bottom:7px; margin-right:4px;border:1px solid #787878;width:286px; height:19px;padding-top:5px;}\
#head_openv .search .mid .clear {clear:both;}\
#head_openv .search .mid .xz { margin-top:5px;}\
#head_openv .search .mid .xz .c_grey { color:#DCDCDC;text-decoration:none;}\
#head_openv .search .right { background:url('+ img_path +'images/head_s_right.gif) no-repeat left top; height:70px; float:left; width:8px;}\
</style>\
<div id="head_openv">\
  <div class="logo"><img src="'+ img_path +'images/logo.gif" width="134" height="43" /></div>\
  <div class="search">\
   <div class="left"></div>\
   <div class="mid">\
    <form id="openv_form1" name="openv_form1" method="get" action="http://www.openv.com/ls.php" target="_blank">\
    <div><label><input name="q" type="text" class="input1" /></label><input type="image" src="'+ img_path +'images/anniu_ss.gif" width="73" height="28" align="absbottom" /></div>\
  	<div class="clear"></div>\
		<div class="xz">\
	  	<input type="radio" name="t" value="0" checked /><span class="c_grey">全部视频</span>\
	  	<input type="radio" name="t" value="1" /><span class="c_grey">电视节目</span>\
	  	<input type="radio" name="t" value="2" /><span class="c_grey">网络视频</span></div>\
	  </div>\
	  </form>\
   <div class="right"></div>\
  </div>\
 </div>\
');