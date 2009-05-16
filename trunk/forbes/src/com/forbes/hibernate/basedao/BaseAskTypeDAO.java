package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.AskType;

/**
 * A data access object (DAO) providing persistence and search support for AskType
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.AskType
 * @author MyEclipse Persistence Tools
 */

public class BaseAskTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseAskTypeDAO.class);
	// property constants
	public static final String PID = "pid";
	public static final String NAME = "name";
	public static final String DISORDER = "disorder";

	public void save(AskType transientInstance) {
		log.debug("saving AskType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AskType persistentInstance) {
		log.debug("deleting AskType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AskType findById(java.lang.Integer id) {
		log.debug("getting AskType instance with id: " + id);
		try {
			AskType instance = (AskType) getSession().get(
					"com.forbes.hibernate.bean.AskType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(AskType instance) {
		log.debug("finding AskType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.AskType").add(Example.create(instance))
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
		log.debug("finding AskType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from AskType as model where model."
					+ propertyName + "= ? ORDER BY model.disorder ";
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
		log.debug("finding all AskType instances");
		try {
			String queryString = "from AskType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AskType merge(AskType detachedInstance) {
		log.debug("merging AskType instance");
		try {
			AskType result = (AskType) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AskType instance) {
		log.debug("attaching dirty AskType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AskType instance) {
		log.debug("attaching clean AskType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}