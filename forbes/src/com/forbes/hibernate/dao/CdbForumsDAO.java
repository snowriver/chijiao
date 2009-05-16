package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseCdbForumsDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * CdbForums entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.CdbForums
 * @author MyEclipse Persistence Tools
 */

public class CdbForumsDAO extends BaseCdbForumsDAO {
	private static final Log log = LogFactory.getLog(CdbForumsDAO.class);
	// property constants
	
	public List findTopCdbForums(String fup, String type, String status, String orderby, int beg, int len) {
		
		if (orderby == null || orderby.equals("")) orderby = "fid DESC ";
		if (status == null || status.equals("")) status = "";
		
		try {
			String queryString = "SELECT DISTINCT model FROM CdbForums AS model WHERE " +
					"model.type = '" + type + "' AND model.status IN (" + status + ") ";
			
			if (fup != null && fup.equals("0")) 
				queryString += "AND model.fup = 0 ";
			if (fup != null && fup.equals("1")) 
				queryString += "AND model.fup > 0 ";
			
			queryString += " ORDER BY model." + orderby +" DESC";
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