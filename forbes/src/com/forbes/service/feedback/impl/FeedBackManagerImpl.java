package com.forbes.service.feedback.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.bean.Favorite;
import com.forbes.hibernate.bean.FavoriteType;
import com.forbes.hibernate.bean.FeedBack;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.hibernate.dao.FavoriteDAO;
import com.forbes.hibernate.dao.FavoriteTypeDAO;
import com.forbes.hibernate.dao.FeedBackDAO;
import com.forbes.service.basic.CityManager;
import com.forbes.service.favorite.FavoriteManager;
import com.forbes.service.feedback.FeedBackManager;
import com.forbes.util.Pager;


public class FeedBackManagerImpl implements FeedBackManager {
	
	
	
	private FeedBackDAO feedBackDAO;
	
	public FeedBackDAO getFeedBackDAO() {
		return feedBackDAO;
	}

	public void setFeedBackDAO(FeedBackDAO feedBackDAO) {
		this.feedBackDAO = feedBackDAO;
	}

	public void addFeedBack(FeedBack feedBack) {
		feedBackDAO.save(feedBack);
	}
	
	public void deleteFeedBack(FeedBack feedBack) {
		feedBackDAO.delete(feedBack);
	}
	
	public FeedBack getFeedBack(Integer id) {
		return feedBackDAO.findById(id);
	}

	public void updateFeedBack(FeedBack feedBack) {
		feedBackDAO.attachDirty(feedBack);
	}
	
	public List getFeedBackByPage( Pager pager, int pageNo, Short feedType, Short errorType, String keyword  ) throws ForbesException{
		try {			
			pager.setTotoalCnt(feedBackDAO.getCount( feedType, errorType, keyword));
			List list = feedBackDAO.getFeedBackByPage( feedType, errorType, keyword, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	
}
