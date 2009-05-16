package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UchomeFeed;

/**
 * A data access object (DAO) providing persistence and search support for
 * UchomeFeed entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UchomeFeed
 * @author MyEclipse Persistence Tools
 */

public class BaseUchomeFeedDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUchomeFeedDAO.class);
	// property constants
	public static final String APPID = "appid";
	public static final String ICON = "icon";
	public static final String UID = "uid";
	public static final String USERNAME = "username";
	public static final String DATELINE = "dateline";
	public static final String FRIEND = "friend";
	public static final String HASH_TEMPLATE = "hashTemplate";
	public static final String HASH_DATA = "hashData";
	public static final String TITLE_TEMPLATE = "titleTemplate";
	public static final String TITLE_DATA = "titleData";
	public static final String BODY_TEMPLATE = "bodyTemplate";
	public static final String BODY_DATA = "bodyData";
	public static final String BODY_GENERAL = "bodyGeneral";
	public static final String IMAGE1 = "image1";
	public static final String IMAGE1_LINK = "image1Link";
	public static final String IMAGE2 = "image2";
	public static final String IMAGE2_LINK = "image2Link";
	public static final String IMAGE3 = "image3";
	public static final String IMAGE3_LINK = "image3Link";
	public static final String IMAGE4 = "image4";
	public static final String IMAGE4_LINK = "image4Link";
	public static final String TARGET_IDS = "targetIds";

	public void save(UchomeFeed transientInstance) {
		log.debug("saving UchomeFeed instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UchomeFeed persistentInstance) {
		log.debug("deleting UchomeFeed instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UchomeFeed findById(java.lang.Integer id) {
		log.debug("getting UchomeFeed instance with id: " + id);
		try {
			UchomeFeed instance = (UchomeFeed) getSession().get(
					"com.forbes.hibernate.bean.UchomeFeed", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UchomeFeed instance) {
		log.debug("finding UchomeFeed instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UchomeFeed").add(
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
		log.debug("finding UchomeFeed instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UchomeFeed as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAppid(Object appid) {
		return findByProperty(APPID, appid);
	}

	public List findByIcon(Object icon) {
		return findByProperty(ICON, icon);
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByDateline(Object dateline) {
		return findByProperty(DATELINE, dateline);
	}

	public List findByFriend(Object friend) {
		return findByProperty(FRIEND, friend);
	}

	public List findByHashTemplate(Object hashTemplate) {
		return findByProperty(HASH_TEMPLATE, hashTemplate);
	}

	public List findByHashData(Object hashData) {
		return findByProperty(HASH_DATA, hashData);
	}

	public List findByTitleTemplate(Object titleTemplate) {
		return findByProperty(TITLE_TEMPLATE, titleTemplate);
	}

	public List findByTitleData(Object titleData) {
		return findByProperty(TITLE_DATA, titleData);
	}

	public List findByBodyTemplate(Object bodyTemplate) {
		return findByProperty(BODY_TEMPLATE, bodyTemplate);
	}

	public List findByBodyData(Object bodyData) {
		return findByProperty(BODY_DATA, bodyData);
	}

	public List findByBodyGeneral(Object bodyGeneral) {
		return findByProperty(BODY_GENERAL, bodyGeneral);
	}

	public List findByImage1(Object image1) {
		return findByProperty(IMAGE1, image1);
	}

	public List findByImage1Link(Object image1Link) {
		return findByProperty(IMAGE1_LINK, image1Link);
	}

	public List findByImage2(Object image2) {
		return findByProperty(IMAGE2, image2);
	}

	public List findByImage2Link(Object image2Link) {
		return findByProperty(IMAGE2_LINK, image2Link);
	}

	public List findByImage3(Object image3) {
		return findByProperty(IMAGE3, image3);
	}

	public List findByImage3Link(Object image3Link) {
		return findByProperty(IMAGE3_LINK, image3Link);
	}

	public List findByImage4(Object image4) {
		return findByProperty(IMAGE4, image4);
	}

	public List findByImage4Link(Object image4Link) {
		return findByProperty(IMAGE4_LINK, image4Link);
	}

	public List findByTargetIds(Object targetIds) {
		return findByProperty(TARGET_IDS, targetIds);
	}

	public List findAll() {
		log.debug("finding all UchomeFeed instances");
		try {
			String queryString = "from UchomeFeed";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UchomeFeed merge(UchomeFeed detachedInstance) {
		log.debug("merging UchomeFeed instance");
		try {
			UchomeFeed result = (UchomeFeed) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UchomeFeed instance) {
		log.debug("attaching dirty UchomeFeed instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UchomeFeed instance) {
		log.debug("attaching clean UchomeFeed instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}