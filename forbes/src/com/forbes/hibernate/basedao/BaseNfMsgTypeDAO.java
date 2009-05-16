package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.NfMsgType;

/**
 * A data access object (DAO) providing persistence and search support for
 * NfMsgType entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.NfMsgType
 * @author MyEclipse Persistence Tools
 */

public class BaseNfMsgTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseNfMsgTypeDAO.class);
	// property constants
	public static final String MSG_TYPE_CH = "msgTypeCh";
	public static final String LEVEL = "level";

	public void save(NfMsgType transientInstance) {
		log.debug("saving NfMsgType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NfMsgType persistentInstance) {
		log.debug("deleting NfMsgType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NfMsgType findById(java.lang.Short id) {
		log.debug("getting NfMsgType instance with id: " + id);
		try {
			NfMsgType instance = (NfMsgType) getSession().get(
					"com.forbes.hibernate.bean.NfMsgType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NfMsgType instance) {
		log.debug("finding NfMsgType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.NfMsgType").add(
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
		log.debug("finding NfMsgType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from NfMsgType as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMsgTypeCh(Object msgTypeCh) {
		return findByProperty(MSG_TYPE_CH, msgTypeCh);
	}

	public List findByLevel(Object level) {
		return findByProperty(LEVEL, level);
	}

	public List findAll() {
		log.debug("finding all NfMsgType instances");
		try {
			String queryString = "from NfMsgType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NfMsgType merge(NfMsgType detachedInstance) {
		log.debug("merging NfMsgType instance");
		try {
			NfMsgType result = (NfMsgType) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NfMsgType instance) {
		log.debug("attaching dirty NfMsgType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NfMsgType instance) {
		log.debug("attaching clean NfMsgType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}