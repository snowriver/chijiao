package com.forbes.task;

import com.forbes.util.Constant;
import com.forbes.util.FileAccess;
import com.forbes.util.ToHtml;

public class TohtmlTask {
	
	
	
	public void doTask(){
		try {
			System.out.println(" Start ............");
				
				java.io.File myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}					
				boolean flag_index = ToHtml.toHtml(Constant.FORBES_URL + "/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS + "\\index.html");
			
				
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}
				boolean flag_article = ToHtml.toHtml(Constant.FORBES_URL + "/article/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ARTICLE + "\\index.html");
				
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}
				boolean flag_video = ToHtml.toHtml(Constant.FORBES_URL + "/video/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_VIDEO + "\\index.html");
						
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_ASK);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}				
				boolean flag_ask = ToHtml.toHtml(Constant.FORBES_URL + "/ask/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_ASK + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ASK + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ASK + "\\index.html");
				
			System.out.println(" end ............");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
