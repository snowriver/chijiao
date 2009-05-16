package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.service.basic.CityManager;
import com.forbes.service.video.VideoTypeManager;


import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class VideoTypeSelector {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public List getTopVideoType() throws ForbesException{
		VideoTypeManager videoTypeManager =  (VideoTypeManager)ctx.getBean("videoTypeManagerService");
		return videoTypeManager.getTopVideoType();
	}

	public List getVideoTypes(String pid) throws ForbesException{
		VideoTypeManager videoTypeManager =  (VideoTypeManager)ctx.getBean("videoTypeManagerService");
		return videoTypeManager.getVideoTypes(pid);
	}

}
