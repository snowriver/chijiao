package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.CdbThreads;

/**
 * A data access object (DAO) providing persistence and search support for
 * CdbThreads entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.CdbThreads
 * @author MyEclipse Persistence Tools
 */

public class BaseCdbThreadsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseCdbThreadsDAO.class);
	// property constants
	public static final String FID = "fid";
	public static final String ICONID = "iconid";
	public static final String TYPEID = "typeid";
	public static final String SORTID = "sortid";
	public static final String READPERM = "readperm";
	public static final String PRICE = "price";
	public static final String AUTHOR = "author";
	public static final String AUTHORID = "authorid";
	public static final String SUBJECT = "subject";
	public static final String DATELINE = "dateline";
	public static final String LASTPOST = "lastpost";
	public static final String LASTPOSTER = "lastposter";
	public static final String VIEWS = "views";
	public static final String REPLIES = "replies";
	public static final String DISPLAYORDER = "displayorder";
	public static final String HIGHLIGHT = "highlight";
	public static final String DIGEST = "digest";
	public static final String RATE = "rate";
	public static final String SPECIAL = "special";
	public static final String ATTACHMENT = "attachment";
	public static final String SUBSCRIBED = "subscribed";
	public static final String MODERATED = "moderated";
	public static final String CLOSED = "closed";
	public static final String ITEMID = "itemid";
	public static final String SUPE_PUSHSTATUS = "supePushstatus";

	public void save(CdbThreads transientInstance) {
		log.debug("saving CdbThreads instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CdbThreads persistentInstance) {
		log.debug("deleting CdbThreads instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CdbThreads findById(java.lang.Integer id) {
		log.debug("getting CdbThreads instance with id: " + id);
		try {
			CdbThreads instance = (CdbThreads) getSession().get(
					"com.forbes.hibernate.bean.CdbThreads", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CdbThreads instance) {
		log.debug("finding CdbThreads instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.CdbThreads").add(
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
		log.debug("finding CdbThreads instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CdbThreads as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFid(Object fid) {
		return findByProperty(FID, fid);
	}

	public List findByIconid(Object iconid) {
		return findByProperty(ICONID, iconid);
	}

	public List findByTypeid(Object typeid) {
		return findByProperty(TYPEID, typeid);
	}

	public List findBySortid(Object sortid) {
		return findByProperty(SORTID, sortid);
	}

	public List findByReadperm(Object readperm) {
		return findByProperty(READPERM, readperm);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByAuthor(Object author) {
		return findByProperty(AUTHOR, author);
	}

	public List findByAuthorid(Object authorid) {
		return findByProperty(AUTHORID, authorid);
	}

	public List findBySubject(Object subject) {
		return findByProperty(SUBJECT, subject);
	}

	public List findByDateline(Object dateline) {
		return findByProperty(DATELINE, dateline);
	}

	public List findByLastpost(Object lastpost) {
		return findByProperty(LASTPOST, lastpost);
	}

	public List findByLastposter(Object lastposter) {
		return findByProperty(LASTPOSTER, lastposter);
	}

	public List findByViews(Object views) {
		return findByProperty(VIEWS, views);
	}

	public List findByReplies(Object replies) {
		return findByProperty(REPLIES, replies);
	}

	public List findByDisplayorder(Object displayorder) {
		return findByProperty(DISPLAYORDER, displayorder);
	}

	public List findByHighlight(Object highlight) {
		return findByProperty(HIGHLIGHT, highlight);
	}

	public List findByDigest(Object digest) {
		return findByProperty(DIGEST, digest);
	}

	public List findByRate(Object rate) {
		return findByProperty(RATE, rate);
	}

	public List findBySpecial(Object special) {
		return findByProperty(SPECIAL, special);
	}

	public List findByAttachment(Object attachment) {
		return findByProperty(ATTACHMENT, attachment);
	}

	public List findBySubscribed(Object subscribed) {
		return findByProperty(SUBSCRIBED, subscribed);
	}

	public List findByModerated(Object moderated) {
		return findByProperty(MODERATED, moderated);
	}

	public List findByClosed(Object closed) {
		return findByProperty(CLOSED, closed);
	}

	public List findByItemid(Object itemid) {
		return findByProperty(ITEMID, itemid);
	}

	public List findBySupePushstatus(Object supePushstatus) {
		return findByProperty(SUPE_PUSHSTATUS, supePushstatus);
	}

	public List findAll() {
		log.debug("finding all CdbThreads instances");
		try {
			String queryString = "from CdbThreads";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CdbThreads merge(CdbThreads detachedInstance) {
		log.debug("merging CdbThreads instance");
		try {
			CdbThreads result = (CdbThreads) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CdbThreads instance) {
		log.debug("attaching dirty CdbThreads instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CdbThreads instance) {
		log.debug("attaching clean CdbThreads instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}