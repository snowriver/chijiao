package com.forbes.hibernate.dao;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.forbes.hibernate.basedao.BaseArticleDAO;
import com.forbes.hibernate.bean.Article;

/**
 * A data access object (DAO) providing persistence and search support for
 * ArticleList entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Article
 * @author MyEclipse Persistence Tools
 */

public class ArticleDAO extends BaseArticleDAO {
	private static final Log log = LogFactory.getLog(ArticleDAO.class);
	// property constants
	
	public int getCount(String deleteFlag, String userid, String typeid, String isverify, String keyword) {
		
		if (keyword == null) keyword = "";
		
		try {

			String queryString = "SELECT COUNT(*) FROM Article AS model WHERE model.isdelete = ? " +
					"AND (model.title LIKE ? OR model.description LIKE ? ) ";
			
			if(userid != null && !userid.equals(""))
				queryString += "AND model.user = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType in (" + typeid  + ") OR model.articleType2 in (" + typeid  + ") ) ";
			if(isverify != null && isverify.length() >0)
				queryString += "AND model.isverify in (" + isverify + ") ";
			
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findArticleByPage(String deleteFlag, String userid, String typeid, String isverify, String keyword, String orderby, int beg, int len) {
		
		if (keyword == null) keyword = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Article AS model WHERE model.isdelete = ? " +
					"AND (model.title LIKE ? OR model.description LIKE ? ) ";

			if(userid != null && !userid.equals(""))
				queryString += "AND model.user = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType in (" + typeid  + ") OR model.articleType2 in (" + typeid  + ") ) ";
			if(isverify != null && isverify.length() >0)
				queryString += "AND model.isverify in (" + isverify + ") ";
			queryString += " ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
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
	
	public List findTopArticleByArticleType(String typeid, String orderby, int beg, int len) {
		
		if (typeid == null) typeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Article AS model WHERE model.isdelete = 'N'  AND model.isverify > 0 ";

			if(typeid != null && typeid.length() > 0)
				queryString += "AND ( model.articleType in( " + typeid  + " ) )";
			
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
	
	public List findNextArticle(String id) {
		
		//if (typeid == null) typeid = "";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Article AS model WHERE model.isdelete = 'N' AND model.isverify > 0 ";			
			/*if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType = " + typeid  + " ) ";*/
			
			queryString += "AND model.id > " + id +" ORDER BY model.id ASC";
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);	
			query.setFirstResult(0);
			query.setMaxResults(1);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findPreArticle(String id) {
		
		//if (typeid == null) typeid = "";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Article AS model WHERE model.isdelete = 'N' AND model.isverify > 0 ";			
			/*if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.articleType = " + typeid  + " ) ";*/
			
			queryString += "AND model.id < " + id +" ORDER BY model.id DESC";
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setFirstResult(0);
			query.setMaxResults(1);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findArticleById(String likeid, String orderby, int beg, int len) {
		
		if (likeid == null) likeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Article AS model WHERE model.isdelete = 'N' ";

			if(likeid != null && likeid.length() > 0)
				queryString += "AND ( model.id in( " + likeid  + " ) )";
			
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
	
	public List getAllArticleid() {
		
		try {			
			String queryString = "SELECT DISTINCT model.id FROM Article AS model WHERE model.isdelete = 'N' ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);			

			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

}