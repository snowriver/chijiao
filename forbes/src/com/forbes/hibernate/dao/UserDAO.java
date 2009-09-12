package com.forbes.hibernate.dao;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

import com.forbes.hibernate.basedao.BaseUserDAO;

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

public class UserDAO extends BaseUserDAO {
	private static final Log log = LogFactory.getLog(UserDAO.class);
	// property constants
	
	public int getCount(String type, String keyword) {
		try {
			if( keyword == null ) keyword = "";
    		
			String queryString = "SELECT COUNT(*) FROM User AS model WHERE model.deleteFlag = 'N' " +
								 "AND ( model.loginName LIKE ? OR model.name LIKE ? OR model.email LIKE ? ) ";			
			
			if( type!= null && type.length()>0 )
				queryString += "AND model.type = '" + type + "' ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyword + "%" );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findUserByPage(String type, String keyword, String orderBy, int beg, int len) {
		try {
			if( keyword == null ) keyword = "";
			if (orderBy == null || orderBy.equals("")) orderBy = "id DESC ";
			
			String queryString = "SELECT DISTINCT model FROM User AS model WHERE model.deleteFlag = 'N' " +
								 "AND ( model.loginName LIKE ? OR model.name LIKE ? OR model.email LIKE ? ) ";
			if( type!= null && type.length()>0 )
				queryString += "AND model.type = '" + type + "' ";
			if( orderBy!= null && orderBy.length()>0 )
				queryString += "ORDER BY model." + orderBy;
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyword + "%" );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findUser(String inType, String loginName) {
		try {
			String queryString = "SELECT DISTINCT model FROM User AS model WHERE model.deleteFlag = 'N' AND model.type in(" + inType + ") " +
								 "AND model.loginName = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, inType );
			query.setParameter(0, loginName );
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public int getCount(String inType, String propertyName, Object value) {
		try {
			String queryString = "SELECT COUNT(*) FROM User AS model WHERE model.deleteFlag = 'N' AND model.type in(" + inType + ") " +
								 "AND model." +  propertyName + "= ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, inType );
			query.setParameter(0, value );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

}