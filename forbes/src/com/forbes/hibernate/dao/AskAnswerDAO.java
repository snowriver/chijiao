package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseAskAnswerDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * AskAnswer entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.AskAnswer
 * @author MyEclipse Persistence Tools
 */

public class AskAnswerDAO extends BaseAskAnswerDAO {
	private static final Log log = LogFactory.getLog(AskAnswerDAO.class);
	// property constants
	
	
	public int getCount(Integer askId) {
		
		try {
			String queryString = "SELECT COUNT(*) FROM AskAnswer AS model WHERE model.ask = ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, askId );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int getCount(Integer userId, Integer askId) {
		
		try {
			String queryString = "SELECT COUNT(*) FROM AskAnswer AS model WHERE model.ask = ? AND model.userId = ? ";
			//System.out.println(" 1 -> queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, askId );
			query.setParameter(1, userId );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findAskAnswerByPage(Integer askId, String orderby, int beg, int len) {
	
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM AskAnswer AS model WHERE model.ask = ? ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, askId );

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findAskAnswerByAsk(Integer askId, String orderby, int beg, int len) {

		if (orderby == null || orderby.equals("")) orderby = "pubdate DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM AskAnswer AS model WHERE model.ask = ? " +
					" ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);	
			query.setParameter(0, askId );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findAskAnswerByAsk(Integer askId) {
		try {			
			String queryString = "SELECT DISTINCT model FROM AskAnswer AS model WHERE model.ask = ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);	
			query.setParameter(0, askId );
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}