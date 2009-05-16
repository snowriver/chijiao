package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUserDetailDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserDetail entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserDetail
 * @author MyEclipse Persistence Tools
 */

public class UserDetailDAO extends BaseUserDetailDAO {
	private static final Log log = LogFactory.getLog(UserDetailDAO.class);
	// property constants
	
}