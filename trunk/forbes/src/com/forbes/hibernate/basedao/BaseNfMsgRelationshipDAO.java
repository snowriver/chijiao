package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.NfMsgRelationship;

/**
 * A data access object (DAO) providing persistence and search support for
 * NfMsgRelationship entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.NfMsgRelationship
 * @author MyEclipse Persistence Tools
 */

public class BaseNfMsgRelationshipDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(BaseNfMsgRelationshipDAO.class);
	// property constants
	public static final String MSG_ID = "msgId";
	public static final String USER_ID = "userId";
	public static final String VIEW_TIMES = "viewTimes";

	public void save(NfMsgRelationship transientInstance) {
		log.debug("saving NfMsgRelationship instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(NfMsgRelationship persistentInstance) {
		log.debug("deleting NfMsgRelationship instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NfMsgRelationship findById(java.lang.Long id) {
		log.debug("getting NfMsgRelationship instance with id: " + id);
		try {
			NfMsgRelationship instance = (NfMsgRelationship) getSession().get(
					"com.forbes.hibernate.bean.NfMsgRelationship", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(NfMsgRelationship instance) {
		log.debug("finding NfMsgRelationship instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.NfMsgRelationship").add(
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
		log.debug("finding NfMsgRelationship instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from NfMsgRelationship as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMsgId(Object msgId) {
		return findByProperty(MSG_ID, msgId);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByViewTimes(Object viewTimes) {
		return findByProperty(VIEW_TIMES, viewTimes);
	}

	public List findAll() {
		log.debug("finding all NfMsgRelationship instances");
		try {
			String queryString = "from NfMsgRelationship";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public NfMsgRelationship merge(NfMsgRelationship detachedInstance) {
		log.debug("merging NfMsgRelationship instance");
		try {
			NfMsgRelationship result = (NfMsgRelationship) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(NfMsgRelationship instance) {
		log.debug("attaching dirty NfMsgRelationship instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NfMsgRelationship instance) {
		log.debug("attaching clean NfMsgRelationship instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}