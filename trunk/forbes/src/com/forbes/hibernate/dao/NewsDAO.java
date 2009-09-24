package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import com.forbes.hibernate.basedao.BaseNewsDAO;

/**
 * A data access object (DAO) providing persistence and search support for News
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.News
 * @author MyEclipse Persistence Tools
 */

public class NewsDAO extends BaseNewsDAO {
	private static final Log log = LogFactory.getLog(NewsDAO.class);
	// property constants
	
	public int getCount(String keyword) {
		
		if (keyword == null) keyword = "";
		
		try {

			String queryString = "SELECT COUNT(*) FROM News AS model WHERE (model.title LIKE ? ) ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findNewsByPage( String keyword, String orderby, int beg, int len ) {
		
		if (keyword == null) keyword = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM News AS model WHERE (model.title LIKE ? ) ";
			queryString += "ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findTopNews(String orderby, int beg, int len) {

		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM News AS model ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findNewsById(String likeid, String orderby, int beg, int len) {
		
		if (likeid == null) likeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM News AS model WHERE model.isdelete = 'N' ";

			if(likeid != null && likeid.length() > 0)
				queryString += "AND ( model.id in( " + likeid  + " ) )";
			
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
	
	
	
	public List findNextNews(String id) {
		
		//if (typeid == null) typeid = "";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM News AS model WHERE model.isdelete = 'N' ";			
			/*if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType = " + typeid  + " ) ";*/
			
			queryString += "AND model.id > " + id +" ORDER BY model.id ASC";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);	
			query.setFirstResult(0);
			query.setMaxResults(1);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findPreNews(String id) {
		
		//if (typeid == null) typeid = "";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM News AS model WHERE model.isdelete = 'N' ";			
			/*if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType = " + typeid  + " ) ";*/
			
			queryString += "AND model.id < " + id +" ORDER BY model.id DESC";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setFirstResult(0);
			query.setMaxResults(1);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}