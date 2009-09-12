package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.basic.SectorManager;

import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SectorSelector {
	
	private static ApplicationContext ctx = null;
	
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public List getSectors() throws ForbesException{
		SectorManager sectorManager =  (SectorManager)ctx.getBean("sectorManagerService");
		return sectorManager.getTopSector();
	}

	public List getSectors(String pid) throws ForbesException{
		SectorManager sectorManager =  (SectorManager)ctx.getBean("sectorManagerService");
		return sectorManager.getSectors(pid);
	}

}
