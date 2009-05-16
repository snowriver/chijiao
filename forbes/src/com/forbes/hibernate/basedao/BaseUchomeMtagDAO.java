package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeMtag;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeMtag entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeMtag
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeMtagDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeMtagDAO.class);
	// property constants
	public static final String TAGNAME = "tagname";
	public static final String FIELDID = "fieldid";
	public static final String MEMBERNUM = "membernum";
	public static final String CLOSE = "close";
	public static final String ANNOUNCEMENT = "announcement";
	public static final String PIC = "pic";
	public static final String CLOSEAPPLY = "closeapply";
	public static final String JOINPERM = "joinperm";
	public static final String VIEWPERM = "viewperm";
	public static final String MODERATOR = "moderator";

	public void save(UchomeMtag transientInstance) {
		log.debug("saving UchomeMtag instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeMtag persistentInstance) {
		log.debug("deleting UchomeMtag instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeMtag findById(java.lang.Integer id) {
		log.debug("getting UchomeMtag instance with id: " + id);
		try {
			UchomeMtag instance = (UchomeMtag) getSession().get(
					"com.forbes.hibernate.bean.UchomeMtag", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeMtag instance) {
		log.debug("finding UchomeMtag instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UchomeMtag").add(
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
		log.debug("finding UchomeMtag instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UchomeMtag as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTagname(Object tagname) {
		return findByProperty(TAGNAME, tagname);
	}

	public List findByFieldid(Object fieldid) {
		return findByProperty(FIELDID, fieldid);
	}

	public List findByMembernum(Object membernum) {
		return findByProperty(MEMBERNUM, membernum);
	}

	public List findByClose(Object close) {
		return findByProperty(CLOSE, close);
	}

	public List findByAnnouncement(Object announcement) {
		return findByProperty(ANNOUNCEMENT, announcement);
	}

	public List findByPic(Object pic) {
		return findByProperty(PIC, pic);
	}

	public List findByCloseapply(Object closeapply) {
		return findByProperty(CLOSEAPPLY, closeapply);
	}

	public List findByJoinperm(Object joinperm) {
		return findByProperty(JOINPERM, joinperm);
	}

	public List findByViewperm(Object viewperm) {
		return findByProperty(VIEWPERM, viewperm);
	}

	public List findByModerator(Object moderator) {
		return findByProperty(MODERATOR, moderator);
	}

	public List findAll() {
		log.debug("finding all UchomeMtag instances");
		try {
			String queryString = "from UchomeMtag";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeMtag merge(UchomeMtag detachedInstance) {
		log.debug("merging UchomeMtag instance");
		try {
			UchomeMtag result = (UchomeMtag) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeMtag instance) {
		log.debug("attaching dirty UchomeMtag instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeMtag instance) {
		log.debug("attaching clean UchomeMtag instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}