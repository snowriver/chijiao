package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.FeedBack;

/**
 * A data access object (DAO) providing persistence and search support for
 * FeedBack entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.FeedBack
 * @author MyEclipse Persistence Tools
 */

public class BaseFeedBackDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseFeedBackDAO.class);
	// property constants
	public static final String FEED_TYPE = "feedType";
	public static final String ERROR_TYPE = "errorType";
	public static final String ERROR_CONTENT = "errorContent";
	public static final String ERROR_URL = "errorUrl";
	public static final String USER_ID = "userId";
	public static final String USER_NAME = "userName";

	public void save(FeedBack transientInstance) {
		log.debug("saving FeedBack instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FeedBack persistentInstance) {
		log.debug("deleting FeedBack instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FeedBack findById(java.lang.Integer id) {
		log.debug("getting FeedBack instance with id: " + id);
		try {
			FeedBack instance = (FeedBack) getSession().get(
					"com.forbes.hibernate.bean.FeedBack", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(FeedBack instance) {
		log.debug("finding FeedBack instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.FeedBack").add(
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
		log.debug("finding FeedBack instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from FeedBack as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFeedType(Object feedType) {
		return findByProperty(FEED_TYPE, feedType);
	}

	public List findByErrerType(Object errerType) {
		return findByProperty(ERROR_TYPE, errerType);
	}

	public List findByErrerContent(Object errerContent) {
		return findByProperty(ERROR_CONTENT, errerContent);
	}

	public List findByErrorUrl(Object errorUrl) {
		return findByProperty(ERROR_URL, errorUrl);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findAll() {
		log.debug("finding all FeedBack instances");
		try {
			String queryString = "from FeedBack";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FeedBack merge(FeedBack detachedInstance) {
		log.debug("merging FeedBack instance");
		try {
			FeedBack result = (FeedBack) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FeedBack instance) {
		log.debug("attaching dirty FeedBack instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FeedBack instance) {
		log.debug("attaching clean FeedBack instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}