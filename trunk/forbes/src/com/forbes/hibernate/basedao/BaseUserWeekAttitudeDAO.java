package com.forbes.hibernate.basedao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserWeekAttitude;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserWeekAttitude entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserWeekAttitude
 * @author MyEclipse Persistence Tools
 */

public class BaseUserWeekAttitudeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(BaseUserWeekAttitudeDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String CONFIDENT = "confident";
	public static final String INTENT = "intent";
	public static final String INITIATIVE = "initiative";
	public static final String EBULLIENT = "ebullient";
	public static final String LOVE = "love";
	public static final String STUDY = "study";
	public static final String AUTONOMIC = "autonomic";
	public static final String PERTINACIOUS = "pertinacious";
	public static final String INSIST = "insist";
	public static final String SERIOUS = "serious";
	public static final String RAPID = "rapid";
	public static final String OPTIMISM = "optimism";
	public static final String INNOVATION = "innovation";
	public static final String HONEST = "honest";
	public static final String RESPONSIBILITY = "responsibility";
	public static final String SONSY = "sonsy";
	public static final String DILIGENCE = "diligence";
	public static final String HUMILITY = "humility";
	public static final String PURPOSE = "purpose";
	public static final String CLEAR = "clear";
	public static final String DOBEST = "dobest";
	public static final String TEAM = "team";
	public static final String SLUGGISH = "sluggish";
	public static final String INFERIORITY = "inferiority";
	public static final String FLUKE = "fluke";
	public static final String CONCEITED = "conceited";
	public static final String PRIDE = "pride";
	public static final String BOGGLE = "boggle";
	public static final String ACEDIA = "acedia";
	public static final String ANXIETY = "anxiety";
	public static final String FALSITY = "falsity";
	public static final String DREAM = "dream";
	public static final String ADAMANCY = "adamancy";
	public static final String CYNICAL = "cynical";
	public static final String VULGAR = "vulgar";
	public static final String RECREANCE = "recreance";
	public static final String PEACOCKERY = "peacockery";
	public static final String AVARICE = "avarice";
	public static final String ASOCIAL = "asocial";
	public static final String FUSSY = "fussy";
	public static final String TESTINESS = "testiness";
	public static final String DESPAIR = "despair";
	public static final String BEGRUDGE = "begrudge";
	public static final String EXCUSE = "excuse";

	protected void initDao() {
		// do nothing
	}

	public void save(UserWeekAttitude transientInstance) {
		log.debug("saving UserWeekAttitude instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserWeekAttitude persistentInstance) {
		log.debug("deleting UserWeekAttitude instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserWeekAttitude findById(java.lang.Integer id) {
		log.debug("getting UserWeekAttitude instance with id: " + id);
		try {
			UserWeekAttitude instance = (UserWeekAttitude) getHibernateTemplate()
					.get("com.forbes.hibernate.bean.UserWeekAttitude", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserWeekAttitude instance) {
		log.debug("finding UserWeekAttitude instance by example");
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
		log.debug("finding UserWeekAttitude instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from UserWeekAttitude as model where model."
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

	public List findByConfident(Object confident) {
		return findByProperty(CONFIDENT, confident);
	}

	public List findByIntent(Object intent) {
		return findByProperty(INTENT, intent);
	}

	public List findByInitiative(Object initiative) {
		return findByProperty(INITIATIVE, initiative);
	}

	public List findByEbullient(Object ebullient) {
		return findByProperty(EBULLIENT, ebullient);
	}

	public List findByLove(Object love) {
		return findByProperty(LOVE, love);
	}

	public List findByStudy(Object study) {
		return findByProperty(STUDY, study);
	}

	public List findByAutonomic(Object autonomic) {
		return findByProperty(AUTONOMIC, autonomic);
	}

	public List findByPertinacious(Object pertinacious) {
		return findByProperty(PERTINACIOUS, pertinacious);
	}

	public List findByInsist(Object insist) {
		return findByProperty(INSIST, insist);
	}

	public List findBySerious(Object serious) {
		return findByProperty(SERIOUS, serious);
	}

	public List findByRapid(Object rapid) {
		return findByProperty(RAPID, rapid);
	}

	public List findByOptimism(Object optimism) {
		return findByProperty(OPTIMISM, optimism);
	}

	public List findByInnovation(Object innovation) {
		return findByProperty(INNOVATION, innovation);
	}

	public List findByHonest(Object honest) {
		return findByProperty(HONEST, honest);
	}

	public List findByResponsibility(Object responsibility) {
		return findByProperty(RESPONSIBILITY, responsibility);
	}

	public List findBySonsy(Object sonsy) {
		return findByProperty(SONSY, sonsy);
	}

	public List findByDiligence(Object diligence) {
		return findByProperty(DILIGENCE, diligence);
	}

	public List findByHumility(Object humility) {
		return findByProperty(HUMILITY, humility);
	}

	public List findByPurpose(Object purpose) {
		return findByProperty(PURPOSE, purpose);
	}

	public List findByClear(Object clear) {
		return findByProperty(CLEAR, clear);
	}

	public List findByDobest(Object dobest) {
		return findByProperty(DOBEST, dobest);
	}

	public List findByTeam(Object team) {
		return findByProperty(TEAM, team);
	}

	public List findBySluggish(Object sluggish) {
		return findByProperty(SLUGGISH, sluggish);
	}

	public List findByInferiority(Object inferiority) {
		return findByProperty(INFERIORITY, inferiority);
	}

	public List findByFluke(Object fluke) {
		return findByProperty(FLUKE, fluke);
	}

	public List findByConceited(Object conceited) {
		return findByProperty(CONCEITED, conceited);
	}

	public List findByPride(Object pride) {
		return findByProperty(PRIDE, pride);
	}

	public List findByBoggle(Object boggle) {
		return findByProperty(BOGGLE, boggle);
	}

	public List findByAcedia(Object acedia) {
		return findByProperty(ACEDIA, acedia);
	}

	public List findByAnxiety(Object anxiety) {
		return findByProperty(ANXIETY, anxiety);
	}

	public List findByFalse(Object falsity) {
		return findByProperty(FALSITY, false);
	}

	public List findByDream(Object dream) {
		return findByProperty(DREAM, dream);
	}

	public List findByAdamancy(Object adamancy) {
		return findByProperty(ADAMANCY, adamancy);
	}

	public List findByCynical(Object cynical) {
		return findByProperty(CYNICAL, cynical);
	}

	public List findByVulgar(Object vulgar) {
		return findByProperty(VULGAR, vulgar);
	}

	public List findByRecreance(Object recreance) {
		return findByProperty(RECREANCE, recreance);
	}

	public List findByPeacockery(Object peacockery) {
		return findByProperty(PEACOCKERY, peacockery);
	}

	public List findByAvarice(Object avarice) {
		return findByProperty(AVARICE, avarice);
	}

	public List findByAsocial(Object asocial) {
		return findByProperty(ASOCIAL, asocial);
	}

	public List findByFussy(Object fussy) {
		return findByProperty(FUSSY, fussy);
	}

	public List findByTestiness(Object testiness) {
		return findByProperty(TESTINESS, testiness);
	}

	public List findByDespair(Object despair) {
		return findByProperty(DESPAIR, despair);
	}

	public List findByBegrudge(Object begrudge) {
		return findByProperty(BEGRUDGE, begrudge);
	}

	public List findByExcuse(Object excuse) {
		return findByProperty(EXCUSE, excuse);
	}

	public List findAll() {
		log.debug("finding all UserWeekAttitude instances");
		try {
			String queryString = "from UserWeekAttitude";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserWeekAttitude merge(UserWeekAttitude detachedInstance) {
		log.debug("merging UserWeekAttitude instance");
		try {
			UserWeekAttitude result = (UserWeekAttitude) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserWeekAttitude instance) {
		log.debug("attaching dirty UserWeekAttitude instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserWeekAttitude instance) {
		log.debug("attaching clean UserWeekAttitude instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/*public static UserWeekAttitudeDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (UserWeekAttitudeDAO) ctx.getBean("UserWeekAttitudeDAO");
	}*/
}