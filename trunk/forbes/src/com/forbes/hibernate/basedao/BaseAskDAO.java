package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.Ask;

/**
 * A data access object (DAO) providing persistence and search support for Ask
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.Ask
 * @author MyEclipse Persistence Tools
 */

public class BaseAskDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseAskDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String TYPE_ID = "typeId";
	public static final String TYPE_NAME = "typeName";
	public static final String TYPE_ID2 = "typeId2";
	public static final String TYPE_NAME2 = "typeName2";
	public static final String ANONYMOUS = "anonymous";
	public static final String TITLE = "title";
	public static final String DIGEST = "digest";
	public static final String REWARD = "reward";
	public static final String BEST_ANSWER = "bestAnswer";
	public static final String STATUS = "status";
	public static final String DISORDER = "disorder";
	public static final String VIEWS = "views";
	public static final String REPLIES = "replies";
	public static final String IP = "ip";
	public static final String CONTENT = "content";
	public static final String EXTRA = "extra";

	public void save(Ask transientInstance) {
		log.debug("saving Ask instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Ask persistentInstance) {
		log.debug("deleting Ask instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Ask findById(java.lang.Integer id) {
		log.debug("getting Ask instance with id: " + id);
		try {
			Ask instance = (Ask) getSession().get("com.forbes.hibernate.bean.Ask",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Ask instance) {
		log.debug("finding Ask instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.Ask").add(Example.create(instance))
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
		log.debug("finding Ask instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ask as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByTypeId(Object typeId) {
		return findByProperty(TYPE_ID, typeId);
	}

	public List findByTypeName(Object typeName) {
		return findByProperty(TYPE_NAME, typeName);
	}

	public List findByTypeId2(Object typeId2) {
		return findByProperty(TYPE_ID2, typeId2);
	}

	public List findByTypeName2(Object typeName2) {
		return findByProperty(TYPE_NAME2, typeName2);
	}

	public List findByAnonymous(Object anonymous) {
		return findByProperty(ANONYMOUS, anonymous);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByDigest(Object digest) {
		return findByProperty(DIGEST, digest);
	}

	public List findByReward(Object reward) {
		return findByProperty(REWARD, reward);
	}

	public List findByBestAnswer(Object bestAnswer) {
		return findByProperty(BEST_ANSWER, bestAnswer);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByDisorder(Object disorder) {
		return findByProperty(DISORDER, disorder);
	}

	public List findByViews(Object views) {
		return findByProperty(VIEWS, views);
	}

	public List findByReplies(Object replies) {
		return findByProperty(REPLIES, replies);
	}

	public List findByIp(Object ip) {
		return findByProperty(IP, ip);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByExtra(Object extra) {
		return findByProperty(EXTRA, extra);
	}

	public List findAll() {
		log.debug("finding all Ask instances");
		try {
			String queryString = "from Ask";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Ask merge(Ask detachedInstance) {
		log.debug("merging Ask instance");
		try {
			Ask result = (Ask) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Ask instance) {
		log.debug("attaching dirty Ask instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Ask instance) {
		log.debug("attaching clean Ask instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}