package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeBlogFilter;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeBlogFilter entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeBlogFilter
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeBlogFilterDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeBlogFilterDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String URL = "url";
	public static final String NOTE = "note";

	protected void initDao() {
		// do nothing
	}

	public void save(UchomeBlogFilter transientInstance) {
		log.debug("saving UchomeBlogFilter instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeBlogFilter persistentInstance) {
		log.debug("deleting UchomeBlogFilter instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeBlogFilter findById(java.lang.Integer id) {
		log.debug("getting UchomeBlogFilter instance with id: " + id);
		try {
			UchomeBlogFilter instance = (UchomeBlogFilter) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UchomeBlogFilter", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeBlogFilter instance) {
		log.debug("finding UchomeBlogFilter instance by example");
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
		log.debug("finding UchomeBlogFilter instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UchomeBlogFilter as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findByNote(Object note) {
		return findByProperty(NOTE, note);
	}

	public List findAll() {
		log.debug("finding all UchomeBlogFilter instances");
		try {
			String queryString = "from UchomeBlogFilter";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeBlogFilter merge(UchomeBlogFilter detachedInstance) {
		log.debug("merging UchomeBlogFilter instance");
		try {
			UchomeBlogFilter result = (UchomeBlogFilter) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeBlogFilter instance) {
		log.debug("attaching dirty UchomeBlogFilter instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeBlogFilter instance) {
		log.debug("attaching clean UchomeBlogFilter instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUchomeBlogFilterDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUchomeBlogFilterDAO) ctx.getBean("UchomeBlogFilterDAO");
	}
}