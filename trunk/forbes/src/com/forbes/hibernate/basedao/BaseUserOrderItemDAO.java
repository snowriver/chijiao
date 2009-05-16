package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserOrderItem;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserOrderItem entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserOrderItem
 * @author MyEclipse Persistence Tools
 */

public class BaseUserOrderItemDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserOrderItemDAO.class);
	// property constants
	public static final String ORDER_ID = "orderId";
	public static final String SERVICE_ID = "serviceId";
	public static final String COUNT = "count";
	public static final String PRICE = "price";
	public static final String SERVICE_DETAIL = "serviceDetail";
	public static final String DEAL_STATUS = "dealStatus";

	public void save(UserOrderItem transientInstance) {
		log.debug("saving UserOrderItem instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserOrderItem persistentInstance) {
		log.debug("deleting UserOrderItem instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserOrderItem findById(java.lang.Long id) {
		log.debug("getting UserOrderItem instance with id: " + id);
		try {
			UserOrderItem instance = (UserOrderItem) getSession().get(
					"com.forbes.hibernate.bean.UserOrderItem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserOrderItem instance) {
		log.debug("finding UserOrderItem instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserOrderItem").add(
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
		log.debug("finding UserOrderItem instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserOrderItem as model where model."
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

	public List findByServiceId(Object serviceId) {
		return findByProperty(SERVICE_ID, serviceId);
	}

	public List findByCount(Object count) {
		return findByProperty(COUNT, count);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByServiceDetail(Object serviceDetail) {
		return findByProperty(SERVICE_DETAIL, serviceDetail);
	}

	public List findByDealStatus(Object dealStatus) {
		return findByProperty(DEAL_STATUS, dealStatus);
	}

	public List findAll() {
		log.debug("finding all UserOrderItem instances");
		try {
			String queryString = "from UserOrderItem";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserOrderItem merge(UserOrderItem detachedInstance) {
		log.debug("merging UserOrderItem instance");
		try {
			UserOrderItem result = (UserOrderItem) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserOrderItem instance) {
		log.debug("attaching dirty UserOrderItem instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserOrderItem instance) {
		log.debug("attaching clean UserOrderItem instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}