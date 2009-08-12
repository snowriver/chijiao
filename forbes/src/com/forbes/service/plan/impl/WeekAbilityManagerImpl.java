package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.hibernate.bean.UserWeekAbility;
import com.forbes.hibernate.bean.UserWeekAttitude;
import com.forbes.hibernate.dao.UserDailySumupDAO;
import com.forbes.hibernate.dao.UserWeekAbilityDAO;
import com.forbes.hibernate.dao.UserWeekAttitudeDAO;
import com.forbes.service.plan.DailySumupManager;
import com.forbes.service.plan.WeekAbilityManager;
import com.forbes.service.plan.WeekAttitudeManager;
import com.forbes.util.Pager;


public class WeekAbilityManagerImpl implements WeekAbilityManager {
	
	private UserWeekAbilityDAO userWeekAbilityDAO;	
	
	public UserWeekAbilityDAO getUserWeekAbilityDAO() {
		return userWeekAbilityDAO;
	}

	public void setUserWeekAbilityDAO(UserWeekAbilityDAO userWeekAbilityDAO) {
		this.userWeekAbilityDAO = userWeekAbilityDAO;
	}
	

	public UserWeekAbility getWeekAbility( String userid, String date ) throws ForbesException{
		try {
			List list = userWeekAbilityDAO.findWeekAbility(userid, date);
			if(list.size() >0) {
				return (UserWeekAbility)list.get(0);
			}
			else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getWeekAbilityCount(String userid, String date) throws ForbesException{		
		try {			
			return userWeekAbilityDAO.getCount(userid, date);
			
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addWeekAbility(UserWeekAbility userWeekAbility) {
		userWeekAbilityDAO.save(userWeekAbility);
	}
	
	public void deleteWeekAbility(UserWeekAbility userWeekAbility) {
		userWeekAbilityDAO.delete(userWeekAbility);
	}
	
	public UserWeekAbility getWeekAbility(Integer id) {
		return userWeekAbilityDAO.findById(id);
	}
	
	public void updateWeekAbility(UserWeekAbility userWeekAbility) {
		userWeekAbilityDAO.merge(userWeekAbility);
	}

	


	
}
