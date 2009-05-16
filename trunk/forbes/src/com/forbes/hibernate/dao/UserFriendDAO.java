package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUserFriendDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserFriend entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserFriend
 * @author MyEclipse Persistence Tools
 */

public class UserFriendDAO extends BaseUserFriendDAO {
	private static final Log log = LogFactory.getLog(UserFriendDAO.class);
	// property constants
	
	public int getCount(String userId) {
		try {
    		
			String queryString = "SELECT COUNT(*) FROM UserFriend AS model WHERE model.userId = ? ";
			
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userId );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int getCount(Integer userId, Integer friendId) {
		
		try {
			String queryString = "SELECT COUNT(*) FROM UserFriend AS model WHERE model.friend = ? AND model.userId = ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, friendId );
			query.setParameter(1, userId );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findUserFriendByPage(String userId, String orderBy, int beg, int len) {
		try {
			
			String queryString = "SELECT DISTINCT model FROM UserFriend AS model WHERE model.userId = ? ";
			if( orderBy!= null && orderBy.length()>0 )
				queryString += "ORDER BY " + orderBy;
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userId );

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}