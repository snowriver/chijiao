package com.forbes.ajax;

import java.util.*;
import com.forbes.exception.ForbesException;
import com.forbes.service.plan.DailyPlanManager;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserPlanCount {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public int getUserDailyPlanCount(String uid, String date, String iscomplete) throws ForbesException{
		DailyPlanManager dailyPlanManager =  (DailyPlanManager)ctx.getBean("dailyPlanManagerService");
		return dailyPlanManager.getDailyPlanCount(uid, date, iscomplete);
	}

}
