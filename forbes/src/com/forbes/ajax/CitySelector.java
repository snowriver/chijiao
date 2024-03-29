package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.basic.CityManager;


import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CitySelector {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public List getProvinces() throws ForbesException{
		CityManager cityManager =  (CityManager)ctx.getBean("cityManagerService");
		return cityManager.getAllProvince();
	}

	public List getCitys(String pid) throws ForbesException{
		CityManager cityManager =  (CityManager)ctx.getBean("cityManagerService");
		return cityManager.getCity(pid);
	}

}
