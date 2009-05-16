package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.forbes.hibernate.basedao.BaseFavoriteTypeDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * FavoriteType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.FavoriteType
 * @author MyEclipse Persistence Tools
 */

public class FavoriteTypeDAO extends BaseFavoriteTypeDAO {
	private static final Log log = LogFactory.getLog(FavoriteTypeDAO.class);
	// property constants
	
}