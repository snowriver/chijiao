package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.forbes.hibernate.bean.Article;

/**
 * A data access object (DAO) providing persistence and search support for
 * Article entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Article
 * @author MyEclipse Persistence Tools
 */

public class BaseArticleDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseArticleDAO.class);
	// property constants
	public static final String USERID = "userid";
	public static final String USERIP = "userip";
	public static final String TYPEID = "typeid";
	public static final String TYPEID2 = "typeid2";
	public static final String TYPEID3 = "typeid3";
	public static final String ISCOMMEND = "iscommend";
	public static final String ISMAKE = "ismake";
	public static final String CLICK = "click";
	public static final String TITLE = "title";
	public static final String SHORTTITLE = "shorttitle";
	public static final String WRITER = "writer";
	public static final String SOURCE = "source";
	public static final String DESCRIPTION = "description";
	public static final String KEYWORDS = "keywords";
	public static final String DELETE_FLAG = "deleteFlag";
	public static final String DIGG = "digg";
	public static final String VERIFY_FLAG = "verifyFlag";

	public void save(Article transientInstance) {
		log.debug("saving Article instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Article persistentInstance) {
		log.debug("deleting Article instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Article findById(java.lang.Integer id) {
		log.debug("getting Article instance with id: " + id);
		try {
			Article instance = (Article) getSession().get(
					"com.forbes.hibernate.bean.Article", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Article instance) {
		log.debug("finding Article instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Article").add(
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
		log.debug("finding Article instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Article as model where model."
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

	public List findByUserip(Object userip) {
		return findByProperty(USERIP, userip);
	}

	public List findByTypeid(Object typeid) {
		return findByProperty(TYPEID, typeid);
	}

	public List findByTypeid2(Object typeid2) {
		return findByProperty(TYPEID2, typeid2);
	}

	public List findByTypeid3(Object typeid3) {
		return findByProperty(TYPEID3, typeid3);
	}

	public List findByIscommend(Object iscommend) {
		return findByProperty(ISCOMMEND, iscommend);
	}

	public List findByIsmake(Object ismake) {
		return findByProperty(ISMAKE, ismake);
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

	public List findByDeleteFlag(Object deleteFlag) {
		return findByProperty(DELETE_FLAG, deleteFlag);
	}

	public List findByDigg(Object digg) {
		return findByProperty(DIGG, digg);
	}

	public List findByVerifyFlag(Object verifyFlag) {
		return findByProperty(VERIFY_FLAG, verifyFlag);
	}

	public List findAll() {
		log.debug("finding all Article instances");
		try {
			String queryString = "from Article";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Article merge(Article detachedInstance) {
		log.debug("merging Article instance");
		try {
			Article result = (Article) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Article instance) {
		log.debug("attaching dirty Article instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Article instance) {
		log.debug("attaching clean Article instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}