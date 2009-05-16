package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.VideoType;

/**
 * A data access object (DAO) providing persistence and search support for VideoType
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.VideoType
 * @author MyEclipse Persistence Tools
 */

public class BaseVideoTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseVideoTypeDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String NAME = "name";
	public static final String DISORDER = "disorder";

	public void save(VideoType transientInstance) {
		log.debug("saving VideoType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(VideoType persistentInstance) {
		log.debug("deleting VideoType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VideoType findById(java.lang.Integer id) {
		log.debug("getting VideoType instance with id: " + id);
		try {
			VideoType instance = (VideoType) getSession().get(
					"com.forbes.hibernate.bean.VideoType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(VideoType instance) {
		log.debug("finding VideoType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.VideoType").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding VideoType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from VideoType as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByDisorder(Object disorder) {
		return findByProperty(DISORDER, disorder);
	}

	public List findAll() {
		log.debug("finding all VideoType instances");
		try {
			String queryString = "from VideoType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public VideoType merge(VideoType detachedInstance) {
		log.debug("merging VideoType instance");
		try {
			VideoType result = (VideoType) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(VideoType instance) {
		log.debug("attaching dirty VideoType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VideoType instance) {
		log.debug("attaching clean VideoType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}