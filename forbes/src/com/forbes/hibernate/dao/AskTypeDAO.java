package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseAskTypeDAO;

/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.User
 * @author MyEclipse Persistence Tools
 */

public class AskTypeDAO extends BaseAskTypeDAO {
	private static final Log log = LogFactory.getLog(AskTypeDAO.class);
	// property constants
	
	public int getCount(String pid) {
		try {

			String queryString = "SELECT COUNT(*) FROM AskType AS model WHERE model.id > 0 AND model.pid = ? ";			
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, pid );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findAskTypeByPage(String pid, int beg, int len) {
		try {			
			String queryString = "SELECT DISTINCT model FROM AskType AS model WHERE model.id > 0 AND model.pid = ? ORDER BY model.disorder ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, pid );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
}