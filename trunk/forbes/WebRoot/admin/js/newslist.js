if(moz) {
	extendEventObject();
	extendElementModel();
	emulateAttachEvent();
}
function viewNews(aid){
	if(aid==0) aid = getOneItem();
	window.open("archives_do.php?aid="+aid+"&dopost=viewNewshives");
}
function editNews(id, returnUrl){
	location="AdminManageNews.do?act=get&id="+id+"&returnUrl=" + returnUrl;
}
function updateNews(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=makeNewshives&qstr="+qstr;
}
function checkNews(returnUrl){
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateArticle.do?act=verify&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫ��˵����£�");
}
function moveNews(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=moveNewshives&qstr="+qstr;
}
function adNews(returnUrl){	
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminManageNews.do?act=command&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫ�Ƽ�����Ѷ��");
}
function delNews(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminManageNews.do?act=delete&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫɾ�������£�");
}


//�����Ĳ˵�
function ShowMenu(obj,aid,atitle)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("����ĵ�",function(){ viewNews(aid); }),
    new ContextItem("�༭�ĵ�",function(){ editNews(aid); }),
    new ContextSeperator(),
    new ContextItem("����HTML",function(){ updateNews(aid); }),
    new ContextItem("����ĵ�",function(){ checkNews(aid); }),
    new ContextItem("�Ƽ��ĵ�",function(){ adNews(aid); }),
    new ContextSeperator(),
    new ContextItem("ɾ���ĵ�",function(){ delNews(aid); }),
    new ContextSeperator(),
    new ContextItem("ȫ��ѡ��",function(){ selAll(); }),
    new ContextItem("ȡ��ѡ��",function(){ noSelAll(); }),
    new ContextSeperator(),
    new ContextItem("Ƶ������",function(){ location="catalog_main.php"; })
  ]
  ContextMenu.display(popupoptions)
}

//���ѡ���ļ����ļ���
function getCheckboxItem()
{
	var allSel="";
	if(document.form2.arcID.value) return document.form2.arcID.value;
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(document.form2.arcID[i].checked)
		{
			if(allSel=="")
				allSel=document.form2.arcID[i].value;
			else
				allSel=allSel+"`"+document.form2.arcID[i].value;
		}
	}
	return allSel;	
}

//���ѡ������һ����id
function getOneItem()
{
	var allSel="";
	if(document.form2.arcID.value) return document.form2.arcID.value;
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(document.form2.arcID[i].checked)
		{
				allSel = document.form2.arcID[i].value;
				break;
		}
	}
	return allSel;	
}

function selAll()
{
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(!document.form2.arcID[i].checked)
		{
			document.form2.arcID[i].checked=true;
		}
	}
}
function noSelAll()
{
	for(i=0;i<document.form2.arcID.length;i++)
	{
		if(document.form2.arcID[i].checked)
		{
			document.form2.arcID[i].checked=false;
		}
	}
}
