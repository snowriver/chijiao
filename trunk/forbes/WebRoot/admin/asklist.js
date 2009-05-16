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
function updateUserLevel(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="AdminManageUserLevel.do?id="+id+"&dopost=makeArchives&qstr="+qstr;
}
function checkArc(returnUrl){
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateArticle.do?act=verify&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要审核的文章！");
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
		alert("请选择要删除的文章！");
}
function delUserLevel(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminManageUserLevel.do?act=delete&levelID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的等级！");
}

function delAskAnswer(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminManageAskAnswer.do?act=delete&levelID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的等级！");
}
//上下文菜单
function ShowMenu(obj,aid,atitle)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("浏览文档",function(){ viewArc(aid); }),
    new ContextItem("编辑文档",function(){ editArc(aid); }),
    new ContextSeperator(),
    new ContextItem("更新HTML",function(){ updateArc(aid); }),
    new ContextItem("审核文档",function(){ checkArc(aid); }),
    new ContextItem("推荐文档",function(){ adArc(aid); }),
    new ContextSeperator(),
    new ContextItem("删除文档",function(){ delArc(aid); }),
    new ContextSeperator(),
    new ContextItem("全部选择",function(){ selAll(); }),
    new ContextItem("取消选择",function(){ noSelAll(); }),
    new ContextSeperator(),
    new ContextItem("频道管理",function(){ location="catalog_main.php"; })
  ]
  ContextMenu.display(popupoptions)
}

//获得选中文件的文件名
function getCheckboxItem()
{
	var allSel="";
	if(document.form2.levelID.value) return document.form2.levelID.value;
	for(i=0;i<document.form2.levelID.length;i++)
	{
		if(document.form2.levelID[i].checked)
		{
			if(allSel=="")
				allSel=document.form2.levelID[i].value;
			else
				allSel=allSel+"`"+document.form2.levelID[i].value;
		}
	}
	return allSel;	
}

//获得选中其中一个的id
function getOneItem()
{
	var allSel="";
	if(document.form2.levelID.value) return document.form2.levelID.value;
	for(i=0;i<document.form2.levelID.length;i++)
	{
		if(document.form2.levelID[i].checked)
		{
				allSel = document.form2.levelID[i].value;
				break;
		}
	}
	return allSel;	
}

function selAll()
{

	for(i=0;i<document.form2.levelID.length;i++)
	{
		if(!document.form2.levelID[i].checked)
		{
			document.form2.levelID[i].checked=true;
		}
	}
}
function noSelAll()
{
	for(i=0;i<document.form2.levelID.length;i++)
	{
		if(document.form2.levelID[i].checked)
		{
			document.form2.levelID[i].checked=false;
		}
	}
}
