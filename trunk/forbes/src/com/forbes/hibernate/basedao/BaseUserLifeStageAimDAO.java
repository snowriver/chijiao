package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.forbes.hibernate.bean.UserLifeStageAim;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserLifeStageAim entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserLifeStageAim
 * @author MyEclipse Persistence Tools
 */

public class BaseUserLifeStageAimDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserLifeStageAimDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String YEARS = "years";
	public static final String AIM = "aim";

	protected void initDao() {
		// do nothing
	}

	public void save(UserLifeStageAim transientInstance) {
		log.debug("saving UserLifeStageAim instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserLifeStageAim persistentInstance) {
		log.debug("deleting UserLifeStageAim instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserLifeStageAim findById(java.lang.Integer id) {
		log.debug("getting UserLifeStageAim instance with id: " + id);
		try {
			UserLifeStageAim instance = (UserLifeStageAim) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserLifeStageAim", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserLifeStageAim instance) {
		log.debug("finding UserLifeStageAim instance by example");
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
		log.debug("finding UserLifeStageAim instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserLifeStageAim as model where model."
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

	public List findByAim(Object aim) {
		return findByProperty(AIM, aim);
	}

	public List findByYears(Object years) {
		return findByProperty(YEARS, years);
	}
	
	public List findAll() {
		log.debug("finding all UserLifeStageAim instances");
		try {
			String queryString = "from UserLifeStageAim";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserLifeStageAim merge(UserLifeStageAim detachedInstance) {
		log.debug("merging UserLifeStageAim instance");
		try {
			UserLifeStageAim result = (UserLifeStageAim) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserLifeStageAim instance) {
		log.debug("attaching dirty UserLifeStageAim instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserLifeStageAim instance) {
		log.debug("attaching clean UserLifeStageAim instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserLifeStageAimDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserLifeStageAimDAO) ctx.getBean("UserLifeStageAimDAO");
	}
}