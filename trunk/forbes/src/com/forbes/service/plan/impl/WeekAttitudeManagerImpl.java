package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.hibernate.bean.UserWeekAttitude;
import com.forbes.hibernate.dao.UserDailySumupDAO;
import com.forbes.hibernate.dao.UserWeekAttitudeDAO;
import com.forbes.service.plan.DailySumupManager;
import com.forbes.service.plan.WeekAttitudeManager;
import com.forbes.util.Pager;


public class WeekAttitudeManagerImpl implements WeekAttitudeManager {
	
	private UserWeekAttitudeDAO userWeekAttitudeDAO;	
	

	public UserWeekAttitudeDAO getUserWeekAttitudeDAO() {
		return userWeekAttitudeDAO;
	}

	public void setUserWeekAttitudeDAO(UserWeekAttitudeDAO userWeekAttitudeDAO) {
		this.userWeekAttitudeDAO = userWeekAttitudeDAO;
	}

	public UserWeekAttitude getWeekAttitude( String userid, String date ) throws ForbesException{
		try {
			List list = userWeekAttitudeDAO.findWeekAttitude(userid, date);
			if(list.size() >0) {
				return (UserWeekAttitude)list.get(0);
			}
			else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getWeekAttitudeCount(String userid, String date) throws ForbesException{		
		try {			
			return userWeekAttitudeDAO.getCount(userid, date);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addWeekAttitude(UserWeekAttitude userWeekAttitude) {
		userWeekAttitudeDAO.save(userWeekAttitude);
	}
	
	public void deleteWeekAttitude(UserWeekAttitude userWeekAttitude) {
		userWeekAttitudeDAO.delete(userWeekAttitude);
	}
	
	public UserWeekAttitude getWeekAttitude(Integer id) {
		return userWeekAttitudeDAO.findById(id);
	}
	
	public void updateWeekAttitude(UserWeekAttitude userWeekAttitude) {
		userWeekAttitudeDAO.merge(userWeekAttitude);
	}

	/*public UserWeekAttitude getNextUserWeekAttitude(Integer id) {
		List list = userWeekAttitudeDAO.findNextUserWeekAttitude(id.toString());
		if(list.size() >0 )
			return (UserWeekAttitude)list.get(0);
		else 
			return null;
	}
	
	public UserWeekAttitude getPreUserWeekAttitude(Integer id) {
		List list = userWeekAttitudeDAO.findPreUserWeekAttitude(id.toString());
		if(list.size() >0  )
			return (UserWeekAttitude)list.get(0);
		else 
			return null;
	}
	
	public void updateUserWeekAttitude(UserWeekAttitude userWeekAttitude) {
		userWeekAttitudeDAO.attachDirty(userWeekAttitude);
	}

	public boolean verifyTitle( String title ){
		List list = userWeekAttitudeDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		UserWeekAttitude a = userWeekAttitudeDAO.findById(id);
		List list = userWeekAttitudeDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopUserWeekAttitudeByUserWeekAttitudeType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = userWeekAttitudeDAO.findTopUserWeekAttitudeByUserWeekAttitudeType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeUserWeekAttitude(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = userWeekAttitudeDAO.findUserWeekAttitudeById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllUserWeekAttitudeid( ) throws ForbesException{
		
		try {
			List list = userWeekAttitudeDAO.getAllUserWeekAttitudeid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}*/
	
}
