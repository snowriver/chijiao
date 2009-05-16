package com.forbes.hibernate.basedao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.bean.UcAdmins;

/**
 * A data access object (DAO) providing persistence and search support for
 * UcAdmins entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UcAdmins
 * @author MyEclipse Persistence Tools
 */

public class BaseUcAdminsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BaseUcAdminsDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String ALLOWADMINSETTING = "allowadminsetting";
	public static final String ALLOWADMINAPP = "allowadminapp";
	public static final String ALLOWADMINUSER = "allowadminuser";
	public static final String ALLOWADMINBADWORD = "allowadminbadword";
	public static final String ALLOWADMINTAG = "allowadmintag";
	public static final String ALLOWADMINPM = "allowadminpm";
	public static final String ALLOWADMINCREDITS = "allowadmincredits";
	public static final String ALLOWADMINDOMAIN = "allowadmindomain";
	public static final String ALLOWADMINDB = "allowadmindb";
	public static final String ALLOWADMINNOTE = "allowadminnote";
	public static final String ALLOWADMINCACHE = "allowadmincache";
	public static final String ALLOWADMINLOG = "allowadminlog";

	public void save(UcAdmins transientInstance) {
		log.debug("saving UcAdmins instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(UcAdmins persistentInstance) {
		log.debug("deleting UcAdmins instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UcAdmins findById(java.lang.Integer id) {
		log.debug("getting UcAdmins instance with id: " + id);
		try {
			UcAdmins instance = (UcAdmins) getSession().get(
					"com.forbes.hibernate.bean.UcAdmins", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(UcAdmins instance) {
		log.debug("finding UcAdmins instance by example");
		try {
			List results = getSession().createCriteria(
					"com.forbes.hibernate.bean.UcAdmins").add(
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
		log.debug("finding UcAdmins instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from UcAdmins as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByAllowadminsetting(Object allowadminsetting) {
		return findByProperty(ALLOWADMINSETTING, allowadminsetting);
	}

	public List findByAllowadminapp(Object allowadminapp) {
		return findByProperty(ALLOWADMINAPP, allowadminapp);
	}

	public List findByAllowadminuser(Object allowadminuser) {
		return findByProperty(ALLOWADMINUSER, allowadminuser);
	}

	public List findByAllowadminbadword(Object allowadminbadword) {
		return findByProperty(ALLOWADMINBADWORD, allowadminbadword);
	}

	public List findByAllowadmintag(Object allowadmintag) {
		return findByProperty(ALLOWADMINTAG, allowadmintag);
	}

	public List findByAllowadminpm(Object allowadminpm) {
		return findByProperty(ALLOWADMINPM, allowadminpm);
	}

	public List findByAllowadmincredits(Object allowadmincredits) {
		return findByProperty(ALLOWADMINCREDITS, allowadmincredits);
	}

	public List findByAllowadmindomain(Object allowadmindomain) {
		return findByProperty(ALLOWADMINDOMAIN, allowadmindomain);
	}

	public List findByAllowadmindb(Object allowadmindb) {
		return findByProperty(ALLOWADMINDB, allowadmindb);
	}

	public List findByAllowadminnote(Object allowadminnote) {
		return findByProperty(ALLOWADMINNOTE, allowadminnote);
	}

	public List findByAllowadmincache(Object allowadmincache) {
		return findByProperty(ALLOWADMINCACHE, allowadmincache);
	}

	public List findByAllowadminlog(Object allowadminlog) {
		return findByProperty(ALLOWADMINLOG, allowadminlog);
	}

	public List findAll() {
		log.debug("finding all UcAdmins instances");
		try {
			String queryString = "from UcAdmins";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public UcAdmins merge(UcAdmins detachedInstance) {
		log.debug("merging UcAdmins instance");
		try {
			UcAdmins result = (UcAdmins) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(UcAdmins instance) {
		log.debug("attaching dirty UcAdmins instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UcAdmins instance) {
		log.debug("attaching clean UcAdmins instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}