package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserOrder;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserOrder entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserOrder
 * @author MyEclipse Persistence Tools
 */

public class BaseUserOrderDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserOrderDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String USER_TYPE = "userType";
	public static final String TOTAL = "total";
	public static final String STATUS = "status";
	public static final String PAY_METHOD = "payMethod";
	public static final String REMARK = "remark";

	public void save(UserOrder transientInstance) {
		log.debug("saving UserOrder instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserOrder persistentInstance) {
		log.debug("deleting UserOrder instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserOrder findById(java.lang.Long id) {
		log.debug("getting UserOrder instance with id: " + id);
		try {
			UserOrder instance = (UserOrder) getSession().get(
					"com.forbes.hibernate.bean.UserOrder", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserOrder instance) {
		log.debug("finding UserOrder instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserOrder").add(
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
		log.debug("finding UserOrder instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserOrder as model where model."
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

	public List findByUserType(Object userType) {
		return findByProperty(USER_TYPE, userType);
	}

	public List findByTotal(Object total) {
		return findByProperty(TOTAL, total);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByPayMethod(Object payMethod) {
		return findByProperty(PAY_METHOD, payMethod);
	}

	public List findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all UserOrder instances");
		try {
			String queryString = "from UserOrder";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserOrder merge(UserOrder detachedInstance) {
		log.debug("merging UserOrder instance");
		try {
			UserOrder result = (UserOrder) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserOrder instance) {
		log.debug("attaching dirty UserOrder instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserOrder instance) {
		log.debug("attaching clean UserOrder instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}