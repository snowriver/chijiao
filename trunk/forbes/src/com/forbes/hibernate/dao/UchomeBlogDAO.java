package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUchomeBlogDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeBlog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UchomeBlog
 * @author MyEclipse Persistence Tools
 */

public class UchomeBlogDAO extends BaseUchomeBlogDAO {
	private static final Log log = LogFactory.getLog(UchomeBlogDAO.class);
	// property constants
	
	public List findTopUchomeBlog(String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "blogid DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM UchomeBlog AS model";
			
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