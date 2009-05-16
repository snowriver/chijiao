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
		alert("请选择要审核的文章！");
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
		alert("请选择要推荐的资讯！");
}
function delNews(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminManageNews.do?act=delete&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的文章！");
}


//上下文菜单
function ShowMenu(obj,aid,atitle)
{
  var eobj,popupoptions
  popupoptions = [
    new ContextItem("浏览文档",function(){ viewNews(aid); }),
    new ContextItem("编辑文档",function(){ editNews(aid); }),
    new ContextSeperator(),
    new ContextItem("更新HTML",function(){ updateNews(aid); }),
    new ContextItem("审核文档",function(){ checkNews(aid); }),
    new ContextItem("推荐文档",function(){ adNews(aid); }),
    new ContextSeperator(),
    new ContextItem("删除文档",function(){ delNews(aid); }),
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

//获得选中其中一个的id
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
