package com.forbes.hibernate.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUserActionLogDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserActionLog entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UserActionLog
 * @author MyEclipse Persistence Tools
 */

public class UserActionLogDAO extends BaseUserActionLogDAO {
	private static final Log log = LogFactory.getLog(UserActionLogDAO.class);
	// property constants
	
	public int findUserLogCnt(String userId, String loginName, String actionType, String btime, String etime ){
    	try {
    		if(loginName == null) loginName = "";
			String queryString = "Select count(*) from UserActionLog as act , User as user " +
					"where act.usrId = user.id and user.lgName like ? and act.usrActionType=? ";
			
			if(userId !=null && userId.length() > 0) {
				queryString = queryString + " and act.usrId = " + userId + " ";
			}
			
			if( btime!=null && btime.length() > 0 ) {
				btime = btime + " 00:00:00";				
				queryString = queryString + " and act.insertDate >= '" + btime + "' ";
			}
			if( etime!=null && etime.length() > 0 ) {				
				etime = etime + " 23:59:59";
				queryString = queryString + " and act.insertDate <= '" + etime + "' ";
			}
			
			//System.out.println("queryString = "+queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			//query.setParameter(0, userId);
			query.setParameter(0, "%" + loginName + "%" );
			query.setParameter(1, actionType);
			return Integer.parseInt( "" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
    }
}