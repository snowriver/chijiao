package com.forbes.hibernate.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.forbes.hibernate.basedao.BaseSysConfigDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysConfig entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.SysConfig
 * @author MyEclipse Persistence Tools
 */

public class SysConfigDAO extends BaseSysConfigDAO {
	private static final Log log = LogFactory.getLog(SysConfigDAO.class);
	// property constants
	
}