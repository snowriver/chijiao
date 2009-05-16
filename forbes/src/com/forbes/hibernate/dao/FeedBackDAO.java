package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseFeedBackDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * FeedBack entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.FeedBack
 * @author MyEclipse Persistence Tools
 */

public class FeedBackDAO extends BaseFeedBackDAO {
	private static final Log log = LogFactory.getLog(FeedBackDAO.class);
	// property constants
	
	public int getCount(Short feedType, Short errorType, String keyword ) {
		if (keyword == null) keyword = "";
		try {

			String queryString = "SELECT COUNT(fb) FROM FeedBack AS fb WHERE fb.keyword like ? ";
			
			if(feedType != null)
				queryString = "AND fb.feedType =  " + feedType;
			
			if(errorType != null)
				queryString = "AND fb.errorType =  " + errorType;
			
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List getFeedBackByPage(Short feedType, Short errorType, String keyword, int beg, int len ) {
		if (keyword == null) keyword = "";
		try {

			String queryString = "SELECT fb FROM FeedBack AS fb WHERE fb.keyword like ? ";
			
			if(feedType != null)
				queryString += " AND fb.feedType =  " + feedType;
			
			if(errorType != null)
				queryString += " AND fb.errorType =  " + errorType;
			
			queryString += " ORDER BY fb.feedTime DESC ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
}