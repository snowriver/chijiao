package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UserDetail;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDetail entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserDetail
 * @author MyEclipse Persistence Tools
 */

public class BaseUserDetailDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUserDetailDAO.class);
	// property constants
	public static final String SEX = "sex";
	public static final String SEX_LOCK = "sexLock";
	public static final String EMAIL = "email";
	public static final String EMAIL_LOCK = "emailLock";
	public static final String QQ = "qq";
	public static final String QQ_LOCK = "qqLock";
	public static final String MSN = "msn";
	public static final String MSN_LOCK = "msnLock";
	public static final String SCORES = "scores";
	public static final String BIRTH_TYPE = "birthType";
	public static final String BIRTH_LOCK = "birthLock";
	public static final String BIRTH_YEAR = "birthYear";
	public static final String BIRTH_MONTH = "birthMonth";
	public static final String BIRTH_DAY = "birthDay";
	public static final String HOME_LOCK = "homeLock";
	public static final String HOME_PROVINCE_ID = "homeProvinceId";
	public static final String HOME_PROVINCE_NAME = "homeProvinceName";
	public static final String HOME_CITY_ID = "homeCityId";
	public static final String HOME_CITY_NAME = "homeCityName";
	public static final String HOME_DISTRICT_ID = "homeDistrictId";
	public static final String HOME_DISTRICT_NAME = "homeDistrictName";
	public static final String LIVE_LOCK = "liveLock";
	public static final String LIVE_PROVINCE_ID = "liveProvinceId";
	public static final String LIVE_PROVINCE_NAME = "liveProvinceName";
	public static final String LIVE_CITY_ID = "liveCityId";
	public static final String LIVE_CITY_NAME = "liveCityName";
	public static final String LIVE_DISTRICT_ID = "liveDistrictId";
	public static final String LIVE_DISTRICT_NAME = "liveDistrictName";
	public static final String PHONE = "phone";
	public static final String PHONE_LOCK = "phoneLock";
	public static final String MOBILE = "mobile";
	public static final String MOBILE_LOCK = "mobileLock";
	public static final String CALLING = "calling";
	public static final String CALLING_LOCK = "callingLock";
	public static final String WORK = "work";
	public static final String WORK_LOCK = "workLock";
	public static final String DESCRIPTION = "description";

	public void save(UserDetail transientInstance) {
		log.debug("saving UserDetail instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UserDetail persistentInstance) {
		log.debug("deleting UserDetail instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UserDetail findById(java.lang.Integer id) {
		log.debug("getting UserDetail instance with id: " + id);
		try {
			UserDetail instance = (UserDetail) getSession().get(
					"com.forbes.hibernate.bean.UserDetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UserDetail instance) {
		log.debug("finding UserDetail instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UserDetail").add(
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
		log.debug("finding UserDetail instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UserDetail as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findBySexLock(Object sexLock) {
		return findByProperty(SEX_LOCK, sexLock);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByEmailLock(Object emailLock) {
		return findByProperty(EMAIL_LOCK, emailLock);
	}

	public List findByQq(Object qq) {
		return findByProperty(QQ, qq);
	}

	public List findByQqLock(Object qqLock) {
		return findByProperty(QQ_LOCK, qqLock);
	}

	public List findByMsn(Object msn) {
		return findByProperty(MSN, msn);
	}

	public List findByHotmailLock(Object msnLock) {
		return findByProperty(MSN_LOCK, msnLock);
	}

	public List findByScores(Object scores) {
		return findByProperty(SCORES, scores);
	}

	public List findByBirthType(Object birthType) {
		return findByProperty(BIRTH_TYPE, birthType);
	}

	public List findByBirthLock(Object birthLock) {
		return findByProperty(BIRTH_LOCK, birthLock);
	}

	public List findByBirthYear(Object birthYear) {
		return findByProperty(BIRTH_YEAR, birthYear);
	}

	public List findByBirthMonth(Object birthMonth) {
		return findByProperty(BIRTH_MONTH, birthMonth);
	}

	public List findByBirthDay(Object birthDay) {
		return findByProperty(BIRTH_DAY, birthDay);
	}

	public List findByHomeLock(Object homeLock) {
		return findByProperty(HOME_LOCK, homeLock);
	}

	public List findByHomeProvinceId(Object homeProvinceId) {
		return findByProperty(HOME_PROVINCE_ID, homeProvinceId);
	}

	public List findByHomeProvinceName(Object homeProvinceName) {
		return findByProperty(HOME_PROVINCE_NAME, homeProvinceName);
	}

	public List findByHomeCityId(Object homeCityId) {
		return findByProperty(HOME_CITY_ID, homeCityId);
	}

	public List findByHomeCityName(Object homeCityName) {
		return findByProperty(HOME_CITY_NAME, homeCityName);
	}

	public List findByHomeDistrictId(Object homeDistrictId) {
		return findByProperty(HOME_DISTRICT_ID, homeDistrictId);
	}

	public List findByHomeDistrictName(Object homeDistrictName) {
		return findByProperty(HOME_DISTRICT_NAME, homeDistrictName);
	}

	public List findByLiveLock(Object liveLock) {
		return findByProperty(LIVE_LOCK, liveLock);
	}

	public List findByLiveProvinceId(Object liveProvinceId) {
		return findByProperty(LIVE_PROVINCE_ID, liveProvinceId);
	}

	public List findByLiveProvinceName(Object liveProvinceName) {
		return findByProperty(LIVE_PROVINCE_NAME, liveProvinceName);
	}

	public List findByLiveCityId(Object liveCityId) {
		return findByProperty(LIVE_CITY_ID, liveCityId);
	}

	public List findByLiveCityName(Object liveCityName) {
		return findByProperty(LIVE_CITY_NAME, liveCityName);
	}

	public List findByLiveDistrictId(Object liveDistrictId) {
		return findByProperty(LIVE_DISTRICT_ID, liveDistrictId);
	}

	public List findByLiveDistrictName(Object liveDistrictName) {
		return findByProperty(LIVE_DISTRICT_NAME, liveDistrictName);
	}

	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List findByPhoneLock(Object phoneLock) {
		return findByProperty(PHONE_LOCK, phoneLock);
	}

	public List findByMobile(Object mobile) {
		return findByProperty(MOBILE, mobile);
	}

	public List findByMobileLock(Object mobileLock) {
		return findByProperty(MOBILE_LOCK, mobileLock);
	}

	public List findByCalling(Object calling) {
		return findByProperty(CALLING, calling);
	}

	public List findByCallingLock(Object callingLock) {
		return findByProperty(CALLING_LOCK, callingLock);
	}

	public List findByWork(Object work) {
		return findByProperty(WORK, work);
	}

	public List findByWorkLock(Object workLock) {
		return findByProperty(WORK_LOCK, workLock);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findAll() {
		log.debug("finding all UserDetail instances");
		try {
			String queryString = "from UserDetail";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UserDetail merge(UserDetail detachedInstance) {
		log.debug("merging UserDetail instance");
		try {
			UserDetail result = (UserDetail) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UserDetail instance) {
		log.debug("attaching dirty UserDetail instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UserDetail instance) {
		log.debug("attaching clean UserDetail instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}