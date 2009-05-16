package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.Bulletin;

/**
 * A data access object (DAO) providing persistence and search support for
 * Bulletin entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Bulletin
 * @author MyEclipse Persistence Tools
 */

public class BaseBulletinDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseBulletinDAO.class);
	// property constants
	public static final String CLICK = "click";
	public static final String TITLE = "title";
	public static final String COLOR = "color";
	public static final String RANK = "rank";
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	public void save(Bulletin transientInstance) {
		log.debug("saving Bulletin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Bulletin persistentInstance) {
		log.debug("deleting Bulletin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Bulletin findById(java.lang.Integer id) {
		log.debug("getting Bulletin instance with id: " + id);
		try {
			Bulletin instance = (Bulletin) getHibernateTemplate().get(
					"com.forbes.hibernate.bean.Bulletin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Bulletin instance) {
		log.debug("finding Bulletin instance by example");
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
		log.debug("finding Bulletin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Bulletin as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByClick(Object click) {
		return findByProperty(CLICK, click);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByColor(Object color) {
		return findByProperty(COLOR, color);
	}

	public List findByArcrank(Object rank) {
		return findByProperty(RANK, rank);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all Bulletin instances");
		try {
			String queryString = "from Bulletin";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Bulletin merge(Bulletin detachedInstance) {
		log.debug("merging Bulletin instance");
		try {
			Bulletin result = (Bulletin) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Bulletin instance) {
		log.debug("attaching dirty Bulletin instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Bulletin instance) {
		log.debug("attaching clean Bulletin instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseBulletinDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BaseBulletinDAO) ctx.getBean("BulletinDAO");
	}
}