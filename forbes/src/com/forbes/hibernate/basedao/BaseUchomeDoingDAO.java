package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeDoing;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeDoing entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeDoing
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeDoingDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeDoingDAO.class);
	// property constants
	public static final String UID = "uid";
	public static final String USERNAME = "username";
	public static final String FROM = "from";
	public static final String DATELINE = "dateline";
	public static final String MESSAGE = "message";
	public static final String IP = "ip";
	public static final String REPLYNUM = "replynum";
	public static final String MOOD = "mood";

	public void save(UchomeDoing transientInstance) {
		log.debug("saving UchomeDoing instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeDoing persistentInstance) {
		log.debug("deleting UchomeDoing instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeDoing findById(java.lang.Integer id) {
		log.debug("getting UchomeDoing instance with id: " + id);
		try {
			UchomeDoing instance = (UchomeDoing) getSession().get(
					"com.forbes.hibernate.bean.UchomeDoing", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeDoing instance) {
		log.debug("finding UchomeDoing instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UchomeDoing").add(
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
		log.debug("finding UchomeDoing instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UchomeDoing as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByFrom(Object from) {
		return findByProperty(FROM, from);
	}

	public List findByDateline(Object dateline) {
		return findByProperty(DATELINE, dateline);
	}

	public List findByMessage(Object message) {
		return findByProperty(MESSAGE, message);
	}

	public List findByIp(Object ip) {
		return findByProperty(IP, ip);
	}

	public List findByReplynum(Object replynum) {
		return findByProperty(REPLYNUM, replynum);
	}

	public List findByMood(Object mood) {
		return findByProperty(MOOD, mood);
	}

	public List findAll() {
		log.debug("finding all UchomeDoing instances");
		try {
			String queryString = "from UchomeDoing";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeDoing merge(UchomeDoing detachedInstance) {
		log.debug("merging UchomeDoing instance");
		try {
			UchomeDoing result = (UchomeDoing) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeDoing instance) {
		log.debug("attaching dirty UchomeDoing instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeDoing instance) {
		log.debug("attaching clean UchomeDoing instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}