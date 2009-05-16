package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.AskAnswer;

/**
 * A data access object (DAO) providing persistence and search support for
 * AskAnswer entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.AskAnswer
 * @author MyEclipse Persistence Tools
 */

public class BaseAskAnswerDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseAskAnswerDAO.class);
	// property constants
	public static final String ASK_ID = "askId";
	public static final String IF_ANSWER = "ifAnswer";
	public static final String TYPE_ID = "typeId";
	public static final String TYPE_ID2 = "typeId2";
	public static final String USER_ID = "userId";
	public static final String LOGIN_NAME = "loginName";
	public static final String ANONYMOUS = "anonymous";
	public static final String GOOD_RATE = "goodRate";
	public static final String BAD_RATE = "badRate";
	public static final String USER_IP = "userIp";
	public static final String BRIEF = "brief";
	public static final String CONTENT = "content";
	public static final String IF_CHECK = "ifCheck";

	public void save(AskAnswer transientInstance) {
		log.debug("saving AskAnswer instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AskAnswer persistentInstance) {
		log.debug("deleting AskAnswer instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AskAnswer findById(java.lang.Long id) {
		log.debug("getting AskAnswer instance with id: " + id);
		try {
			AskAnswer instance = (AskAnswer) getSession().get(
					"com.forbes.hibernate.bean.AskAnswer", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(AskAnswer instance) {
		log.debug("finding AskAnswer instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.AskAnswer").add(
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
		log.debug("finding AskAnswer instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from AskAnswer as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAskId(Object askId) {
		return findByProperty(ASK_ID, askId);
	}

	public List findByIfAnswer(Object ifAnswer) {
		return findByProperty(IF_ANSWER, ifAnswer);
	}

	public List findByTypeId(Object typeId) {
		return findByProperty(TYPE_ID, typeId);
	}

	public List findByTypeId2(Object typeId2) {
		return findByProperty(TYPE_ID2, typeId2);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByLoginName(Object loginName) {
		return findByProperty(LOGIN_NAME, loginName);
	}

	public List findByAnonymous(Object anonymous) {
		return findByProperty(ANONYMOUS, anonymous);
	}

	public List findByGoodRate(Object goodRate) {
		return findByProperty(GOOD_RATE, goodRate);
	}

	public List findByBadRate(Object badRate) {
		return findByProperty(BAD_RATE, badRate);
	}

	public List findByUserIp(Object userIp) {
		return findByProperty(USER_IP, userIp);
	}

	public List findByBrief(Object brief) {
		return findByProperty(BRIEF, brief);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByIfCheck(Object ifCheck) {
		return findByProperty(IF_CHECK, ifCheck);
	}

	public List findAll() {
		log.debug("finding all AskAnswer instances");
		try {
			String queryString = "from AskAnswer";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AskAnswer merge(AskAnswer detachedInstance) {
		log.debug("merging AskAnswer instance");
		try {
			AskAnswer result = (AskAnswer) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AskAnswer instance) {
		log.debug("attaching dirty AskAnswer instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AskAnswer instance) {
		log.debug("attaching clean AskAnswer instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}