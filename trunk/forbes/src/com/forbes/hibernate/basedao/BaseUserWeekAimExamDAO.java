package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserWeekAimExam;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserWeekAimExam entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserWeekAimExam
 * @author MyEclipse Persistence Tools
 */

public class BaseUserWeekAimExamDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserWeekAimExamDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String CAREER_DONE = "careerDone";
	public static final String CAREER_NEXT = "careerNext";
	public static final String FAMILY_DONE = "familyDone";
	public static final String FAMILY_NEXT = "familyNext";
	public static final String CONTACT_DONE = "contactDone";
	public static final String CONTACT_NEXT = "contactNext";
	public static final String FINANCE_DONE = "financeDone";
	public static final String FINANCE_NEXT = "financeNext";
	public static final String SPIRIT_DONE = "spiritDone";
	public static final String SPIRIT_NEXT = "spiritNext";
	public static final String HEALTH_DONE = "healthDone";
	public static final String HEALTH_NEXT = "healthNext";
	public static final String OTHER_DONE = "otherDone";
	public static final String OTHER_NEXT = "otherNext";

	protected void initDao() {
		// do nothing
	}

	public void save(UserWeekAimExam transientInstance) {
		log.debug("saving UserWeekAimExam instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserWeekAimExam persistentInstance) {
		log.debug("deleting UserWeekAimExam instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserWeekAimExam findById(java.lang.Integer id) {
		log.debug("getting UserWeekAimExam instance with id: " + id);
		try {
			UserWeekAimExam instance = (UserWeekAimExam) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserWeekAimExam", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserWeekAimExam instance) {
		log.debug("finding UserWeekAimExam instance by example");
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
		log.debug("finding UserWeekAimExam instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserWeekAimExam as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}
	
	public List findByCareerDone(Object careerDone) {
		return findByProperty(CAREER_DONE, careerDone);
	}

	public List findByCareerNext(Object careerNext) {
		return findByProperty(CAREER_NEXT, careerNext);
	}

	public List findByFamilyDone(Object familyDone) {
		return findByProperty(FAMILY_DONE, familyDone);
	}

	public List findByFamilyNext(Object familyNext) {
		return findByProperty(FAMILY_NEXT, familyNext);
	}

	public List findByContactDone(Object contactDone) {
		return findByProperty(CONTACT_DONE, contactDone);
	}

	public List findByContactNext(Object contactNext) {
		return findByProperty(CONTACT_NEXT, contactNext);
	}

	public List findByFinanceDone(Object financeDone) {
		return findByProperty(FINANCE_DONE, financeDone);
	}

	public List findByFinanceNext(Object financeNext) {
		return findByProperty(FINANCE_NEXT, financeNext);
	}

	public List findBySpiritDone(Object spiritDone) {
		return findByProperty(SPIRIT_DONE, spiritDone);
	}

	public List findBySpiritNext(Object spiritNext) {
		return findByProperty(SPIRIT_NEXT, spiritNext);
	}

	public List findByHealthDone(Object healthDone) {
		return findByProperty(HEALTH_DONE, healthDone);
	}

	public List findByHealthNext(Object healthNext) {
		return findByProperty(HEALTH_NEXT, healthNext);
	}

	public List findByOtherDone(Object otherDone) {
		return findByProperty(OTHER_DONE, otherDone);
	}

	public List findByOtherNext(Object otherNext) {
		return findByProperty(OTHER_NEXT, otherNext);
	}

	public List findAll() {
		log.debug("finding all UserWeekAimExam instances");
		try {
			String queryString = "from UserWeekAimExam";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserWeekAimExam merge(UserWeekAimExam detachedInstance) {
		log.debug("merging UserWeekAimExam instance");
		try {
			UserWeekAimExam result = (UserWeekAimExam) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserWeekAimExam instance) {
		log.debug("attaching dirty UserWeekAimExam instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserWeekAimExam instance) {
		log.debug("attaching clean UserWeekAimExam instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserWeekAimExamDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserWeekAimExamDAO) ctx.getBean("UserWeekAimExamDAO");
	}
}