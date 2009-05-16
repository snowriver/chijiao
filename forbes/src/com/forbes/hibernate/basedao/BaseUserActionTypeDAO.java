package com.forbes.hibernate.basedao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserActionType;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserActionType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserActionType
 * @author MyEclipse Persistence Tools
 */

public class BaseUserActionTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserActionTypeDAO.class);
	// property constants
	public static final String ACTION_NAME = "actionName";
	public static final String DESCS = "descs";

	public void save(UserActionType transientInstance) {
		log.debug("saving UserActionType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserActionType persistentInstance) {
		log.debug("deleting UserActionType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserActionType findById(java.lang.Short id) {
		log.debug("getting UserActionType instance with id: " + id);
		try {
			UserActionType instance = (UserActionType) getSession().get(
					"com.forbes.hibernate.bean.UserActionType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserActionType instance) {
		log.debug("finding UserActionType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserActionType").add(
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
		log.debug("finding UserActionType instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserActionType as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByActionName(Object actionName) {
		return findByProperty(ACTION_NAME, actionName);
	}

	public List findByDescs(Object descs) {
		return findByProperty(DESCS, descs);
	}

	public List findAll() {
		log.debug("finding all UserActionType instances");
		try {
			String queryString = "from UserActionType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserActionType merge(UserActionType detachedInstance) {
		log.debug("merging UserActionType instance");
		try {
			UserActionType result = (UserActionType) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserActionType instance) {
		log.debug("attaching dirty UserActionType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserActionType instance) {
		log.debug("attaching clean UserActionType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}