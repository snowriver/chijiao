package com.forbes.service.plan;

import java.util.Date;
import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailyPlan;
import com.forbes.hibernate.dao.UserDailyPlanDAO;
import com.forbes.util.Pager;

public interface DailyPlanManager {

	public UserDailyPlanDAO getUserDailyPlanDAO();

	public void setUserDailyPlanDAO(UserDailyPlanDAO userDailyPlanDAO);

	public List getDailyPlanByPage(Pager pager, int pageNo, String userid,
			String date, String iscomplete, String keyword, String orderby)
			throws ForbesException;

	public void addDailyPlan(UserDailyPlan userDailyPlan);

	public void deleteDailyPlan(UserDailyPlan userDailyPlan);

	public UserDailyPlan getDailyPlan(Integer id);
	
	public void updateDailyPlan(UserDailyPlan userDailyPlan);

}
