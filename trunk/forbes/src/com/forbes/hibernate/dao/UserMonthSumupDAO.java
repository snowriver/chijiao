package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUserMonthSumupDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserMonthSumup entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserMonthSumup
 * @author MyEclipse Persistence Tools
 */

public class UserMonthSumupDAO extends BaseUserMonthSumupDAO {
	private static final Log log = LogFactory.getLog(UserMonthSumupDAO.class);
	// property constants
	
	public int getCount(String userid, String year, String month) {

		try {

			String queryString = "SELECT COUNT(*) FROM UserMonthSumup AS model "
								+ "WHERE model.userId = ? "
								+ "AND model.year = ? "
								+ "AND model.month = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, year);
			query.setParameter(2, month);
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	
	
	public List findMonthSumup(String userid, String year, String month) {
		
		try {
			String queryString = "SELECT DISTINCT model FROM UserMonthSumup AS model " 
					+ "WHERE model.userId = ? "
					+ "AND model.year = ? "
					+ "AND model.month = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, year);
			query.setParameter(2, month);
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}