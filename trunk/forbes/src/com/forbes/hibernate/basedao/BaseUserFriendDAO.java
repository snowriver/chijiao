package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserFriend;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserFriend entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserFriend
 * @author MyEclipse Persistence Tools
 */

public class BaseUserFriendDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserFriendDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String FRIEND_ID = "friendId";
	public static final String FRIEND_LOGINNAME = "friendLoginname";
	public static final String NOTE = "note";

	public void save(UserFriend transientInstance) {
		log.debug("saving UserFriend instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserFriend persistentInstance) {
		log.debug("deleting UserFriend instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserFriend findById(java.lang.Long id) {
		log.debug("getting UserFriend instance with id: " + id);
		try {
			UserFriend instance = (UserFriend) getSession().get(
					"com.forbes.hibernate.bean.UserFriend", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserFriend instance) {
		log.debug("finding UserFriend instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserFriend").add(
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
		log.debug("finding UserFriend instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserFriend as model where model."
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

	public List findByFriendId(Object friendId) {
		return findByProperty(FRIEND_ID, friendId);
	}

	public List findByFriendLoginname(Object friendLoginname) {
		return findByProperty(FRIEND_LOGINNAME, friendLoginname);
	}

	public List findByNote(Object note) {
		return findByProperty(NOTE, note);
	}

	public List findAll() {
		log.debug("finding all UserFriend instances");
		try {
			String queryString = "from UserFriend";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserFriend merge(UserFriend detachedInstance) {
		log.debug("merging UserFriend instance");
		try {
			UserFriend result = (UserFriend) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserFriend instance) {
		log.debug("attaching dirty UserFriend instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserFriend instance) {
		log.debug("attaching clean UserFriend instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}