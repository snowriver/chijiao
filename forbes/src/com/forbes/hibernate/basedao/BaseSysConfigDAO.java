package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.SysConfig;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysConfig entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.SysConfig
 * @author MyEclipse Persistence Tools
 */

public class BaseSysConfigDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseSysConfigDAO.class);
	// property constants
	public static final String ID = "id";
	public static final String INFO = "info";
	public static final String VALUE = "value";
	public static final String TYPE = "type";
	public static final String GROUP = "group";

	protected void initDao() {
		// do nothing
	}

	public void save(SysConfig transientInstance) {
		log.debug("saving SysConfig instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SysConfig persistentInstance) {
		log.debug("deleting SysConfig instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SysConfig findById(java.lang.String id) {
		log.debug("getting SysConfig instance with id: " + id);
		try {
			SysConfig instance = (SysConfig) getHibernateTemplate().get(
					"com.forbes.hibernate.bean.SysConfig", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SysConfig instance) {
		log.debug("finding SysConfig instance by example");
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
		log.debug("finding SysConfig instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SysConfig as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findById(Object id) {
		return findByProperty(ID, id);
	}

	public List findByInfo(Object info) {
		return findByProperty(INFO, info);
	}

	public List findByValue(Object value) {
		return findByProperty(VALUE, value);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByGroup(Object group) {
		return findByProperty(GROUP, group);
	}

	public List findAll() {
		log.debug("finding all SysConfig instances");
		try {
			String queryString = "from SysConfig";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SysConfig merge(SysConfig detachedInstance) {
		log.debug("merging SysConfig instance");
		try {
			SysConfig result = (SysConfig) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SysConfig instance) {
		log.debug("attaching dirty SysConfig instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SysConfig instance) {
		log.debug("attaching clean SysConfig instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseSysConfigDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BaseSysConfigDAO) ctx.getBean("SysConfigDAO");
	}
}