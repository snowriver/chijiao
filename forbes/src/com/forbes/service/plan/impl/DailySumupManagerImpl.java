package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.hibernate.dao.UserDailySumupDAO;
import com.forbes.service.plan.DailySumupManager;
import com.forbes.util.Pager;


public class DailySumupManagerImpl implements DailySumupManager {
	
	private UserDailySumupDAO userDailySumupDAO;
	
	public UserDailySumupDAO getUserDailySumupDAO() {
		return userDailySumupDAO;
	}

	public void setUserDailySumupDAO(UserDailySumupDAO userDailySumupDAO) {
		this.userDailySumupDAO = userDailySumupDAO;
	}

	public List getDailySumupByPage(Pager pager, int pageNo, String userid, String date, String keyword, String orderby ) throws ForbesException{
				
		try {			
			pager.setTotoalCnt(userDailySumupDAO.getCount(userid, date, keyword));
			List list = userDailySumupDAO.findDailySumupByPage(userid, date, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getDailySumupCount(String userid, String date) throws ForbesException{		
		try {			
			return userDailySumupDAO.getCount(userid, date, null);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addDailySumup(UserDailySumup userDailySumup) {
		userDailySumupDAO.save(userDailySumup);
	}
	
	public void deleteDailySumup(UserDailySumup userDailySumup) {
		userDailySumupDAO.delete(userDailySumup);
	}
	
	public UserDailySumup getDailySumup(Integer id) {
		return userDailySumupDAO.findById(id);
	}
	
	public void updateDailySumup(UserDailySumup userDailySumup) {
		userDailySumupDAO.merge(userDailySumup);
	}

	/*public UserDailySumup getNextUserDailySumup(Integer id) {
		List list = userDailySumupDAO.findNextUserDailySumup(id.toString());
		if(list.size() >0 )
			return (UserDailySumup)list.get(0);
		else 
			return null;
	}
	
	public UserDailySumup getPreUserDailySumup(Integer id) {
		List list = userDailySumupDAO.findPreUserDailySumup(id.toString());
		if(list.size() >0  )
			return (UserDailySumup)list.get(0);
		else 
			return null;
	}
	
	public void updateUserDailySumup(UserDailySumup userDailySumup) {
		userDailySumupDAO.attachDirty(userDailySumup);
	}

	public boolean verifyTitle( String title ){
		List list = userDailySumupDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		UserDailySumup a = userDailySumupDAO.findById(id);
		List list = userDailySumupDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopUserDailySumupByUserDailySumupType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = userDailySumupDAO.findTopUserDailySumupByUserDailySumupType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeUserDailySumup(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = userDailySumupDAO.findUserDailySumupById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllUserDailySumupid( ) throws ForbesException{
		
		try {
			List list = userDailySumupDAO.getAllUserDailySumupid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}*/
	
}
