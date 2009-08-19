package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserMonthSumup;
import com.forbes.hibernate.dao.UserMonthSumupDAO;
import com.forbes.service.plan.MonthSumupManager;

public class MonthSumupManagerImpl implements MonthSumupManager {
	
	private UserMonthSumupDAO userMonthSumupDAO;
	
	public UserMonthSumupDAO getUserMonthSumupDAO() {
		return userMonthSumupDAO;
	}

	public void setUserMonthSumupDAO(UserMonthSumupDAO userMonthSumupDAO) {
		this.userMonthSumupDAO = userMonthSumupDAO;
	}

	public UserMonthSumup getMonthSumup( String userid, String year, String month ) throws ForbesException{
				
		try {			
			List list = userMonthSumupDAO.findMonthSumup(userid, year, month);
			if(list.size() >0) {
				return (UserMonthSumup)list.get(0);
			}
			else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getMonthSumupCount(String userid, String year, String month) throws ForbesException{		
		try {			
			return userMonthSumupDAO.getCount(userid, year, month);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addMonthSumup(UserMonthSumup userMonthSumup) {
		userMonthSumupDAO.save(userMonthSumup);
	}
	
	public void deleteMonthSumup(UserMonthSumup userMonthSumup) {
		userMonthSumupDAO.delete(userMonthSumup);
	}
	
	public UserMonthSumup getMonthSumup(Integer id) {
		return userMonthSumupDAO.findById(id);
	}
	
	public void updateMonthSumup(UserMonthSumup userMonthSumup) {
		userMonthSumupDAO.merge(userMonthSumup);
	}

}
