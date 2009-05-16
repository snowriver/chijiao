package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseCdbThreadsDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * CdbThreads entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.CdbThreads
 * @author MyEclipse Persistence Tools
 */

public class CdbThreadsDAO extends BaseCdbThreadsDAO {
	private static final Log log = LogFactory.getLog(CdbThreadsDAO.class);
	// property constants
	
	public List findTopCdbThreads(String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "tid DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM CdbThreads AS model WHERE model.closed = 0 ";
			
			queryString += " ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			
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