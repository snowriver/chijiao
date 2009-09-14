package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeBlogfield;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeBlogfield entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeBlogfield
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeBlogfieldDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeBlogfieldDAO.class);
	// property constants
	public static final String UID = "uid";
	public static final String TAG = "tag";
	public static final String MESSAGE = "message";
	public static final String POSTIP = "postip";
	public static final String RELATED = "related";
	public static final String RELATEDTIME = "relatedtime";
	public static final String TARGET_IDS = "targetIds";

	protected void initDao() {
		// do nothing
	}

	public void save(UchomeBlogfield transientInstance) {
		log.debug("saving UchomeBlogfield instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeBlogfield persistentInstance) {
		log.debug("deleting UchomeBlogfield instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeBlogfield findById(java.lang.Integer id) {
		log.debug("getting UchomeBlogfield instance with id: " + id);
		try {
			UchomeBlogfield instance = (UchomeBlogfield) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UchomeBlogfield", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeBlogfield instance) {
		log.debug("finding UchomeBlogfield instance by example");
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
		log.debug("finding UchomeBlogfield instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UchomeBlogfield as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByTag(Object tag) {
		return findByProperty(TAG, tag);
	}

	public List findByMessage(Object message) {
		return findByProperty(MESSAGE, message);
	}

	public List findByPostip(Object postip) {
		return findByProperty(POSTIP, postip);
	}

	public List findByRelated(Object related) {
		return findByProperty(RELATED, related);
	}

	public List findByRelatedtime(Object relatedtime) {
		return findByProperty(RELATEDTIME, relatedtime);
	}

	public List findByTargetIds(Object targetIds) {
		return findByProperty(TARGET_IDS, targetIds);
	}

	public List findAll() {
		log.debug("finding all UchomeBlogfield instances");
		try {
			String queryString = "from UchomeBlogfield";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeBlogfield merge(UchomeBlogfield detachedInstance) {
		log.debug("merging UchomeBlogfield instance");
		try {
			UchomeBlogfield result = (UchomeBlogfield) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeBlogfield instance) {
		log.debug("attaching dirty UchomeBlogfield instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeBlogfield instance) {
		log.debug("attaching clean UchomeBlogfield instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUchomeBlogfieldDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUchomeBlogfieldDAO) ctx.getBean("UchomeBlogfieldDAO");
	}
}