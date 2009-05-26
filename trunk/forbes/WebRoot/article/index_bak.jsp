<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jstl/fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>赤脚网 - 创业大学 - 全力打造创业者学习和交流平台</TITLE>
	<META name="Keywords" content="${WEB_KEYWORD }" />
	<META name="Description" content="${WEB_DESCRIPTION }" />
	
	<LINK rel=stylesheet type=text/css href="css/article.css">
	<LINK rel=stylesheet type=text/css href="base.css">
	<LINK rel=stylesheet type=text/css href="../css/supev.css">
	
	<SCRIPT src="../js/jquery/jquery-1.2.6.min.js"></SCRIPT>
	<SCRIPT src="../js/openDiv.js" charset="gb2312"></SCRIPT>	
	
	<SCRIPT language="javascript" type="text/javascript">
  
		function listArticles(type, divid){
			$.ajax({
				url: '../article/ArticleSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=type&typeid=" + type,
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		
		function listNews(divid){
			$.ajax({
				url: '../article/NewsSearch.do',
				type: 'post',
				dataType: 'html',
				data:"act=top",
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		function listNewRegister(divid){
			
			$.ajax({
				url: '../article/NewRegister.do',
				type: 'post',
				dataType: 'html',
				data:"orderby=regdate DESC",
				timeout: 10000,
				error: function(){
					//alert('System error');
					$("#" + divid +"").html("导入失败，请刷新");
				},
				success: function(rsHtml){
					//alert("#" + divid);
					$("#" + divid +"").html(rsHtml);
				}
			});
		}
		
		$(window).bind("load",function(){
				//showUserInfo();
				listNews("newslist");
				
				listArticles(5, "div_5");				
				listArticles(26, "div_26");
				listArticles(42, "div_42");
				listArticles(17, "div_17");				
				listArticles(10, "div_10");
				listArticles(49, "div_49");
				listArticles(35, "div_35");
				listArticles(16, "div_16");
				listNewRegister("new_register");
				//listComps();
        	}
		);
	</SCRIPT>









<SCRIPT language=javascript type=text/javascript>
<!--
if(typeof com=="undefined"){var com=new Object();}
if(typeof com.deconcept=="undefined"){com.deconcept=new Object();}
if(typeof com.deconcept.util=="undefined"){com.deconcept.util=new Object();}
if(typeof com.deconcept.FlashObjectUtil=="undefined"){com.deconcept.FlashObjectUtil=new Object();}
com.deconcept.FlashObject=function(_1,id,w,h,_5,c,_7,_8,_9,_a,_b){
if(!document.createElement||!document.getElementById){return;}
this.DETECT_KEY=_b?_b:"detectflash";
this.skipDetect=com.deconcept.util.getRequestParameter(this.DETECT_KEY);
this.params=new Object();
this.variables=new Object();
this.attributes=new Array();
this.useExpressInstall=_7;
if(_1){this.setAttribute("swf",_1);}
if(id){this.setAttribute("id",id);}
if(w){this.setAttribute("width",w);}
if(h){this.setAttribute("height",h);}
if(_5){this.setAttribute("version",new com.deconcept.PlayerVersion(_5.toString().split(".")));}
this.installedVer=com.deconcept.FlashObjectUtil.getPlayerVersion(this.getAttribute("version"),_7);
if(c){this.addParam("bgcolor",c);}
var q=_8?_8:"high";
this.addParam("quality",q);
var _d=(_9)?_9:window.location;
this.setAttribute("xiRedirectUrl",_d);
this.setAttribute("redirectUrl","");
if(_a){this.setAttribute("redirectUrl",_a);}
};
com.deconcept.FlashObject.prototype={setAttribute:function(_e,_f){
this.attributes[_e]=_f;
},getAttribute:function(_10){
return this.attributes[_10];
},addParam:function(_11,_12){
this.params[_11]=_12;
},getParams:function(){
return this.params;
},addVariable:function(_13,_14){
this.variables[_13]=_14;
},getVariable:function(_15){
return this.variables[_15];
},getVariables:function(){
return this.variables;
},createParamTag:function(n,v){
var p=document.createElement("param");
p.setAttribute("name",n);
p.setAttribute("value",v);
return p;
},getVariablePairs:function(){
var _19=new Array();
var key;
var _1b=this.getVariables();
for(key in _1b){_19.push(key+"="+_1b[key]);}
return _19;
},getFlashHTML:function(){
var _1c="";
if(navigator.plugins&&navigator.mimeTypes&&navigator.mimeTypes.length){
if(this.getAttribute("doExpressInstall")){
this.addVariable("MMplayerType","PlugIn");
}
_1c="<embed type=\"application/x-shockwave-flash\" src=\""+this.getAttribute("swf")+"\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\"";
_1c+=" id=\""+this.getAttribute("id")+"\" name=\""+this.getAttribute("id")+"\" ";
var _1d=this.getParams();
for(var key in _1d){_1c+=[key]+"=\""+_1d[key]+"\" ";}
var _1f=this.getVariablePairs().join("&");
if(_1f.length>0){_1c+="flashvars=\""+_1f+"\"";}
_1c+="/>";
}else{
if(this.getAttribute("doExpressInstall")){this.addVariable("MMplayerType","ActiveX");}
_1c="<object id=\""+this.getAttribute("id")+"\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\">";
_1c+="<param name=\"movie\" value=\""+this.getAttribute("swf")+"\" />";
var _20=this.getParams();
for(var key in _20){_1c+="<param name=\""+key+"\" value=\""+_20[key]+"\" />";}
var _22=this.getVariablePairs().join("&");
if(_22.length>0){_1c+="<param name=\"flashvars\" value=\""+_22+"\" />";
}_1c+="</object>";}
return _1c;
},write:function(_23){
if(this.useExpressInstall){
var _24=new com.deconcept.PlayerVersion([6,0,65]);
if(this.installedVer.versionIsValid(_24)&&!this.installedVer.versionIsValid(this.getAttribute("version"))){
this.setAttribute("doExpressInstall",true);
this.addVariable("MMredirectURL",escape(this.getAttribute("xiRedirectUrl")));
document.title=document.title.slice(0,47)+" - Flash Player Installation";
this.addVariable("MMdoctitle",document.title);}
}else{this.setAttribute("doExpressInstall",false);}
if(this.skipDetect||this.getAttribute("doExpressInstall")||this.installedVer.versionIsValid(this.getAttribute("version"))){
var n=(typeof _23=="string")?document.getElementById(_23):_23;
n.innerHTML=this.getFlashHTML();
}else{if(this.getAttribute("redirectUrl")!=""){document.location.replace(this.getAttribute("redirectUrl"));}}}};
com.deconcept.FlashObjectUtil.getPlayerVersion=function(_26,_27){
var _28=new com.deconcept.PlayerVersion(0,0,0);
if(navigator.plugins&&navigator.mimeTypes.length){
var x=navigator.plugins["Shockwave Flash"];
if(x&&x.description){_28=new com.deconcept.PlayerVersion(x.description.replace(/([a-z]|[A-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split("."));}
}else{
try{var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
for(var i=3;axo!=null;i++){
axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+i);
_28=new com.deconcept.PlayerVersion([i,0,0]);}}
catch(e){}
if(_26&&_28.major>_26.major){return _28;}
if(!_26||((_26.minor!=0||_26.rev!=0)&&_28.major==_26.major)||_28.major!=6||_27){
try{
_28=new com.deconcept.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(","));
}catch(e){}}}
return _28;
};
com.deconcept.PlayerVersion=function(_2c){
this.major=parseInt(_2c[0])||0;
this.minor=parseInt(_2c[1])||0;
this.rev=parseInt(_2c[2])||0;
};
com.deconcept.PlayerVersion.prototype.versionIsValid=function(fv){
if(this.major<fv.major){return false;}
if(this.major>fv.major){return true;}
if(this.minor<fv.minor){return false;}
if(this.minor>fv.minor){return true;}
if(this.rev<fv.rev){return false;}
return true;
};
com.deconcept.util={getRequestParameter:function(_2e){
var q=document.location.search||document.location.href.hash;
if(q){var _30=q.indexOf(_2e+"=");
var _31=(q.indexOf("&",_30)>-1)?q.indexOf("&",_30):q.length;
if(q.length>1&&_30>-1){
return q.substring(q.indexOf("=",_30)+1,_31);}}return "";
},removeChildren:function(n){
while(n.hasChildNodes()){
n.removeChild(n.firstChild);}}};
if(Array.prototype.push==null){
Array.prototype.push=function(_33){
this[this.length]=_33;
return this.length;};}
var getQueryParamValue=com.deconcept.util.getRequestParameter;
var FlashObject=com.deconcept.FlashObject;

-->
</SCRIPT>
<META name=GENERATOR content="MSHTML 8.00.6001.18241"></HEAD>
<BODY>

<SCRIPT>
	var jsenv = new Array();
	jsenv['THEME_PATH'] = './theme/zh-cn/';
	jsenv['TPL_RES_PATH'] = 'tpl/zh-cn/res/';
	jsenv['TPL_IMG_PATH'] = 'tpl/zh-cn/res/img';
	jsenv['cookie_pre'] = 'WF9_';
	jsenv['SUPEV_ROOT'] = 'http://localhost/SupeV/upload/';
	jsenv['accessing_time'] = '450000';
	jsenv['charset'] = 'utf-8';
</SCRIPT>
	
<c:set var="index" value="article"></c:set>

<!--手机频道通用头部开始-->

<!--手机频道通用头部结束-->
<!--header开始-->
<%@ include file="include/header.jsp"%>

<!--header结束-->
<!--主结构开始-->

<DIV id=wrapper>
	<DIV id=container>
		<DIV id=main>
			<!--flash轮播开始-->
			<DIV id=flashcontent>
				
				
			</DIV>
			<SCRIPT language=javascript type=text/javascript src="Symbian%20S60中文网%20-%20SJ_91_COM_files/s60lunbo.js"></SCRIPT>
			
			<!--flash轮播结束-->
			
			<!--最新资讯开始-->
			<DIV id=news>
				<H2>
					<SPAN class=left>最新资讯</SPAN>
					<A class="more right" target=_blank href="NewsSearch.do?act=list&orderby=pubdate desc"><font color="black">+更多资讯</font></A>
				</H2>
				
				<DIV id="newslist">
					<img src="images/loading.gif" />
				</DIV>
			</DIV>
			<!--最新资讯结束-->
			
			
			<DIV class=clear></DIV>
			
			
			<!--软件开始-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">企业管理</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=5&keyword=&orderby=pubdate desc">+更多</A>
					</H2>
					
					<DIV class=clear></DIV>

					<DIV class=con>
						<DIV id="div_5"> <img src="images/loading.gif" /> </DIV>

						<DIV class=clear></DIV>
					</DIV>
				</DIV>
			</DIV>
			


			<DIV class="pingce swpatch">
				<DIV id=gametab_1>
					<H2>
						<SPAN class="left">创业投资</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=26&keyword=&orderby=pubdate desc">+更多</A>
					</H2>

					<DIV class=con>

						<DIV id="div_26"> <img src="images/loading.gif" /> </DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--软件结束-->
		
		<DIV class=clear></DIV>
		
		
		<!--教程评测开始-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">成功激励</SPAN>
			
				
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=42&keyword=&orderby=pubdate desc">+更多</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_42"> <img src="images/loading.gif" /> </DIV>
					
				</DIV></DIV>
				

</DIV>

<DIV class="pingce swpatch">
<H2>
<SPAN class="left">理财规划</SPAN>
<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=17&keyword=&orderby=pubdate desc">+更多</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_17"> <img src="images/loading.gif" /> </DIV>
	
</DIV></DIV>
</DIV>
<!--教程评测结束-->


<!--教程评测开始-->
		<DIV class="jiaocheng swpatch">
			<H2>
				<SPAN class="left">财富人生</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=10&keyword=&orderby=pubdate desc">+更多</A></H2>
			<DIV>
				
				<DIV class=con>
					<DIV id="div_10"> <img src="images/loading.gif" /> </DIV>
					
				</DIV></DIV>
				

</DIV>

<!--教程评测结束-->


<!--教程评测开始-->
<DIV class="pingce swpatch">
<H2>

<SPAN class="left">能力提升</SPAN>
				<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=49&keyword=&orderby=pubdate desc">+更多</A></H2>
<DIV id=pctab_1>



<DIV class=con>
	<DIV id="div_49"> <img src="images/loading.gif" /> </DIV>
	
</DIV></DIV>
</DIV>
<!--教程评测开始-->


<DIV class=clear></DIV>
			
			
			<!--软件开始-->
			<DIV class="jiaocheng swpatch">
				<DIV id=softtab_1>
					<H2>
						<SPAN class="left">职场晋级</SPAN> <A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=35&keyword=&orderby=pubdate desc">+更多</A>
					</H2>
					
					<DIV class=clear></DIV>

					<DIV class=con>
						<DIV id="div_35"> <img src="images/loading.gif" /> </DIV>

						<DIV class=clear></DIV>
					</DIV>
				</DIV>
			</DIV>
			


			<DIV class="pingce swpatch">
				<DIV id=gametab_1>
					<H2>
						<SPAN class="left">健康养生</SPAN>						
						<A class="more right" target=_blank href="ArticleSearch.do?act=list&typeid=16&keyword=&orderby=pubdate desc">+更多</A>
					</H2>

					<DIV class=con>

						<DIV id="div_16"> <img src="images/loading.gif" /> </DIV>


						<DIV class=clear></DIV>
				</DIV>
			</DIV>
			
		</DIV>
		<!--软件结束-->
		
		<DIV class=clear></DIV>
		
		

<DIV class=clear></DIV><!--主题开始-->


<DIV class=theme>
<H2><SPAN class=left>最新注册</SPAN><A class="more right" target=_blank href="http://localhost/uc/home/network.php?ac=space">+更多</A></H2>
<DIV class=con>

	<DIV id="new_register"> <img src="images/loading.gif" /> </DIV>
	
<DIV class=clear></DIV>
<DIV class=wallpaper_down>



</DIV></DIV></DIV><!--主题结束--></DIV>

<!--右边栏开始-->

<DIV id=sidebar>
	<%@ include file="include/siderbar.jsp"%>
	</DIV>
<!--右边栏结束-->
<DIV class=clear></DIV></DIV></DIV>

<!--主结构结束-->
<!--footer开始-->
<!--footer开始-->
<div id="footer">
        <script language="javascript" type="text/javascript" src="js/foot.js" charset="gb2312"></script>
    </div>
<!--footer结束-->
<!--footer结束-->
</BODY></HTML>
