package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserMonthSumup;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserMonthSumup entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserMonthSumup
 * @author MyEclipse Persistence Tools
 */

public class BaseUserMonthSumupDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserMonthSumupDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String YEAR = "year";
	public static final String MONTH = "month";
	public static final String AIM = "aim";
	public static final String GAIN = "gain";
	public static final String CHALLENGE = "challenge";
	public static final String IMPROVE = "improve";
	public static final String ANALYSE = "analyse";

	protected void initDao() {
		// do nothing
	}

	public void save(UserMonthSumup transientInstance) {
		log.debug("saving UserMonthSumup instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserMonthSumup persistentInstance) {
		log.debug("deleting UserMonthSumup instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserMonthSumup findById(java.lang.Integer id) {
		log.debug("getting UserMonthSumup instance with id: " + id);
		try {
			UserMonthSumup instance = (UserMonthSumup) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserMonthSumup", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserMonthSumup instance) {
		log.debug("finding UserMonthSumup instance by example");
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
		log.debug("finding UserMonthSumup instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserMonthSumup as model where model."
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

	public List findByYear(Object year) {
		return findByProperty(YEAR, year);
	}

	public List findByMonth(Object month) {
		return findByProperty(MONTH, month);
	}

	public List findByAim(Object aim) {
		return findByProperty(AIM, aim);
	}

	public List findByGain(Object gain) {
		return findByProperty(GAIN, gain);
	}

	public List findByChallenge(Object challenge) {
		return findByProperty(CHALLENGE, challenge);
	}

	public List findByImprove(Object improve) {
		return findByProperty(IMPROVE, improve);
	}

	public List findByAnalyse(Object analyse) {
		return findByProperty(ANALYSE, analyse);
	}

	public List findAll() {
		log.debug("finding all UserMonthSumup instances");
		try {
			String queryString = "from UserMonthSumup";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserMonthSumup merge(UserMonthSumup detachedInstance) {
		log.debug("merging UserMonthSumup instance");
		try {
			UserMonthSumup result = (UserMonthSumup) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserMonthSumup instance) {
		log.debug("attaching dirty UserMonthSumup instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserMonthSumup instance) {
		log.debug("attaching clean UserMonthSumup instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserMonthSumupDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserMonthSumupDAO) ctx.getBean("UserMonthSumupDAO");
	}
}