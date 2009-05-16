package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UcMembers;

/**
 * A data access object (DAO) providing persistence and search support for
 * UcMembers entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UcMembers
 * @author MyEclipse Persistence Tools
 */

public class BaseUcMembersDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUcMembersDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String EMAIL = "email";
	public static final String MYID = "myid";
	public static final String MYIDKEY = "myidkey";
	public static final String REGIP = "regip";
	public static final String REGDATE = "regdate";
	public static final String LASTLOGINIP = "lastloginip";
	public static final String LASTLOGINTIME = "lastlogintime";
	public static final String SALT = "salt";
	public static final String SECQUES = "secques";
	public static final String TYPE = "type";

	public void save(UcMembers transientInstance) {
		log.debug("saving UcMembers instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UcMembers persistentInstance) {
		log.debug("deleting UcMembers instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UcMembers findById(java.lang.Integer id) {
		log.debug("getting UcMembers instance with id: " + id);
		try {
			UcMembers instance = (UcMembers) getSession().get(
					"com.forbes.hibernate.bean.UcMembers", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UcMembers instance) {
		log.debug("finding UcMembers instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UcMembers").add(
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
		log.debug("finding UcMembers instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UcMembers as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByMyid(Object myid) {
		return findByProperty(MYID, myid);
	}

	public List findByMyidkey(Object myidkey) {
		return findByProperty(MYIDKEY, myidkey);
	}

	public List findByRegip(Object regip) {
		return findByProperty(REGIP, regip);
	}

	public List findByRegdate(Object regdate) {
		return findByProperty(REGDATE, regdate);
	}

	public List findByLastloginip(Object lastloginip) {
		return findByProperty(LASTLOGINIP, lastloginip);
	}

	public List findByLastlogintime(Object lastlogintime) {
		return findByProperty(LASTLOGINTIME, lastlogintime);
	}

	public List findBySalt(Object salt) {
		return findByProperty(SALT, salt);
	}

	public List findBySecques(Object secques) {
		return findByProperty(SECQUES, secques);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findAll() {
		log.debug("finding all UcMembers instances");
		try {
			String queryString = "from UcMembers";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UcMembers merge(UcMembers detachedInstance) {
		log.debug("merging UcMembers instance");
		try {
			UcMembers result = (UcMembers) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UcMembers instance) {
		log.debug("attaching dirty UcMembers instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UcMembers instance) {
		log.debug("attaching clean UcMembers instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}