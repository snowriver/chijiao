	//BUG ’ºØ
	function win_open_bug(errType,width,height,siteUrl){
			var err = null;
			var url = (siteUrl != "" && siteUrl != null) ? siteUrl.replace('?','£ø').replace('&','£¶') : document.location.toString().replace('?','£ø').replace('&','£¶');
			try{errType = (errType != null) ? parseInt(errType) : 1;}catch(err){errType = 1;}
			try{width = (width != null) ? parseInt(width) : 500;}catch(err){width = 500;}
			try{height = (height != null) ? parseInt(height) : 720;}catch(err){height = 720;}
			window.open("../feedback/index.jsp?errNum=" + errType.toString() + "&errUrl=" + url,"errPage","fullscreen=no,channelmode=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=" + width.toString() + ",height=" + height.toString());
		}