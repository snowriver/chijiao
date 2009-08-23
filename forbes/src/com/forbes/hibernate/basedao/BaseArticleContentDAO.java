package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.ArticleContent;

/**
 * A data access object (DAO) providing persistence and search support for
 * ArticleContent entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.ArticleContent
 * @author MyEclipse Persistence Tools
 */

public class BaseArticleContentDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseArticleContentDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	public void save(ArticleContent transientInstance) {
		log.debug("saving ArticleContent instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ArticleContent persistentInstance) {
		log.debug("deleting ArticleContent instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ArticleContent findById(java.lang.Integer id) {
		log.debug("getting ArticleContent instance with id: " + id);
		try {
			ArticleContent instance = (ArticleContent) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.ArticleContent", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ArticleContent instance) {
		log.debug("finding ArticleContent instance by example");
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
		log.debug("finding ArticleContent instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ArticleContent as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all ArticleContent instances");
		try {
			String queryString = "from ArticleContent";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ArticleContent merge(ArticleContent detachedInstance) {
		log.debug("merging ArticleContent instance");
		try {
			ArticleContent result = (ArticleContent) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ArticleContent instance) {
		log.debug("attaching dirty ArticleContent instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ArticleContent instance) {
		log.debug("attaching clean ArticleContent instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseArticleContentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseArticleContentDAO) ctx.getBean("ArticleContentDAO");
	}
}