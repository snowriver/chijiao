package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserDailyAccredit;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDailyAccredit entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserDailyAccredit
 * @author MyEclipse Persistence Tools
 */

public class BaseUserDailyAccreditDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(BaseUserDailyAccreditDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String SN = "sn";
	public static final String RECEIVER = "receiver";
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String IS_COMPLETE = "isComplete";
	public static final String NOTE = "note";

	protected void initDao() {
		// do nothing
	}

	public void save(UserDailyAccredit transientInstance) {
		log.debug("saving UserDailyAccredit instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserDailyAccredit persistentInstance) {
		log.debug("deleting UserDailyAccredit instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserDailyAccredit findById(java.lang.Integer id) {
		log.debug("getting UserDailyAccredit instance with id: " + id);
		try {
			UserDailyAccredit instance = (UserDailyAccredit) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserDailyAccredit", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserDailyAccredit instance) {
		log.debug("finding UserDailyAccredit instance by example");
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
		log.debug("finding UserDailyAccredit instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserDailyAccredit as model where model."
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

	public List findByReceiver(Object receiver) {
		return findByProperty(RECEIVER, receiver);
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
		log.debug("finding all UserDailyAccredit instances");
		try {
			String queryString = "from UserDailyAccredit";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserDailyAccredit merge(UserDailyAccredit detachedInstance) {
		log.debug("merging UserDailyAccredit instance");
		try {
			UserDailyAccredit result = (UserDailyAccredit) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserDailyAccredit instance) {
		log.debug("attaching dirty UserDailyAccredit instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserDailyAccredit instance) {
		log.debug("attaching clean UserDailyAccredit instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserDailyAccreditDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserDailyAccreditDAO) ctx.getBean("UserDailyAccreditDAO");
	}
}