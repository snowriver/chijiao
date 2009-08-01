package com.forbes.hibernate.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.basedao.BaseUserDailyAccreditDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDailyAccredit entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserDailyAccredit
 * @author MyEclipse Persistence Tools
 */

public class UserDailyAccreditDAO extends BaseUserDailyAccreditDAO {
	private static final Log log = LogFactory
			.getLog(UserDailyAccreditDAO.class);
	// property constants
	
	public int getCount(String userid, String date, String iscomplete,
			String keyword) {

		if (keyword == null)
			keyword = "";

		try {

			String queryString = "SELECT COUNT(*) FROM UserDailyAccredit AS model WHERE model.userId = ? "
					+ "AND (model.title LIKE ? OR model.content LIKE ? ) ";

			if (date != null) {
				queryString += " AND model.date = '" + date + "'";
			} 

			if (iscomplete != null && iscomplete.length() > 0)
				queryString += " AND model.iscomplete = " + iscomplete;

			// System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");

			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findDailyAccreditByPage(String userid, String date,
			String iscomplete, String keyword, String orderby, int beg, int len) {

		if (keyword == null)
			keyword = "";
		if (orderby == null || orderby.equals(""))
			orderby = "sn ASC ";

		try {
			String queryString = "SELECT DISTINCT model FROM UserDailyAccredit AS model WHERE model.userId = ? "
					+ "AND (model.title LIKE ? OR model.content LIKE ? ) ";

			if (date != null) {
				queryString += " AND model.date = '" + date + "'";
			} 
			if (iscomplete != null && !iscomplete.equals(""))
				queryString += " AND model.iscomplete = " + iscomplete;
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}