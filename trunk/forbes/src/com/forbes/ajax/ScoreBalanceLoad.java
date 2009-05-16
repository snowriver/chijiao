package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.account.ScoreManager;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.service.basic.CityManager;
import com.forbes.service.video.VideoTypeManager;


import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ScoreBalanceLoad {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public int getUserBalance(String userId) throws ForbesException{
		ScoreManager scoreManager =  (ScoreManager)ctx.getBean("scoreManagerService");
		Short accountType = com.forbes.util.DictionaryManager.getInstance().getVal("ACCOUNT_TYPE", "2").getDvalue();
		return scoreManager.getBalance(userId, accountType.toString());
	}

}
