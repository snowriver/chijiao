package com.forbes.task;

import com.forbes.util.Constant;
import com.forbes.util.FileAccess;
import com.forbes.util.ToHtml;

public class TohtmlTask {
	
	
	
	public void doTask(){
		try {
				
				
				java.io.File myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}					
				ToHtml.toHtml(Constant.FORBES_URL + "/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS + "\\index.html");
				
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}
				ToHtml.toHtml(Constant.FORBES_URL + "/article/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ARTICLE + "\\index.html");
				
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}
				ToHtml.toHtml(Constant.FORBES_URL + "/video/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_VIDEO + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_VIDEO + "\\index.html");
				
				
				myFilePath = new java.io.File(Constant.APPSERV_VIRTUAL_ADDRESS_ASK);
				if (!myFilePath.exists()) {
					myFilePath.mkdir();
				}				
				ToHtml.toHtml(Constant.FORBES_URL + "/ask/NewIndex.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_ASK + "\\index.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ASK + "\\index.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ASK + "\\index.html");
				
								
				// Article Top
				ToHtml.toHtml(Constant.FORBES_URL + "/article/ArticleSearch.do?act=top&orderby=click%20DESC",
						Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_click_article.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_click_article.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_click_article.html");
				
				ToHtml.toHtml(Constant.FORBES_URL + "/article/ArticleSearch.do?act=top&orderby=iscommend%20DESC",
						Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_commend_article.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_commend_article.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_commend_article.html");
				
				ToHtml.toHtml(Constant.FORBES_URL + "/article/TopUchomeBlog.do",
						Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_uchome_blog.html", "gbk", "gbk");
				FileAccess.Copy(Constant.APPSERV_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_uchome_blog.html", 
						Constant.TOMCAT_VIRTUAL_ADDRESS_ARTICLE + "\\ten_top_uchome_blog.html");
				
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
