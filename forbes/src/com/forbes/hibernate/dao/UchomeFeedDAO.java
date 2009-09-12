package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.forbes.hibernate.basedao.BaseUchomeFeedDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeFeed entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UchomeFeed
 * @author MyEclipse Persistence Tools
 */

public class UchomeFeedDAO extends BaseUchomeFeedDAO {
	private static final Log log = LogFactory.getLog(UchomeFeedDAO.class);
	// property constants
	
	public List findTopUchomeFeed(String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "feedid DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM UchomeFeed AS model";
			
			queryString += " ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}