package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.CdbForums;

/**
 * A data access object (DAO) providing persistence and search support for
 * CdbForums entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.CdbForums
 * @author MyEclipse Persistence Tools
 */

public class BaseCdbForumsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseCdbForumsDAO.class);
	// property constants
	public static final String FUP = "fup";
	public static final String TYPE = "type";
	public static final String NAME = "name";
	public static final String STATUS = "status";
	public static final String DISPLAYORDER = "displayorder";
	public static final String STYLEID = "styleid";
	public static final String THREADS = "threads";
	public static final String POSTS = "posts";
	public static final String TODAYPOSTS = "todayposts";
	public static final String LASTPOST = "lastpost";
	public static final String ALLOWSMILIES = "allowsmilies";
	public static final String ALLOWHTML = "allowhtml";
	public static final String ALLOWBBCODE = "allowbbcode";
	public static final String ALLOWIMGCODE = "allowimgcode";
	public static final String ALLOWMEDIACODE = "allowmediacode";
	public static final String ALLOWANONYMOUS = "allowanonymous";
	public static final String ALLOWSHARE = "allowshare";
	public static final String ALLOWPOSTSPECIAL = "allowpostspecial";
	public static final String ALLOWSPECIALONLY = "allowspecialonly";
	public static final String ALLOWEDITRULES = "alloweditrules";
	public static final String ALLOWFEED = "allowfeed";
	public static final String RECYCLEBIN = "recyclebin";
	public static final String MODNEWPOSTS = "modnewposts";
	public static final String JAMMER = "jammer";
	public static final String DISABLEWATERMARK = "disablewatermark";
	public static final String INHERITEDMOD = "inheritedmod";
	public static final String AUTOCLOSE = "autoclose";
	public static final String FORUMCOLUMNS = "forumcolumns";
	public static final String THREADCACHES = "threadcaches";
	public static final String ALLOWEDITPOST = "alloweditpost";
	public static final String SIMPLE = "simple";
	public static final String MODWORKS = "modworks";
	public static final String ALLOWTAG = "allowtag";
	public static final String ALLOWGLOBALSTICK = "allowglobalstick";

	public void save(CdbForums transientInstance) {
		log.debug("saving CdbForums instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CdbForums persistentInstance) {
		log.debug("deleting CdbForums instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CdbForums findById(java.lang.Short id) {
		log.debug("getting CdbForums instance with id: " + id);
		try {
			CdbForums instance = (CdbForums) getSession().get(
					"com.forbes.hibernate.bean.CdbForums", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CdbForums instance) {
		log.debug("finding CdbForums instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.CdbForums").add(
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
		log.debug("finding CdbForums instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CdbForums as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFup(Object fup) {
		return findByProperty(FUP, fup);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByDisplayorder(Object displayorder) {
		return findByProperty(DISPLAYORDER, displayorder);
	}

	public List findByStyleid(Object styleid) {
		return findByProperty(STYLEID, styleid);
	}

	public List findByThreads(Object threads) {
		return findByProperty(THREADS, threads);
	}

	public List findByPosts(Object posts) {
		return findByProperty(POSTS, posts);
	}

	public List findByTodayposts(Object todayposts) {
		return findByProperty(TODAYPOSTS, todayposts);
	}

	public List findByLastpost(Object lastpost) {
		return findByProperty(LASTPOST, lastpost);
	}

	public List findByAllowsmilies(Object allowsmilies) {
		return findByProperty(ALLOWSMILIES, allowsmilies);
	}

	public List findByAllowhtml(Object allowhtml) {
		return findByProperty(ALLOWHTML, allowhtml);
	}

	public List findByAllowbbcode(Object allowbbcode) {
		return findByProperty(ALLOWBBCODE, allowbbcode);
	}

	public List findByAllowimgcode(Object allowimgcode) {
		return findByProperty(ALLOWIMGCODE, allowimgcode);
	}

	public List findByAllowmediacode(Object allowmediacode) {
		return findByProperty(ALLOWMEDIACODE, allowmediacode);
	}

	public List findByAllowanonymous(Object allowanonymous) {
		return findByProperty(ALLOWANONYMOUS, allowanonymous);
	}

	public List findByAllowshare(Object allowshare) {
		return findByProperty(ALLOWSHARE, allowshare);
	}

	public List findByAllowpostspecial(Object allowpostspecial) {
		return findByProperty(ALLOWPOSTSPECIAL, allowpostspecial);
	}

	public List findByAllowspecialonly(Object allowspecialonly) {
		return findByProperty(ALLOWSPECIALONLY, allowspecialonly);
	}

	public List findByAlloweditrules(Object alloweditrules) {
		return findByProperty(ALLOWEDITRULES, alloweditrules);
	}

	public List findByAllowfeed(Object allowfeed) {
		return findByProperty(ALLOWFEED, allowfeed);
	}

	public List findByRecyclebin(Object recyclebin) {
		return findByProperty(RECYCLEBIN, recyclebin);
	}

	public List findByModnewposts(Object modnewposts) {
		return findByProperty(MODNEWPOSTS, modnewposts);
	}

	public List findByJammer(Object jammer) {
		return findByProperty(JAMMER, jammer);
	}

	public List findByDisablewatermark(Object disablewatermark) {
		return findByProperty(DISABLEWATERMARK, disablewatermark);
	}

	public List findByInheritedmod(Object inheritedmod) {
		return findByProperty(INHERITEDMOD, inheritedmod);
	}

	public List findByAutoclose(Object autoclose) {
		return findByProperty(AUTOCLOSE, autoclose);
	}

	public List findByForumcolumns(Object forumcolumns) {
		return findByProperty(FORUMCOLUMNS, forumcolumns);
	}

	public List findByThreadcaches(Object threadcaches) {
		return findByProperty(THREADCACHES, threadcaches);
	}

	public List findByAlloweditpost(Object alloweditpost) {
		return findByProperty(ALLOWEDITPOST, alloweditpost);
	}

	public List findBySimple(Object simple) {
		return findByProperty(SIMPLE, simple);
	}

	public List findByModworks(Object modworks) {
		return findByProperty(MODWORKS, modworks);
	}

	public List findByAllowtag(Object allowtag) {
		return findByProperty(ALLOWTAG, allowtag);
	}

	public List findByAllowglobalstick(Object allowglobalstick) {
		return findByProperty(ALLOWGLOBALSTICK, allowglobalstick);
	}

	public List findAll() {
		log.debug("finding all CdbForums instances");
		try {
			String queryString = "from CdbForums";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CdbForums merge(CdbForums detachedInstance) {
		log.debug("merging CdbForums instance");
		try {
			CdbForums result = (CdbForums) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CdbForums instance) {
		log.debug("attaching dirty CdbForums instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CdbForums instance) {
		log.debug("attaching clean CdbForums instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}