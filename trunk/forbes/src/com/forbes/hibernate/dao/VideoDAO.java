package com.forbes.hibernate.dao;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseVideoDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * VideoList entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Video
 * @author MyEclipse Persistence Tools
 */

public class VideoDAO extends BaseVideoDAO {
	private static final Log log = LogFactory.getLog(VideoDAO.class);
	// property constants
	
	public int getCount(String deleteFlag, String userid, String typeid, String keyword) {
		
		if (keyword == null) keyword = "";
		
		try {

			String queryString = "SELECT COUNT(*) FROM Video AS model WHERE model.isdelete = ? " +
					"AND (model.title LIKE ? OR model.description LIKE ? OR model.writer LIKE ? OR model.source LIKE ? ) ";
			
			if(userid != null && !userid.equals(""))
				queryString += "AND model.user = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.videoType = " + typeid  + " OR model.videoType2 = " + typeid + " ) ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			query.setParameter(3, "%" + keyword + "%" );
			query.setParameter(4, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findVideoByPage(String deleteFlag, String userid, String typeid, String keyword, String orderby, int beg, int len) {
		
		if (keyword == null) keyword = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Video AS model WHERE model.isdelete = ? " +
					"AND (model.title LIKE ? OR model.description LIKE ? OR model.writer LIKE ? OR model.source LIKE ? ) ";

			if(userid != null && !userid.equals(""))
				queryString += "AND model.user = " + userid + " ";
			if(typeid != null && !typeid.equals(""))
				queryString += "AND ( model.videoType = " + typeid  + " OR model.videoType2 = " + typeid + " ) ";
			queryString += "ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, (deleteFlag==null || deleteFlag.equals(""))?"N":deleteFlag );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			query.setParameter(3, "%" + keyword + "%" );
			query.setParameter(4, "%" + keyword + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findTopVideoeByVideoType(String typeid, String orderby, int beg, int len) {
		
		if (typeid == null) typeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Video AS model WHERE model.isdelete = 'N' ";

			if(typeid != null && typeid.length() > 0)
				queryString += "AND ( model.videoType = " + typeid  + " ) ";
			
			queryString += "ORDER BY model." + orderby;
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findVideoById(String likeid, String orderby, int beg, int len) {
		
		if (likeid == null) likeid = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM Video AS model WHERE model.isdelete = 'N' ";

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
}