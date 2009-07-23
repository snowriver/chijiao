package com.forbes.service.plan.impl;

import java.util.Date;
import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailyPlan;
import com.forbes.hibernate.dao.UserDailyPlanDAO;
import com.forbes.service.plan.DailyPlanManager;
import com.forbes.util.Pager;


public class DailyPlanManagerImpl implements DailyPlanManager {
	
	private UserDailyPlanDAO userDailyPlanDAO;
	
	public UserDailyPlanDAO getUserDailyPlanDAO() {
		return userDailyPlanDAO;
	}

	public void setUserDailyPlanDAO(UserDailyPlanDAO userDailyPlanDAO) {
		this.userDailyPlanDAO = userDailyPlanDAO;
	}

	public List getDailyPlanByPage(Pager pager, int pageNo, String userid, String date, String iscomplete, String keyword, String orderby ) throws ForbesException{
		/*if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}*/
		
		try {			
			pager.setTotoalCnt(userDailyPlanDAO.getCount(userid, date, iscomplete, keyword));
			List list = userDailyPlanDAO.findDailyPlanByPage(userid, date, iscomplete, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getDailyPlanCount(String userid, String date, String iscomplete ) throws ForbesException{		
		try {			
			return userDailyPlanDAO.getCount(userid, date, iscomplete, null);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addDailyPlan(UserDailyPlan userDailyPlan) {
		userDailyPlanDAO.save(userDailyPlan);
	}
	
	public void deleteDailyPlan(UserDailyPlan userDailyPlan) {
		userDailyPlanDAO.delete(userDailyPlan);
	}
	
	public UserDailyPlan getDailyPlan(Integer id) {
		return userDailyPlanDAO.findById(id);
	}
	
	public void updateDailyPlan(UserDailyPlan userDailyPlan) {
		userDailyPlanDAO.merge(userDailyPlan);
	}

	/*public UserDailyPlan getNextUserDailyPlan(Integer id) {
		List list = userDailyPlanDAO.findNextUserDailyPlan(id.toString());
		if(list.size() >0 )
			return (UserDailyPlan)list.get(0);
		else 
			return null;
	}
	
	public UserDailyPlan getPreUserDailyPlan(Integer id) {
		List list = userDailyPlanDAO.findPreUserDailyPlan(id.toString());
		if(list.size() >0  )
			return (UserDailyPlan)list.get(0);
		else 
			return null;
	}
	
	public void updateUserDailyPlan(UserDailyPlan userDailyPlan) {
		userDailyPlanDAO.attachDirty(userDailyPlan);
	}

	public boolean verifyTitle( String title ){
		List list = userDailyPlanDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		UserDailyPlan a = userDailyPlanDAO.findById(id);
		List list = userDailyPlanDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopUserDailyPlanByUserDailyPlanType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = userDailyPlanDAO.findTopUserDailyPlanByUserDailyPlanType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeUserDailyPlan(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = userDailyPlanDAO.findUserDailyPlanById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllUserDailyPlanid( ) throws ForbesException{
		
		try {
			List list = userDailyPlanDAO.getAllUserDailyPlanid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}*/
	
}
