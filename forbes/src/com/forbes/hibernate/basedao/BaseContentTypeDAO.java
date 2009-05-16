package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.ContentType;

/**
 * A data access object (DAO) providing persistence and search support for
 * ContentType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.ContentType
 * @author MyEclipse Persistence Tools
 */

public class BaseContentTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseContentTypeDAO.class);
	// property constants
	public static final String TYPE_NAME = "typeName";

	public void save(ContentType transientInstance) {
		log.debug("saving ContentType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ContentType persistentInstance) {
		log.debug("deleting ContentType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ContentType findById(java.lang.Short id) {
		log.debug("getting ContentType instance with id: " + id);
		try {
			ContentType instance = (ContentType) getSession().get(
					"com.forbes.hibernate.bean.ContentType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ContentType instance) {
		log.debug("finding ContentType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.ContentType").add(
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
		log.debug("finding ContentType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ContentType as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTypeName(Object typeName) {
		return findByProperty(TYPE_NAME, typeName);
	}

	public List findAll() {
		log.debug("finding all ContentType instances");
		try {
			String queryString = "from ContentType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ContentType merge(ContentType detachedInstance) {
		log.debug("merging ContentType instance");
		try {
			ContentType result = (ContentType) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ContentType instance) {
		log.debug("attaching dirty ContentType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ContentType instance) {
		log.debug("attaching clean ContentType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}