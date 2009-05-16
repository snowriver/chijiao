package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UcPms;

/**
 * A data access object (DAO) providing persistence and search support for UcPms
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UcPms
 * @author MyEclipse Persistence Tools
 */

public class BaseUcPmsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUcPmsDAO.class);
	// property constants
	public static final String MSGFROM = "msgfrom";
	public static final String MSGFROMID = "msgfromid";
	public static final String MSGTOID = "msgtoid";
	public static final String FOLDER = "folder";
	public static final String NEW_ = "new_";
	public static final String SUBJECT = "subject";
	public static final String DATELINE = "dateline";
	public static final String MESSAGE = "message";
	public static final String DELSTATUS = "delstatus";
	public static final String RELATED = "related";
	public static final String FROMAPPID = "fromappid";

	protected void initDao() {
		// do nothing
	}

	public void save(UcPms transientInstance) {
		log.debug("saving UcPms instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UcPms persistentInstance) {
		log.debug("deleting UcPms instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UcPms findById(java.lang.Integer id) {
		log.debug("getting UcPms instance with id: " + id);
		try {
			UcPms instance = (UcPms) getHibernateTemplate().get(
					"com.forbes.hibernate.bean.UcPms", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UcPms instance) {
		log.debug("finding UcPms instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding UcPms instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UcPms as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMsgfrom(Object msgfrom) {
		return findByProperty(MSGFROM, msgfrom);
	}

	public List findByMsgfromid(Object msgfromid) {
		return findByProperty(MSGFROMID, msgfromid);
	}

	public List findByMsgtoid(Object msgtoid) {
		return findByProperty(MSGTOID, msgtoid);
	}

	public List findByFolder(Object folder) {
		return findByProperty(FOLDER, folder);
	}

	public List findByNew_(Object new_) {
		return findByProperty(NEW_, new_);
	}

	public List findBySubject(Object subject) {
		return findByProperty(SUBJECT, subject);
	}

	public List findByDateline(Object dateline) {
		return findByProperty(DATELINE, dateline);
	}

	public List findByMessage(Object message) {
		return findByProperty(MESSAGE, message);
	}

	public List findByDelstatus(Object delstatus) {
		return findByProperty(DELSTATUS, delstatus);
	}

	public List findByRelated(Object related) {
		return findByProperty(RELATED, related);
	}

	public List findByFromappid(Object fromappid) {
		return findByProperty(FROMAPPID, fromappid);
	}

	public List findAll() {
		log.debug("finding all UcPms instances");
		try {
			String queryString = "from UcPms";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UcPms merge(UcPms detachedInstance) {
		log.debug("merging UcPms instance");
		try {
			UcPms result = (UcPms) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UcPms instance) {
		log.debug("attaching dirty UcPms instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UcPms instance) {
		log.debug("attaching clean UcPms instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUcPmsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BaseUcPmsDAO) ctx.getBean("UcPmsDAO");
	}
}