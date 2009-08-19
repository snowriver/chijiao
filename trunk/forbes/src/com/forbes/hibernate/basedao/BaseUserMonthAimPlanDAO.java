package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserMonthAimPlan;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserMonthAimPlan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserMonthAimPlan
 * @author MyEclipse Persistence Tools
 */

public class BaseUserMonthAimPlanDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserMonthAimPlanDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String MONTH = "month";
	public static final String CAREER_AIM = "careerAim";
	public static final String CAREER_PLAN = "careerPlan";
	public static final String FAMILY_AIM = "familyAim";
	public static final String FAMILY_PLAN = "familyPlan";
	public static final String CONTACT_AIM = "contactAim";
	public static final String CONTACT_PLAN = "contactPlan";
	public static final String FINANCE_AIM = "financeAim";
	public static final String FINANCE_PLAN = "financePlan";
	public static final String SPIRIT_AIM = "spiritAim";
	public static final String SPIRIT_PLAN = "spiritPlan";
	public static final String HEALTH_AIM = "healthAim";
	public static final String HEALTH_PLAN = "healthPlan";
	public static final String OTHER_AIM = "otherAim";
	public static final String OTHER_PLAN = "otherPlan";

	protected void initDao() {
		// do nothing
	}

	public void save(UserMonthAimPlan transientInstance) {
		log.debug("saving UserMonthAimPlan instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserMonthAimPlan persistentInstance) {
		log.debug("deleting UserMonthAimPlan instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserMonthAimPlan findById(java.lang.Integer id) {
		log.debug("getting UserMonthAimPlan instance with id: " + id);
		try {
			UserMonthAimPlan instance = (UserMonthAimPlan) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserMonthAimPlan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserMonthAimPlan instance) {
		log.debug("finding UserMonthAimPlan instance by example");
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
		log.debug("finding UserMonthAimPlan instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserMonthAimPlan as model where model."
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

	public List findByMonth(Object month) {
		return findByProperty(MONTH, month);
	}

	public List findByCareerAim(Object careerAim) {
		return findByProperty(CAREER_AIM, careerAim);
	}

	public List findByCareerPlan(Object careerPlan) {
		return findByProperty(CAREER_PLAN, careerPlan);
	}

	public List findByFamilyAim(Object familyAim) {
		return findByProperty(FAMILY_AIM, familyAim);
	}

	public List findByFamilyPlan(Object familyPlan) {
		return findByProperty(FAMILY_PLAN, familyPlan);
	}

	public List findByContactAim(Object contactAim) {
		return findByProperty(CONTACT_AIM, contactAim);
	}

	public List findByContactPlan(Object contactPlan) {
		return findByProperty(CONTACT_PLAN, contactPlan);
	}

	public List findByFinanceAim(Object financeAim) {
		return findByProperty(FINANCE_AIM, financeAim);
	}

	public List findByFinancePlan(Object financePlan) {
		return findByProperty(FINANCE_PLAN, financePlan);
	}

	public List findBySpiritAim(Object spiritAim) {
		return findByProperty(SPIRIT_AIM, spiritAim);
	}

	public List findBySpiritPlan(Object spiritPlan) {
		return findByProperty(SPIRIT_PLAN, spiritPlan);
	}

	public List findByHealthAim(Object healthAim) {
		return findByProperty(HEALTH_AIM, healthAim);
	}

	public List findByHealthPlan(Object healthPlan) {
		return findByProperty(HEALTH_PLAN, healthPlan);
	}

	public List findByOtherAim(Object otherAim) {
		return findByProperty(OTHER_AIM, otherAim);
	}

	public List findByOtherPlan(Object otherPlan) {
		return findByProperty(OTHER_PLAN, otherPlan);
	}

	public List findAll() {
		log.debug("finding all UserMonthAimPlan instances");
		try {
			String queryString = "from UserMonthAimPlan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserMonthAimPlan merge(UserMonthAimPlan detachedInstance) {
		log.debug("merging UserMonthAimPlan instance");
		try {
			UserMonthAimPlan result = (UserMonthAimPlan) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserMonthAimPlan instance) {
		log.debug("attaching dirty UserMonthAimPlan instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserMonthAimPlan instance) {
		log.debug("attaching clean UserMonthAimPlan instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserMonthAimPlanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserMonthAimPlanDAO) ctx.getBean("UserMonthAimPlanDAO");
	}
}