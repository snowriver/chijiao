package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUchomeMtagDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeMtag entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UchomeMtag
 * @author MyEclipse Persistence Tools
 */

public class UchomeMtagDAO extends BaseUchomeMtagDAO {
	private static final Log log = LogFactory.getLog(UchomeMtagDAO.class);
	// property constants
	
	public List findTopUchomeMtag(String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "tagid DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM UchomeMtag AS model WHERE model.close = 0 ";
			
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