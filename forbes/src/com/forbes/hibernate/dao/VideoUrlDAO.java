package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseVideoUrlDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * VideoUrl entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.VideoUrl
 * @author MyEclipse Persistence Tools
 */

public class VideoUrlDAO extends BaseVideoUrlDAO {
	private static final Log log = LogFactory.getLog(VideoUrlDAO.class);
	// property constants
	
	public int getCount(String videoid, String keyword) {
		try {
			if (keyword == null) keyword = "";
			
			String queryString = "SELECT COUNT(*) FROM VideoUrl AS model WHERE model.video = ? " +
								 "AND model.title LIKE ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, videoid );
			query.setParameter(1, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findVideoUrlByPage(String videoid, String keyword, String orderby, int beg, int len) {
		
		try {

			if (keyword == null) keyword = "";
			if (orderby == null || orderby.equals("")) orderby = "id ASC ";
			
			String queryString = "SELECT DISTINCT model FROM VideoUrl AS model WHERE model.video = ? " +
								 "AND model.title LIKE ? ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, videoid );
			query.setParameter(1, "%" + keyword + "%" );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}