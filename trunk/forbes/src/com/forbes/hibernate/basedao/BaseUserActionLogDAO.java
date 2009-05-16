package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserActionLog;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserActionLog entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserActionLog
 * @author MyEclipse Persistence Tools
 */

public class BaseUserActionLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserActionLogDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String ACTION_DATA = "actionData";
	public static final String DESCS = "descs";

	public void save(UserActionLog transientInstance) {
		log.debug("saving UserActionLog instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserActionLog persistentInstance) {
		log.debug("deleting UserActionLog instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserActionLog findById(java.lang.Integer id) {
		log.debug("getting UserActionLog instance with id: " + id);
		try {
			UserActionLog instance = (UserActionLog) getSession().get(
					"com.forbes.hibernate.bean.UserActionLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserActionLog instance) {
		log.debug("finding UserActionLog instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserActionLog").add(
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
		log.debug("finding UserActionLog instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserActionLog as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByActionData(Object actionData) {
		return findByProperty(ACTION_DATA, actionData);
	}

	public List findByDescs(Object descs) {
		return findByProperty(DESCS, descs);
	}

	public List findAll() {
		log.debug("finding all UserActionLog instances");
		try {
			String queryString = "from UserActionLog";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserActionLog merge(UserActionLog detachedInstance) {
		log.debug("merging UserActionLog instance");
		try {
			UserActionLog result = (UserActionLog) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserActionLog instance) {
		log.debug("attaching dirty UserActionLog instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserActionLog instance) {
		log.debug("attaching clean UserActionLog instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}