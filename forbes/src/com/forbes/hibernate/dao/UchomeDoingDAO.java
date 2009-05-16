package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUchomeDoingDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeDoing entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UchomeDoing
 * @author MyEclipse Persistence Tools
 */

public class UchomeDoingDAO extends BaseUchomeDoingDAO {
	private static final Log log = LogFactory.getLog(UchomeDoingDAO.class);
	// property constants
	
	public List findTopUchomeDoing(String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "doid DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM UchomeDoing AS model";
			
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