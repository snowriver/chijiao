package com.forbes.ajax;

import com.forbes.exception.ForbesException;
import com.forbes.service.plan.WeekAimExamManager;
import com.forbes.service.plan.WeekAttitudeManager;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserWeekCount {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public int getUserWeekAttitudeCount(String uid, String date) throws ForbesException{
		WeekAttitudeManager weekAttitudeManager =  (WeekAttitudeManager)ctx.getBean("weekAttitudeManagerService");
		return weekAttitudeManager.getWeekAttitudeCount(uid, date);
	}
	
	public int getUserWeekAimExamCount(String uid, String date) throws ForbesException{
		WeekAimExamManager weekAimExamManager =  (WeekAimExamManager)ctx.getBean("weekAimExamManagerService");
		return weekAimExamManager.getWeekAimExamCount(uid, date);
	}
	
}
