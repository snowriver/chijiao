package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.ask.AskTypeManager;

import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AskTypeSelector {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public List getTopAskType() throws ForbesException{
		AskTypeManager askTypeManager =  (AskTypeManager)ctx.getBean("askTypeManagerService");
		return askTypeManager.getTopAskType();
	}

	public List getAskTypes(String pid) throws ForbesException{
		AskTypeManager askTypeManager =  (AskTypeManager)ctx.getBean("askTypeManagerService");
		return askTypeManager.getAskTypeByPid(Integer.parseInt(pid));
	}

}
