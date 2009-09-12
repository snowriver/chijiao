package com.forbes.ajax;

import java.util.*;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.service.article.ArticleTypeManager;

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
	
	public Map getALlArticleTypes() throws ForbesException{
		ArticleTypeManager articleTypeManager =  (ArticleTypeManager)ctx.getBean("articleTypeManagerService");
		
		Map map = new HashMap();
		List<ArticleType> list = articleTypeManager.getAllArticleType();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			ArticleType at = (ArticleType) iterator.next();
			map.put(at.getId(), at.getName());
		}
		return map;
	}

}
