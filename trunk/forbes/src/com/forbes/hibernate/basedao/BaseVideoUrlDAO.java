package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.forbes.hibernate.bean.VideoUrl;

/**
 * A data access object (DAO) providing persistence and search support for
 * VideoUrl entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.VideoUrl
 * @author MyEclipse Persistence Tools
 */

public class BaseVideoUrlDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseVideoUrlDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String URL = "url";

	public void save(VideoUrl transientInstance) {
		log.debug("saving VideoUrl instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(VideoUrl persistentInstance) {
		log.debug("deleting VideoUrl instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VideoUrl findById(java.lang.Integer id) {
		log.debug("getting VideoUrl instance with id: " + id);
		try {
			VideoUrl instance = (VideoUrl) getSession().get(
					"com.forbes.hibernate.bean.VideoUrl", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(VideoUrl instance) {
		log.debug("finding VideoUrl instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.VideoUrl").add(
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
		log.debug("finding VideoUrl instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from VideoUrl as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findAll() {
		log.debug("finding all VideoUrl instances");
		try {
			String queryString = "from VideoUrl";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public VideoUrl merge(VideoUrl detachedInstance) {
		log.debug("merging VideoUrl instance");
		try {
			VideoUrl result = (VideoUrl) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(VideoUrl instance) {
		log.debug("attaching dirty VideoUrl instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VideoUrl instance) {
		log.debug("attaching clean VideoUrl instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

}