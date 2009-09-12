package com.forbes.hibernate.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUserLevelPromotionDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLevelPromotion entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserLevelPromotion
 * @author MyEclipse Persistence Tools
 */

public class UserLevelPromotionDAO extends BaseUserLevelPromotionDAO {
	private static final Log log = LogFactory.getLog(UserLevelPromotionDAO.class);
	// property constants
	
	public List findUserLevelPromotionByPage( int beg, int len) {
		try {

			//if (orderBy == null || orderBy.equals("")) orderBy = "promotDate DESC ";
			
			String queryString = "SELECT DISTINCT model FROM UserLevelPromotion AS model ORDER BY model.promotDate DESC ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			
			//System.out.println("size = "+query.list().size());
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}