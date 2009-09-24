package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.News;
import com.forbes.hibernate.bean.NewsContent;
import com.forbes.hibernate.dao.NewsContentDAO;
import com.forbes.hibernate.dao.NewsDAO;
import com.forbes.service.article.NewsManager;
import com.forbes.util.Pager;


public class NewsManagerImpl implements NewsManager {
	
	private NewsDAO newsDAO;
	
	private NewsContentDAO newsContentDAO;	

	public NewsDAO getNewsDAO() {
		return newsDAO;
	}

	public void setNewsDAO(NewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}

	public NewsContentDAO getNewsContentDAO() {
		return newsContentDAO;
	}

	public void setNewsContentDAO(NewsContentDAO newsContentDAO) {
		this.newsContentDAO = newsContentDAO;
	}
	
	public List getNewsByPage( Pager pager, int pageNo, String keywords, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(newsDAO.getCount(keywords));
			List list = newsDAO.findNewsByPage(keywords, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopNews( String orderby, int beg, int len ) throws ForbesException{
		try {			
			List list = newsDAO.findTopNews(orderby, beg, len);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public boolean verifyTitle( String title ){
		List list = newsDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		News a = newsDAO.findById(id);
		List list = newsDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public void addNews(News news) {
		newsDAO.save(news);
	}
	
	public void deleteNews(News news) {
		newsDAO.delete(news);
	}
	
	public News getNews(Integer id) {
		return newsDAO.findById(id);
	}

	public void updateNews(News news) {
		newsDAO.attachDirty(news);
	}


	public List getLikeNews(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = newsDAO.findNewsById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
	public News getNextNews(Integer id) {
		List list = newsDAO.findNextNews(id.toString());
		if(list.size() >0 )
			return (News)list.get(0);
		else 
			return null;
	}
	
	public News getPreNews(Integer id) {
		List list = newsDAO.findPreNews(id.toString());
		if(list.size() >0  )
			return (News)list.get(0);
		else 
			return null;
	}
	
	public void addNewsContent(NewsContent newsContent) {
		newsContentDAO.save(newsContent);
	}
	
	public void deleteNewsContent(NewsContent newsContent) {
		newsContentDAO.delete(newsContent);
	}
	
	public NewsContent getNewsContent(Integer id) {
		return newsContentDAO.findById(id);
	}

	public void updateNewsContent(NewsContent newsContent) {
		newsContentDAO.attachDirty(newsContent);
	}

	
		
}
