package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.News;
import com.forbes.hibernate.bean.NewsContent;
import com.forbes.hibernate.dao.NewsContentDAO;
import com.forbes.hibernate.dao.NewsDAO;
import com.forbes.util.Pager;

public interface NewsManager {

	public NewsDAO getNewsDAO();

	public void setNewsDAO(NewsDAO newsDAO);
	
	public NewsContentDAO getNewsContentDAO();

	public void setNewsContentDAO(NewsContentDAO newsContentDAO);

	public void addNews(News news);
	
	public void deleteNews(News news);
	
	public News getNews(Integer id);

	public void updateNews(News news);
	
	public boolean verifyTitle( String title );
	
	public boolean verifyTitle( Integer id, String title );
	
	public List getNewsByPage( Pager pager, int pageNo, String keywords, String orderby ) throws ForbesException;
	
	public List getTopNews( String orderby, int beg, int len ) throws ForbesException;
	
	public List getLikeNews(String likeid, String orderby, int begin, int length ) throws ForbesException;
	
	public News getNextNews(Integer id);
	
	public News getPreNews(Integer id);
	
	public void addNewsContent(NewsContent newsContent);
	
	public void deleteNewsContent(NewsContent newsContent);
	
	public NewsContent getNewsContent(Integer id);

	public void updateNewsContent(NewsContent newsContent);
	
}
