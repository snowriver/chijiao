package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserDailyPlan;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDailyPlan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserDailyPlan
 * @author MyEclipse Persistence Tools
 */

public class BaseUserDailyPlanDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(BaseUserDailyPlanDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String SN = "sn";
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String IS_COMPLETE = "isComplete";
	public static final String NOTE = "note";

	public void save(UserDailyPlan transientInstance) {
		log.debug("saving UserDailyPlan instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserDailyPlan persistentInstance) {
		log.debug("deleting UserDailyPlan instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserDailyPlan findById(java.lang.Integer id) {
		log.debug("getting UserDailyPlan instance with id: " + id);
		try {
			UserDailyPlan instance = (UserDailyPlan) getSession().get(
					"com.forbes.hibernate.bean.UserDailyPlan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserDailyPlan instance) {
		log.debug("finding UserDailyPlan instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserDailyPlan").add(
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
		log.debug("finding UserDailyPlan instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserDailyPlan as model where model."
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

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByIsComplete(Object isComplete) {
		return findByProperty(IS_COMPLETE, isComplete);
	}

	public List findByNote(Object note) {
		return findByProperty(NOTE, note);
	}

	public List findAll() {
		log.debug("finding all UserDailyPlan instances");
		try {
			String queryString = "from UserDailyPlan";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserDailyPlan merge(UserDailyPlan detachedInstance) {
		log.debug("merging UserDailyPlan instance");
		try {
			UserDailyPlan result = (UserDailyPlan) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserDailyPlan instance) {
		log.debug("attaching dirty UserDailyPlan instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserDailyPlan instance) {
		log.debug("attaching clean UserDailyPlan instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}