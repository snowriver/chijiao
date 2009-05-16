package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserScoreLog;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserScoreLog entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserScoreLog
 * @author MyEclipse Persistence Tools
 */

public class BaseUserScoreLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserScoreLogDAO.class);
	// property constants
	public static final String OBJECT_ID = "objectId";
	public static final String AMOUNT = "amount";
	public static final String STATUS = "status";
	public static final String ACCOUNT_ID = "accountId";
	public static final String REMARK = "remark";
	public static final String BALANCE = "balance";
	public static final String PRESENT_BALANCE = "presentBalance";
	public static final String PRESENT_AMOUNT = "presentAmount";

	public void save(UserScoreLog transientInstance) {
		log.debug("saving UserScoreLog instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserScoreLog persistentInstance) {
		log.debug("deleting UserScoreLog instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserScoreLog findById(java.lang.Long id) {
		log.debug("getting UserScoreLog instance with id: " + id);
		try {
			UserScoreLog instance = (UserScoreLog) getSession().get(
					"com.forbes.hibernate.bean.UserScoreLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserScoreLog instance) {
		log.debug("finding UserScoreLog instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserScoreLog").add(
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
		log.debug("finding UserScoreLog instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserScoreLog as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByObjectId(Object objectId) {
		return findByProperty(OBJECT_ID, objectId);
	}

	public List findByAmount(Object amount) {
		return findByProperty(AMOUNT, amount);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByAccountId(Object accountId) {
		return findByProperty(ACCOUNT_ID, accountId);
	}

	public List findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findByBalance(Object balance) {
		return findByProperty(BALANCE, balance);
	}

	public List findByPresentBalance(Object presentBalance) {
		return findByProperty(PRESENT_BALANCE, presentBalance);
	}

	public List findByPresentAmount(Object presentAmount) {
		return findByProperty(PRESENT_AMOUNT, presentAmount);
	}

	public List findAll() {
		log.debug("finding all UserScoreLog instances");
		try {
			String queryString = "from UserScoreLog";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserScoreLog merge(UserScoreLog detachedInstance) {
		log.debug("merging UserScoreLog instance");
		try {
			UserScoreLog result = (UserScoreLog) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserScoreLog instance) {
		log.debug("attaching dirty UserScoreLog instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserScoreLog instance) {
		log.debug("attaching clean UserScoreLog instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}