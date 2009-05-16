package com.forbes.util;


public class UrlTool {


	public String getUrl(String url) {
		
		String returnUrl = null;
		
		String [] s = url.split("[|]");
		
		//System.out.println(s.length);
		
		for( int i =0; i <s.length; i++) {
			//System.out.println(" return_url = " + s[i]);
			if(i == 0) {
				continue;
			}
			else if(i==1) {
				returnUrl = s[1] +"?";
			}
			else {
				String param[] = s[i].split("=");
				if(param.length==1)
					returnUrl = returnUrl + s[i].split("=")[0] +"=&" ;
				else
					returnUrl = returnUrl + s[i].split("=")[0] + "=" + s[i].split("=")[1] +"&";
			}
			
		}
		return returnUrl;
		
	}
	
	public String getUrl2(String url, String type) {
		
		String returnUrl = null;
		
		String [] s = url.split(type);
		
		//System.out.println(s.length);
		
		//System.out.println(" s[0] = " + s[0]);
		
		for( int i =0; i <s.length; i++) {
			//System.out.println(" return_url = " + s[i]);
			if(i == 0) {
				continue;
			}
			else if(i==1) {
				returnUrl = s[1] +"?";
			}
			else {
				String param[] = s[i].split("=");
				if(param.length==1)
					returnUrl = returnUrl + s[i].split("=")[0] +"=&" ;
				else
					returnUrl = returnUrl + s[i].split("=")[0] + "=" + s[i].split("=")[1] +"&";
			}
			
		}
		return returnUrl;
		
	}
	
	/*public static void main(String [] args) {
		System.out.println("[|]");
		UrlTool t = new UrlTool();
		String url = "|clientListEstMatch.do|act=match|val=NA|pno=1|estid=2509|boxid=2509";
		System.out.println(t.getUrl2(url,"[|]"));
	}*/
}
