//搜索的初始化，默认初始化一下变量
var url = "http://www.chijiao.org/";
var charset = "gbk";
//var searchTpye = "article";

//实现搜索，触发该方法，跳出搜索结果页面
 function getSearchPage(searchTpye, keyword){
	switch(searchTpye){
		case 'article':
			url = "ArticleSearch.do?act=search&orderby=pubdate desc&keyword=";
			charset = "gbk";
			break;
		case 'video':
			url = "VideoSearch.do?act=search&orderby=pubdate desc&keyword=";
			charset = "gbk"
			break;
		default:
			url = "AskSearch.do?act=search&orderby=pubdate desc&keyword=";
			charset = "gbk";
	}

	switch(charset){
		case 'utf-8':
			url = url + urlDecode(keyword);
			//window.location.href = encodeURI(url);
			window.open(encodeURI(url));
			break;
		case 'gbk':
			url = url + urlDecode(keyword);
			//window.location.href = url;
			window.open(url);
			break;
		default:
			url = url + escape(keyword);
			//window.location.href = url;
			window.open(url);
	}

 }
 //
 function urlDecode(str){
			var ret = "";
			for(var i= 0;i<str.length;i++){
				var chr = str.charAt(i);
				if(chr == "+")
					ret += " ";
				else if(chr == "%"){
					var asc = str.substring(i + 1, i + 3);
					if(parseInt("0x" + asc) > 0x7f){
						ret += asc2str(parseInt("0x" + asc + str.substring(i + 4, i + 6)));
						i += 5;
					}else{
						ret += asc2str(parseInt("0x" + asc));
						i += 2;
					}
				}else{
					ret += chr;
				}
			}
    		return ret;
   		}

 
 //响应搜索时候的回车事件，按下回车键相当于点击搜索按钮
 function EnterSubmit(){
        var _key;
        document.onkeyup = function(e){
            if (e == null) { // ie
                _key = event.keyCode;
            } else { // firefox
                _key = e.which;
            }
            
            if(_key == 13){
                document.getElementById("searchSubmit").click();
            }
        }
    }