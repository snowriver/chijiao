package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserLevel;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLevel entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserLevel
 * @author MyEclipse Persistence Tools
 */

public class BaseUserLevelDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserLevelDAO.class);
	// property constants
	public static final String LEVEL = "level";
	public static final String START_SCORE = "startScore";
	public static final String END_SCORE = "endScore";
	public static final String TITLE = "title";

	public void save(UserLevel transientInstance) {
		log.debug("saving UserLevel instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserLevel persistentInstance) {
		log.debug("deleting UserLevel instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserLevel findById(java.lang.Short id) {
		log.debug("getting UserLevel instance with id: " + id);
		try {
			UserLevel instance = (UserLevel) getSession().get(
					"com.forbes.hibernate.bean.UserLevel", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserLevel instance) {
		log.debug("finding UserLevel instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserLevel").add(
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
		log.debug("finding UserLevel instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserLevel as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLevel(Object level) {
		return findByProperty(LEVEL, level);
	}

	public List findByStartScore(Object startScore) {
		return findByProperty(START_SCORE, startScore);
	}

	public List findByEndScore(Object endScore) {
		return findByProperty(END_SCORE, endScore);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findAll() {
		log.debug("finding all UserLevel instances");
		try {
			String queryString = "from UserLevel";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserLevel merge(UserLevel detachedInstance) {
		log.debug("merging UserLevel instance");
		try {
			UserLevel result = (UserLevel) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserLevel instance) {
		log.debug("attaching dirty UserLevel instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserLevel instance) {
		log.debug("attaching clean UserLevel instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}