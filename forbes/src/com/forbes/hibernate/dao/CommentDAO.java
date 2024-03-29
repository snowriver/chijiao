package com.forbes.hibernate.dao;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseCommentDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Comment
 * @author MyEclipse Persistence Tools
 */

public class CommentDAO extends BaseCommentDAO {
	private static final Log log = LogFactory.getLog(CommentDAO.class);
	// property constants
	
	public int getCount(Short commentType, Integer objectId) {
		
		try {
			String queryString = "SELECT COUNT(*) FROM Comment AS model WHERE model.commentType = ? AND model.objectId = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, commentType );
			query.setParameter(1, objectId );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findCommentByPage(Short commentType, Integer objectId, String orderby, int beg, int len) {
	
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Comment AS model WHERE model.commentType = ? AND model.objectId = ? ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, commentType );
			query.setParameter(1, objectId );

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findComment(Short commentType, Integer objectId, String orderby, int beg, int len) {

		if (orderby == null || orderby.equals("")) orderby = "pubdate DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Comment AS model WHERE model.commentType = ? AND model.objectId = ? " +
					" ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, commentType );
			query.setParameter(1, objectId );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findComment(Short commentType, Integer objectId) {
		try {			
			String queryString = "SELECT DISTINCT model FROM Comment AS model WHERE model.commentType = ? AND model.objectId = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, commentType );
			query.setParameter(1, objectId );
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public int getCount(Integer userId, Short commentType, Integer objectId) {
		try {			
			String queryString = "SELECT COUNT(*)  FROM Comment AS model WHERE model.user = ? AND model.commentType = ? AND model.objectId = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userId );
			query.setParameter(1, commentType );
			query.setParameter(2, objectId );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}