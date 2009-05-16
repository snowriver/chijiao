package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.ArticleKeyword;

/**
 * A data access object (DAO) providing persistence and search support for
 * ArticleKeyword entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.ArticleKeyword
 * @author MyEclipse Persistence Tools
 */

public class BaseArticleKeywordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseArticleKeywordDAO.class);
	// property constants
	public static final String KEYWORD = "keyword";
	public static final String RANK = "rank";
	public static final String STA = "sta";
	public static final String RPURL = "rpurl";

	public void save(ArticleKeyword transientInstance) {
		log.debug("saving ArticleKeyword instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ArticleKeyword persistentInstance) {
		log.debug("deleting ArticleKeyword instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ArticleKeyword findById(java.lang.Integer id) {
		log.debug("getting ArticleKeyword instance with id: " + id);
		try {
			ArticleKeyword instance = (ArticleKeyword) getSession().get(
					"com.forbes.hibernate.bean.ArticleKeyword", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ArticleKeyword instance) {
		log.debug("finding ArticleKeyword instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.ArticleKeyword").add(
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
		log.debug("finding ArticleKeyword instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ArticleKeyword as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKeyword(Object keyword) {
		return findByProperty(KEYWORD, keyword);
	}

	public List findByRank(Object rank) {
		return findByProperty(RANK, rank);
	}

	public List findBySta(Object sta) {
		return findByProperty(STA, sta);
	}

	public List findByRpurl(Object rpurl) {
		return findByProperty(RPURL, rpurl);
	}

	public List findAll() {
		log.debug("finding all ArticleKeyword instances");
		try {
			String queryString = "from ArticleKeyword order by rank desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ArticleKeyword merge(ArticleKeyword detachedInstance) {
		log.debug("merging ArticleKeyword instance");
		try {
			ArticleKeyword result = (ArticleKeyword) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ArticleKeyword instance) {
		log.debug("attaching dirty ArticleKeyword instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ArticleKeyword instance) {
		log.debug("attaching clean ArticleKeyword instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}