package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUserYearAimPlanDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserYearAimPlan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserYearAimPlan
 * @author MyEclipse Persistence Tools
 */

public class UserYearAimPlanDAO extends BaseUserYearAimPlanDAO {
	private static final Log log = LogFactory.getLog(UserYearAimPlanDAO.class);
	// property constants

	public int getCount(String userid, String year, String quarter) {

		try {
			String queryString = "SELECT COUNT(*) FROM UserYearAimPlan AS model "
								+ "WHERE model.userId = ? "
								+ "AND model.year = ? "
								+ "AND model.quarter = ? ";

			/*if (date != null) {
				queryString += " AND model.date = '" + date + "'";
			}*/

			// System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, year);
			query.setParameter(2, quarter);
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findYearAimPlan(String userid, String year, String quarter) {
		
		try {
			String queryString = "SELECT DISTINCT model FROM UserYearAimPlan AS model " 
					+ "WHERE model.userId = ? "
					+ "AND model.year = ? "
					+ "AND model.quarter = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, year);
			query.setParameter(2, quarter);
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}