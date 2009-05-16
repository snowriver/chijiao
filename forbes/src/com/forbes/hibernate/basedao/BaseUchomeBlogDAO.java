package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeBlog;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeBlog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeBlog
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeBlogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeBlogDAO.class);
	// property constants
	public static final String UID = "uid";
	public static final String USERNAME = "username";
	public static final String SUBJECT = "subject";
	public static final String CLASSID = "classid";
	public static final String VIEWNUM = "viewnum";
	public static final String REPLYNUM = "replynum";
	public static final String TRACENUM = "tracenum";
	public static final String DATELINE = "dateline";
	public static final String PIC = "pic";
	public static final String PICFLAG = "picflag";
	public static final String NOREPLY = "noreply";
	public static final String FRIEND = "friend";
	public static final String PASSWORD = "password";

	public void save(UchomeBlog transientInstance) {
		log.debug("saving UchomeBlog instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeBlog persistentInstance) {
		log.debug("deleting UchomeBlog instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeBlog findById(java.lang.Integer id) {
		log.debug("getting UchomeBlog instance with id: " + id);
		try {
			UchomeBlog instance = (UchomeBlog) getSession().get(
					"com.forbes.hibernate.bean.UchomeBlog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeBlog instance) {
		log.debug("finding UchomeBlog instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UchomeBlog").add(
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
		log.debug("finding UchomeBlog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UchomeBlog as model where model."
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

	public List findBySubject(Object subject) {
		return findByProperty(SUBJECT, subject);
	}

	public List findByClassid(Object classid) {
		return findByProperty(CLASSID, classid);
	}

	public List findByViewnum(Object viewnum) {
		return findByProperty(VIEWNUM, viewnum);
	}

	public List findByReplynum(Object replynum) {
		return findByProperty(REPLYNUM, replynum);
	}

	public List findByTracenum(Object tracenum) {
		return findByProperty(TRACENUM, tracenum);
	}

	public List findByDateline(Object dateline) {
		return findByProperty(DATELINE, dateline);
	}

	public List findByPic(Object pic) {
		return findByProperty(PIC, pic);
	}

	public List findByPicflag(Object picflag) {
		return findByProperty(PICFLAG, picflag);
	}

	public List findByNoreply(Object noreply) {
		return findByProperty(NOREPLY, noreply);
	}

	public List findByFriend(Object friend) {
		return findByProperty(FRIEND, friend);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findAll() {
		log.debug("finding all UchomeBlog instances");
		try {
			String queryString = "from UchomeBlog";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeBlog merge(UchomeBlog detachedInstance) {
		log.debug("merging UchomeBlog instance");
		try {
			UchomeBlog result = (UchomeBlog) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeBlog instance) {
		log.debug("attaching dirty UchomeBlog instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeBlog instance) {
		log.debug("attaching clean UchomeBlog instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}