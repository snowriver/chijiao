package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.Dictionary;

/**
 * A data access object (DAO) providing persistence and search support for
 * Dictionary entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Dictionary
 * @author MyEclipse Persistence Tools
 */

public class BaseDictionaryDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseDictionaryDAO.class);
	// property constants
	public static final String DGROUP = "dgroup";
	public static final String DINDEX = "dindex";
	public static final String DKEY = "dkey";
	public static final String DVALUE = "dvalue";
	public static final String DVALUE_DESC_CH = "dvalueDescCh";

	public void save(Dictionary transientInstance) {
		log.debug("saving Dictionary instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Dictionary persistentInstance) {
		log.debug("deleting Dictionary instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Dictionary findById(java.lang.Integer id) {
		log.debug("getting Dictionary instance with id: " + id);
		try {
			Dictionary instance = (Dictionary) getSession().get(
					"com.forbes.hibernate.bean.Dictionary", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Dictionary instance) {
		log.debug("finding Dictionary instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Dictionary").add(
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
		log.debug("finding Dictionary instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Dictionary as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDgroup(Object dgroup) {
		return findByProperty(DGROUP, dgroup);
	}

	public List findByDindex(Object dindex) {
		return findByProperty(DINDEX, dindex);
	}

	public List findByDkey(Object dkey) {
		return findByProperty(DKEY, dkey);
	}

	public List findByDvalue(Object dvalue) {
		return findByProperty(DVALUE, dvalue);
	}

	public List findByDvalueDescCh(Object dvalueDescCh) {
		return findByProperty(DVALUE_DESC_CH, dvalueDescCh);
	}

	public List findAll() {
		log.debug("finding all Dictionary instances");
		try {
			String queryString = "from Dictionary";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Dictionary merge(Dictionary detachedInstance) {
		log.debug("merging Dictionary instance");
		try {
			Dictionary result = (Dictionary) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Dictionary instance) {
		log.debug("attaching dirty Dictionary instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Dictionary instance) {
		log.debug("attaching clean Dictionary instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}