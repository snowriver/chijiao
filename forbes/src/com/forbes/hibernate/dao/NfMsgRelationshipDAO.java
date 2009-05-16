package com.forbes.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseNfMsgRelationshipDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * NfMsgRelationship entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.NfMsgRelationship
 * @author MyEclipse Persistence Tools
 */

public class NfMsgRelationshipDAO extends BaseNfMsgRelationshipDAO {
	private static final Log log = LogFactory
			.getLog(NfMsgRelationshipDAO.class);
	// property constants
	
	public List findMsg(String userId, String msgType, int count){
		try {
    		String queryString = "from NfMsgRelationship as mr where mr.msgTypeId in (" + msgType + ") AND mr.userId=? order by mr.id desc";
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		query.setParameter(0, userId );
    		query.setMaxResults( count );
    		return query.list();
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public List findNotReadMsg(String userId, String msgType, int count){
		try {
    		String queryString = "from NfMsgRelationship as mr where  mr.msgTypeId in (" + msgType + ") AND mr.userId=? and (mr.viewTimes = 0 or mr.viewTimes is null) order by mr.id desc";
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		query.setParameter(0, userId );
    		query.setMaxResults( count );
    		return query.list();
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public int getCount( String userId, String msgType  ){
		try {
    		String queryString = "select count(mr) from NfMsgRelationship as mr where  mr.msgTypeId in (" + msgType + ") AND mr.userId=? ";
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		query.setParameter(0, userId );
    		return new Integer("" + query.list().get(0));
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public List findMsgByPage( String userId, String msgType, int start, int len){
		try {
    		String queryString = "from NfMsgRelationship as mr where  mr.msgTypeId in (" + msgType + ") AND mr.userId=? order by mr.id desc";
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		query.setParameter(0, userId );
    		//query.setParameter(1, usrType );    		
    		query.setFirstResult( start );
    		query.setMaxResults( len );
    		return query.list();
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public int getCount(String userId, String msgType, String startTime,String endTime, String keyword){
		try {
    		String queryString = "select count(mr) from NfMsgRelationship as mr ,NfUsrMsg as m where  mr.msgTypeId in (" + msgType + ") AND " ;
    			queryString +=" mr.nfUsrMsg = m and	mr.userId=? ";
    		
    		if( startTime != null && startTime.length() > 0  ){
    			queryString += " and m.msgDate > '" + startTime + "'";
    		}
    		if( endTime != null && endTime.length() > 0 ){
    			queryString += " and m.msgDate < '" + endTime + "'";
    		}
    		if( keyword != null && keyword.length() > 0 ){
    			queryString += " and ( m.msgTitle like ? or m.msgContent like ? ) ";
    		}
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		
    		query.setParameter(0, userId );
    		
    		if( keyword != null && keyword.length() > 0 ){
    			query.setParameter(1, "%" + keyword + "%");
    			query.setParameter(2, "%" + keyword + "%");
    		}
    		
    		
    		return new Integer("" + query.list().get(0));
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public List  searchMsgByPage( String userId, String msgType, String startTime,String endTime,String keyword,
			int start, int len){
		try {
    		String queryString = "SELECT mr from NfMsgRelationship as mr ,NfUsrMsg as m ";
    		queryString +=" where  mr.msgTypeId in (" + msgType + ") AND mr.nfUsrMsg = m and mr.usrId=? ";
    		if( startTime != null && startTime.length() > 0  ){
    			//System.out.println(startTime);
    			startTime+=" 00:00:00";
    			queryString += " and m.msgDate >='" + startTime + "'";
    		}
    		if( endTime != null && endTime.length() > 0 ){
    			 endTime+=" 23:59:59";
    			queryString += " and m.msgDate <= '" + endTime + "'";
    		}
    		if( keyword != null && keyword.length() > 0 ){
    			queryString += " and ( m.msgTitle like ? or m.msgContent like ? ) ";
    		}
    		
    		queryString +=" order by mr.id desc";
    		
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		
    		query.setParameter(0, userId );
    		if( keyword != null && keyword.length() > 0 ){
    			query.setParameter(1, "%" + keyword + "%");
    			query.setParameter(2, "%" + keyword + "%");
    		}
    		query.setFirstResult( start );
    		query.setMaxResults( len );
    		return query.list();
    	} catch (RuntimeException re) {
    		throw re;
    	}
	}
	
	public int getNotViewCount(String userId, String msgType ){
		try {
    		String queryString = "select count(mr) from NfMsgRelationship as mr where  mr.msgTypeId in (" + msgType + ") AND mr.userId=? and (mr.viewTimes = 0 or mr.viewTimes is null)";
    		org.hibernate.Query query = getSession().createQuery( queryString );
    		
    		query.setParameter(0, userId );
    		//query.setParameter(1, usrType );
    		return new Integer("" + query.list().get(0));
    	} catch (RuntimeException re) {
    		re.printStackTrace();
    		throw re;
    	}
	}
}