package com.forbes.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanFactory {
	private static ApplicationContext ctx = null;
	private static BeanFactory beanFactory = null;

	static{
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");  
	}
	public static Object getBean(String beanName){
		return ctx.getBean(beanName);
	}
}
