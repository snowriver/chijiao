package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.OrderService;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrderService entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.OrderService
 * @author MyEclipse Persistence Tools
 */

public class BaseOrderServiceDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseOrderServiceDAO.class);
	// property constants
	public static final String SERVICE_NAME_CH = "serviceNameCh";
	public static final String SERVICE_NAME_EN = "serviceNameEn";
	public static final String SERVICE_TYPE = "serviceType";
	public static final String PRICE = "price";
	public static final String DISCOUNT = "discount";
	public static final String ACTIVE = "active";
	public static final String DEAL_CLASS = "dealClass";
	public static final String SERVICE_DISP = "serviceDisp";
	public static final String SERVICE_COUNT = "serviceCount";
	public static final String SERVICE_USER = "serviceUser";
	public static final String SERVICE_DESCS = "serviceDescs";
	public static final String NEED_CONFIRM = "needConfirm";
	public static final String NEED_CS_DEAL = "needCsDeal";
	public static final String CHARGE_NOTE = "chargeNote";

	public void save(OrderService transientInstance) {
		log.debug("saving OrderService instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(OrderService persistentInstance) {
		log.debug("deleting OrderService instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public OrderService findById(java.lang.Integer id) {
		log.debug("getting OrderService instance with id: " + id);
		try {
			OrderService instance = (OrderService) getSession().get(
					"com.forbes.hibernate.bean.OrderService", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(OrderService instance) {
		log.debug("finding OrderService instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.OrderService").add(
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
		log.debug("finding OrderService instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from OrderService as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByServiceNameCh(Object serviceNameCh) {
		return findByProperty(SERVICE_NAME_CH, serviceNameCh);
	}

	public List findByServiceNameEn(Object serviceNameEn) {
		return findByProperty(SERVICE_NAME_EN, serviceNameEn);
	}

	public List findByServiceType(Object serviceType) {
		return findByProperty(SERVICE_TYPE, serviceType);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByDiscount(Object discount) {
		return findByProperty(DISCOUNT, discount);
	}

	public List findByActive(Object active) {
		return findByProperty(ACTIVE, active);
	}

	public List findByDealClass(Object dealClass) {
		return findByProperty(DEAL_CLASS, dealClass);
	}

	public List findByServiceDisp(Object serviceDisp) {
		return findByProperty(SERVICE_DISP, serviceDisp);
	}

	public List findByServiceCount(Object serviceCount) {
		return findByProperty(SERVICE_COUNT, serviceCount);
	}

	public List findByServiceUser(Object serviceUser) {
		return findByProperty(SERVICE_USER, serviceUser);
	}

	public List findByServiceDescs(Object serviceDescs) {
		return findByProperty(SERVICE_DESCS, serviceDescs);
	}

	public List findByNeedConfirm(Object needConfirm) {
		return findByProperty(NEED_CONFIRM, needConfirm);
	}

	public List findByNeedCsDeal(Object needCsDeal) {
		return findByProperty(NEED_CS_DEAL, needCsDeal);
	}

	public List findByChargeNote(Object chargeNote) {
		return findByProperty(CHARGE_NOTE, chargeNote);
	}

	public List findAll() {
		log.debug("finding all OrderService instances");
		try {
			String queryString = "from OrderService";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public OrderService merge(OrderService detachedInstance) {
		log.debug("merging OrderService instance");
		try {
			OrderService result = (OrderService) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(OrderService instance) {
		log.debug("attaching dirty OrderService instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(OrderService instance) {
		log.debug("attaching clean OrderService instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}