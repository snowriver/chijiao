package com.forbes.service.plan.impl;

import java.util.Date;
import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailyAccredit;
import com.forbes.hibernate.dao.UserDailyAccreditDAO;
import com.forbes.service.plan.DailyAccreditManager;
import com.forbes.util.Pager;


public class DailyAccreditManagerImpl implements DailyAccreditManager {
	
	private UserDailyAccreditDAO userDailyAccreditDAO;
	
	public UserDailyAccreditDAO getUserDailyAccreditDAO() {
		return userDailyAccreditDAO;
	}

	public void setUserDailyAccreditDAO(UserDailyAccreditDAO userDailyAccreditDAO) {
		this.userDailyAccreditDAO = userDailyAccreditDAO;
	}

	public List getDailyAccreditByPage(Pager pager, int pageNo, String userid, String date, String iscomplete, String keyword, String orderby ) throws ForbesException{
		/*if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}*/
		
		try {			
			pager.setTotoalCnt(userDailyAccreditDAO.getCount(userid, date, iscomplete, keyword));
			List list = userDailyAccreditDAO.findDailyAccreditByPage(userid, date, iscomplete, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getDailyAccreditCount(String userid, String date, String iscomplete ) throws ForbesException{		
		try {			
			return userDailyAccreditDAO.getCount(userid, date, iscomplete, null);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addDailyAccredit(UserDailyAccredit userDailyAccredit) {
		userDailyAccreditDAO.save(userDailyAccredit);
	}
	
	public void deleteDailyAccredit(UserDailyAccredit userDailyAccredit) {
		userDailyAccreditDAO.delete(userDailyAccredit);
	}
	
	public UserDailyAccredit getDailyAccredit(Integer id) {
		return userDailyAccreditDAO.findById(id);
	}
	
	public void updateDailyAccredit(UserDailyAccredit userDailyAccredit) {
		userDailyAccreditDAO.merge(userDailyAccredit);
	}

	/*public UserDailyAccredit getNextUserDailyAccredit(Integer id) {
		List list = userDailyAccreditDAO.findNextUserDailyAccredit(id.toString());
		if(list.size() >0 )
			return (UserDailyAccredit)list.get(0);
		else 
			return null;
	}
	
	public UserDailyAccredit getPreUserDailyAccredit(Integer id) {
		List list = userDailyAccreditDAO.findPreUserDailyAccredit(id.toString());
		if(list.size() >0  )
			return (UserDailyAccredit)list.get(0);
		else 
			return null;
	}
	
	public void updateUserDailyAccredit(UserDailyAccredit userDailyAccredit) {
		userDailyAccreditDAO.attachDirty(userDailyAccredit);
	}

	public boolean verifyTitle( String title ){
		List list = userDailyAccreditDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		UserDailyAccredit a = userDailyAccreditDAO.findById(id);
		List list = userDailyAccreditDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopUserDailyAccreditByUserDailyAccreditType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = userDailyAccreditDAO.findTopUserDailyAccreditByUserDailyAccreditType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeUserDailyAccredit(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = userDailyAccreditDAO.findUserDailyAccreditById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllUserDailyAccreditid( ) throws ForbesException{
		
		try {
			List list = userDailyAccreditDAO.getAllUserDailyAccreditid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}*/
	
}
