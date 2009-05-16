package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseSearchKeywordDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * SearchKeyword entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.SearchKeyword
 * @author MyEclipse Persistence Tools
 */

public class SearchKeywordDAO extends BaseSearchKeywordDAO {
	private static final Log log = LogFactory.getLog(SearchKeywordDAO.class);
	// property constants
	
	public int getCount( String keyword ) {
		
		if (keyword == null) keyword = "";
		
		try {

			String queryString = "SELECT COUNT(*) FROM SearchKeyword AS model WHERE model.keyword like ? ";
			
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findSearchKeywordByPage( String keyword, String orderby, int beg, int len ) {
	
		if (keyword == null) keyword = "";
		if (orderby == null || orderby.equals("")) orderby = "id DESC ";
		
		try {			
			String queryString = "SELECT DISTINCT model FROM SearchKeyword AS model WHERE model.keyword like ? ";
		
			queryString += "ORDER BY model." + orderby;
			//System.out.println("queryString = "+queryString);
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, "%" + keyword + "%" );
			
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}