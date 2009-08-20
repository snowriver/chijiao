package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUserLifeStageAimDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLifeStageAim entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserLifeStageAim
 * @author MyEclipse Persistence Tools
 */

public class UserLifeStageAimDAO extends BaseUserLifeStageAimDAO {
	private static final Log log = LogFactory.getLog(UserLifeStageAimDAO.class);
	// property constants
	
	public int getCount(String userid, String years) {

		try {
			String queryString = "SELECT COUNT(*) FROM UserLifeStageAim AS model "
								+ "WHERE model.userId = ? AND model.years = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, years);
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findLifeStageAim(String userid, String years) {		
		try {
			String queryString = "SELECT DISTINCT model FROM UserLifeStageAim AS model " 
					+ "WHERE model.userId = ? AND model.years = ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userid);
			query.setParameter(1, years);
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}