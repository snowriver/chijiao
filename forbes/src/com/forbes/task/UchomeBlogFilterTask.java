package com.forbes.task;

import java.util.List;

import com.forbes.hibernate.bean.UchomeBlogFilter;
import com.forbes.hibernate.bean.UchomeBlogfield;
import com.forbes.service.ucenter.UchomeBlogManager;


public class UchomeBlogFilterTask {

	/*private static ApplicationContext ctx = null;
	
	static {
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
	}*/
	
	private UchomeBlogManager uchomeBlogManager;
	
	public UchomeBlogManager getUchomeBlogManager() {
		return uchomeBlogManager;
	}

	public void setUchomeBlogManager(UchomeBlogManager uchomeBlogManager) {
		this.uchomeBlogManager = uchomeBlogManager;
	}

	public void doTask() {
		try {
			System.out.println(" do task");
			/*UchomeBlogManager  uchomeBlogManager = 
					(UchomeBlogManager)ctx.getBean("uchomeBlogFilterManagerService");*/
			List<UchomeBlogFilter> filterList = uchomeBlogManager.getAllBlogFilter();			
			List<UchomeBlogfield> blogList = uchomeBlogManager.getAllBlogfield();
			
			for (UchomeBlogfield field : blogList) {
				
				System.out.println(field.getBlogid());
				String message = field.getMessage();
				for (UchomeBlogFilter filter : filterList) {
					
					System.out.println("<a href=\"" + filter.getUrl() + "\">" + 
							filter.getName() + "</a>");
					
					message = message
							.replaceAll("<a href=\"" + filter.getUrl() + "\">" + 
							filter.getName() + "</a>", "");
					message = message
							.replaceAll("<A href=\"" + filter.getUrl() + "\">" + 
							filter.getName() + "</A>", "");
					message = message
							.replaceAll("<a href=" + filter.getUrl() + ">" + 
							filter.getName() + "</a>", "");
					message = message
							.replaceAll("<A href=" + filter.getUrl() + ">" + 
							filter.getName() + "</A>", "");
				}
				field.setMessage(message);
				uchomeBlogManager.updateUchomeBlogfield(field);
				Thread.sleep(50);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
