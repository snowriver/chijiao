package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUcMembersDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UcMembers entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UcMembers
 * @author MyEclipse Persistence Tools
 */

public class UcMembersDAO extends BaseUcMembersDAO {
	private static final Log log = LogFactory.getLog(UcMembersDAO.class);
	// property constants
	
	public List findUcMembers(String username) {
		try {
			String queryString = "SELECT DISTINCT model FROM UcMembers AS model " +
					"WHERE model.username = ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, username );
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public int getCount( String propertyName, Object value ) {
		try {
			String queryString = "SELECT COUNT(*) FROM UcMembers AS model WHERE " +
								 "model." +  propertyName + " = ? ";
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, value );
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public int getCount( String keyWord ) {
		try {
			if( keyWord == null ) keyWord = "";
    		
			String queryString = "SELECT COUNT(*) FROM UcMembers AS model WHERE ( model.username LIKE ? OR model.email LIKE ? ) ";			
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyWord + "%" );
			query.setParameter(1, "%" + keyWord + "%" );
			
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findUserByPage( String keyWord, String orderBy, int beg, int len) {
		try {
			if( keyWord == null ) keyWord = "";
			if (orderBy == null || orderBy.equals("")) orderBy = "id DESC ";
			
			String queryString = "SELECT DISTINCT model FROM UcMembers AS model WHERE " +
								 "( model.username LIKE ? OR model.email LIKE ? ) ";
			
			if( orderBy!= null && orderBy.length()>0 )
				queryString += "ORDER BY model." + orderBy;
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			
			query.setParameter(0, "%" + keyWord + "%" );
			query.setParameter(1, "%" + keyWord + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findUserByPage( int beg, int len) {
		try {
			
			String queryString = "SELECT DISTINCT user FROM UcMembers AS user, UserDetail as detail WHERE " +
								 "user.userDetail is not null AND user.userDetail = detail ORDER BY detail.scores DESC ";
			
			System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			
			System.out.println("size = "+query.list().size());
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}