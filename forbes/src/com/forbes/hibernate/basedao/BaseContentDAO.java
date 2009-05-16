package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.Content;

/**
 * A data access object (DAO) providing persistence and search support for
 * Content entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Content
 * @author MyEclipse Persistence Tools
 */

public class BaseContentDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseContentDAO.class);
	// property constants
	public static final String UER_ID = "uerId";
	public static final String CONTENT = "content";
	public static final String IP = "ip";
	public static final String RE_ID = "reId";

	public void save(Content transientInstance) {
		log.debug("saving Content instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Content persistentInstance) {
		log.debug("deleting Content instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Content findById(java.lang.Long id) {
		log.debug("getting Content instance with id: " + id);
		try {
			Content instance = (Content) getSession().get(
					"com.forbes.hibernate.bean.Content", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Content instance) {
		log.debug("finding Content instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Content").add(
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
		log.debug("finding Content instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Content as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUerId(Object uerId) {
		return findByProperty(UER_ID, uerId);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByIp(Object ip) {
		return findByProperty(IP, ip);
	}

	public List findByReId(Object reId) {
		return findByProperty(RE_ID, reId);
	}

	public List findAll() {
		log.debug("finding all Content instances");
		try {
			String queryString = "from Content";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Content merge(Content detachedInstance) {
		log.debug("merging Content instance");
		try {
			Content result = (Content) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Content instance) {
		log.debug("attaching dirty Content instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Content instance) {
		log.debug("attaching clean Content instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}