package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserMonthAimPlan;
import com.forbes.hibernate.dao.UserMonthAimPlanDAO;
import com.forbes.service.plan.MonthAimPlanManager;


public class MonthAimPlanManagerImpl implements MonthAimPlanManager {
	
	private UserMonthAimPlanDAO userMonthAimPlanDAO;	

	public UserMonthAimPlanDAO getUserMonthAimPlanDAO() {
		return userMonthAimPlanDAO;
	}

	public void setUserMonthAimPlanDAO(UserMonthAimPlanDAO userMonthAimPlanDAO) {
		this.userMonthAimPlanDAO = userMonthAimPlanDAO;
	}

	public UserMonthAimPlan getMonthAimPlan( String userid, String year, String month ) throws ForbesException{
		try {
			List list = userMonthAimPlanDAO.findMonthAimPlan(userid, year, month);
			if(list.size() >0) {
				return (UserMonthAimPlan)list.get(0);
			}
			else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getMonthAimPlanCount(String userid, String year, String month) throws ForbesException{		
		try {			
			return userMonthAimPlanDAO.getCount(userid, year, month);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addMonthAimPlan(UserMonthAimPlan userMonthAimPlan) {
		userMonthAimPlanDAO.save(userMonthAimPlan);
	}
	
	public void deleteMonthAimPlan(UserMonthAimPlan userMonthAimPlan) {
		userMonthAimPlanDAO.delete(userMonthAimPlan);
	}
	
	public UserMonthAimPlan getMonthAimPlan(Integer id) {
		return userMonthAimPlanDAO.findById(id);
	}
	
	public void updateMonthAimPlan(UserMonthAimPlan userMonthAimPlan) {
		userMonthAimPlanDAO.merge(userMonthAimPlan);
	}


	
}
