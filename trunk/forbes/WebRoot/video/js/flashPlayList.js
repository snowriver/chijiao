/*Flash play*/
	if(typeof(listTitle)=='undefined'){
  	listTitle = 'listTitle';
	}
	if(typeof(listSubTitle)=='undefined'){
	  listSubTitle = 'listSubTitle';
	}
	
	if(typeof(listCategory)=='undefined'){
	  listCategory = false;
	}
	var isMSN = location.host.toString().search(/msn\.openv\.com/i)>-1;
	var nowPID = -1;
	var bgC_d = '#FFFFFF';
	var bgC_s = '#B0BED7';
	var bgC_i = '#EEEEEE';
	var sFV   = '';
	var swf_path = 'http://img.openv.tv/openvcom/swf/player.swf';
	sFV+= '&hasLeftBar=false';
	function innerPlay(id)
	{			  		 		 
	   if(id==nowPID)return;
	   scroll(0,0);
		 if(id >= v.length)id=0;
		 _tmp = v[id].split('||');
		 $(".title span#title").html(_tmp[0]);
		 isAd = 'true';
		 if(_tmp[3]){
		    isAd = _tmp[3];
		 }
		 _qval ='tv=0';
		 if(listCategory){
		    _qval += ',category='+encodeURIComponent(listCategory);
		 }
	   _qval += ',ref='+ encodeURIComponent(document.referrer) + ',channel=' + encodeURIComponent(location.href);
 		 sFV += '&pid='+ _tmp[1] +'&playNowTitle='+ encodeURIComponent(_tmp[0]) +'&q='+ _qval +'&autostart=true&showOverEvent=1&culatePlayerTimer=true&playADstatu='+isAd;  
 		 
	    s_htm = '<object width="500" height="425" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">\
            <param name="movie" value="'+ isAd +'"/>\
            <param name="allowScriptAccess" value="always"/>\
            <param name="allowfullscreen" value="true"/>\
            <param name="FlashVars" value="'+ isAd +'"/>\
            <embed width="500" height="425"\
              allowscriptaccess="always"\
              type="application/x-shockwave-flash"\
              src="'+ isAd +'"\
              allowfullscreen="true" wmode="transparent" quality="high"/>\
            </object>';
  	$('#vplay_td').html(s_htm);
	  nowPID = id;
	  
	 
	}
	function videoStatus(id,ty,cs){
	  if(ty!='ad' && cs == 'playOverAll'){
	    innerPlay(nowPID+1);
	  }
	}