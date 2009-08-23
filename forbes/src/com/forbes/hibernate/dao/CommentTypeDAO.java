package com.forbes.hibernate.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseCommentTypeDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * ContentType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.CommentType
 * @author MyEclipse Persistence Tools
 */

public class CommentTypeDAO extends BaseCommentTypeDAO {
	private static final Log log = LogFactory.getLog(CommentTypeDAO.class);
	// property constants
	
}