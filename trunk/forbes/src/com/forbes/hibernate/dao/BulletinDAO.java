package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseBulletinDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Bulletin entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Bulletin
 * @author MyEclipse Persistence Tools
 */

public class BulletinDAO extends BaseBulletinDAO {
	private static final Log log = LogFactory.getLog(BulletinDAO.class);

	// property constants

	public int getCount(String keyword) {
		if (keyword == null)
			keyword = "";
		try {
			String queryString = "SELECT COUNT(*) FROM Bulletin AS model "
					+ "WHERE model.title LIKE ? ";
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%");
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findBulletinByPage(String keyword, String orderby, int beg,
			int len) {

		if (keyword == null)
			keyword = "";
		if (orderby == null || orderby.equals(""))
			orderby = "id DESC ";

		try {
			String queryString = "SELECT DISTINCT model FROM Bulletin AS model "
					+ "WHERE model.title LIKE ? ";
			queryString += " ORDER BY model." + orderby;
			// System.out.println("queryString = "+queryString);

			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%");

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findTopBulletin(String orderby, int beg, int len) {
		if (orderby == null || orderby.equals(""))
			orderby = "id DESC ";
		try {
			String queryString = "SELECT DISTINCT model FROM Bulletin AS model "
					+ "ORDER BY model." + orderby;
			//System.out.println("queryString = " + queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findNextBulletin(String id) {
		try {
			String queryString = "SELECT DISTINCT model FROM Bulletin AS model WHERE model.id is not null ";
			queryString += "AND model.id > " + id + " ORDER BY model.id ASC";
			// System.out.println("queryString = "+queryString);

			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setFirstResult(0);
			query.setMaxResults(1);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findPreBulletin(String id) {
		try {
			String queryString = "SELECT DISTINCT model FROM Bulletin AS model WHERE model.id is not null ";
			queryString += "AND model.id < " + id + " ORDER BY model.id DESC";
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