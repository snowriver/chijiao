package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.Sector;

/**
 * A data access object (DAO) providing persistence and search support for Sector
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Sector
 * @author MyEclipse Persistence Tools
 */

public class BaseSectorDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseSectorDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String NAME = "name";
	public static final String DISORDER = "disorder";

	public void save(Sector transientInstance) {
		log.debug("saving Sector instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sector persistentInstance) {
		log.debug("deleting Sector instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sector findById(java.lang.Integer id) {
		log.debug("getting Sector instance with id: " + id);
		try {
			Sector instance = (Sector) getSession().get(
					"com.forbes.hibernate.bean.Sector", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sector instance) {
		log.debug("finding Sector instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Sector").add(Example.create(instance))
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
		log.debug("finding Sector instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sector as model where model."
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
		log.debug("finding all Sector instances");
		try {
			String queryString = "from Sector";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sector merge(Sector detachedInstance) {
		log.debug("merging Sector instance");
		try {
			Sector result = (Sector) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sector instance) {
		log.debug("attaching dirty Sector instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sector instance) {
		log.debug("attaching clean Sector instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}