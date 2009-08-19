package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserYearAimPlan;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserYearAimPlan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserYearAimPlan
 * @author MyEclipse Persistence Tools
 */

public class BaseUserYearAimPlanDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserYearAimPlanDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String YEAR = "year";
	public static final String QUARTER = "quarter";
	public static final String FIRST_MONTH = "firstMonth";
	public static final String SECOND_MONTH = "secondMonth";
	public static final String THIRD_MONTH = "thirdMonth";

	protected void initDao() {
		// do nothing
	}

	public void save(UserYearAimPlan transientInstance) {
		log.debug("saving UserYearAimPlan instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserYearAimPlan persistentInstance) {
		log.debug("deleting UserYearAimPlan instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserYearAimPlan findById(java.lang.Integer id) {
		log.debug("getting UserYearAimPlan instance with id: " + id);
		try {
			UserYearAimPlan instance = (UserYearAimPlan) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserYearAimPlan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserYearAimPlan instance) {
		log.debug("finding UserYearAimPlan instance by example");
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
		log.debug("finding UserYearAimPlan instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserYearAimPlan as model where model."
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

	public List findByQuarter(Object quarter) {
		return findByProperty(QUARTER, quarter);
	}

	public List findByFirstMonth(Object firstMonth) {
		return findByProperty(FIRST_MONTH, firstMonth);
	}

	public List findBySecondMonth(Object secondMonth) {
		return findByProperty(SECOND_MONTH, secondMonth);
	}

	public List findByThirdMonth(Object thirdMonth) {
		return findByProperty(THIRD_MONTH, thirdMonth);
	}

	public List findAll() {
		log.debug("finding all UserYearAimPlan instances");
		try {
			String queryString = "from UserYearAimPlan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserYearAimPlan merge(UserYearAimPlan detachedInstance) {
		log.debug("merging UserYearAimPlan instance");
		try {
			UserYearAimPlan result = (UserYearAimPlan) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserYearAimPlan instance) {
		log.debug("attaching dirty UserYearAimPlan instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserYearAimPlan instance) {
		log.debug("attaching clean UserYearAimPlan instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserYearAimPlanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserYearAimPlanDAO) ctx.getBean("UserYearAimPlanDAO");
	}
}