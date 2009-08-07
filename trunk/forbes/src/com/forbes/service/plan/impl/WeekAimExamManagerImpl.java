package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserWeekAimExam;
import com.forbes.hibernate.dao.UserWeekAimExamDAO;
import com.forbes.service.plan.WeekAimExamManager;

public class WeekAimExamManagerImpl implements WeekAimExamManager {
	
	private UserWeekAimExamDAO userWeekAimExamDAO;	

	public UserWeekAimExamDAO getUserWeekAimExamDAO() {
		return userWeekAimExamDAO;
	}

	public void setUserWeekAimExamDAO(UserWeekAimExamDAO userWeekAimExamDAO) {
		this.userWeekAimExamDAO = userWeekAimExamDAO;
	}

	public UserWeekAimExam getWeekAimExam( String userid, String date ) throws ForbesException{
		try {
			List list = userWeekAimExamDAO.findWeekAimExam(userid, date);
			if(list.size() >0) {
				return (UserWeekAimExam)list.get(0);
			}
			else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getWeekAimExamCount(String userid, String date) throws ForbesException{		
		try {			
			return userWeekAimExamDAO.getCount(userid, date);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addWeekAimExam(UserWeekAimExam userWeekAimExam) {
		userWeekAimExamDAO.save(userWeekAimExam);
	}
	
	public void deleteWeekAimExam(UserWeekAimExam userWeekAimExam) {
		userWeekAimExamDAO.delete(userWeekAimExam);
	}
	
	public UserWeekAimExam getWeekAimExam(Integer id) {
		return userWeekAimExamDAO.findById(id);
	}
	
	public void updateWeekAimExam(UserWeekAimExam userWeekAimExam) {
		userWeekAimExamDAO.merge(userWeekAimExam);
	}

	/*public UserWeekAimExam getNextUserWeekAimExam(Integer id) {
		List list = userWeekAimExamDAO.findNextUserWeekAimExam(id.toString());
		if(list.size() >0 )
			return (UserWeekAimExam)list.get(0);
		else 
			return null;
	}
	
	public UserWeekAimExam getPreUserWeekAimExam(Integer id) {
		List list = userWeekAimExamDAO.findPreUserWeekAimExam(id.toString());
		if(list.size() >0  )
			return (UserWeekAimExam)list.get(0);
		else 
			return null;
	}
	
	public void updateUserWeekAimExam(UserWeekAimExam userWeekAimExam) {
		userWeekAimExamDAO.attachDirty(userWeekAimExam);
	}

	public boolean verifyTitle( String title ){
		List list = userWeekAimExamDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		UserWeekAimExam a = userWeekAimExamDAO.findById(id);
		List list = userWeekAimExamDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopUserWeekAimExamByUserWeekAimExamType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = userWeekAimExamDAO.findTopUserWeekAimExamByUserWeekAimExamType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeUserWeekAimExam(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = userWeekAimExamDAO.findUserWeekAimExamById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllUserWeekAimExamid( ) throws ForbesException{
		
		try {
			List list = userWeekAimExamDAO.getAllUserWeekAimExamid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}*/
	
}
