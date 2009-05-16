package com.forbes.hibernate.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUserPaymentLogDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserPaymentLog entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserPaymentLog
 * @author MyEclipse Persistence Tools
 */

public class UserPaymentLogDAO extends BaseUserPaymentLogDAO {
	private static final Log log = LogFactory.getLog(UserPaymentLogDAO.class);
	// property constants
	
}