if(moz) {
	extendEventObject();
	extendElementModel();
	emulateAttachEvent();
}
function viewArc(aid){
	if(aid==0) aid = getOneItem();
	window.open("archives_do.php?aid="+aid+"&dopost=viewArchives");
}
function editService(id, returnUrl){
	location="AdminManageService.do?act=detail&osid="+id+"&returnUrl=" + returnUrl;
}
function updateArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=makeArchives&qstr="+qstr;
}
function checkArc(returnUrl){
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateArticle.do?act=verify&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫ��˵����£�");
}
function moveArc(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=moveArchives&qstr="+qstr;
}
function adArc(returnUrl){	
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateArticle.do?act=command&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫɾ�������£�");
}
function delService(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminManageService.do?act=delete&serviceID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("��ѡ��Ҫɾ���ķ���");
}


//�����Ĳ˵�
function ShowMenu(obj,aid,atitle)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("����ĵ�",function(){ viewArc(aid); }),
    new ContextItem("�༭�ĵ�",function(){ editArc(aid); }),
    new ContextSeperator(),
    new ContextItem("����HTML",function(){ updateArc(aid); }),
    new ContextItem("����ĵ�",function(){ checkArc(aid); }),
    new ContextItem("�Ƽ��ĵ�",function(){ adArc(aid); }),
    new ContextSeperator(),
    new ContextItem("ɾ���ĵ�",function(){ delArc(aid); }),
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
	if(document.form2.serviceID.value) return document.form2.serviceID.value;
	for(i=0;i<document.form2.serviceID.length;i++)
	{
		if(document.form2.serviceID[i].checked)
		{
			if(allSel=="")
				allSel=document.form2.serviceID[i].value;
			else
				allSel=allSel+"`"+document.form2.serviceID[i].value;
		}
	}
	return allSel;	
}

//���ѡ������һ����id
function getOneItem()
{
	var allSel="";
	if(document.form2.serviceID.value) return document.form2.serviceID.value;
	for(i=0;i<document.form2.serviceID.length;i++)
	{
		if(document.form2.serviceID[i].checked)
		{
				allSel = document.form2.serviceID[i].value;
				break;
		}
	}
	return allSel;	
}

function selAll()
{
	for(i=0;i<document.form2.serviceID.length;i++)
	{
		if(!document.form2.serviceID[i].checked)
		{
			document.form2.serviceID[i].checked=true;
		}
	}
}
function noSelAll()
{
	for(i=0;i<document.form2.serviceID.length;i++)
	{
		if(document.form2.serviceID[i].checked)
		{
			document.form2.serviceID[i].checked=false;
		}
	}
}
