package com.forbes.hibernate.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseAskDAO;

/**
 * A data access object (DAO) providing persistence and search support for Ask
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.Ask
 * @author MyEclipse Persistence Tools
 */

public class AskDAO extends BaseAskDAO {
	private static final Log log = LogFactory.getLog(AskDAO.class);
	
	public int getCount( String userid, String typeid, String status, String keyword) {
		
		if (keyword == null) keyword = "";
		
		try {

			String queryString = "SELECT COUNT(*) FROM Ask AS model WHERE (model.title LIKE ? OR model.typeName LIKE ? OR model.typeName2 LIKE ? ) ";
			
			if(userid != null && !userid.equals(""))
				queryString += "AND model.userId = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.askType in (" + typeid  + ") OR model.askType2 in (" + typeid  + ") )";
			if(status != null && !status.equals(""))
				queryString += "AND model.status in ( " + status + ") ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
			query.setParameter(0, "%" + keyword + "%" );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int getCountByAnswer( String userid ) {
		
		try {

			String queryString = "SELECT COUNT(DISTINCT ask.id) FROM Ask AS ask, AskAnswer AS answer " +
					" WHERE answer.ask = ask AND answer.userId = " + userid;
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findAskByPage(String userid, String typeid, String status, String keyword, String orderby, int beg, int len) {
		
		if (keyword == null) keyword = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Ask AS model WHERE (model.title LIKE ? OR model.typeName LIKE ? OR model.typeName2 LIKE ? ) ";

			if(userid != null && !userid.equals(""))
				queryString += "AND model.userId = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.askType in (" + typeid  + ") OR model.askType2 in (" + typeid  + ") )";
			if(status != null && !status.equals(""))
				queryString += "AND model.status in ( " + status + ") ";
			
			queryString += " ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
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
	
	
	public List findAskByAnswerAndPage(String userid, String orderby, int beg, int len) {

		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT ask FROM Ask AS ask , AskAnswer AS answer " +
								 "WHERE answer.ask = ask AND answer.userId = " + userid;
		
			
			queryString += " ORDER BY ask." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findTopAsk(String typeid, String status, String orderby, int beg, int len) {
		
		if (typeid == null) typeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Ask AS model WHERE model.id is not null ";

			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.askType = " + typeid  + " ) ";
			if(status != null && !status.equals(""))
				queryString += "AND model.status in (" + status  + " ) ";
			
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
}