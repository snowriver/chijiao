package com.forbes.ajax;

import com.forbes.exception.ForbesException;
import com.forbes.service.plan.DailyAccreditManager;
import com.forbes.service.plan.DailyPlanManager;
import com.forbes.service.plan.DailySumupManager;

import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserDailyCount {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public int getUserDailyPlanCount(String uid, String date, String iscomplete) throws ForbesException{
		DailyPlanManager dailyPlanManager =  (DailyPlanManager)ctx.getBean("dailyPlanManagerService");
		return dailyPlanManager.getDailyPlanCount(uid, date, iscomplete);
	}
	
	public int getUserDailyAccreditCount(String uid, String date, String iscomplete) throws ForbesException{
		DailyAccreditManager dailyAccreditManager =  (DailyAccreditManager)ctx.getBean("dailyAccreditManagerService");
		return dailyAccreditManager.getDailyAccreditCount(uid, date, iscomplete);
	}
	
	public int getUserDailySumupCount(String uid, String date) throws ForbesException{
		DailySumupManager dailySumupManager =  (DailySumupManager)ctx.getBean("dailySumupManagerService");
		return dailySumupManager.getDailySumupCount(uid, date);
	}

}
