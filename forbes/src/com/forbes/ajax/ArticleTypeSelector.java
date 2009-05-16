package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.service.basic.CityManager;


import org.springframework.context.ApplicationContext;   
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ArticleTypeSelector {
	
	private static ApplicationContext ctx = null;
	
	static {
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}
	
	public List getTopArticleType() throws ForbesException{
		ArticleTypeManager articleTypeManager =  (ArticleTypeManager)ctx.getBean("articleTypeManagerService");
		return articleTypeManager.getTopArticleType();
	}

	public List getArticleTypes(String pid) throws ForbesException{
		ArticleTypeManager articleTypeManager =  (ArticleTypeManager)ctx.getBean("articleTypeManagerService");
		return articleTypeManager.getArticleType( pid );
	}

}
