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
		/*CityDAO cityDAO  = (CityDAO )ctx.getBean("CityDAO");
		return cityDAO.findByPid(0);*/
		CityManager cityManager =  (CityManager)ctx.getBean("cityManagerService");
		return cityManager.getAllProvince();
	}

	public List getCitys(String pid) throws ForbesException{
		/*CityDAO cityDAO  = (CityDAO )ctx.getBean("CityDAO");
		return cityDAO.findByPid(Integer.parseInt(pid));*/
		CityManager cityManager =  (CityManager)ctx.getBean("cityManagerService");
		return cityManager.getCity(pid);
	}

}
