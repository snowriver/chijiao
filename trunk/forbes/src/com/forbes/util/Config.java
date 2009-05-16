package com.forbes.util;

import java.util.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Config {
	private static HashMap ucurl;
	private static ApplicationContext ctx = null;
	private static Config config = null;

	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");
		config  = ( Config )ctx.getBean("config");
	}
	public HashMap getUcurl() {
		return ucurl;
	}

	public void setUcurl(HashMap ucurl) {
		this.ucurl = ucurl;
	}
	public static String getProperty(String key,String defVal){
		return ucurl.get(key).toString();
	}
}
