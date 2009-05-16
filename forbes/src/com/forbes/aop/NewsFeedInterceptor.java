package com.forbes.aop;

import java.lang.reflect.Method;
import java.util.Map;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.forbes.aop.newsfeed.MessageGeneratorInf;


public class NewsFeedInterceptor implements AfterReturningAdvice{
	private Map genClassMap;
	private static ApplicationContext ctx = null;
	static{
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	public void afterReturning( Object returnValue,Method method,Object[] args,Object target )throws Throwable{
		try{
			
			String methodName = method.getName();
			String className  = (String)genClassMap.get( methodName );
			if( className == null ){
				return;
			}
		
			MessageGeneratorInf msgGenerator = ( MessageGeneratorInf )ctx.getBean(className);
			if( msgGenerator == null ){
				return;
			}
			msgGenerator.genMessage(returnValue, method, args, target);
		}
		catch( Exception e ){
			e.printStackTrace();
		}
	}
	
	public Map getGenClassMap() {
		return genClassMap;
	}
	public void setGenClassMap(Map genClassMap) {
		this.genClassMap = genClassMap;
	}
}
