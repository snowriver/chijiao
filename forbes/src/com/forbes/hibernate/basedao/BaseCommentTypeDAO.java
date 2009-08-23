package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.forbes.hibernate.bean.CommentType;

/**
 * A data access object (DAO) providing persistence and search support for
 * CommentType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.CommentType
 * @author MyEclipse Persistence Tools
 */

public class BaseCommentTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseCommentTypeDAO.class);
	// property constants
	public static final String TYPE_NAME = "typeName";

	public void save(CommentType transientInstance) {
		log.debug("saving CommentType instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CommentType persistentInstance) {
		log.debug("deleting CommentType instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CommentType findById(java.lang.Short id) {
		log.debug("getting CommentType instance with id: " + id);
		try {
			CommentType instance = (CommentType) getSession().get(
					"com.forbes.hibernate.bean.CommentType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CommentType instance) {
		log.debug("finding CommentType instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.CommentType").add(
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
		log.debug("finding CommentType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CommentType as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTypeName(Object typeName) {
		return findByProperty(TYPE_NAME, typeName);
	}

	public List findAll() {
		log.debug("finding all CommentType instances");
		try {
			String queryString = "from CommentType";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CommentType merge(CommentType detachedInstance) {
		log.debug("merging CommentType instance");
		try {
			CommentType result = (CommentType) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CommentType instance) {
		log.debug("attaching dirty CommentType instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CommentType instance) {
		log.debug("attaching clean CommentType instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}