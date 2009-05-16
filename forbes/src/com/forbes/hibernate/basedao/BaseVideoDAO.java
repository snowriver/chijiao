package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.forbes.hibernate.bean.Video;

/**
 * A data access object (DAO) providing persistence and search support for
 * Video entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Video
 * @author MyEclipse Persistence Tools
 */

public class BaseVideoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseVideoDAO.class);
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

	public void save(Video transientInstance) {
		log.debug("saving Video instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Video persistentInstance) {
		log.debug("deleting Video instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Video findById(java.lang.Integer id) {
		log.debug("getting Video instance with id: " + id);
		try {
			Video instance = (Video) getSession().get(
					"com.forbes.hibernate.bean.Video", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Video instance) {
		log.debug("finding Video instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Video").add(
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
		log.debug("finding Video instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Video as model where model."
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
		log.debug("finding all Video instances");
		try {
			String queryString = "from Video";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Video merge(Video detachedInstance) {
		log.debug("merging Video instance");
		try {
			Video result = (Video) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Video instance) {
		log.debug("attaching dirty Video instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Video instance) {
		log.debug("attaching clean Video instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}