package com.forbes.service.ucenter.impl;

import java.util.List;

import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.bean.UchomeMtag;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeDoingDAO;
import com.forbes.hibernate.dao.UchomeFeedDAO;
import com.forbes.hibernate.dao.UchomeMtagDAO;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.service.ucenter.UchomeManager;
import com.forbes.util.Pager;


public class UchomeManagerImpl implements UchomeManager{
	
	private UchomeMtagDAO uchomeMtagDAO;
	
	private UchomeFeedDAO uchomeFeedDAO;
	
	private UchomeDoingDAO uchomeDoingDAO;
	
	private UchomeBlogDAO uchomeBlogDAO;
	
	public UchomeMtagDAO getUchomeMtagDAO() {
		return uchomeMtagDAO;
	}

	public void setUchomeMtagDAO(UchomeMtagDAO uchomeMtagDAO) {
		this.uchomeMtagDAO = uchomeMtagDAO;
	}
	
	public UchomeFeedDAO getUchomeFeedDAO() {
		return uchomeFeedDAO;
	}

	public void setUchomeFeedDAO(UchomeFeedDAO uchomeFeedDAO) {
		this.uchomeFeedDAO = uchomeFeedDAO;
	}
	
	public UchomeDoingDAO getUchomeDoingDAO() {
		return uchomeDoingDAO;
	}

	public void setUchomeDoingDAO(UchomeDoingDAO uchomeDoingDAO) {
		this.uchomeDoingDAO = uchomeDoingDAO;
	}
	
	public UchomeBlogDAO getUchomeBlogDAO() {
		return uchomeBlogDAO;
	}

	public void setUchomeBlogDAO(UchomeBlogDAO uchomeBlogDAO) {
		this.uchomeBlogDAO = uchomeBlogDAO;
	}
	
	public List getUchomeMtags( String orderby, int begin, int length ){
		try{
			/*if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}*/
			
			List mtagList = uchomeMtagDAO.findTopUchomeMtag( orderby, begin, length );

			return mtagList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	
	public List getUchomeFeeds( String orderby, int begin, int length ){
		try{
			List feedList = uchomeFeedDAO.findTopUchomeFeed( orderby, begin, length );

			return feedList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	public List getUchomeDoings( String orderby, int begin, int length ){
		try{
			List doingList = uchomeDoingDAO.findTopUchomeDoing( orderby, begin, length );

			return doingList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	public List getUchomeBlogs( String orderby, int begin, int length ){
		try{
			List blogList = uchomeBlogDAO.findTopUchomeBlog( orderby, begin, length );

			return blogList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	
	
}
