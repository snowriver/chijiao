package com.forbes.hibernate.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.basedao.BaseUserWeekAbilityDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserWeekAbility entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserWeekAbility
 * @author MyEclipse Persistence Tools
 */

public class UserWeekAbilityDAO extends BaseUserWeekAbilityDAO {
	private static final Log log = LogFactory.getLog(UserWeekAbilityDAO.class);
	// property constants

	public int getCount(String userid, String date) {

		try {

			String queryString = "SELECT COUNT(*) FROM UserWeekAbility AS model WHERE model.userId = ? "
								+ "AND model.date = ? ";

			/*if (date != null) {
				queryString += " AND model.date = '" + date + "'";
			}*/

			// System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, date);
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findWeekAbilityByPage(String userid, String date, int beg, int len) {
		try {
			String queryString = "SELECT DISTINCT model FROM UserWeekAbility AS model WHERE model.userId = ? "
								+ "AND model.date = ? ";
			/*if (date != null) {
				queryString += " AND model.date = '" + date + "'";
			}*/			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, date);
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findWeekAbility(String userid, String date) {
		
		try {
			String queryString = "SELECT DISTINCT model FROM UserWeekAbility AS model WHERE model.userId = ? "
					+ "AND model.date = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, date);
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}