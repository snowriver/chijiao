package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserWeekAbility;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserWeekAbility entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserWeekAbility
 * @author MyEclipse Persistence Tools
 */

public class BaseUserWeekAbilityDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserWeekAbilityDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String ARDOUR = "ardour";
	public static final String PROMISES = "promises";
	public static final String RESPONSIBILITY = "responsibility";
	public static final String ADMIRE = "admire";
	public static final String CONTRIBUTE = "contribute";
	public static final String BELIEVE = "believe";
	public static final String WINWIN = "winwin";
	public static final String LISTEN = "listen";
	public static final String FOCUS = "focus";
	public static final String ECHO = "echo";
	public static final String PRAISE = "praise";
	public static final String CONVINCE = "convince";
	public static final String FEEDBACK = "feedback";
	public static final String THANK = "thank";
	public static final String VISUALIZE = "visualize";
	public static final String STUDY = "study";
	public static final String INNOVATION = "innovation";
	public static final String LOVE = "love";
	public static final String GUMPTION = "gumption";
	public static final String PURPOSE = "purpose";
	public static final String INTENT = "intent";
	public static final String PROFESSIONAL = "professional";
	public static final String WILLPOWER = "willpower";

	protected void initDao() {
		// do nothing
	}

	public void save(UserWeekAbility transientInstance) {
		log.debug("saving UserWeekAbility instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserWeekAbility persistentInstance) {
		log.debug("deleting UserWeekAbility instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserWeekAbility findById(java.lang.Integer id) {
		log.debug("getting UserWeekAbility instance with id: " + id);
		try {
			UserWeekAbility instance = (UserWeekAbility) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserWeekAbility", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserWeekAbility instance) {
		log.debug("finding UserWeekAbility instance by example");
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
		log.debug("finding UserWeekAbility instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserWeekAbility as model where model."
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

	public List findByArdour(Object ardour) {
		return findByProperty(ARDOUR, ardour);
	}

	public List findByPromises(Object promises) {
		return findByProperty(PROMISES, promises);
	}

	public List findByResponsibility(Object responsibility) {
		return findByProperty(RESPONSIBILITY, responsibility);
	}

	public List findByAdmire(Object admire) {
		return findByProperty(ADMIRE, admire);
	}

	public List findByContribute(Object contribute) {
		return findByProperty(CONTRIBUTE, contribute);
	}

	public List findByBelieve(Object believe) {
		return findByProperty(BELIEVE, believe);
	}

	public List findByWinWin(Object winwin) {
		return findByProperty(WINWIN, winwin);
	}

	public List findByListen(Object listen) {
		return findByProperty(LISTEN, listen);
	}

	public List findByFocus(Object focus) {
		return findByProperty(FOCUS, focus);
	}

	public List findByEcho(Object echo) {
		return findByProperty(ECHO, echo);
	}

	public List findByPraise(Object praise) {
		return findByProperty(PRAISE, praise);
	}

	public List findByConvince(Object convince) {
		return findByProperty(CONVINCE, convince);
	}

	public List findByFeedback(Object feedback) {
		return findByProperty(FEEDBACK, feedback);
	}

	public List findByThank(Object thank) {
		return findByProperty(THANK, thank);
	}

	public List findByVisualize(Object visualize) {
		return findByProperty(VISUALIZE, visualize);
	}

	public List findByStudy(Object study) {
		return findByProperty(STUDY, study);
	}

	public List findByInnovation(Object innovation) {
		return findByProperty(INNOVATION, innovation);
	}

	public List findByLove(Object love) {
		return findByProperty(LOVE, love);
	}

	public List findByGumption(Object gumption) {
		return findByProperty(GUMPTION, gumption);
	}

	public List findByPurpose(Object purpose) {
		return findByProperty(PURPOSE, purpose);
	}

	public List findByIntent(Object intent) {
		return findByProperty(INTENT, intent);
	}

	public List findByProfessional(Object professional) {
		return findByProperty(PROFESSIONAL, professional);
	}

	public List findByWillpower(Object willpower) {
		return findByProperty(WILLPOWER, willpower);
	}

	public List findAll() {
		log.debug("finding all UserWeekAbility instances");
		try {
			String queryString = "from UserWeekAbility";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserWeekAbility merge(UserWeekAbility detachedInstance) {
		log.debug("merging UserWeekAbility instance");
		try {
			UserWeekAbility result = (UserWeekAbility) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserWeekAbility instance) {
		log.debug("attaching dirty UserWeekAbility instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserWeekAbility instance) {
		log.debug("attaching clean UserWeekAbility instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaseUserWeekAbilityDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaseUserWeekAbilityDAO) ctx.getBean("UserWeekAbilityDAO");
	}
}