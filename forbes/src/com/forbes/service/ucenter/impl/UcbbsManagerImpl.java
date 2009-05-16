package com.forbes.service.ucenter.impl;

import java.util.List;

import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.bean.UchomeMtag;
import com.forbes.hibernate.dao.CdbForumsDAO;
import com.forbes.hibernate.dao.CdbThreadsDAO;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeDoingDAO;
import com.forbes.hibernate.dao.UchomeFeedDAO;
import com.forbes.hibernate.dao.UchomeMtagDAO;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.service.ucenter.UcbbsManager;
import com.forbes.service.ucenter.UchomeManager;
import com.forbes.util.Pager;


public class UcbbsManagerImpl implements UcbbsManager{
	
	private CdbThreadsDAO cdbThreadsDAO;
	
	private CdbForumsDAO cdbForumsDAO;
	
	public CdbThreadsDAO getCdbThreadsDAO() {
		return cdbThreadsDAO;
	}


	public void setCdbThreadsDAO(CdbThreadsDAO cdbThreadsDAO) {
		this.cdbThreadsDAO = cdbThreadsDAO;
	}


	public CdbForumsDAO getCdbForumsDAO() {
		return cdbForumsDAO;
	}


	public void setCdbForumsDAO(CdbForumsDAO cdbForumsDAO) {
		this.cdbForumsDAO = cdbForumsDAO;
	}
	
	public List getCdbForums( String fup, String type, String status, String orderby, int begin, int length ){
		try{
			/*if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}*/
			
			List forumList = cdbForumsDAO.findTopCdbForums( fup, type, status, orderby, begin, length );

			return forumList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	
	public List getCdbThreads( String orderby, int begin, int length ){
		try{
			List threadList = cdbThreadsDAO.findTopCdbThreads( orderby, begin, length );

			return threadList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}

	

	

	
	
}
