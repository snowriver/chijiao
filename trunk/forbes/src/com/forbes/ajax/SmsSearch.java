package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.sms.SmsSearchManager;
import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SmsSearch {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public int getNewPmsCount(String msgtoid) throws ForbesException{
		String folder = "inbox";
		String new_   = "1";
		//String msgtoid = "";
		String delstatus = "0_1";
		String related = "0";
		SmsSearchManager smsSearchManager =  (SmsSearchManager)ctx.getBean("smsSearchManagerService");
		return smsSearchManager.getPmsCount(null, msgtoid, folder, new_, null, delstatus, related, null);
		//smsSearchManager.getPmsCount(msgfromid, msgtoid, folder, new_, dateline, delstatus, related, fromappid);
		 
	}

}
