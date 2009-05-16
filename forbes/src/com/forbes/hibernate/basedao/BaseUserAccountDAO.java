package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserAccount;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserAccount entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserAccount
 * @author MyEclipse Persistence Tools
 */

public class BaseUserAccountDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserAccountDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String ACCOUNT_TYPE = "accountType";
	public static final String BALANCE = "balance";
	public static final String PRESENT_BALANCE = "presentBalance";

	public void save(UserAccount transientInstance) {
		log.debug("saving UserAccount instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserAccount persistentInstance) {
		log.debug("deleting UserAccount instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserAccount findById(java.lang.Long id) {
		log.debug("getting UserAccount instance with id: " + id);
		try {
			UserAccount instance = (UserAccount) getSession().get(
					"com.forbes.hibernate.bean.UserAccount", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserAccount instance) {
		log.debug("finding UserAccount instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserAccount").add(
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
		log.debug("finding UserAccount instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserAccount as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByAccountType(Object accountType) {
		return findByProperty(ACCOUNT_TYPE, accountType);
	}

	public List findByBalance(Object balance) {
		return findByProperty(BALANCE, balance);
	}

	public List findByPresentBalance(Object presentBalance) {
		return findByProperty(PRESENT_BALANCE, presentBalance);
	}

	public List findAll() {
		log.debug("finding all UserAccount instances");
		try {
			String queryString = "from UserAccount";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserAccount merge(UserAccount detachedInstance) {
		log.debug("merging UserAccount instance");
		try {
			UserAccount result = (UserAccount) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserAccount instance) {
		log.debug("attaching dirty UserAccount instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserAccount instance) {
		log.debug("attaching clean UserAccount instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}