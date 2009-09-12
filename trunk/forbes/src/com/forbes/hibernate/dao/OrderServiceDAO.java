package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseOrderServiceDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrderService entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.OrderService
 * @author MyEclipse Persistence Tools
 */

public class OrderServiceDAO extends BaseOrderServiceDAO {
	private static final Log log = LogFactory.getLog(OrderServiceDAO.class);
	// property constants
	
	public int getCount(String type, String keyword) {
		try {
			if( keyword == null ) keyword = "";
    		
			String queryString = "SELECT COUNT(*) FROM OrderService AS model WHERE model.active = 'Y' " +
								 "AND ( model.serviceNameCh LIKE ? OR model.serviceDisp LIKE ? OR model.serviceDescs LIKE ? ) ";	
			
			if( type!= null && type.length()>0 )
				queryString += "AND model.serviceType = " + type + " ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyword + "%" );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findOrderServiceByPage(String type, String keyword, String orderBy, int beg, int len) {
		try {
			if( keyword == null ) keyword = "";
			if (orderBy == null || orderBy.equals("")) orderBy = "id DESC ";
			
			String queryString = "SELECT DISTINCT model FROM OrderService AS model WHERE model.active = 'Y' " +
								 "AND ( model.serviceNameCh LIKE ? OR model.serviceDisp LIKE ? OR model.serviceDescs LIKE ? ) ";
			if( type!= null && type.length()>0 )
				queryString += "AND model.serviceType = " + type + " ";
			if( orderBy!= null && orderBy.length()>0 )
				queryString += "ORDER BY model." + orderBy;
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, type );
			query.setParameter(0, "%" + keyword + "%" );
			query.setParameter(1, "%" + keyword + "%" );
			query.setParameter(2, "%" + keyword + "%" );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}