package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.News;

/**
 * A data access object (DAO) providing persistence and search support for News
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.News
 * @author MyEclipse Persistence Tools
 */

public class BaseNewsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseNewsDAO.class);
	// property constants
	public static final String USERID = "userid";
	public static final String LIKEID = "likeid";
	public static final String ISCOMMEND = "iscommend";
	public static final String CLICK = "click";
	public static final String TITLE = "title";
	public static final String SHORTTITLE = "shorttitle";
	public static final String WRITER = "writer";
	public static final String SOURCE = "source";
	public static final String DESCRIPTION = "description";
	public static final String KEYWORDS = "keywords";
	public static final String DIGG = "digg";
	public static final String ISDELETE = "isdelete";
	public static final String LITPIC = "litpic";
	public static final String COLOR = "color";
	public static final String ARCRANK = "arcrank";
	public static final String CONTENT = "content";

	public void save(News transientInstance) {
		log.debug("saving News instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(News persistentInstance) {
		log.debug("deleting News instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public News findById(java.lang.Integer id) {
		log.debug("getting News instance with id: " + id);
		try {
			News instance = (News) getSession().get(
					"com.forbes.hibernate.bean.News", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(News instance) {
		log.debug("finding News instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.News").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding News instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from News as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserid(Object userid) {
		return findByProperty(USERID, userid);
	}

	public List findByLikeid(Object likeid) {
		return findByProperty(LIKEID, likeid);
	}

	public List findByIscommend(Object iscommend) {
		return findByProperty(ISCOMMEND, iscommend);
	}

	public List findByClick(Object click) {
		return findByProperty(CLICK, click);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByShorttitle(Object shorttitle) {
		return findByProperty(SHORTTITLE, shorttitle);
	}

	public List findByWriter(Object writer) {
		return findByProperty(WRITER, writer);
	}

	public List findBySource(Object source) {
		return findByProperty(SOURCE, source);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findByKeywords(Object keywords) {
		return findByProperty(KEYWORDS, keywords);
	}

	public List findByDigg(Object digg) {
		return findByProperty(DIGG, digg);
	}

	public List findByIsdelete(Object isdelete) {
		return findByProperty(ISDELETE, isdelete);
	}

	public List findByLitpic(Object litpic) {
		return findByProperty(LITPIC, litpic);
	}

	public List findByColor(Object color) {
		return findByProperty(COLOR, color);
	}

	public List findByArcrank(Object arcrank) {
		return findByProperty(ARCRANK, arcrank);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all News instances");
		try {
			String queryString = "from News";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public News merge(News detachedInstance) {
		log.debug("merging News instance");
		try {
			News result = (News) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(News instance) {
		log.debug("attaching dirty News instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(News instance) {
		log.debug("attaching clean News instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}