package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUserLevelDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLevel entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserLevel
 * @author MyEclipse Persistence Tools
 */

public class UserLevelDAO extends BaseUserLevelDAO {
	private static final Log log = LogFactory.getLog(UserLevelDAO.class);
	// property constants
	
	public int getCount(String keyword) {
		try {
			if (keyword == null) keyword = "";
			
			//String queryString = "SELECT COUNT(*) FROM UserLevel AS model WHERE model.title LIKE ? ";
			String queryString = "SELECT COUNT(*) FROM UserLevel AS model ";			
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findUserLevelByPage(String keyword, int beg, int len) {
		try {			
			//String queryString = "SELECT DISTINCT model FROM UserLevel AS model WHERE model.title LIKE ? ";
			String queryString = "SELECT DISTINCT model FROM UserLevel AS model ";
			
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, "%" + keyword + "%" );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}