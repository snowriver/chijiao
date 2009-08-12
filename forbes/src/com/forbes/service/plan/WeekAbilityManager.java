package com.forbes.service.plan;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserWeekAbility;
import com.forbes.hibernate.dao.UserWeekAbilityDAO;

public interface WeekAbilityManager {
	
	public UserWeekAbilityDAO getUserWeekAbilityDAO();

	public void setUserWeekAbilityDAO(UserWeekAbilityDAO userWeekAbilityDAO);

	public UserWeekAbility getWeekAbility( String userid, String date ) throws ForbesException;
	
	public int getWeekAbilityCount(String userid, String date) throws ForbesException;

	public void addWeekAbility(UserWeekAbility userWeekAbility);
	
	public void deleteWeekAbility(UserWeekAbility userWeekAbility);
	
	public UserWeekAbility getWeekAbility(Integer id);
	
	public void updateWeekAbility(UserWeekAbility userWeekAbility);

}
