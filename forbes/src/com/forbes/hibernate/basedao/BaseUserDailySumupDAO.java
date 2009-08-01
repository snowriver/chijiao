package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserDailySumup;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDailySumup entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserDailySumup
 * @author MyEclipse Persistence Tools
 */

public class BaseUserDailySumupDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserDailySumupDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String SN = "sn";
	public static final String ADVANCE = "advance";
	public static final String MEDITATE = "meditate";
	public static final String NOTE = "note";

	protected void initDao() {
		// do nothing
	}

	public void save(UserDailySumup transientInstance) {
		log.debug("saving UserDailySumup instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserDailySumup persistentInstance) {
		log.debug("deleting UserDailySumup instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserDailySumup findById(java.lang.Integer id) {
		log.debug("getting UserDailySumup instance with id: " + id);
		try {
			UserDailySumup instance = (UserDailySumup) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserDailySumup", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserDailySumup instance) {
		log.debug("finding UserDailySumup instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding UserDailySumup instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserDailySumup as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findBySn(Object sn) {
		return findByProperty(SN, sn);
	}

	public List findByAdvance(Object advance) {
		return findByProperty(ADVANCE, advance);
	}

	public List findByMeditate(Object meditate) {
		return findByProperty(MEDITATE, meditate);
	}

	public List findByNote(Object note) {
		return findByProperty(NOTE, note);
	}

	public List findAll() {
		log.debug("finding all UserDailySumup instances");
		try {
			String queryString = "from UserDailySumup";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserDailySumup merge(UserDailySumup detachedInstance) {
		log.debug("merging UserDailySumup instance");
		try {
			UserDailySumup result = (UserDailySumup) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserDailySumup instance) {
		log.debug("attaching dirty UserDailySumup instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserDailySumup instance) {
		log.debug("attaching clean UserDailySumup instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserDailySumupDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserDailySumupDAO) ctx.getBean("UserDailySumupDAO");
	}
}