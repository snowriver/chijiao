package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.SearchKeyword;

/**
 * A data access object (DAO) providing persistence and search support for
 * SearchKeyword entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.SearchKeyword
 * @author MyEclipse Persistence Tools
 */

public class BaseSearchKeywordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseSearchKeywordDAO.class);
	// property constants
	public static final String KEYWORD = "keyword";
	public static final String SPWORDS = "spwords";
	public static final String COUNT = "count";
	public static final String RESULT = "result";
	public static final String LASTTIME = "lasttime";
	public static final String ISTAG = "istag";
	public static final String WEEKCC = "weekcc";
	public static final String MONTHCC = "monthcc";
	public static final String STARTTIME = "starttime";
	public static final String WEEKUP = "weekup";
	public static final String MONTHUP = "monthup";

	public void save(SearchKeyword transientInstance) {
		log.debug("saving SearchKeyword instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SearchKeyword persistentInstance) {
		log.debug("deleting SearchKeyword instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SearchKeyword findById(java.lang.Integer id) {
		log.debug("getting SearchKeyword instance with id: " + id);
		try {
			SearchKeyword instance = (SearchKeyword) getSession().get(
					"com.forbes.hibernate.bean.SearchKeyword", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SearchKeyword instance) {
		log.debug("finding SearchKeyword instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.SearchKeyword").add(
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
		log.debug("finding SearchKeyword instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SearchKeyword as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKeyword(Object keyword) {
		return findByProperty(KEYWORD, keyword);
	}

	public List findBySpwords(Object spwords) {
		return findByProperty(SPWORDS, spwords);
	}

	public List findByCount(Object count) {
		return findByProperty(COUNT, count);
	}

	public List findByResult(Object result) {
		return findByProperty(RESULT, result);
	}

	public List findByLasttime(Object lasttime) {
		return findByProperty(LASTTIME, lasttime);
	}

	public List findByIstag(Object istag) {
		return findByProperty(ISTAG, istag);
	}

	public List findByWeekcc(Object weekcc) {
		return findByProperty(WEEKCC, weekcc);
	}

	public List findByMonthcc(Object monthcc) {
		return findByProperty(MONTHCC, monthcc);
	}

	public List findByStarttime(Object starttime) {
		return findByProperty(STARTTIME, starttime);
	}

	public List findByWeekup(Object weekup) {
		return findByProperty(WEEKUP, weekup);
	}

	public List findByMonthup(Object monthup) {
		return findByProperty(MONTHUP, monthup);
	}

	public List findAll() {
		log.debug("finding all SearchKeyword instances");
		try {
			String queryString = "from SearchKeyword";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SearchKeyword merge(SearchKeyword detachedInstance) {
		log.debug("merging SearchKeyword instance");
		try {
			SearchKeyword result = (SearchKeyword) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SearchKeyword instance) {
		log.debug("attaching dirty SearchKeyword instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SearchKeyword instance) {
		log.debug("attaching clean SearchKeyword instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}