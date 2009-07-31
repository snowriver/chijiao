var shield = document.createElement("DIV"); 
var alertFram = document.createElement("DIV"); 
function openDIV(title,url,width,height) 
{ 
widthx= width -5;
shield.id = "shield"; 
shield.style.position = "absolute"; 
shield.style.left = "0px"; 
shield.style.top = "0px"; 
shield.style.width = "100%"; 
shield.style.height = "100%";
shield.style.height = document.body.scrollHeight+"px"; 
shield.style.background = "#000"; 
shield.style.textAlign = "center"; 
shield.style.zIndex = "10000"; 
shield.style.filter = "alpha(opacity=0)"; 

alertFram.id="alertFram"; 
alertFram.style.position = "absolute"; 
//负边界居中法,相对于shield层的顶部时 

alertFram.style.left = "25%"; 
alertFram.style.top = "20%"; 
//alertFram.style.marginLeft = "-125px"; 
//alertFram.style.marginTop = "-75px"; 

//负边界居中法,相对于shield层的底部时 
alertFram.style.right = "50%"; 
alertFram.style.bottom = "50%"; 
alertFram.style.marginRight = "0px"; 
alertFram.style.marginBottom = "0px"; 

alertFram.style.width = width+"px"; 
alertFram.style.height = "150px"; 
alertFram.style.background = "#000"; 
alertFram.style.textAlign = "center"; 
alertFram.style.lineHeight = "150px"; 
alertFram.style.zIndex = "10002"; 
strHtml = "<div style=\"list-style:none;margin:0px;padding:0px;border-width:3px;border-color:#777777;border-style:solid;width:" + width + "\">\n"; 
strHtml += "<div onmousedown=\"oMove(parentNode.parentNode);\" style=\"cursor:move;background:url(../images/openbar.gif) repeat-x ;text-align:left;padding-left:5px;font-size:13px;font-weight:bold;color: #F0F0F0;height:27px;line-height:27px;\">";
strHtml += "<div ><div style=\"float:left;width:50%;color:#cccccc\">[" + title +"]</div><div style=\"float:right;width:10%\"><a href='#' onClick=\"remove()\"><img src='../images/off.gif' border='0'/></a></div></div></div>\n"; 
strHtml += "<iframe id=openIframe MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 border='0' VSPACE=0 FRAMEBORDER=0 SCROLLING=NO width=" + widthx +" height="+height+" src=\"" + url + "\"></iframe>";
strHtml += "</div>\n"; 
alertFram.innerHTML = strHtml; 
document.body.appendChild(alertFram); 
document.body.appendChild(shield); 
document.frames('openIframe').location.reload();

var c = 0; 
this.doAlpha = function(){ 
if (c++ > 50){clearInterval(ad);return 0;} 
shield.style.filter = "alpha(opacity="+c+");"; 
} 

var ad = setInterval("doAlpha()",10); 
alertFram.focus(); 
document.body.onselectstart = function(){return false;}; 
} 
function remove(){ 
   alertFram.innerHTML=""; 
    shield.style.filter = ""; 
    shield.id = ""; 
    shield.style.position = ""; 
    shield.style.left = ""; 
    shield.style.top = ""; 
    shield.style.width = ""; 
    shield.style.height =""; 
    shield.style.background = ""; 
    shield.style.textAlign = ""; 
    shield.style.zIndex = ""; 
    shield.style.filter = ""; 
    alertFram.id=""; 
    alertFram.style.position = ""; 
    alertFram.style.left = ""; 
    alertFram.style.top = ""; 
    alertFram.style.marginLeft = ""; 
    alertFram.style.marginTop = ""; 
    alertFram.style.width = ""; 
    alertFram.style.height = ""; 
    alertFram.style.background = ""; 
    alertFram.style.textAlign = ""; 
    alertFram.style.lineHeight = ""; 
    alertFram.style.zIndex = ""; 
} 
function oMove(obj){ 
  var otop,oleft; 
  otop = event.y - obj.offsetTop; 
  oleft = event.x - obj.offsetLeft; 
  obj.setCapture(); 
  obj.onmousemove = function() 
  { 
    obj.style.left = event.x - oleft; 
    obj.style.top = event.y - otop; 
  } 
  obj.onmouseup = function() 
  { 
    obj.onmousemove = null; 
    obj.style.filter = null; 
    obj.releaseCapture(); 
  } 
} 

window.closeDiv = function(){ 
   alertFram.innerHTML=""; 
    shield.style.filter = ""; 
    shield.id = ""; 
    shield.style.position = ""; 
    shield.style.left = ""; 
    shield.style.top = ""; 
    shield.style.width = ""; 
    shield.style.height =""; 
    shield.style.background = ""; 
    shield.style.textAlign = ""; 
    shield.style.zIndex = ""; 
    shield.style.filter = ""; 
    alertFram.id=""; 
    alertFram.style.position = ""; 
    alertFram.style.left = ""; 
    alertFram.style.top = ""; 
    alertFram.style.marginLeft = ""; 
    alertFram.style.marginTop = ""; 
    alertFram.style.width = ""; 
    alertFram.style.height = ""; 
    alertFram.style.background = ""; 
    alertFram.style.textAlign = ""; 
    alertFram.style.lineHeight = ""; 
    alertFram.style.zIndex = ""; 
	//alert(self.parent.location);
	self.location=self.parent.location;
}


window.closeDivn = function(){ 
   alertFram.innerHTML=""; 
    shield.style.filter = ""; 
    shield.id = ""; 
    shield.style.position = ""; 
    shield.style.left = ""; 
    shield.style.top = ""; 
    shield.style.width = ""; 
    shield.style.height =""; 
    shield.style.background = ""; 
    shield.style.textAlign = ""; 
    shield.style.zIndex = ""; 
    shield.style.filter = ""; 
    alertFram.id=""; 
    alertFram.style.position = ""; 
    alertFram.style.left = ""; 
    alertFram.style.top = ""; 
    alertFram.style.marginLeft = ""; 
    alertFram.style.marginTop = ""; 
    alertFram.style.width = ""; 
    alertFram.style.height = ""; 
    alertFram.style.background = ""; 
    alertFram.style.textAlign = ""; 
    alertFram.style.lineHeight = ""; 
    alertFram.style.zIndex = ""; 
	//alert(self.parent.location);
	//self.location=self.parent.location;
}
