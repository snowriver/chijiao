package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserPaymentLog;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserPaymentLog entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserPaymentLog
 * @author MyEclipse Persistence Tools
 */

public class BaseUserPaymentLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserPaymentLogDAO.class);
	// property constants
	public static final String ORDER_ID = "orderId";
	public static final String PAY_METHOD = "payMethod";
	public static final String CHECK_NO = "checkNo";
	public static final String BANK_ORDER_ID = "bankOrderId";
	public static final String AMOUNT = "amount";
	public static final String STATUS = "status";
	public static final String ACCOUNT_ID = "accountId";
	public static final String REMARK = "remark";
	public static final String BALANCE = "balance";
	public static final String PRESENT_BALANCE = "presentBalance";
	public static final String PRESENT_AMOUNT = "presentAmount";

	public void save(UserPaymentLog transientInstance) {
		log.debug("saving UserPaymentLog instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserPaymentLog persistentInstance) {
		log.debug("deleting UserPaymentLog instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserPaymentLog findById(java.lang.Long id) {
		log.debug("getting UserPaymentLog instance with id: " + id);
		try {
			UserPaymentLog instance = (UserPaymentLog) getSession().get(
					"com.forbes.hibernate.bean.UserPaymentLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserPaymentLog instance) {
		log.debug("finding UserPaymentLog instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserPaymentLog").add(
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
		log.debug("finding UserPaymentLog instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserPaymentLog as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByPayMethod(Object payMethod) {
		return findByProperty(PAY_METHOD, payMethod);
	}

	public List findByCheckNo(Object checkNo) {
		return findByProperty(CHECK_NO, checkNo);
	}

	public List findByBankOrderId(Object bankOrderId) {
		return findByProperty(BANK_ORDER_ID, bankOrderId);
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
		log.debug("finding all UserPaymentLog instances");
		try {
			String queryString = "from UserPaymentLog";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserPaymentLog merge(UserPaymentLog detachedInstance) {
		log.debug("merging UserPaymentLog instance");
		try {
			UserPaymentLog result = (UserPaymentLog) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserPaymentLog instance) {
		log.debug("attaching dirty UserPaymentLog instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserPaymentLog instance) {
		log.debug("attaching clean UserPaymentLog instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}