package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserLevelPromotion;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLevelPromotion entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserLevelPromotion
 * @author MyEclipse Persistence Tools
 */

public class BaseUserLevelPromotionDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(BaseUserLevelPromotionDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String LEVEL = "level";
	public static final String LEVEL_TITLE = "levelTitle";

	public void save(UserLevelPromotion transientInstance) {
		log.debug("saving UserLevelPromotion instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserLevelPromotion persistentInstance) {
		log.debug("deleting UserLevelPromotion instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserLevelPromotion findById(java.lang.Integer id) {
		log.debug("getting UserLevelPromotion instance with id: " + id);
		try {
			UserLevelPromotion instance = (UserLevelPromotion) getSession()
					.get("com.forbes.hibernate.bean.UserLevelPromotion", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserLevelPromotion instance) {
		log.debug("finding UserLevelPromotion instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserLevelPromotion").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding UserLevelPromotion instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserLevelPromotion as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByLevel(Object level) {
		return findByProperty(LEVEL, level);
	}

	public List findByLevelTitle(Object levelTitle) {
		return findByProperty(LEVEL_TITLE, levelTitle);
	}

	public List findAll() {
		log.debug("finding all UserLevelPromotion instances");
		try {
			String queryString = "from UserLevelPromotion";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserLevelPromotion merge(UserLevelPromotion detachedInstance) {
		log.debug("merging UserLevelPromotion instance");
		try {
			UserLevelPromotion result = (UserLevelPromotion) getSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserLevelPromotion instance) {
		log.debug("attaching dirty UserLevelPromotion instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserLevelPromotion instance) {
		log.debug("attaching clean UserLevelPromotion instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}