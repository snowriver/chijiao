package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.NewsContent;

/**
 * A data access object (DAO) providing persistence and search support for
 * NewsContent entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.NewsContent
 * @author MyEclipse Persistence Tools
 */

public class BaseNewsContentDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseNewsContentDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	public void save(NewsContent transientInstance) {
		log.debug("saving NewsContent instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NewsContent persistentInstance) {
		log.debug("deleting NewsContent instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NewsContent findById(java.lang.Integer id) {
		log.debug("getting NewsContent instance with id: " + id);
		try {
			NewsContent instance = (NewsContent) getHibernateTemplate().get(
					"com.forbes.hibernate.bean.NewsContent", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NewsContent instance) {
		log.debug("finding NewsContent instance by example");
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
		log.debug("finding NewsContent instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from NewsContent as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all NewsContent instances");
		try {
			String queryString = "from NewsContent";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NewsContent merge(NewsContent detachedInstance) {
		log.debug("merging NewsContent instance");
		try {
			NewsContent result = (NewsContent) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NewsContent instance) {
		log.debug("attaching dirty NewsContent instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NewsContent instance) {
		log.debug("attaching clean NewsContent instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseNewsContentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseNewsContentDAO) ctx.getBean("NewsContentDAO");
	}
}