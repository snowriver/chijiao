package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUcAdminsDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UcAdmins entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UcAdmins
 * @author MyEclipse Persistence Tools
 */

public class UcAdminsDAO extends BaseUcAdminsDAO {
	private static final Log log = LogFactory.getLog(UcAdminsDAO.class);
	// property constants
	
	public int getCount( String keyWord ) {
		try {
			if( keyWord == null ) keyWord = "";
    		
			String queryString = "SELECT COUNT(*) FROM UcAdmins AS model WHERE model.username LIKE ? ";			
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyWord + "%" );
			
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findAdminByPage( String keyWord, String orderBy, int beg, int len) {
		try {
			if( keyWord == null ) keyWord = "";
			if (orderBy == null || orderBy.equals("")) orderBy = "uid ASC ";
			
			String queryString = "SELECT DISTINCT model FROM UcAdmins AS model WHERE " +
								 "model.username LIKE ? ";
			
			if( orderBy!= null && orderBy.length()>0 )
				queryString += "ORDER BY model." + orderBy;
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyWord + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			
			//System.out.println("size = "+query.list().size());
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}