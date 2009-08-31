package com.forbes.util;

public interface Constant {
		
	public int ASK_USER_ADMIN      = 1;  //ADMIN
	public int ASK_USER_CLIENT     = 2;  //CLIENT
	
	public String UC_URL	     = (String)SysConfigManager.getValue("cfg_uc_url");
	public String UC_HOME_URL	 = (String)SysConfigManager.getValue("cfg_uc_home_url");
	public String UC_BBS_URL	 = (String)SysConfigManager.getValue("cfg_uc_bbs_url");
	
	public String FORBES_URL 	 = (String)SysConfigManager.getValue("cfg_forbes_url");
	
	public String APPSERV_VIRTUAL_ADDRESS 		  = (String)SysConfigManager.getValue("cfg_appserv_virtual_address");
	public String APPSERV_VIRTUAL_ADDRESS_ARTICLE = (String)SysConfigManager.getValue("cfg_appserv_virtual_address_article");
	public String APPSERV_VIRTUAL_ADDRESS_VIDEO   = (String)SysConfigManager.getValue("cfg_appserv_virtual_address_video");
	public String APPSERV_VIRTUAL_ADDRESS_ASK	  = (String)SysConfigManager.getValue("cfg_appserv_virtual_address_ask");
	
	public String TOMCAT_VIRTUAL_ADDRESS 		 = (String)SysConfigManager.getValue("cfg_tomcat_virtual_address");
	public String TOMCAT_VIRTUAL_ADDRESS_ARTICLE = (String)SysConfigManager.getValue("cfg_tomcat_virtual_address_article");
	public String TOMCAT_VIRTUAL_ADDRESS_VIDEO 	 = (String)SysConfigManager.getValue("cfg_tomcat_virtual_address_video");
	public String TOMCAT_VIRTUAL_ADDRESS_ASK	 = (String)SysConfigManager.getValue("cfg_tomcat_virtual_address_ask");
}
