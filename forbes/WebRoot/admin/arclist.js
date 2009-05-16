if(moz) {
	extendEventObject();
	extendElementModel();
	emulateAttachEvent();
}
function viewArc(aid){
	if(aid==0) aid = getOneItem();
	window.open("archives_do.php?aid="+aid+"&dopost=viewArchives");
}
function editArc(id, returnUrl){
	location="AdminEditArticle.do?act=gettype&op=edit&id="+id+"&returnUrl=" + returnUrl;
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
function delArc(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminUpdateArticle.do?act=delete&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的文章！");
}
function modArc(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="article_batch_modify.jsp?arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要批量修改的文章！");
}


//Video
function viewVideo(aid){
	if(aid==0) aid = getOneItem();
	window.open("archives_do.php?aid="+aid+"&dopost=viewArchives");
}
function editVideo(id, returnUrl){
	location="AdminEditVideo.do?act=gettype&op=edit&id="+id+"&returnUrl=" + returnUrl;
}
function editVideoUrl(videoid, returnUrl){
	location="AdminUpdateVideoUrl.do?act=list&videoid="+videoid+"&returnUrl=" + returnUrl;
}
function updateVideo(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=makeArchives&qstr="+qstr;
}
function checkVideo(returnUrl){
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateVideo.do?act=verify&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要审核的文章！");
}
function moveVideo(aid){
	var qstr=getCheckboxItem();
	if(aid==0) aid = getOneItem();
	location="archives_do.php?aid="+aid+"&dopost=moveArchives&qstr="+qstr;
}
function adVideo(returnUrl){	
	var qstr=getCheckboxItem();
	if(qstr.length > 0)
		location="AdminUpdateVideo.do?act=command&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的文章！");
}
function delVideo(returnUrl){
	var qstr=getCheckboxItem();
	//alert(qstr);
	//if(aid==0) aid = getOneItem();
	if(qstr.length > 0)
		location="AdminUpdateVideo.do?act=delete&arcID="+qstr+"&returnUrl="+returnUrl;
	else
		alert("请选择要删除的文章！");
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
