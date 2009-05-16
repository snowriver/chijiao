var img_path = 'http://img.openv.tv/openvcom/';

if(typeof(nvg_name)=='undefined'){
  nvg_name = '';
}
document.write('\
<style>\
#menu_openv { background:url('+ img_path +'images/menu_bg.gif) repeat-x left top; height:40px;}\
#menu_openv ul { margin-left:6px;}\
#menu_openv li { background:url('+ img_path +'images/line.jpg) no-repeat right top; height:21px; padding-right:16px;  margin-left:16px;* margin-left:16px;_ margin-left:16px;float:left; list-style:none;}\
#menu_openv li.first { padding-right:4px;*padding-right:4px;_padding-right:3px;margin-left:4px;* margin-left:4px;_ margin-left:2px;  }\
#menu_openv li.first a,#menu_openv li.first a:visited { margin-top:7px;*margin-top:4px;_margin-top:4px; padding:3px 12px 2px 12px; *padding:6px 12px 2px 12px; _padding:6px 13px 2px 14px; text-decoration:none; float:left; display:block;}\
#menu_openv li.expli { padding-right:4px;*padding-right:4px;_padding-right:3px;margin-left:4px;* margin-left:4px;_ margin-left:2px;  }\
#menu_openv li.expli a,#menu_openv li.expli a:visited { margin-top:7px;*margin-top:4px;_margin-top:4px; padding:3px 12px 2px 12px; *padding:6px 12px 2px 12px; _padding:6px 13px 2px 14px; color:#fff; text-decoration:none; float:left; display:block; background-color:#54AD26}\
#menu_openv li.expli a:hover { color:#fff;}\
#menu_openv li a ,#menu_openv li a:visited { text-decoration:none; float:left; margin-top:10px; display:block;}\
#menu_openv li a:hover { color:#DCDCDC;}\
#menu_openv li.nobg { background:transparent}\
#menu_openv li a.c_grey{ color:#DCDCDC; text-decoration:none;}\
#menu_openv li a.c_orange{ color:#FF9900; text-decoration:none;}\
</style>\
<div id="menu_openv">\
  <ul>\
');
var nvg_d = [];i=0;

//--------------- 导航数据 开始 ---------------//
nvg_d[i++]={title:'首页',name:'shouye',href:'http://www.openv.com'};
nvg_d[i++]={title:'高清影视',name:'gaoqingyingshi',href:'http://hd.openv.com/',cls:'c_orange'};
nvg_d[i++]={title:'高清节目',name:'gaoqingjiemu',href:'http://hd.openv.com/index_list.php?t=1'};
nvg_d[i++]={title:'娱乐',name:'ent',href:'http://ent.openv.com'};
nvg_d[i++]={title:'新闻',name:'news',href:'http://news.openv.com'};
nvg_d[i++]={title:'体育',name:'sports',href:'http://sports.openv.com'};
nvg_d[i++]={title:'时尚',name:'fashion',href:'http://fashion.openv.com'};
nvg_d[i++]={title:'财经',name:'finance',href:'http://finance.openv.com'};
nvg_d[i++]={title:'汽车',name:'auto',href:'http://auto.openv.com'};
nvg_d[i++]={title:'直播',name:'zhibo',href:'http://tv.openv.com/live.php'};
nvg_d[i++]={title:'搜视指南',name:'soushizhinan',href:'http://tv.openv.com'};
nvg_d[i++]={title:'网友热搜',name:'bt',href:'http://bt.openv.com'};
nvg_d[i++]={title:'专辑',name:'zj',href:'http://zj.openv.com'};
//--------------- 导航数据  结束 ---------------//

for(i=0;i<nvg_d.length;i++){
  var n = nvg_d[i];
  var cls  = '';
  if(nvg_name == n.name){cls = 'expli ';}
  else if(i==0){cls = 'first'}
  if(i==nvg_d.length-1){cls += 'nobg';}
  if(!n.cls){n.cls='c_grey'}
  document.write('<li class="'+cls+'"><a href="'+n.href+'" class="'+n.cls+'">'+n.title+'</a></li>');
}

document.write('\
    </ul>\
</div>\
');

$('li','#menu_openv').each(function(){
  if(!$(this).hasClass('expli')){
    $(this).mouseover(function(){
      $(this).addClass('expli');
    }).mouseout(function(){
      $(this).removeClass('expli');
    });
  }
});