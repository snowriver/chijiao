

function $Nav(){
	if(window.navigator.userAgent.indexOf("MSIE")>=1) return 'IE';
  else if(window.navigator.userAgent.indexOf("Firefox")>=1) return 'FF';
  else return "OT";
}

function $Obj(objname){
	return document.getElementById(objname);
}

function ShowColor(){
	var fcolor=showModalDialog("img/color.htm?ok",false,"dialogWidth:107px;dialogHeight:137px;status:0;dialogTop:"+(window.event.clientY+120)+";dialogLeft:"+(window.event.clientX));
	if(fcolor!=null && fcolor!="undefined") document.form1.color.value = fcolor;
}

function ShowHide(objname){
    var obj = $Obj(objname);
    if(obj.style.display == "block" || obj.style.display == ""){  obj.style.display = "none"; }
    else{  obj.style.display = "block"; }
}

function ShowHide2(objname){
    var obj = $Obj(objname);
    if(obj.style.display != 'block'){ obj.style.display = 'block' }
    else{  obj.style.display = 'none'; }
}

function ShowObj(objname){
   var obj = $Obj(objname);
   obj.style.display = "block";
}

function HideObj(objname){
   var obj = $Obj(objname);
   obj.style.display = "none";
}

function ShowItem1(){
  ShowObj('head1'); ShowObj('needset'); HideObj('head2'); HideObj('adset');
}

function ShowItem2(){
  ShowObj('head2'); ShowObj('adset'); HideObj('head1'); HideObj('needset');
}

function SeePic(img,f){
   if ( f.value != "" ) { img.src = f.value; }
}

function SelectArcListA(){
   var posLeft = 10;
   var posTop = 10;
   window.open("AdminUpdateArticle.do?act=select", "selArcList", "scrollbars=yes,resizable=yes,statebar=no,width=700,height=500,left="+posLeft+", top="+posTop);
}

function SelectNewsListA(){
   var posLeft = 10;
   var posTop = 10;
   window.open("AdminManageNews.do?act=select", "selArcList", "scrollbars=yes,resizable=yes,statebar=no,width=700,height=500,left="+posLeft+", top="+posTop);
}

function SelectVideoListA(){
   var posLeft = 10;
   var posTop = 10;
   window.open("AdminUpdateVideo.do?act=select", "selArcList", "scrollbars=yes,resizable=yes,statebar=no,width=700,height=500,left="+posLeft+", top="+posTop);
}

function SelectArcListB(fname,addvar){
   var posLeft = 10;
   var posTop = 10;
   window.open("content_select_list.php?f="+fname+addvar, "selArcList", "scrollbars=yes,resizable=yes,statebar=no,width=700,height=500,left="+posLeft+", top="+posTop);
}

function SelectFlash(){
   if($Nav()=='IE'){ var posLeft = window.event.clientX-300; var posTop = window.event.clientY; }
   else{ var posLeft = 100; var posTop = 100; }
   window.open("../include/dialog/select_media.php?f=form1.flashurl", "popUpFlashWin", "scrollbars=yes,resizable=yes,statebar=no,width=500,height=350,left="+posLeft+", top="+posTop);
}

function SelectMedia(fname){
   if($Nav()=='IE'){ var posLeft = window.event.clientX-200; var posTop = window.event.clientY; }
   else{ var posLeft = 100;var posTop = 100; }
   window.open("../include/dialog/select_media.php?f="+fname, "popUpFlashWin", "scrollbars=yes,resizable=yes,statebar=no,width=500,height=350,left="+posLeft+", top="+posTop);
}

function SelectSoft(fname){
   if($Nav()=='IE'){ var posLeft = window.event.clientX-200; var posTop = window.event.clientY-50; }
   else{ var posLeft = 100; var posTop = 100; }
   window.open("../include/dialog/select_soft.php?f="+fname, "popUpImagesWin", "scrollbars=yes,resizable=yes,statebar=no,width=600,height=400,left="+posLeft+", top="+posTop);
}

function SelectImage(fname,stype){
   if($Nav()=='IE'){ var posLeft = window.event.clientX-100; var posTop = window.event.clientY; }
   else{ var posLeft = 100; var posTop = 100; }
   if(!fname) fname = 'form1.picname';
   if(!stype) stype = '';
   window.open("../include/dialog/select_images.jsp?f="+fname+"&imgstick="+stype, "popUpImagesWin", "scrollbars=yes,resizable=yes,statebar=no,width=600,height=400,left="+posLeft+", top="+posTop);
}

function SelectArticleType(typeid,selbtn){
	//alert("aaa");
   if($Nav()=='IE'){ var posLeft = window.event.clientX-100; var posTop = window.event.clientY; }
   else{ var posLeft = 100; var posTop = 100; }
   window.open("../SelectArticleType.do?act=select&typeid="+typeid+"&selbtn="+selbtn, "popUpSelCWin", "scrollbars=yes,resizable=yes,statebar=no,width=450,height=300,left="+posLeft+", top="+posTop);
}
function SelectVideoType(typeid,selbtn){
	//alert("aaa");
   if($Nav()=='IE'){ var posLeft = window.event.clientX-100; var posTop = window.event.clientY; }
   else{ var posLeft = 100; var posTop = 100; }
   window.open("../SelectVideoType.do?act=select&typeid="+typeid+"&selbtn="+selbtn, "popUpSelCWin", "scrollbars=yes,resizable=yes,statebar=no,width=450,height=300,left="+posLeft+", top="+posTop);
}

function SelectImageN(fname,stype,vname){
   if($Nav()=='IE'){ var posLeft = window.event.clientX-100; var posTop = window.event.clientY; }
   else{ var posLeft = 100; var posTop = 100; }
   if(!fname) fname = 'form1.picname';
   if(!stype) stype = '';
   window.open("../include/dialog/select_images.php?f="+fname+"&imgstick="+stype+"&v="+vname, "popUpImagesWin", "scrollbars=yes,resizable=yes,statebar=no,width=600,height=400,left="+posLeft+", top="+posTop);
}

function SelectKeywords(f){
	if($Nav()=='IE'){ var posLeft = window.event.clientX-350; var posTop = window.event.clientY-200; }
  else{ var posLeft = 100; var posTop = 100; }
  window.open("AdminManageArticleKeyword.do?act=select&f="+f, "popUpkwWin", "scrollbars=yes,resizable=yes,statebar=no,width=600,height=450,left="+posLeft+", top="+posTop);
}

function InitPage(){
   var selsource = $Obj('selsource');
   var selwriter = $Obj('selwriter');
   var titlechange = $Obj('title');
   if(selsource){ selsource.onmousedown=function(e){ SelectSource(e); } }
   if(selwriter){ selwriter.onmousedown=function(e){ SelectWriter(e); } }
   if(titlechange){ titlechange.onchange=function(e){ TestHasTitle(e); } }
}

function OpenMyWin(surl){
   window.open(surl, "popUpMyWin", "scrollbars=yes,resizable=yes,statebar=no,width=500,height=350,left=200, top=100");
}

function PutSource(str){
	var osource = $Obj('source');
	if(osource) osource.value = str;
}

function PutWriter(str){
	var owriter = $Obj('writer');
	if(owriter) owriter.value = str;
}

function SelectSource(e){
	LoadNewDiv(e,'article_select_sw.jsp?t=source&k=8','_mysource',"dlg");
}

function TestHasTitle(e){
	LoadNewDiv2(e,'article_test_title.php?t='+$Obj('title').value,'_mytitle',"dlgTesttitle");
}

function SelectWriter(e){
	LoadNewDiv(e,'article_select_sw.php?t=writer&k=8','_mywriter',"dlg");
}

function LoadNewDiv(e,surl,oname,dlgcls){
	if($Nav()=='IE'){ var posLeft = window.event.clientX-20; var posTop = window.event.clientY-20; }
  else{ var posLeft = e.pageX-20; var posTop = e.pageY-20; }
  var newobj = $Obj(oname);
  if(!newobj){
  	newobj = document.createElement("DIV");
    newobj.id = oname;
    newobj.style.position='absolute';
    newobj.className = dlgcls;
    newobj.style.top = posTop;
    newobj.style.left = posLeft;
    document.body.appendChild(newobj);
  }
  else{
  	newobj.style.display = "block";
  }
  if(newobj.innerHTML.length<10){
     var myajax = new DedeAjax(newobj);
     myajax.SendGet2(surl);
     DedeXHTTP = null;
  }
}

function LoadNewDiv2(e,surl,oname,dlgcls){
	if($Nav()=='IE'){ var posLeft = window.event.clientX-20; var posTop = window.event.clientY-20; }
  else{ var posLeft = e.pageX-20; var posTop = e.pageY-20; }
  var newobj = $Obj(oname);
  if(!newobj){
  	newobj = document.createElement("DIV");
    newobj.id = oname;
    newobj.style.position='absolute';
    newobj.className = dlgcls;
    newobj.style.top = posTop;
    newobj.style.left = posLeft;
    newobj.style.display = 'none';
    document.body.appendChild(newobj);
  }
  newobj.innerHTML = '';
  var myajax = new DedeAjax(newobj);
  myajax.SendGet2(surl);
  if(newobj.innerHTML=='') newobj.style.display = "none";
  else newobj.style.display = "block";
  DedeXHTTP = null;
}

function ShowUrlTr(){
	var jumpTest = $Obj('isjump');
	var jtr = $Obj('redirecturltr');
	if(jumpTest.checked) jtr.style.display = "block";
	else jtr.style.display = "none";
}

function ShowPicTr(){
	var picTest = $Obj('ispic');
	var jtr = $Obj('pictable');
	if(picTest.checked) jtr.style.display = "block";
	else jtr.style.display = "none";
}

function ShowUrlTrEdit(){
	ShowUrlTr();
	var jumpTest = $Obj('isjump');
	var rurl = $Obj('redirecturl');
	if(!jumpTest.checked) rurl.value="";
}

function CkRemote(ckname,fname){
	var ckBox = $Obj(ckname);
	var fileBox = $Obj(fname);
	if(ckBox.checked){
		fileBox.style.display = 'none';
  }else{
		fileBox.style.display = 'block';
	}
}

function selNext(oj,v)
{
	newonj = oj.options;
	while(newonj.length>0)
	{ newonj.remove(0); }
	clear(oj);
	if(v!=0)
	{
		aOption = document.createElement("OPTION");
 		aOption.text="��ѡ��";
		aOption.value="0";
		oj.options.add(aOption);
		aOption = document.createElement("OPTION");
 		aOption.text="-����-";
		aOption.value="0";
		oj.options.add(aOption);
	}
	else
	{
		aOption = document.createElement("OPTION");
 		aOption.text="-����-";
		aOption.value="0";
		oj.options.add(aOption);
		return;
	}
	cityarr = barr=eval("B"+v);
	for(i=0;i<cityarr.length;i++)
	{
		tlines = cityarr[i].split("~");
		aOption = document.createElement("OPTION");
 		aOption.text=tlines[1];
		aOption.value=tlines[0];
		oj.options.add(aOption);
	}
}
function selNextDf(oj,v,fk,fv)
{
	newonj = oj.options;
	while(newonj.length>0)
	{ newonj.remove(0); }
	clear(oj);
	if(v==0)
	{
		aOption = document.createElement("OPTION");
 		aOption.text="��ѡ��";
		aOption.value="0";
		oj.options.add(aOption);
		return;
	}
	else
	{
		if(fk==0) fv = '����';
		aOption = document.createElement("OPTION");
 		aOption.text = fv;
		aOption.value = fk;
		oj.options.add(aOption);
	}
	cityarr = barr=eval("B"+v);
	for(i=0;i<cityarr.length;i++)
	{
		tlines = cityarr[i].split("~");
		aOption = document.createElement("OPTION");
 		aOption.text=tlines[1];
		aOption.value=tlines[0];
		oj.options.add(aOption);
	}
}
//����ʡ��ѡ��
function selTop(oj)
{
	clear(oj);
	for(i=0;i<Ap.length;i++)
	{
		itvalue = Ap[i];
		tlines = itvalue.split("~");
		aOption = document.createElement("OPTION");
 		aOption.text=tlines[1];
		aOption.value=tlines[0];
		oj.options.add(aOption);
	}
}
//����ɶ���
function clear(o)
{
	l=o.length;
	for (i = 0; i< l; i++){
		o.options[1]=null;
	}
}

//ͼ������ʾ������zip�ļ�ѡ��
function ShowZipField(formitem,zipid,upid)
{
	if(formitem.checked){
		$Obj(zipid).style.display = 'block';
		$Obj(upid).style.display = 'none';
	}else
	{
		$Obj(zipid).style.display = 'none';
		$Obj(upid).style.display = 'block';
	}
}

//ͼ������ʾ������Html�༭��
function ShowHtmlField(formitem,htmlid,upid)
{
	if($Nav()!="IE"){
		alert("�÷����������ڷ�IE�������");
		return ;
	}
	if(formitem.checked){
		$Obj(htmlid).style.display = 'block';
		$Obj(upid).style.display = 'none';
	}else
	{
		$Obj(htmlid).style.display = 'none';
		$Obj(upid).style.display = 'block';
	}
}

//����Ƿ��з�ָ�����ַ�
function HasNotVd(str)
{
	if(str=='') return false;
	newstr = str.replace(/[^0-9,]/g,'');
	if(newstr!=str) return true;
	else return false;
}

//�ύ�����
//---------------------
function CS_ArchivesAdd()
{
  var tf = document.form1;

  if(tf.title.value==""){
	  alert("�ĵ����ⲻ��Ϊ�գ�");
	  return false;
  }
  if(tf.likeid.value!="" && HasNotVd(tf.likeid.value)){
	   alert("����ĵ�������д��ȷ��ID����ID1,ID2...");
	   return false;
  }
  if(tf.maintypeid.value==0){
	   alert("��ѡ�񵵰��������");
	   return false;
  }
  return true;
}

function CS_ArchivesEdit()
{
  var tf = document.form1;
  if(tf.title.value==""){
	  alert("�ĵ����ⲻ��Ϊ�գ�");
	  return false;
  }
  if(tf.likeid.value!="" && HasNotVd(tf.likeid.value)){
	   alert("����ĵ�������д��ȷ��ID����ID1,ID2...");
	   return false;
  }
  if(tf.maintypeid.value==0){
	   alert("��ѡ�񵵰��������");
	   return false;
  }
  return true;
}

