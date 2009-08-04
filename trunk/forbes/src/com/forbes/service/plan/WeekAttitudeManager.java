package com.forbes.service.plan;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.hibernate.bean.UserWeekAttitude;
import com.forbes.hibernate.dao.UserDailySumupDAO;
import com.forbes.hibernate.dao.UserWeekAttitudeDAO;
import com.forbes.util.Pager;

public interface WeekAttitudeManager {

	public UserWeekAttitudeDAO getUserWeekAttitudeDAO();

	public void setUserWeekAttitudeDAO(UserWeekAttitudeDAO userWeekAttitudeDAO);

	public UserWeekAttitude getWeekAttitude( String userid, String date ) throws ForbesException;
	
	public int getWeekAttitudeCount(String userid, String date) throws ForbesException;

	public void addWeekAttitude(UserWeekAttitude userWeekAttitude);
	
	public void deleteWeekAttitude(UserWeekAttitude userWeekAttitude);
	
	public UserWeekAttitude getWeekAttitude(Integer id);
	
	public void updateWeekAttitude(UserWeekAttitude userWeekAttitude);

}
